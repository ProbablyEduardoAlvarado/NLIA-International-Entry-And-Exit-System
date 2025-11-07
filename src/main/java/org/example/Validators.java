package org.example;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;


/*
 * A general class to encapsulate any methods which are used for validating certain data entries
 */
public class Validators {

    // --- Country Code Validator Logic (Pre-loaded from resource file) ---

    private static final Set<String> VALID_CODES = new HashSet<>();
    // NOTE: This resource file must be placed in src/main/resources/country_codes.txt
    private static final String RESOURCE_FILE = "country_codes.txt";

    static {
        try (InputStream is = Validators.class.getClassLoader().getResourceAsStream(RESOURCE_FILE);
             BufferedReader reader = new BufferedReader(new InputStreamReader(is))) {

            if (is == null) {
                // If the resource is not found, throw an exception to halt startup
                throw new Exception("Resource file not found: " + RESOURCE_FILE);
            }

            // Read all lines and process them
            reader.lines()
                    .map(String::trim)
                    .filter(line -> !line.isEmpty())
                    .forEach(VALID_CODES::add);

        } catch (Exception e) {
            // Print error and ensure the set is empty to prevent invalid input acceptance
            System.err.println("FATAL: Could not load country codes from " + RESOURCE_FILE + ": " + e.getMessage());
        }
    }

    /**
     * Checks if the given 3-letter code is in the set of valid country codes.
     */
    public static boolean isValidCode(String code) {
        return code != null && VALID_CODES.contains(code.toUpperCase().trim());
    }

    // --- Date Validator Logic ---

    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    /**
     * Checks if the given string is a valid date in YYYY-MM-DD format.
     */
    public static boolean isValidDate(String dateStr) {
        try {
            if (dateStr == null || dateStr.isEmpty()) return false;
            LocalDate.parse(dateStr, DATE_FORMATTER);
            return true;
        } catch (DateTimeParseException e) {
            return false;
        }
    }

    // --- Character-only Validator Logic ---

    private static final Pattern LETTER_SPACE_PATTERN = Pattern.compile("^[a-zA-Z\\s]+$");

    /**
     * Checks if the given string contains only letters and spaces.
     */
    public static boolean containsOnlyLetters(String str) {
        if (str == null || str.trim().isEmpty()) return false;
        Matcher matcher = LETTER_SPACE_PATTERN.matcher(str);
        return matcher.matches();
    }

    // --- Alien Number Generation and Conflict Logic ---

