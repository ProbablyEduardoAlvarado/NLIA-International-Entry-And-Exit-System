package org.example;

import java.sql.*;
import java.time.LocalDate;
import java.util.Scanner;
import static org.example.Validators.*;
import static org.example.admissionClasses.*;


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

        String CountryCode = "";
        String PassportIssueDate;
        String PassportExpiry;
        String AirlineCode;
        String FlightNumber;
        String OriginAirport;
        String ArrivalDate;
        String AdmissionClass = "";
        String AlienNumber = "";
        int length;

        /*
         * Query the DB with the initial Passport details and country details to check for an existing
         * passport/person record to populate the remaining biographical details section (and A-Number if it's there)
         * to expedite the process to the flight and admission details
         */

        PassportLookupResult r = checkForPresentPassportRecord(conn, scanner);


        PassportNumber = r.passportNumber();
        CountryCode    = r.countryCode();

        if (r.found()) {
            // Autofill from DB
            GivenName        = r.givenName();
            Surname          = r.surname();
            DOB              = r.dob();
            AlienNumber      = r.aNumber();
            PassportIssueDate = r.issueDate();
            PassportExpiry    = r.expDate();
        } else {
            // Not presently found in the DB: continue with manual entry
            do {
                System.out.print("Enter Given Name: ");
                GivenName = scanner.nextLine();
                length = GivenName.length();
                if (length > 50) System.err.println("Invalid input. Name cannot exceed 50 characters.\n");
                else if (!containsOnlyLetters(GivenName)) System.err.println("Invalid input. Name should only contain characters and spaces.\n");
            } while (length > 50 || !containsOnlyLetters(GivenName));

            do {
                System.out.print("Enter Surname: ");
                Surname = scanner.nextLine();
                length = Surname.length();
                if (length > 50) System.err.println("Invalid input. Surname cannot exceed 50 characters.\n");
                else if (!containsOnlyLetters(Surname)) System.err.println("Invalid input. Surname should only contain characters and spaces.\n");
            } while (length > 50 || !containsOnlyLetters(Surname));

            do {
                System.out.print("Enter Date of Birth (YYYY-MM-DD): ");
                DOB = scanner.nextLine();
                if (!isValidDate(DOB)) System.err.println("Invalid input. Date must be in YYYY-MM-DD format.\n");
            } while (!isValidDate(DOB));

            do {
                System.out.print("Enter Passport Issue Date (YYYY-MM-DD): ");
                PassportIssueDate = scanner.nextLine();
                if (!isValidDate(PassportIssueDate)) System.err.println("Invalid input. Date must be in YYYY-MM-DD format.\n");
            } while (!isValidDate(PassportIssueDate));

            do {
                System.out.print("Enter Passport Expiry Date (YYYY-MM-DD): ");
                PassportExpiry = scanner.nextLine();
                if (!isValidDate(PassportExpiry)) System.err.println("Invalid input. Date must be in YYYY-MM-DD format.\n");
            } while (!isValidDate(PassportExpiry));
        }

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

        // Begin Phase C: Admission details

        I94Lookup i94 = new I94Lookup();
        boolean priorRemovalFlag = i94.checkI94ForAdmissionByPassport(conn, PassportNumber, CountryCode);

        if (priorRemovalFlag) {
            System.err.println("Prior Inadmissibility/Removal, review Alien File #" + AlienNumber);
        }

        // --- 12. Admission Class ---

        //AdmissionClass Must be validated through the available class codes, and certain non-permanent residents must
        //have their exit date calculated.
        String AdmissionClassInput;
        boolean Admitted;
        String ExitDate = null; // Initialize here
        String NotAdmittedReason = null; // Initialize here

        /*
         * Now that the required documentation of ALL arriving passengers are entered the admission process can
         * begin. This IF-ELSE Statement will simply the admission for Citizens by automatically assigning:
         * AlienNumber = NULL
         * AdmissionClass = "C"
         * Admitted = TRUE
         * ExitDate = NULL
         * NotAdmittedReason = NULL
         * */
        if ("USA".equalsIgnoreCase(CountryCode)) {
            AlienNumber = null;
            AdmissionClass = "C";
            Admitted = true;

            // All other Arrivals will be subjected to the Admissions Process and validation requirements for all
            // arrivals through a do-while loop.
        } else { // Returning Permanent Residents (Green Card Holders) 'PR' Class, will receive expedited validation
            printDebugStatus(); // Temporary Debug statement ensuring the AdmissionClasses have been parsed.
            boolean isAdmissionClassValid;
            System.out.println("Enter the Admission Class of the Arriving Alien \nReturning Permanent Residents may be coded as 'PR'/'ARC'/'LPR'");
            do {
                AdmissionClassInput = scanner.nextLine();
                isAdmissionClassValid = admissionClassValidator(AdmissionClassInput);
                if (!isAdmissionClassValid) {
                    System.err.println("The Admission Class is NOT VALID.  Enter a valid Class of Admission.");
                }
            } while (!isAdmissionClassValid);

            // Reassign Admission Class to the validated input
            AdmissionClass = AdmissionClassInput.toUpperCase();

            // Check if PR/LPR/ARC (special Permanent Resident return codes) OR if it's a known Immigrant Visa (like EB1)
            if (AdmissionClass.equalsIgnoreCase("PR") || AdmissionClass.equalsIgnoreCase("LPR") || AdmissionClass.equalsIgnoreCase("ARC") || getPermanentResidentClasses().contains(AdmissionClass)) {

                if (AdmissionClass.equalsIgnoreCase("PR") || AdmissionClass.equalsIgnoreCase("LPR") || AdmissionClass.equalsIgnoreCase("ARC")) {
                    AdmissionClass = "PR"; // Simplify special codes to 'PR'
                }

                Admitted = true;

                try {
                    AlienNumber = getAlienNumberMandatory(scanner, conn, PassportNumber, CountryCode);
                } catch (SQLException e) {
                    System.err.println("Database error during Alien Number validation: " + e.getMessage());
                    throw new RuntimeException(e);
                }
                if (AlienNumber != null && !AlienNumber.isBlank() && !AlienNumber.startsWith("A")) {
                    AlienNumber = "A" + AlienNumber;
                }


            } else { // All other non-immigrant aliens, Review Admissibility and admit or deny

                System.out.print("Will the alien be admitted? Enter TRUE OR FALSE");
                // Loop until a valid boolean is entered
                while (!scanner.hasNextBoolean()) {
                    System.err.println("Invalid input. Enter TRUE or FALSE");
                    scanner.next(); // Consume the invalid input to avoid an infinite loop
                }
                // Once validated, read the boolean value
                Admitted = scanner.nextBoolean();

                // Consume the leftover newline from nextBoolean()
                scanner.nextLine();

                if (Admitted) { // The Traveler is Admitted and now the ExitDate is calculated.

                    boolean ImmigrantVisaHolder = admissionClassExitDate(ArrivalDate, AdmissionClass) == null;

                    if (ImmigrantVisaHolder) {
                        System.out.println("The Immigrant Visa Presented is a " + AdmissionClass + " Visa. \nEnter the Alien Registration Number: ");

                        try {
                            AlienNumber = getAlienNumberMandatory(scanner, conn, PassportNumber, CountryCode);
                        } catch (SQLException e) {
                            System.err.println("Database error during Alien Number validation: " + e.getMessage());
                            throw new RuntimeException(e);
                        }

                        if (AlienNumber != null && !AlienNumber.isBlank() && !AlienNumber.startsWith("A")) {
                            AlienNumber = "A" + AlienNumber;
                        }

                    } else {
                        // 14. Calculate Max Exit Date (Initial ExitDate)
                        ExitDate = admissionClassExitDate(ArrivalDate, AdmissionClass);
                        String MaxExitDate = ExitDate; // Store the maximum allowed date

                        assert MaxExitDate != null;
                        LocalDate maxDate = LocalDate.parse(MaxExitDate); // Convert max date string to LocalDate

                        String adjustmentDecision;
                        System.out.println("The Maximum Stay permitted is until " + MaxExitDate);

                        do {
                            System.out.print("Adjust the Exit Date permitted? (Y/N): ");
                            adjustmentDecision = scanner.nextLine().trim().toUpperCase();
                            if (!adjustmentDecision.equals("Y") && !adjustmentDecision.equals("N")) {
                                System.err.println("INVALID INPUT. Enter Y or N.\n");
                            }
                        } while (!adjustmentDecision.equals("Y") && !adjustmentDecision.equals("N"));

                        if (adjustmentDecision.equals("Y")) {
                            // If 'Y', prompt for a new, valid date, ensuring it is not after the MAX date.
                            String newExitDate;
                            LocalDate newDate;
                            boolean isValid = false;

                            do {
                                System.out.print("Enter New Exit Date (YYYY-MM-DD). Must be on or before " + MaxExitDate + ": ");
                                newExitDate = scanner.nextLine();

                                if (!isValidDate(newExitDate)) {
                                    System.err.println("Invalid format. Date must be in YYYY-MM-DD format.\n");
                                    continue; // Continue do-while to re-prompt
                                }

                                newDate = LocalDate.parse(newExitDate);

                                // Check if the new date is AFTER the maximum allowed date
                                if (newDate.isAfter(maxDate)) { // Validation Logic
                                    System.err.println("REJECTED: The adjusted date (" + newExitDate + ") is AFTER the maximum permitted stay (" + MaxExitDate + "). Please enter an earlier date.");
                                } else {
                                    // Date is valid, exit the loop
                                    isValid = true;
                                }

                            } while (!isValid);

                            ExitDate = newExitDate; // Assign the validated, adjusted date

                        }

                        // Alien Number is optional for admitted non-immigrants
                        try {
                            AlienNumber = getAlienNumberOptional(scanner, conn, PassportNumber, CountryCode);
                        } catch (SQLException e) {
                            System.err.println("Database error during Alien Number validation: " + e.getMessage());
                            throw new RuntimeException(e);
                        }
                    }

                } else { // Admission Denied

                    // If denied, must get an A-Number and a reason for denial.
                    System.out.println("Alien MUST enter an A-Number when denied admission.");
                    try {
                        // Denied aliens must enter an A-Number
                        AlienNumber = getAlienNumberMandatory(scanner, conn, PassportNumber, CountryCode);
                    } catch (SQLException e) {
                        System.err.println("Database error during Alien Number validation: " + e.getMessage());
                        throw new RuntimeException(e);
                    }

                    System.out.print("Enter Reason for Denial (Max 255 chars): ");
                    NotAdmittedReason = scanner.nextLine();
                    if (NotAdmittedReason.length() > 255) {
                        NotAdmittedReason = NotAdmittedReason.substring(0, 255); // Truncate if too long
                    }

                    // If denied, prompt for a new exit date (removal date)
                    String denialExitDate;
                    do {
                        System.out.print("Enter Removal Date (YYYY-MM-DD - required for denied entry): ");
                        denialExitDate = scanner.nextLine();
                        if (!isValidDate(denialExitDate)) {
                            System.err.println("Invalid input. Date must be in YYYY-MM-DD format.\n");
                        }
                    } while (!isValidDate(denialExitDate));
                    ExitDate = denialExitDate;
                }
            }
        }

        // --- Final Processing & SQL Execution ---

        // List the prepared traveler record.
        System.out.println("----- Traveler Details ----- \n" +
                "Name:" + Surname + ", " + GivenName + " | DOB" + DOB +
                "\nCitizen of " + CountryCode + " | Passport No. " + PassportNumber + " | Issue Date: " + PassportIssueDate + " | Expiry: " + PassportExpiry
                + "\n----- Flight Details -----\n" +
                "Flight: " + AirlineCode + FlightNumber + " | [" + OriginAirport + ", " + FlightCountryCode + "] -> EWR | " + ArrivalDate +
                "\n----- Admission Details -----");

        switch (AdmissionClass) {
            case "C": {
                System.out.println("ADMITTED CITIZEN");
                break;
            }
            case "PR":
                System.out.println("RETURNING PERMANENT RESIDENT");
                System.out.println("ARC A-Number: " + AlienNumber);
                break;
            // Immigrant Visa
            case "EB1":
            case "DV":
            case "EB2":
            case "EB3":
            case "EB4":
            case "EB5":
            case "F2A":
            case "F3":
            case "F4":
            case "IR1":
            case "IR2":
            case "IR5":
            case "SB": {
                System.out.println("ADMITTED IMMIGRANT VISA HOLDER");
                System.out.println("Class: " + AdmissionClass);
                System.out.println("A-Number: " + AlienNumber);
                break;
            }
            default: {
                if (Admitted) {
                    System.out.println("ADMITTED NON-IMMIGRANT: CLASS " + AdmissionClass);
                    System.out.println("Exit Date: " + ExitDate);
                    if (AlienNumber != null && !AlienNumber.isEmpty()) {
                        AlienNumber = "A" + AlienNumber; // Sets the A Number formatting to be passed to the Database and only when a not null is detected.
                        System.out.println("A-Number: " + AlienNumber);
                    }
                } else {
                    System.out.println("DENIED ADMISSION: CLASS " + AdmissionClass);
                    System.out.println("Reason: " + NotAdmittedReason);
                    AlienNumber = "A" + AlienNumber;
                    System.out.println("A-Number: " + AlienNumber);
                    System.out.println("Removal Date: " + ExitDate);
                }
                break;
            }
        }
        // --- 15. Execute Database Call ---
        try {
            // Add type casting for PostgreSQL function parameters for type safety
            String callString = "{call PUBLIC.\"Admit_New_Traveler\"(?, ?, ?::date, ?, ?::char(3), ?::date, ?::date, ?, ?, ?, ?::char(3), ?::date, ?, ?::boolean, ?, ?::date, ?)}";

            try (CallableStatement cs = conn.prepareCall(callString)) {
                cs.setString(1, GivenName);
                cs.setString(2, Surname);
                cs.setObject(3, DOB, Types.DATE); // explicitly cast by '::date'
                cs.setString(4, PassportNumber);
                cs.setString(5, CountryCode); // Country of citizenship explicitly cast by '::char(3)'
                cs.setObject(6, PassportIssueDate, Types.DATE); // explicitly cast by '::date'
                cs.setObject(7, PassportExpiry, Types.DATE); // explicitly cast by '::date'
                cs.setString(8, AirlineCode); // UAL
                cs.setString(9, FlightNumber); // 2362
                cs.setString(10, OriginAirport); // Origin FLight IATA
                cs.setString(11, FlightCountryCode); // Origin Flight Country
                cs.setObject(12, ArrivalDate, Types.DATE); // explicitly cast by '::date'
                cs.setString(13, AdmissionClass);
                cs.setBoolean(14, Admitted); // explicitly cast by '::boolean'
                cs.setObject(15, AlienNumber, Types.VARCHAR);
                cs.setObject(16, ExitDate, Types.DATE); // explicitly cast by '::date'
                cs.setObject(17, NotAdmittedReason, Types.VARCHAR);

                // Execute the function using executeQuery to retrieve the Result Set (PersonID, I94RecordID)
                try (ResultSet rs = cs.executeQuery()) {
                    if (rs.next()) {
                        int personId = rs.getInt(1);
                        int i94RecordId = rs.getInt(2);
                        System.out.println("✅ Success: Traveler '" + GivenName + " " + Surname + "' recorded!");
                        System.out.println("  - Person ID: " + personId);
                        System.out.println("  - I-94 Record ID: " + i94RecordId);
                    } else {
                        System.err.println("❌ Database Error: Function executed successfully but returned no results (PersonID, I94RecordID).");
                    }
                }

            } catch (SQLException e) {
                System.err.println("❌ Database Error: Failed to admit new traveler.");
                System.err.println("SQL State: " + e.getSQLState());
                System.err.println("Error Message: " + e.getMessage());
            }
        } catch (Exception e) {
            System.err.println("❌ Unexpected Error: " + e.getMessage());
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

    /**
     * checkForPresentPassport()
     *
     * @param conn - Passes the DB connection to prepare the query
     *             If there is an existing passport record
     * @returns GivenName
     * @returns Surname
     * @returns AlienNumber if not null in the DB
     * @returns ExpiryDate
     * @returns
     *
     */
    private PassportLookupResult checkForPresentPassportRecord(Connection conn, Scanner scanner) {

        String passportNumber;
        String countryCode;

        // --- 1. Passport Number ---
        do {
            System.out.print("Enter Passport Number: ");
            passportNumber = scanner.nextLine().trim().toUpperCase();
            if (passportNumber.length() != 9) {
                System.err.println("Invalid Input. Passports must have 9 characters.");
            }
        } while (passportNumber.length() != 9);

        // --- 2. Country of Citizenship ---
        do {
            System.out.print("Enter Country of Citizenship (3-letter Code): ");
            countryCode = scanner.nextLine().trim().toUpperCase();
            if (!isValidCode(countryCode)) {
                System.err.println("Invalid input. Country Code must be a 3-letter code found in the valid list.\n");
            }
        } while (!isValidCode(countryCode));

        String sql =
                "SELECT per.\"PersonID\", per.\"GivenName\", per.\"Surname\", per.\"DateOfBirth\", per.\"ANumber\", " +
                        "       ppt.\"IssueDate\", ppt.\"ExpDate\" " +
                        "FROM public.\"Passport\" ppt " +
                        "JOIN public.\"Person\" per " +
                        "  ON ppt.\"PassportNumber\" = per.\"PassportNumber\" " +
                        " AND ppt.\"CountryCode\" = per.\"PassportCountryCode\" " +
                        "WHERE ppt.\"PassportNumber\" = ? AND ppt.\"CountryCode\" = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, passportNumber);
            ps.setString(2, countryCode);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Integer personId  = rs.getInt("PersonID");
                    String givenName  = rs.getString("GivenName");
                    String surname    = rs.getString("Surname");
                    String dob        = rs.getString("DateOfBirth");
                    String aNumber    = rs.getString("ANumber");
                    String issueDate  = rs.getString("IssueDate");
                    String expDate    = rs.getString("ExpDate");

                    System.out.println("Found: " + surname.toUpperCase() + ", " + givenName.toUpperCase()
                            + " | DOB: " + dob
                            + " | Citizen of: " + countryCode
                            + " | Passport Issued: " + issueDate
                            + " | Expiry: " + expDate);

                    return new PassportLookupResult(
                            true, passportNumber, countryCode,
                            personId, givenName, surname, dob,
                            aNumber, issueDate, expDate
                    );
                }
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
            // continue admission with provided passport values even if lookup failed due to error
        }

        System.out.println("No present records found...Continuing admission.\n");
        return new PassportLookupResult(
                false, passportNumber, countryCode,
                null, null, null, null,
                null, null, null
        );
    }



}