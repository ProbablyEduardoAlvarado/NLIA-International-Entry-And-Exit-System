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

            // Read all lines and collect them into the HashSet for fast lookups
            VALID_CODES.addAll(reader.lines()
                    .map(String::trim)
                    .map(String::toUpperCase)
                    .collect(Collectors.toSet()));

        } catch (Exception e) {
            System.err.println("FATAL: Could not load country codes from " + RESOURCE_FILE);
            e.printStackTrace();
        }
    }


    /**
     * Checks if the given string contains only letters (A-Z, a-z) and spaces.
     * Used primarily for name validation.
     * @param s The string to validate.
     * @return true if the string contains only letters and spaces, false otherwise.
     */
    public static boolean containsOnlyLetters(String s) {
        // Allow letters (uppercase and lowercase) and spaces, and ensure it's not empty
        return s != null && s.trim().length() > 0 && s.matches("^[a-zA-Z\\s]+$");
    }

    /**
     * Validates a 3-character ISO country code against the pre-loaded list.
     * @param code The 3-character country code to validate.
     * @return true if the code is valid, false otherwise.
     */
    public static boolean isValidCode(String code) {
        if (code == null || code.length() != 3) {
            return false;
        }
        // Look up the uppercase version for case-insensitive checking
        return VALID_CODES.contains(code.toUpperCase());
    }

    /**
     * Validates if a date string is in the format YYYY-MM-DD.
     * @param dateString The date string to validate.
     * @return true if the format is correct, false otherwise.
     */
    public static boolean isValidDate(String dateString) {
        if (dateString == null) {
            return false;
        }
        try {
            // Attempt to parse the date using the expected format
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate.parse(dateString, formatter);
            return true;
        } catch (DateTimeParseException e) {
            return false;
        }
    }
    // --- Public Mandatory/Optional Methods ---

    /**
     * Prompts the user for an A-Number. The entry is MANDATORY and cannot be left blank.
     * The input must conform to the A######### format and pass integrity checks.
     * * @param scanner The Scanner object for user input.
     * @param conn A mock database connection for integrity checks.
     * @param passportNumber The related passport number for integrity check context.
     * @param countryCode The related country code for integrity check context.
     * @return The validated Alien Number string.
     * @throws SQLException If a database error occurs during the integrity check.
     */
    public static String getAlienNumberMandatory(Scanner scanner, Connection conn, String passportNumber, String countryCode) throws SQLException {
        String AlienNumber = null;
        boolean isValid = false;

        do {
            System.out.print("Enter Alien Number (A#########) - MANDATORY: ");
            String input = scanner.nextLine().trim();

            if (input.isEmpty()) {
                System.err.println("Error: Alien Number is mandatory and cannot be left blank.\n");
                continue; // Loop again, as input is required
            }

            // Case 1: Check format (A#########)
            if (!isValidANumberFormat(input)) {
                System.err.println("Invalid format. ANumber must start with 'A' followed by exactly 9 digits (A#########).\n");
                isValid = false;
            } else {
                // Case 2: Format is good, now check database integrity
                try {
                    isValid = checkAlienNumberIntegrity(conn, input, passportNumber, countryCode);
                } catch (SQLException e) {
                    // Re-throw the database error to the caller
                    throw e;
                }

                if (isValid) {
                    AlienNumber = input; // Assign only if valid
                } else {
                    // Error message printed inside checkAlienNumberIntegrity or the next line
                    System.err.println("Integrity check failed. Please verify the ANumber against the provided Passport/CountryCode.\n");
                }
            }

        } while (!isValid);

        return AlienNumber;
    }

    /**
     * Prompts the user for an A-Number. The entry is OPTIONAL and can be left blank.
     * If entered, the input must conform to the A######### format and pass integrity checks.
     * * @param scanner The Scanner object for user input.
     * @param conn A mock database connection for integrity checks.
     * @param passportNumber The related passport number for integrity check context.
     * @param countryCode The related country code for integrity check context.
     * @return The validated Alien Number string, or null if the user left it blank.
     * @throws SQLException If a database error occurs during the integrity check.
     */
    public String getAlienNumberOptional(Scanner scanner, Connection conn, String passportNumber, String countryCode) throws SQLException {
        String AlienNumber = null;
        boolean isValid = false;

        do {
            System.out.print("Enter Alien Number (A#########) or leave blank if not applicable (OPTIONAL): ");
            String input = scanner.nextLine().trim();

            if (input.isEmpty()) {
                // Case 1: Optional, and user entered nothing
                return null; // Exit the loop and return null
            }

            // Case 2: Check format (A#########)
            if (!isValidANumberFormat(input)) {
                System.err.println("Invalid format. ANumber must start with 'A' followed by exactly 9 digits (A#########).\n");
                isValid = false;
            } else {
                // Case 3: Format is good, now check database integrity
                try {
                    isValid = checkAlienNumberIntegrity(conn, input, passportNumber, countryCode);
                } catch (SQLException e) {
                    // Re-throw the database error to the caller
                    throw e;
                }

                if (isValid) {
                    AlienNumber = input; // Assign only if valid
                } else {
                    System.err.println("Integrity check failed. Please verify the ANumber against the provided Passport/CountryCode.\n");
                }
            }

        } while (!isValid);

        return AlienNumber;
    }
    /**
     * Validates the format of an Alien Number (A#########).
     * It must start with 'A' followed by exactly 9 digits.
     * @param aNumber The string to validate.
     * @return true if the format is correct, false otherwise.
     */
    public static boolean isValidANumberFormat(String aNumber) {
        if (aNumber == null || aNumber.trim().isEmpty()) {
            return false;
        }
        // Regex: Starts with 'A', followed by exactly 9 digits. Case-insensitive.
        return aNumber.trim().toUpperCase().matches("^A\\d{9}$");
    }

    /**
     * Checks if a given ANumber is valid and not already assigned to a different passport record.
     * This is a crucial integrity check.
     * @param conn The active database connection.
     * @param aNumber The Alien Number (A#########) to check.
     * @param passportNumber The traveler's Passport Number.
     * @param countryCode The traveler's Country Code.
     * @return true if the ANumber is valid for this passport or new; false if conflict is found.
     * @throws SQLException if a database access error occurs.
     */
    public static boolean checkAlienNumberIntegrity(Connection conn, String aNumber, String passportNumber, String countryCode) throws SQLException {
        if (conn == null) {
            System.err.println("Database connection is null during ANumber integrity check.");
            return false;
        }

        // SQL Query: Check for a record that has the entered ANumber BUT a DIFFERENT passport combination.
        // Finding ANY such record indicates a conflict (ANumber is taken by someone else).
        String sql = "SELECT COUNT(*) FROM PUBLIC.\"Person\" WHERE \"ANumber\" = ? AND NOT (\"PassportNumber\" = ? AND \"PassportCountryCode\" = ?)";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {

            // Ensure parameters match the query placeholders (?)
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

            // If count is 0, the ANumber is either not in the DB, OR it's correctly linked to the passport.
            return true; // Validation Passed

        } catch (SQLException e) {
            // Re-throw the SQLException to allow the calling method (AdmitTraveler) to handle the exception gracefully
            throw e;
        }
    }
}