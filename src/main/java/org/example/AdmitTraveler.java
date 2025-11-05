package org.example;
import java.awt.*;
import java.sql.*;
import java.util.Scanner;

import static java.lang.Boolean.TRUE;
import static java.sql.Types.NULL;
import static org.example.Validators.*;
import static org.example.admissionClasses.admissionClassValidator;


/**
 * Handles the interface for the SQL Function to Admit_New_Traveler.
 */
public class AdmitTraveler {

    /**
     * Prompts the user for data and calls the Admit_New_Traveler SQL function
     * using the persistent database connection.
     *
     * @param conn The active, persistent database connection.
     */
    public void admitNewTraveler(Connection conn) { // Changed parameter to Connection

        /*
         * Input Collection and Validation Logic:
         * This section provides the ability to input all required values for the function and requires validation
         * before proceeding to the next required value. It prevents approaching the final SQL function input
         * with invalid data.
         *
         * In real life practice this would be validated generally quickly using the Machine Readable Zone (MRZ) and chip
         * being read by a machine to automatically populate a majority of the admission record.  But as this is not the
         * case, it will be all manual.  Future ideas: Maybe a GUI to make this feel saner.
         */

        Scanner scanner = new Scanner(System.in);
        System.out.println("\n--- Admit New Traveler  ---");
        String GivenName; // Initialize to an empty string to fix scope/assignment errors
        int length;

        // Constraint: GivenName < 50 chars and only CHARS
        do {
            System.out.print("Enter Given Name: ");
            GivenName = scanner.nextLine();
            length = GivenName.length();

            if (length > 50) {
                System.err.println("Invalid input. Name cannot exceed 50 characters.\n");
            } else if (!containsOnlyLetters(GivenName)) {
                System.err.println("Invalid input, Name should only contain characters.\n");
            }
        } while (length > 50 || !containsOnlyLetters(GivenName)); // Loop continues as long as the input is INVALID

        //Constraint: Surname < 50 chars and only CHARS
        String Surname;
        do {
            System.out.print("Enter Surname: ");
            Surname = scanner.nextLine();
            length = Surname.length();
            if (length > 50) {
                System.err.println("Invalid input. Name cannot exceed 50 characters.\n");
            } else if (!containsOnlyLetters(Surname)) { // CORRECTED: Checking Surname
                System.err.println("Invalid input, Name should only contain characters.\n");
            }
        } while (length > 50 || !containsOnlyLetters(Surname)); // CORRECTED: Added containsOnlyLetters check


        // Constraint: DOB should be in YYYY-MM-DD Format
        String DOB = "";
        boolean isValidFormat;

        do {
            System.out.print("Enter Date of Birth (YYYY-MM-DD): ");
            DOB = scanner.nextLine();

            isValidFormat = isValidDate(DOB);

            if (!isValidFormat) {
                System.err.println("Invalid input. Date must be a valid calendar date in the YYYY-MM-DD format (e.g., 2000-01-31).");
            }

        } while (!isValidFormat);

        System.out.print("Enter Passport Number: ");
        String PassportNumber = scanner.nextLine();


        // Constraint: CountryCode MUST be within the parameters inside the country_code.txt list.  Will validate and
        // loop until a true value is returned.
        String CountryCode;
        boolean isCountryCodeValid;

        do {
            System.out.print("Enter Country of Citizenship (3-letter code): ");
            CountryCode = scanner.nextLine();
            // Check validation only once
            isCountryCodeValid = isValidCode(CountryCode); // Use full class name if not static imported
            if (!isCountryCodeValid) {
                System.err.println("\"" + CountryCode + "\" is invalid. Please enter a valid 3-letter code.");
            }
        } while (!isCountryCodeValid);

        //Passport Issue Date YYYY-MM-DD
        //Passport Expiry Date YYYY-MM-DD (Must be 10years minus 1 day.) If not, suspect fraud.
        //Airline Codes MUST be 3 letters (ICAO)
        //Flight Numbers can be up to 4 numbers.
        //Origin Airport MUST be the IATA Code
        //OriginCountry MAY NOT be the US, and must follow the Country Code validation
        //ArrivalDate YYYY-MM-DD


        //AdmissionClass Must be validated through the available class codes, and certain non-permanent residents must
            //have their exit date calculated.
        String AlienNumber;
        String AdmissionClass;
        String AdmissionClassInput;
        Boolean Admitted;
        String ExitDate;
        String NotAdmittedReason;

        /*
        * Now that the required documentation of ALL arriving passengers are entered the admission process can
        * begin. This IF-ELSE Statement will simply the admission for Citizens by automatically assigning:
        * AlienNumber = NULL
        * AdmissionClass = "C"
        * Admitted = TRUE
        * ExitDate = NULL
        * NotAdmittedReason = NULL
        * */
        if (CountryCode.equalsIgnoreCase("USA")){
            AlienNumber = null;
            AdmissionClass = "C";
            Admitted = TRUE;
            ExitDate = null;
            NotAdmittedReason = null;
            
            // All other Arrivals will be subjected to the Admissions Process and validation requirements for all
            // arrivals through a do-while loop.
        }else { // Returning Permanent Residents (Green Card Holders) 'PR' Class, will receive expedited validation
            admissionClasses.printDebugStatus(); // Temporary Debug statement ensuring the AdmissionClasses have been parsed.
            boolean isAdmissionClassValid;
            System.out.println("Enter the Admission Class of the Arriving Alien \nReturning Permanent Residents may be coded as 'PR'/'ARC'/'LPR");
            do {
                AdmissionClassInput = scanner.nextLine();
                isAdmissionClassValid = admissionClasses.admissionClassValidator(AdmissionClassInput);
                if(!isAdmissionClassValid){
                    System.err.println("The Admission Class is NOT VALID.  Enter a valid Class of Admission.");
                }
            } while (!isAdmissionClassValid);
            if (AdmissionClassInput.equalsIgnoreCase("PR") || AdmissionClassInput.equalsIgnoreCase("LPR") || AdmissionClassInput.equalsIgnoreCase("ARC") || AdmissionClassInput.equalsIgnoreCase("PERMANENT RESIDENT")) {
                AdmissionClass = "PR"; // Assign the correct validation and begin the loop for the Alien Number Entry
                Admitted = TRUE;
                ExitDate = null;
                NotAdmittedReason = null;
                System.out.println("Enter the Alien Registration Number (A-Number) for the Returning LPR [Format: A#########]:");
                String inputANumber;

            }else { // All other aliens

            }
        }
        //AdmittedBoolean IF a person is NOT admitted (FALSE) an Alien Number MUST be entered, along with an ExitDate and DenialReason
        // AlienNumber is set to null if the user leaves it empty/optional.

        // ExitDate should be calculated by a Temporary visitor's class automatically, if the admitted flag is FALSE,
            // an override should be triggered for the officer to enter the next available flight for removal.
        //DenialReason should not exceed 255 Chars.

        try {
            // Placeholder for SQL execution logic
            System.out.println("Preparing to execute SQL function with data:");
            System.out.println("  Name: " + GivenName + ", Admission Class: ");

            // Call function Admit_New_Traveler
            CallableStatement cs = conn.prepareCall("{call Admit_New_Traveler(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
            cs.setString(1, GivenName);
            cs.setString(2, Surname);
            cs.setString(3, DOB);
            cs.setString(4, PassportNumber);
            cs.setString(5, CountryCode);
            //cs.setString(6, PassportIssueDate);
            //cs.setString(7, PassportExpiry);
            //cs.setString(8, AirlineCode);
            //cs.setString(9, FlightNumber);
            //cs.setString(10, OriginAirport);
            //cs.setString(11, OriginCountry);
            //cs.setString(12, ArrivalDate);
            //cs.setString(13, AdmissionClass); // All must have an admission class for the sake of entry.
            //cs.setString(14, AdmittedBoolean); // IF FALSE, an AlienNumber must be generated and checked against the DB for uniqueness.
            //cs.setString(15, AlienNumber); // Can be NULL if citizen or certain classes of visas.
            //cs.setString(16, ExitDate); // Can be NULL **IF** Citizen/Permanent Resident/IV Admitted
            //cs.setString(17, DenialReason); // Is null if AdmittedBoolean is TRUE


            // cs.execute();

            if (conn.isValid(1)) {
                System.out.println("✅ Success: Traveler '" + GivenName + "' data processed using persistent connection.");
            }

        } catch (SQLException e) {
            System.err.println("❌ Database Error during Traveler Admission: " + e.getMessage());
        }
    }
    private String promptAndValidateAlienNumber(Scanner scanner, Connection conn, String passportNumber, String countryCode) {
        String AlienNumber = null;
        boolean isANumberValid = false;

        do {
            System.out.print("Enter Alien Number (ANumber) [Optional - Format: A#########]: ");
            String inputANumber = scanner.nextLine().trim();

            if (inputANumber.isEmpty()) {
                // Case 1: Empty/NULL is allowed
                AlienNumber = null;
                isANumberValid = true;

                if (inputANumber && AdmissionClass == "PR"){}
            } else {
                // Case 2: Check format (A#########)
                if (!isValidANumberFormat(inputANumber)) {
                    System.err.println("Invalid format. ANumber must start with 'A' followed by exactly 9 digits (A#########).");
                    isANumberValid = false;
                } else {
                    // Case 3: Format is good, now check database integrity
                    try {
                        // checkAlienNumberIntegrity is static in Validators and handles all DB logic
                        isANumberValid = checkAlienNumberIntegrity(conn, inputANumber, passportNumber, countryCode);
                    } catch (Exception e) {
                        System.err.println("Database check failed during ANumber validation: " + e.getMessage());
                        isANumberValid = false;
                    }

                    if (isANumberValid) {
                        AlienNumber = inputANumber; // Assign only if valid
                    } else {
                        // Error message printed inside checkAlienNumberIntegrity or above
                        System.err.println("Please correct the ANumber or ensure the Passport/CountryCode is correct.");
                    }
                }
            }

        } while (!isANumberValid);

        return AlienNumber;
    }
}