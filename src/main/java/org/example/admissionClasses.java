package org.example;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/**
 * This will provide a private getter and a method to validate and calculate an Exit Date
 * based on the class of admission.
 * */
public class admissionClasses {

    /**
     * Set of all valid Admission Class codes.
     */
    private static final Set<String> VALID_CODES = new HashSet<>();

    /**
     * Set of all Admission Class codes that are considered Permanent Resident (Immigrant Visa) classes.
     * This set is loaded by parsing the 'AdmissionClass.txt' file for entries marked 'TRUE'.
     */
    private static final Set<String> PERMANENT_RESIDENT_CLASSES = new HashSet<>();

    private static final String RESOURCE_FILE = "AdmissionClass.txt";

    private static InputStream openAdmissionClassStream() throws Exception {
        // 1) Try classpath
        InputStream is = admissionClasses.class.getClassLoader().getResourceAsStream(RESOURCE_FILE);
        if (is != null) return is;

        // 2) Try working directory
        Path p1 = Paths.get(RESOURCE_FILE);
        if (Files.exists(p1)) return Files.newInputStream(p1);

        // 3) Try project layout
        Path p2 = Paths.get("src", "main", "resources", RESOURCE_FILE);
        if (Files.exists(p2)) return Files.newInputStream(p2);

        return null;
    }
    // Static initializer block to load data once when the class is loaded
    static {
        try (InputStream is = openAdmissionClassStream()) {

            if (is == null) {
                throw new FileNotFoundException(
                        "Could not find " + RESOURCE_FILE + " on the classpath OR in the working directory OR src/main/resources."
                );
            }

            try (BufferedReader reader = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8))) {

                reader.lines()
                        .map(String::trim)
                        .filter(line -> !line.isEmpty() && !line.startsWith("#"))
                        .forEach(line -> {
                            // your existing parsing logic unchanged
                            int lastCommaIndex = line.lastIndexOf(',');

                            if (lastCommaIndex != -1) {
                                String beforeComma = line.substring(0, lastCommaIndex).trim();
                                String isPermanentStr = line.substring(lastCommaIndex + 1).trim();

                                String classCode = beforeComma.split("#")[0].trim().toUpperCase();
                                if (!classCode.isEmpty()) VALID_CODES.add(classCode);
                                if ("TRUE".equalsIgnoreCase(isPermanentStr)) PERMANENT_RESIDENT_CLASSES.add(classCode);
                            }
                        });

                System.out.println("DEBUG: Loaded " + VALID_CODES.size() + " Admission Class codes.");
                System.out.println("DEBUG: Loaded " + PERMANENT_RESIDENT_CLASSES.size() + " Permanent Resident codes.");
            }

        } catch (Exception e) {
            System.err.println("FATAL: Could not load Admission Class codes from " + RESOURCE_FILE + ": " + e);
        }
    }


    /** admissionClassValidator()
     * Used to validate the AdmissionClass list in AdmissionClass.txt and returns a boolean, whether the entered Admission Class
     * is within the parameter.
     */
    public static boolean admissionClassValidator(String code) {
        if (code == null || code.trim().isEmpty()) {
            return false;
        }
        // Look up the uppercase version for case-insensitive checking
        return VALID_CODES.contains(code.toUpperCase());
    }

    /**
     * Returns an unmodifiable set of all Admission Class codes that indicate a Permanent Resident status.
     * This is used by other classes (like AdmitTraveler) to enforce ANumber entry requirements.
     * @return Set of Permanent Resident class codes.
     */
    public static Set<String> getPermanentResidentClasses() {
        return Collections.unmodifiableSet(PERMANENT_RESIDENT_CLASSES);
    }


    /** admissionClassExitDate()
     * Calculates the maximum allowed Exit Date based on the Admission Class and Arrival Date.
     * @param ArrivalDate The date of entry (YYYY-MM-DD).
     * @param AdmissionClass The class of admission code.
     * @return The calculated Exit Date (YYYY-MM-DD) or null for permanent residents/citizens.
     */
    public static String admissionClassExitDate(String ArrivalDate, String AdmissionClass){

        // The classes in this set should have a NULL ExitDate.
        if (getPermanentResidentClasses().contains(AdmissionClass) || AdmissionClass.equals("C")) {
            return null;
        }

        LocalDate arrival = LocalDate.parse(ArrivalDate);
        LocalDate exitDate;

        // Ensure the code is uppercase for the switch statement
        String upperCaseClass = AdmissionClass.toUpperCase();

        exitDate = switch (upperCaseClass) {
            // Non-Resident aliens and tourists
            case "B1", "B2" ->
                // MAX 6 month stay (180 days)
                    arrival.plusDays(180);
            case "VWP" ->
                // Visa Waiver Program 90 Days
                    arrival.plusDays(90);
            case "C1", "D" ->
                // Transit Visa / Air/Seacrew.
                    arrival.plusDays(29);
            case "F1" ->
                // Academic Student - Duration of Status (D/S). For simulation, give a long date.
                    arrival.plusYears(4).plusMonths(1); // 4 years + 1 month grace
            // All other non-immigrant codes not specifically handled above, default to a standard visitor max.
            case "A1", "A2", "AS", "E1", "E2", "H1B", "J1", "L1", "O1", "PAR", "RF", "TN" -> arrival.plusDays(365);
            default -> {
                // Fallback for codes not fully defined
                System.err.println("WARNING: Admission Class " + AdmissionClass + " has no defined Exit Date rule. Defaulting to 1 day.");
                yield arrival.plusDays(1);
            }
        };
        // Return date in YYYY-MM-DD format
        //noinspection ConstantValue
        return exitDate != null ? exitDate.toString() : null;
    }

    public static void printDebugStatus() {

    }

}