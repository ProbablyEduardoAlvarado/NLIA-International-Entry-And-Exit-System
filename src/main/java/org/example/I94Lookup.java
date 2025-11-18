package org.example;

import java.sql.*;
import java.util.Scanner;

import static org.example.Validators.isValidCode;
import static org.example.Validators.isValidDate;

public class I94Lookup {
    /**
     * I94Lookup()
     * Integrates the I-94 Function in the SQL DB and returns an entire Admission/Departure Record for a certain individual.
     *
     * @param conn query the DB.
     * The Record is returned in two ways:

     * METHOD 2 - Lookup by Passport Number & Passport Issuing Country
     * @returns I94Record
     * */
    public void lookupI94(Connection conn) { // Changed parameter to Connection
        // Use the 'conn' object here to query the database.
        System.out.println("\n----- I-94 Lookup -----");
        String AlienNumber;
        String PassportNumber;
        String CountryCode;
        Scanner scanner = new Scanner(System.in);


        System.out.println("Select a Lookup method - \n 1. Via A-Number\n 2. Via Passport");
        int choice;
        do {
            choice = 0;
            choice = scanner.nextInt();
            switch (choice) {
                case 1:
                    aNumberI94Lookup();
                    break;
                case 2:
                    passportI94Lookup(conn);
                    break;
                default:
                    System.err.println("Invalid Input, enter only 1 or 2.");
            }
        } while ((choice == 0));
    }

    /** METHOD 1 - Lookup by Alien Registration Number
     * Uses the A-Number entered to
     *        First, validate the Number is in format to pass to the DB
     *        Second, Returns the Arrival/Departure Record for that A-Number
     * @returns I94Record for the A Number
     * @throws java.sql.SQLException if the ANumber is invalid
     */
    private void aNumberI94Lookup(){

        Scanner scanner = new Scanner(System.in);
        String AlienNumber; // For later: Use an int to validated and then convert into string once validated...?
        System.out.println("Enter the Alien Registration Number of the Traveler");
        do {
            AlienNumber = scanner.nextLine();
                if (AlienNumber.length() < 9 || !AlienNumber.matches("\\d+")) {
                    AlienNumber = null; // Consumes and resets the input
                    System.err.println("Invalid A-Number.  Enter a Valid Alien Registration Number.");
            }
        }while(AlienNumber == null);
        AlienNumber = "A"+AlienNumber;

        System.out.println(AlienNumber);
        return;
    }

    /** METHOD 2 - Lookup by Passport Data
     * Uses the Passport Number and Issuing Country code entered to -
     *        First, validate the Country Code is correct
     *        Second, Validates the Passport Length conforms
     * @returns I94Record for the A Number
     * @throws java.sql.SQLException  if the ANumber is invalid
     */
    private static void passportI94Lookup(Connection conn){
        Scanner scanner = new Scanner(System.in);
        String CountryCode;
        do {
            System.out.print("Enter the Issuing Country of the Passport. Format USA: ");
            CountryCode = scanner.nextLine().trim().toUpperCase();
            if (!isValidCode(CountryCode)) {
                System.err.println("Invalid input. Country Code must be a valid 3-letter code.\n");
            }
        } while (!isValidCode(CountryCode));

        String PassportNumber;
        System.out.print("Enter Passport Number: ");
        do {
            PassportNumber = scanner.nextLine().trim().toUpperCase();
            if (PassportNumber.length() != 9) {
                System.err.println("Invalid Input.  Passports must have 9 characters.");
            }
        } while (PassportNumber.length() != 9);

        try {
            String selectQuery = "SELECT I94.\"RecordID\", P.\"GivenName\", P.\"Surname\", P.\"ANumber\", P.\"PassportNumber\", P.\"PassportCountryCode\", F.\"CountryCode\" AS \"ORIGIN\", I94.\"ClassCode\", "
                    + "I94.\"EntryDate\", I94.\"ExitDate\", I94.\"Admitted\", I94.\"NotAdmittedReason\" "
                    + "FROM PUBLIC.\"Person\" P "
                    + "INNER JOIN PUBLIC.\"I_94\" I94 ON P.\"PersonID\" = I94.\"PersonID\" "
                    + "INNER JOIN PUBLIC.\"Flight\" F ON I94.\"FlightID\" = F.\"FlightID\" "
                    + "WHERE P.\"PassportNumber\" = ? AND P.\"PassportCountryCode\" = ? "
                    + "ORDER BY I94.\"EntryDate\" DESC";

            // Use try-with-resources for PreparedStatement and Connection
            try (java.sql.PreparedStatement ps = conn.prepareStatement(selectQuery)) {
                ps.setString(1, PassportNumber);
                ps.setString(2, CountryCode);

                // Execute query
                try (java.sql.ResultSet rs = ps.executeQuery()) {

                    boolean foundRecords = false;
                    String travelerName = ""; // Variable to hold the name for a single printout

                    // Use one single loop to process ALL records
                    while (rs.next()) {
                        foundRecords = true;

                        // --- 1. Retrieve Data for the Current Row ---
                        String givenName = rs.getString("GivenName");
                        String surname = rs.getString("Surname");

                        // Get the Date object directly. This will be null if the DB value is null.
                        java.sql.Date exitDateObject = rs.getDate("ExitDate");

                        // Perform the correct null check for the ExitDate
                        String exitDate = (exitDateObject == null) ? "" : String.valueOf(exitDateObject);

                        String entryDate = String.valueOf(rs.getDate("EntryDate"));
                        String admitClassCode = rs.getString("ClassCode");
                        int i94RecordID = rs.getInt("RecordID");
                        String flightOriginCountry = rs.getString("ORIGIN");
                        String aNumber = rs.getString("ANumber");
                        boolean admittedBool = rs.getBoolean("Admitted"); // Retrieve as boolean directly
                        String notAdmittedReason = rs.getString("NotAdmittedReason");

                        // Traveler Info Printout
                        if (travelerName.isEmpty()) {
                            travelerName = givenName + " " + surname;
                            System.out.println("Getting Traveler '" + travelerName + "' I94 records...");
                        }

                        // I94 Record Retrieval
                        System.out.println("Record " + i94RecordID + " | Origin: " + flightOriginCountry +
                                "| Entered on " + entryDate + " | Admit Class: " + admitClassCode +
                                "| Departed: " + exitDate);

                        // Prior Removals will be flagged and raised and a thread sleep to give at least a brief ability to read before it pushes the console back to the main menu.
                        if (!admittedBool) { // FALSE should trigger that a person was removed prior.
                            System.err.println("----PRIOR REMOVAL/INADMISSIBILITY----\nAlien was removed on "+ exitDate +
                                    ", and assigned Alien Number " + aNumber +
                                    "\nRemoval Reason: " + notAdmittedReason +"\n-------------");

                        }
                    } Thread.sleep(5000); // Gives someone a chance to read the result before resetting.
                // End of while loop

                    // No Results handler
                    if (!foundRecords) {
                        System.err.println("❌ Database Error: Function executed successfully but returned no results (PersonID, I94RecordID).");
                    }
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
            }
        } catch (java.sql.SQLException e) {
            // Handle database connection or query execution errors
            e.printStackTrace();
        }
        return;
    }
}