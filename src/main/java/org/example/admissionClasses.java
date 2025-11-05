package org.example;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * This will provide a private getter and a method to validate and calculate an Exit Date
 * based on the class of admission.
 * */
public class admissionClasses {

    /** admissionClassValidator()
     * Used to validate the AdmissionClass list in AdmissionClass.txt and returns a boolean, whether the entered Admission Class
     * is within the parameter.
     */

    private static final Set<String> VALID_CODES = new HashSet<>();
    private static final String RESOURCE_FILE = "AdmissionClass.txt";

    static {
        try (InputStream is = admissionClasses.class.getClassLoader().getResourceAsStream(RESOURCE_FILE);
             BufferedReader reader = new BufferedReader(new InputStreamReader(is))) {

            // Read all lines and collect them into the HashSet for fast lookups
            VALID_CODES.addAll(reader.lines()
                    .map(String::trim)
                    .map(line -> line.split("#")[0].trim()) // FIX: Strip everything after the '#' comment marker
                    .filter(line -> !line.isEmpty()) // Filter out blank lines after stripping comments
                    .map(String::toUpperCase)
                    .collect(Collectors.toSet()));

            // NOTE: DEBUG print statement has been moved to printDebugStatus()

        } catch (Exception e) {
            System.err.println("FATAL: Could not load Admission Class codes from " + RESOURCE_FILE);
            e.printStackTrace();
        }
    }

    /**
     * Prints the current status of the loaded Admission Class codes.
     * Call this method explicitly to control the timing of the debug message.
     */
    public static void printDebugStatus() {
        // Calling this method forces the static block above to run first, then prints the status.
        System.out.println("DEBUG: Loaded " + VALID_CODES.size() + " Admission Class codes.");
    }


    public static boolean admissionClassValidator(String code) {
        if (code == null || code.trim().isEmpty()) {
            return false;
        }
        // Look up the uppercase version for case-insensitive checking
        return VALID_CODES.contains(code.toUpperCase());
    }

    /** admissionClassExitDate()
     * ExitDate will be calculated after the Admission Code is entered into the validator.
     * As a method, the validated Admission Code and the date of attempted entry will be switched to a specific case to
     *  determine the Maximum allowed date under that specific class of admission
     * @
     */
    private String admissionClassExitDate(String ArrivalDate, String AdmissionClass){
        switch (AdmissionClass){
            // First will load the nulls for Permanent Resident Classes/Citizens/Immigrant Visas.
            // 'C' Citizens will skip this method catching as they will have their ExitDate immediately set to NULL.
            case "DV","EB1","EB2","EB3","EB4","EB5","F2A","F3","F4","IR1","IR2","IR5","PR","ARC","LPR","SB":{

            }
            // Aliens permitted to reside until their duration of status (D/S) expires.
            // Heavily...heavily resist using NULLs for classes other than Permanent residents/IVs/Citizens
            // Give general discretion for Students (for the sake of this simulation, will default to 4 years+1 month grace)
            case "A1":

        }
        return ExitDate;
    }
}
