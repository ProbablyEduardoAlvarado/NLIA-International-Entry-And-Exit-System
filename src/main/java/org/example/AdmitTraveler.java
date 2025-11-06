package org.example;
import java.sql.*;
import java.time.LocalDate;
import java.util.Scanner;

import static java.lang.Boolean.TRUE;
import static org.example.Validators.*;
import static org.example.admissionClasses.admissionClassValidator;
import static org.example.admissionClasses.admissionClassExitDate;


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
    public void admitNewTraveler(Connection conn) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("\n--- Admit New Traveler  ---");
        String GivenName;
        String Surname;
        String DOB;
        String PassportNumber;
        String CountryCode;
        String PassportIssueDate;
        String PassportExpiry;
        String AirlineCode;
        String FlightNumber;
        String OriginAirport;
        String ArrivalDate;
        String AdmissionClass = "";
        String AlienNumber; // Declared here for function scope

        int length;

        // --- 1. Given Name ---
        // Constraint: GivenName < 50 chars and only CHARS
        do {
            System.out.print("Enter Given Name: ");
            GivenName = scanner.nextLine();
            length = GivenName.length();

            if (length > 50) {
                System.err.println("Invalid input. Name cannot exceed 50 characters.\n");
            } else if (!containsOnlyLetters(GivenName)) {
                System.err.println("Invalid input. Name should only contain characters and spaces.\n");
            }
        } while (length > 50 || !containsOnlyLetters(GivenName));

        // --- 2. Surname ---
        // Constraint: Surname < 50 chars and only CHARS
        do {
            System.out.print("Enter Surname: ");
            Surname = scanner.nextLine();
            length = Surname.length();

            if (length > 50) {
                System.err.println("Invalid input. Surname cannot exceed 50 characters.\n");
            } else if (!containsOnlyLetters(Surname)) {
                System.err.println("Invalid input. Surname should only contain characters and spaces.\n");
            }
        } while (length > 50 || !containsOnlyLetters(Surname));

        // --- 3. Date of Birth ---
        do {
            System.out.print("Enter Date of Birth (YYYY-MM-DD): ");
            DOB = scanner.nextLine();
            if (!isValidDate(DOB)) {
                System.err.println("Invalid input. Date must be in YYYY-MM-DD format.\n");
            }
        } while (!isValidDate(DOB));

        // --- 4. Passport Number ---
        System.out.print("Enter Passport Number: ");
        PassportNumber = scanner.nextLine();

        // --- 5. Country of Citizenship ---
        do {
            System.out.print("Enter Country of Citizenship (3-letter Code): ");
            CountryCode = scanner.nextLine().trim().toUpperCase();
            if (!isValidCode(CountryCode)) {
                System.err.println("Invalid input. Country Code must be a 3-letter code found in the valid list.\n");
            }
        } while (!isValidCode(CountryCode));

        // --- 6. Passport Issue Date ---
        do {
            System.out.print("Enter Passport Issue Date (YYYY-MM-DD): ");
            PassportIssueDate = scanner.nextLine();
            if (!isValidDate(PassportIssueDate)) {
                System.err.println("Invalid input. Date must be in YYYY-MM-DD format.\n");
            }
        } while (!isValidDate(PassportIssueDate));

        // --- 7. Passport Expiry Date ---
        do {
            System.out.print("Enter Passport Expiry Date (YYYY-MM-DD): ");
            PassportExpiry = scanner.nextLine();
            if (!isValidDate(PassportExpiry)) {
                System.err.println("Invalid input. Date must be in YYYY-MM-DD format.\n");
            }
        } while (!isValidDate(PassportExpiry));

        // --- 8. Airline Code (2-letter) ---
        do {
            System.out.print("Enter Airline Code (3-letter): ");
            AirlineCode = scanner.nextLine().trim().toUpperCase();
            if (AirlineCode.length() != 3) {
                System.err.println("Invalid input. Airline Code must be exactly 3 letters.\n");
            }
        } while (AirlineCode.length() != 3);

        // --- 9. Flight Number ---
        do {
            System.out.print("Enter Flight Number (Max 4 digits): ");
            FlightNumber = scanner.nextLine().trim();
            if (FlightNumber.length() > 4 || !FlightNumber.matches("\\d+")) {
                System.err.println("Invalid input. Flight Number must be 1-4 digits.\n");
            }
        } while (FlightNumber.length() > 4 || !FlightNumber.matches("\\d+"));

        // --- 10. Origin Airport (3-letter Code) ---
        do {
            System.out.print("Enter Origin Airport Code (3-letter IATA): ");
            OriginAirport = scanner.nextLine().trim().toUpperCase();
            if (OriginAirport.length() != 3 || !OriginAirport.matches("[A-Z]+")) {
                System.err.println("Invalid input. Origin Airport Code must be exactly 3 letters.\n");
            }
        } while (OriginAirport.length() != 3 || !OriginAirport.matches("[A-Z]+"));

        // 11. Flight Country Code
        String FlightCountryCode;
        do {
            System.out.print("Enter The Country of the Origin Flight entered, " + AirlineCode + FlightNumber + ":");
            FlightCountryCode = scanner.nextLine().trim().toUpperCase();
            if (!isValidCode(FlightCountryCode)) {
                System.err.println("Invalid input. Country Code must be a 3-letter code found in the valid list.\n");
            }
        } while (!isValidCode(FlightCountryCode));

        // --- 13. Arrival Date ---
        do {
            System.out.print("Enter Arrival Date (YYYY-MM-DD): ");
            ArrivalDate = scanner.nextLine();
            if (!isValidDate(ArrivalDate)) {
                System.err.println("Invalid input. Date must be in YYYY-MM-DD format.\n");
            }
        } while (!isValidDate(ArrivalDate));

        // --- 12. Admission Class ---

        //AdmissionClass Must be validated through the available class codes, and certain non-permanent residents must
        //have their exit date calculated.
        String AdmissionClassInput;
        boolean Admitted;
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
            Admitted = true;
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
                isAdmissionClassValid = admissionClassValidator(AdmissionClassInput);
                if(!isAdmissionClassValid){
                    System.err.println("The Admission Class is NOT VALID.  Enter a valid Class of Admission.");
                }
            } while (!isAdmissionClassValid);
            if (AdmissionClassInput.equalsIgnoreCase("PR") || AdmissionClassInput.equalsIgnoreCase("LPR") || AdmissionClassInput.equalsIgnoreCase("ARC") || AdmissionClassInput.equalsIgnoreCase("PERMANENT RESIDENT")) {
                AdmissionClass = "PR"; // Assign the correct validation and begin the loop for the Alien Number Entry
                Admitted = true;
                ExitDate = null;
                NotAdmittedReason = null;
                try {
                    AlienNumber = Validators.getAlienNumberMandatory(scanner, conn, PassportNumber, CountryCode);
                } catch (SQLException e) {
                    System.err.println("Database error during Alien Number validation: " + e.getMessage());

                    throw new RuntimeException(e);
                }


            }else { // All other aliens, Review Admissibility and admit or deny
                System.out.print("Will the alien be admitted? Enter TRUE OR FALSE");
                // Loop until a valid boolean is entered
                while (!scanner.hasNextBoolean()) {
                    System.err.println("Invalid input. Enter TRUE or FALSE");
                    scanner.next(); // Consume the invalid input to avoid an infinite loop
                }
                // Once validated, read the boolean value
                Admitted = scanner.nextBoolean();

                if(Admitted){ // The Traveler is Admitted and now the ExitDate is calculated.
                    admissionClassValidator(AdmissionClass);

                }else {

                }
            }
        }
        //AdmittedBoolean IF a person is NOT admitted (FALSE) an Alien Number MUST be entered, along with an ExitDate and DenialReason
        // AlienNumber is set to null if the user leaves it empty/optional.

        // ExitDate should be calculated by a Temporary visitor's class automatically, if the admitted flag is FALSE,
        // an override should be triggered for the officer to enter the next available flight for removal.
        //DenialReason should not exceed 255 Chars.

        // --- 13. Alien Number ---


        // --- 14. Calculated Exit Date ---
        ExitDate = admissionClassExitDate(ArrivalDate, AdmissionClass);

        // List the prepared traveler record.
        System.out.println("----- Traveler Details ----- \n" +
                "Name:" + Surname + ", " + GivenName+" | DOB" + DOB +
                "\nCitizen of " + CountryCode +" | Passport No. " + PassportNumber + " | Issue Date: " + PassportIssueDate + " | Expiry: "+PassportExpiry
                + "\n----- Flight Details -----\n");
        // --- SQL Execution ---
        try {
            System.out.println("\n--- Submitting New Traveler Record ---");


            CallableStatement cs = conn.prepareCall("{call Admit_New_Traveler(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");

            cs.setString(1, GivenName);
            cs.setString(2, Surname);
            cs.setString(3, DOB);
            cs.setString(4, PassportNumber);
            cs.setString(5, CountryCode);
            cs.setString(6, PassportIssueDate);
            cs.setString(7, PassportExpiry);
            cs.setString(8, AirlineCode);
            cs.setString(9, FlightNumber);
            cs.setString(10, OriginAirport);
            cs.setString(11, FlightCountryCode);
            cs.setString(12, ArrivalDate);
            cs.setString(13, AdmissionClass);
            //cs.setString(14, Admitted);
            //cs.setObject(15, AlienNumber, Types.VARCHAR); // Use setObject for potential NULL value
            cs.setObject(16, ExitDate, Types.DATE);       // Use setObject for potential NULL value
            //cs.setObject(17, DenialReason, Types.VARCHAR);

            //cs.execute();

            if (conn.isValid(1)) {
                System.out.println("✅ Success: Traveler '" + GivenName + " " + Surname + "' admitted successfully!");
            }

        } catch (SQLException e) {
            System.err.println("❌ Database Error: Failed to admit new traveler.");
            System.err.println("SQL State: " + e.getSQLState());
            System.err.println("Error Message: " + e.getMessage());
        }
    }



    /**
     * Helper method to repeatedly prompt and validate the Admission Class input.
     */
    private String validateAdmissionClass(Scanner scanner) {
        String AdmissionClass;
        do {
            System.out.print("Enter Admission Class (e.g., B2, H1B, PR): ");
            AdmissionClass = scanner.nextLine().trim().toUpperCase();
            // Check if the code is in the preloaded list from AdmissionClass.txt
            if (!admissionClassValidator(AdmissionClass)) {
                System.err.println("Invalid input. Admission Class must be a valid 3 or 4-character code.\n");
            }
        } while (!admissionClassValidator(AdmissionClass));
        return AdmissionClass;
    }


}