    /**
     * Finds the current maximum ANumber in the database and returns the next sequential number as a String.
     * The A-Number is assumed to be stored as a string of digits (e.g., 'A1234567').
     *
     * @param conn The active database connection.
     * @return The next available A-Number as a String.
     * @throws SQLException If a database error occurs.
     */
    public static String generateNextANumber(Connection conn) throws SQLException {
        // Find the maximum ANumber, convert it to a number, and then find the maximum.
        String sql = "SELECT MAX(CAST(\"ANumber\" AS BIGINT)) FROM PUBLIC.\"Person\" WHERE \"ANumber\" IS NOT NULL";
        long maxANumber = 562615698; // Start at a safe, high number if no A-Numbers exist

        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next() && rs.getString(1) != null) {
                // If a max ANumber is found, increment it.
                maxANumber = rs.getLong(1) + 1;
            } else {
                // If the table is empty or ANumber column is all null, start at the default.
                System.out.println("No existing A-Numbers found. Starting generation at: " + maxANumber);
            }
        } catch (SQLException e) {
            System.err.println("Error generating next A-Number. Using fallback: " + maxANumber);
            // Log the error but continue with the fallback number to avoid stopping the process.
        }

        // Return the new number formatted as a string
        return String.valueOf(maxANumber);
    }


    /**
     * Checks if the given ANumber is a conflict (already assigned to a different passport combination).
     * @param conn The active database connection.
     * @param aNumber The Alien Number to check.
     * @param passportNumber The passport number to match.
     * @param countryCode The passport country code to match.
     * @return true if the ANumber is valid for this traveler (or not in DB); false if conflict found.
     * @throws SQLException If a database error occurs.
     */
    public static boolean isANumberValid(Connection conn, String aNumber, String passportNumber, String countryCode) throws SQLException {
        if (conn == null || aNumber == null || aNumber.trim().isEmpty()) {
            // Internal error - should not happen if called correctly
            System.err.println("Internal Error: Missing data for ANumber integrity check.");
            return false;
        }

        // SQL Query: Check for a record that has the entered ANumber BUT a DIFFERENT passport combination.
        String sql = "SELECT COUNT(*) FROM PUBLIC.\"Person\" WHERE \"ANumber\" = ? AND NOT (\"PassportNumber\" = ? AND \"PassportCountryCode\" = ?)";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, aNumber.trim());
            ps.setString(2, passportNumber.trim());
            ps.setString(3, countryCode.trim());

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // If count > 0, an ANumber conflict was found.
                    if (rs.getInt(1) > 0) {
                        System.err.println("❌ CONFLICT: ANumber is already assigned to a DIFFERENT passport record.");
                        return false; // Validation Failed
                    }
                }
            }
            return true; // Validation Passed

        } catch (SQLException e) {
            // Re-throw the SQLException to allow the calling method (AdmitTraveler) to handle the exception gracefully
            throw e;
        }
    }

    /**
     * Helper method to get the Alien Number, which is **mandatory** for immigrants and denied entries.
     * If the user doesn't provide a valid A-Number, one is generated automatically.
     */
    public static String getAlienNumberMandatory(Scanner scanner, Connection conn, String passportNumber, String countryCode) throws SQLException {
        String alienNumber;
        boolean isValid = false;

        System.out.println("Enter Alien Registration Number (A-Number - Mandatory, or press Enter to GENERATE new one): ");
        alienNumber = scanner.nextLine().trim();

        if (!alienNumber.isEmpty()) {
            if (alienNumber.length() < 7 || !alienNumber.matches("\\d+")) {
                System.err.println("Invalid format. A-Number must be a digit-only string (7+ digits). Attempting automatic generation.");
            } else {
                // If provided and passes format check, perform A-Number conflict check
                if (isANumberValid(conn, alienNumber, passportNumber, countryCode)) {
                    isValid = true;
                } else {
                    System.err.println("The entered A-Number conflicts with an existing record. Attempting automatic generation.");
                }
            }
        }

        // If not valid (either empty, invalid format, or conflicted), generate a new one
        if (!isValid) {
            alienNumber = generateNextANumber(conn);
            System.out.println("✅ Automatically generated new A-Number: " + alienNumber);
        }

        return alienNumber;
    }

    /**
     * Helper method to get the Alien Number, which is **optional** for admitted non-immigrants.
     * Returns null if the user skips entering a value, which allows the database to store NULL.
     */
    public static String getAlienNumberOptional(Scanner scanner, Connection conn, String passportNumber, String countryCode) throws SQLException {
        String alienNumber;
        System.out.print("Enter Alien Registration Number (A-Number - Optional, press Enter to skip): ");
        alienNumber = scanner.nextLine().trim();

        // If provided, apply basic validation and conflict check
        if (!alienNumber.isEmpty()) {
            if (alienNumber.length() < 9 || !alienNumber.matches("\\d+")) {
                System.err.println("Warning: Invalid A-Number format detected. Returning NULL.");
                return null;
            }

            // Perform A-Number conflict check against the database
            if (!isANumberValid(conn, alienNumber, passportNumber, countryCode)) {
                System.err.println("Warning: A-Number conflict detected. Returning NULL.");
                return null;
            }
        }

        // If empty, return null to be stored in DB as NULL. Otherwise, return the validated value.
        return alienNumber.isEmpty() ? null : alienNumber;
    }
}