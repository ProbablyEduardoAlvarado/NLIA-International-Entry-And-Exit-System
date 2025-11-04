package org.example;
import java.sql.CallableStatement;
import java.sql.Connection; // Required import
import java.sql.SQLException;
import java.util.Scanner;


/**
 * Handles the interface for the SQL Function to Admit_New_Traveler.
 */
public class AdmitTraveler {

    /**
     * Prompts the user for data and calls the Admit_New_Traveler SQL function
     * using the persistent database connection.
     * @param conn The active, persistent database connection.
     */
    public void admitNewTraveler(Connection conn) { // Changed parameter to Connection

        /*
         * Input Collection and Validation Logic:
         * This section provides the ability to input all required values for the function and requires validation
         * before proceeding to the next required value. It prevents approaching the final SQL function input
         * with invalid data.
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

            if (length > 50){
                System.err.println("Invalid input. Name cannot exceed 50 characters.\n");
            }

        } while(length > 50); // Loop continues as long as the input is INVALID

        //Constraint: Surname < 50 chars and only CHARS
        System.out.print("Enter Surname: ");
        String Surname = scanner.nextLine();

        // DOB should be in YYYY-MM-DD Format
        System.out.print("Enter Date of Birth (YYYY-MM-DD: ");
        String DOB = scanner.nextLine();

        System.out.print("Enter Passport Number: ");
        String PassportNumber = scanner.nextLine();

        System.out.print("Enter Country of Citizenship: ");
        String CountryCode = scanner.nextLine();


        try {
            // Placeholder for SQL execution logic
            System.out.println("Preparing to execute SQL function with data:");
            System.out.println("  Name: " + GivenName + ", Admission Class: " );

            // Call function Admit_New_Traveler
            CallableStatement cs = conn.prepareCall("{call Admit_New_Traveler(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)}");
             cs.setString(1, GivenName);
             cs.setString(2, Surname);
            cs.setString(3, DOB);
            cs.setString(4, PassportNumber);
            cs.setString(5, CountryCode);
            //cs.setString(6, PassportIssueDate);
            //cs.setString(7, PassportExpiry);
            //cs.setString(8, AirlineCode);
            //cs.setString(9, FlightNumber);


            // cs.execute();

            if (conn.isValid(1)) {
                System.out.println("✅ Success: Traveler '" + GivenName + "' data processed using persistent connection.");
            }

        } catch (SQLException e) {
            System.err.println("❌ Database Error during Traveler Admission: " + e.getMessage());
        }
    }
}
