package org.example;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.time.LocalDate;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

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


    // Static initializer block to load data once when the class is loaded
    static {
        try (InputStream is = admissionClasses.class.getClassLoader().getResourceAsStream(RESOURCE_FILE);
             BufferedReader reader = new BufferedReader(new InputStreamReader(is))) {

            if (is == null) {
                throw new Exception("Resource file not found: " + RESOURCE_FILE);
            }

            // Read all lines and process them
            reader.lines()
                    .map(String::trim)
                    .filter(line -> !line.isEmpty() && !line.startsWith("#")) // Skip empty lines and comments
                    .forEach(line -> {
                        // Example line format: B1 # Business Visitor, FALSE
                        // Split by the '#' comment marker
                        String codeAndStatus = line.split("#")[0].trim();

                        // Split by the comma to get the class code and the permanent status boolean
                        String[] parts = codeAndStatus.split(", ");
                        if (parts.length >= 2) {
                            String classCode = parts[0].trim().toUpperCase();
                            String isPermanentStr = parts[1].trim(); // Should be TRUE or FALSE

                            if (!classCode.isEmpty()) {
                                VALID_CODES.add(classCode);
                            }

                            if ("TRUE".equalsIgnoreCase(isPermanentStr)) {
                                PERMANENT_RESIDENT_CLASSES.add(classCode);
                            }
                        }
                    });


            // Diagnostic check for codes loaded
            System.out.println("DEBUG: Loaded " + VALID_CODES.size() + " Admission Class codes.");
            System.out.println("DEBUG: Loaded " + PERMANENT_RESIDENT_CLASSES.size() + " Permanent Resident codes.");


        } catch (Exception e) {
            System.err.println("FATAL: Could not load Admission Class codes from " + RESOURCE_FILE);
            e.printStackTrace();
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
        LocalDate exitDate = null;

        // Ensure the code is uppercase for the switch statement
        String upperCaseClass = AdmissionClass.toUpperCase();

        switch (upperCaseClass){
            // Non-Resident aliens and tourists
            case "B1", "B2":
                // MAX 6 month stay (180 days)
                exitDate = arrival.plusDays(180);
                break;
            case "VWP":
                // Visa Waiver Program 90 Days
                exitDate = arrival.plusDays(90);
                break;
            case "C1", "D":
                // Transit Visa / Air/Seacrew. 
                exitDate = arrival.plusDays(29);
                break;
            case "F1":
                // Academic Student - Duration of Status (D/S). For simulation, give a long date.
                exitDate = arrival.plusYears(4).plusMonths(1); // 4 years + 1 month grace
                break;
            // All other non-immigrant codes not specifically handled above, default to a standard visitor max.
            case "A1", "A2", "AS", "E1", "E2", "H1B", "J1", "L1", "O1", "PAR", "RF", "TN":
                exitDate = arrival.plusDays(365);
                break;
            default:
                // Fallback for codes not fully defined
                System.err.println("WARNING: Admission Class " + AdmissionClass + " has no defined Exit Date rule. Defaulting to 1 day.");
                exitDate = arrival.plusDays(1);
        }

        // Return date in YYYY-MM-DD format
        return exitDate != null ? exitDate.toString() : null;
    }

    public static void printDebugStatus() {

    }

}