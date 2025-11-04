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
import java.util.Set;
import java.util.stream.Collectors;


/*
 * A general class to encapsulate any methods which are used for validating certain data entries
 */
public class Validators {


    /** isValidCode()
     * Used to validate the CountryCodes list in country_codes.txt and returns a boolean, whether the entered CountryCode
     * is within the parameter.  If it is FALSE, it will order the officer to repeat the task.  Can also be used
     * in validating other Country use applications to ensure a clean reference to the Database list of CountryCodes.
     * Assists in performance by not requiring a query of the DB to ensure the CountryCode is in the correct format.
     */

    private static final Set<String> VALID_CODES = new HashSet<>();
    private static final String RESOURCE_FILE = "country_codes.txt";

    static {
        try (InputStream is = Validators.class.getClassLoader().getResourceAsStream(RESOURCE_FILE);
             BufferedReader reader = new BufferedReader(new InputStreamReader(is))) {

            // Read all lines and collect them into the HashSet for fast lookups
            VALID_CODES.addAll(reader.lines()
                    .map(String::trim)
                    .map(String::toUpperCase)
                    .collect(Collectors.toSet()));

        } catch (Exception e) {
            // Handle error, e.g., if the file isn't found
            System.err.println("FATAL: Could not load country codes from " + RESOURCE_FILE);
            e.printStackTrace();
        }
    }

    public static boolean isValidCode(String code) {
        if (code == null || code.length() != 3) {
            return false;
        }
        // Look up the uppercase version for case-insensitive checking
        return VALID_CODES.contains(code.toUpperCase());
    }


    /** containsOnlyLetters()
     * Checks if a string contains only letters and spaces.
     * @param str The string to validate.
     * @return true if the string is non-empty and contains only valid characters, false otherwise.
     */
    public static boolean containsOnlyLetters(String str) {
        if (str == null || str.trim().isEmpty()) {
            return false; // Reject empty or null strings
        }

        // Check every character in the string
        for (char c : str.toCharArray()) {
            // Allow letters (a-z, A-Z) and spaces
            if (!Character.isLetter(c) && c != ' ') {
                return false; // Found a character that is NOT a letter and NOT a space (like a number)
            }
        }
        return true; // All characters passed the check
    }

    /** isValidDate()
     * Validates a string input against the 'YYYY-MM-DD' date format.
     * @param dateStr The date string to check.
     * @return true if the date is valid and in the correct format, false otherwise.
     */
    public static boolean isValidDate(String dateStr) {
        // Check for null or empty string first
        if (dateStr == null || dateStr.trim().isEmpty()) {
            return false;
        }

        // Define the specific format required (DD for day, MM for month, YYYY for year)
        // Note: The format to be enforced (YYYY-MM-DD) is used here.
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        try {
            // Attempt to parse the date. This checks format AND validity (e.g., no Feb 30)
            LocalDate.parse(dateStr, formatter);
            return true;
        } catch (DateTimeParseException e) {
            // Parsing failed (either bad format or invalid date)
            return false;
        }
    }

    /** isValidANumberFormat()
     * Validates that the Alien Number (ANumber) follows the format A######### (A followed by 9 digits).
     * @param aNumber The Alien Number string to validate.
     * @return true if the format is correct, false otherwise.
     */
    public static boolean isValidANumberFormat(String aNumber) {
        // The regex pattern is: start of string (^), letter 'A', exactly 9 digits (\d{9}), end of string ($).
        return aNumber.matches("^A\\d{9}$");
    }


    /** checkAlienNumberIntegrity()
     * Checks for database integrity regarding the Alien Number (ANumber).
     * NOTE: This method is now STATIC to allow easy access via static import.
     * @param conn The active database connection.
     * @param aNumber The Alien Number entered by the user.
     * @param passportNumber The traveler's Passport Number.
     * @param countryCode The traveler's Passport Country Code.
     * @return true if the ANumber is valid for this person (or not yet claimed), false if it conflicts with another person's record.
     */
    public static boolean checkAlienNumberIntegrity(Connection conn, String aNumber, String passportNumber, String countryCode) {
        // If no ANumber is provided, no DB validation is required (it's NULL)
        if (aNumber == null || aNumber.trim().isEmpty()) {
            return true;
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
            System.err.println("Database error during ANumber validation: " + e.getMessage());
            // For safety, assume failure if the database check fails
            return false;
        }
    }
}