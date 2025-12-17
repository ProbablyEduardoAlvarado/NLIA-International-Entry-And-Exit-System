package org.example;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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


/*
 * A general class to encapsulate any methods which are used for validating certain data entries
 */
public class Validators {

    // --- Recursion helper: search parent dirs for a filename ---
    private static Path findFileUpwards(Path startDir, String filename, int depth) {
        if (startDir == null || depth < 0) return null;

        Path candidate = startDir.resolve(filename);
        if (Files.exists(candidate)) return candidate;

        return findFileUpwards(startDir.getParent(), filename, depth - 1); // recursion
    }

    // --- Country Code Validator Logic (Pre-loaded from resource file) ---
    private static final Set<String> VALID_CODES = new HashSet<>();
    private static final String RESOURCE_FILE = "country_codes.txt";

    static {
        try (InputStream is = openCountryCodesStream()) {

            if (is == null) {
                throw new FileNotFoundException(
                        "Could not find " + RESOURCE_FILE + " on the classpath, working directory, " +
                                "resources folder, or parent directories."
                );
            }

            try (BufferedReader reader =
                         new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8))) {

                reader.lines()
                        .map(String::trim)
                        .filter(line -> !line.isEmpty())
                        .forEach(VALID_CODES::add);
            }

            System.out.println("Loaded " + VALID_CODES.size() + " country codes.");

        } catch (Exception e) {
            System.err.println("FATAL: Could not load country codes from " + RESOURCE_FILE + ": " + e);
        }
    }

    private static InputStream openCountryCodesStream() throws IOException {
        // 1) classpath
        InputStream is = Validators.class.getClassLoader().getResourceAsStream(RESOURCE_FILE);
        if (is != null) return is;

        // 2) working dir
        Path p1 = Paths.get(RESOURCE_FILE);
        if (Files.exists(p1)) return Files.newInputStream(p1);

        // 3) typical Maven/Gradle layout
        Path p2 = Paths.get("src", "main", "resources", RESOURCE_FILE);
        if (Files.exists(p2)) return Files.newInputStream(p2);

        // 4) recursion: search upwards from current absolute dir
        Path found = findFileUpwards(Paths.get("").toAbsolutePath(), RESOURCE_FILE, 8);
        if (found != null) return Files.newInputStream(found);

        return null;
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
    @SuppressWarnings("BooleanMethodIsAlwaysInverted")
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
    @SuppressWarnings("BooleanMethodIsAlwaysInverted")
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
        String sql = "SELECT MAX(CAST(SUBSTRING(\"ANumber\" FROM 2) AS BIGINT)) FROM PUBLIC.\"Person\" WHERE \"ANumber\" IS NOT NULL AND \"ANumber\" LIKE 'A%'";
        long maxANumber = 999999999; // Start at a safe, high number if no A-Numbers exist

        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next() && rs.getString(1) != null) {
                // If a max ANumber is found, increment it.
                maxANumber = rs.getLong(1) + 1;
            } else {
                // If the table is empty or ANumber column is all null, start at the default.
                System.out.println("No existing A-Numbers found. Starting generation at: " + maxANumber);
            }
        }  catch (SQLException e) {
        // Log the detailed database error
        System.err.println("❌ Error Generating next A Number.");
        System.err.println("  > SQL State: " + e.getSQLState());
        System.err.println("  > Error Code: " + e.getErrorCode());
        System.err.println("  > Database Message: " + e.getMessage()); // <-- This is the key piece of information!
        throw e;
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
                        System.err.println("❌ CONFLICT: A-Number is already assigned to a DIFFERENT passport record.");
                        return false; // Validation Failed
                    }
                }
            }
            return true; // Validation Passed

        }
    }
    private static String normalizeANumberDigits(String aNumber) {
        if (aNumber == null) return null;
        String s = aNumber.trim();
        if (s.isEmpty()) return null;
        if (s.startsWith("A") || s.startsWith("a")) s = s.substring(1);
        s = s.trim();
        return s.isEmpty() ? null : s;
    }

    private static String findExistingANumberDigits(Connection conn, String passportNumber, String countryCode) throws SQLException {
        final String sql =
                "SELECT \"ANumber\" " +
                        "FROM PUBLIC.\"Person\" " +
                        "WHERE \"PassportNumber\" = ? AND \"PassportCountryCode\" = ? " +
                        "LIMIT 1";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, passportNumber.trim());
            ps.setString(2, countryCode.trim());

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return normalizeANumberDigits(rs.getString("ANumber"));
                }
            }
        }
        return null;
    }

    /**
     * Helper method to get the Alien Number, which is **mandatory** for immigrants and denied entries.
     * If the user doesn't provide a valid A-Number, one is generated automatically.
     */
    public static String getAlienNumberMandatory(Scanner scanner, Connection conn, String passportNumber, String countryCode) throws SQLException {
        // An A-Number should be added to future records of a person if someone already has it
        String existingDigits = findExistingANumberDigits(conn, passportNumber, countryCode);

        System.out.println("Enter Alien Registration Number (A-Number - Mandatory).");
        if (existingDigits != null) {
            System.out.println("Press Enter to USE existing A-Number on file.");
        } else {
            System.out.println("Press Enter to GENERATE a new A-Number.");
        }

        String input = scanner.nextLine().trim();

        // 1) If user hits Enter:
        if (input.isEmpty()) {
            if (existingDigits != null) {
                System.out.println("Using existing A-Number on file: A" + existingDigits);
                return existingDigits; // return digits only (caller may prefix "A")
            }

            String generated = generateNextANumber(conn);
            System.out.println("Automatically generated new A-Number: A" + generated);
            return generated;
        }

        // 2) If user typed something, accept either "A#########" or "#########"
        String enteredDigits = normalizeANumberDigits(input);

        if (enteredDigits == null || enteredDigits.length() < 7 || !enteredDigits.matches("\\d+")) {
            System.err.println("Invalid format. A-Number must be digits (optionally starting with 'A').");

            // If there is already one on file, prefer it over generating a new one.
            if (existingDigits != null) {
                System.out.println("Reverting to existing A-Number on file: A" + existingDigits);
                return existingDigits;
            }

            String generated = generateNextANumber(conn);
            System.out.println("Automatically generated new A-Number: A" + generated);
            return generated;
        }

        // 3) Conflict check (only if user provided a new value)
        if (isANumberValid(conn, enteredDigits, passportNumber, countryCode)) {
            return enteredDigits;
        }

        System.err.println("The entered A-Number conflicts with an existing record.");

        // If person already has one on file, use it instead of generating a second one.
        if (existingDigits != null) {
            System.out.println("Using existing A-Number on file: A" + existingDigits);
            return existingDigits;
        }

        String generated = generateNextANumber(conn);
        System.out.println("Automatically generated new A-Number: A" + generated);
        return generated;
    }


    /**
     * Helper method to get the Alien Number, which is **optional** for admitted non-immigrants.
     * Returns null if the user skips entering a value, which allows the database to store NULL.
     */
    public static String getAlienNumberOptional(Scanner scanner, Connection conn, String passportNumber, String countryCode) throws SQLException {
        // If this passport already has an A-Number on file, prefer reusing it (don’t wipe it out to NULL).
        String existingDigits = findExistingANumberDigits(conn, passportNumber, countryCode);

        System.out.print("Enter Alien Registration Number (A-Number - Optional): ");
        if (existingDigits != null) {
            System.out.print("press Enter to USE existing A-Number on file, or type a new one: ");
        } else {
            System.out.print("press Enter to skip: ");
        }

        String input = scanner.nextLine().trim();

        // If user hits Enter:
        if (input.isEmpty()) {
            // Reuse existing if present; otherwise truly skip (NULL).
            return existingDigits; // may be null
        }

        // Accept either "A#########" or "#########"
        String digits = normalizeANumberDigits(input);

        // Optional: if invalid, fall back to existing (if any), otherwise NULL.
        if (digits == null || digits.length() < 9 || !digits.matches("\\d+")) {
            System.err.println("Warning: Invalid A-Number format detected.");
            return existingDigits; // if null, this correctly returns NULL
        }

        // Conflict check: only needed if user typed a value
        if (!isANumberValid(conn, digits, passportNumber, countryCode)) {
            System.err.println("Warning: A-Number conflict detected.");
            return existingDigits; // if null, this correctly returns NULL
        }

        return digits;
    }
    }
