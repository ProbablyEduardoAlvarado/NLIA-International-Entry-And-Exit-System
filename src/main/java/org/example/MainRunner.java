package org.example;

import com.jcraft.jsch.JSchException;
import java.util.Scanner;
import java.sql.Connection;
import java.sql.SQLException; // Added for connection exceptions

/**
 * The application's main entry point class.
 * It is responsible for initializing the bootstrapping mechanism and managing the persistent DB connection.
 */
public class MainRunner {

    public static void main(String[] args) {
        System.out.println("MainRunner starting application...");

        // Outer try-with-resources manages the SSH Tunnel (Bootstrapper)
        try (ApplicationBootstrapper bootstrapper = new ApplicationBootstrapper()) {

            // 1. Establish the SSH tunnel
            bootstrapper.startup();

            int dbPort = bootstrapper.getLocalDbPort();

            // 2. Establish the SINGLE, PERSISTENT JDBC connection.
            // Inner try-with-resources manages the JDBC Connection lifecycle.
            try (Connection persistentConn = DatabaseTester.getConnection(dbPort)) { // Get persistent connection

                // Test the connection is successful (optional, but good practice)
                DatabaseTester.testConnection(dbPort);

                System.out.println("\n--- Tunnel and SINGLE Connection successful. Entering console interface. ---");

                // 3. Start the console interface, passing the persistent Connection object.
                startConsoleInterface(persistentConn);

            } catch (SQLException | ClassNotFoundException e) {
                System.err.println("FATAL ERROR: Could not establish persistent database connection.");
                System.err.println("Details: " + e.getMessage());
            }

        } catch (JSchException e) {
            System.err.println("FATAL ERROR: Could not establish SSH tunnel. Application aborted.");
            System.err.println("Details: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("An unexpected application error occurred: " + e.getMessage());
        }

        System.out.println("MainRunner exiting.");
    }

    /**
     * Starts an interactive console loop, passing the active database connection.
     * @param dbConnection The active, persistent database connection.
     */
    private static void startConsoleInterface(Connection dbConnection) { // Changed parameter to Connection
        Scanner scanner = new Scanner(System.in);
        String input;
        boolean running = true;

        System.out.println("-----------------------------------------------------------------");
        System.out.println("Console ready. Enter your choice.");

        while (running) {
            displayMenu();
            System.out.print("Enter option (1, 2, 3) or type 'quit': ");

            if (scanner.hasNextLine()) {
                input = scanner.nextLine().trim();
            } else {
                break;
            }

            // Dispatch based on input
            switch (input.toLowerCase()) {
                case "1":
                    // Option 1: Admit New Traveler (Pass the Connection)
                    AdmitTraveler admit = new AdmitTraveler();
                    admit.admitNewTraveler(dbConnection); // Pass the Connection
                    break;
                case "2":
                    // Option 2: I-94 Lookup (Pass the Connection)
                    I94Lookup lookup = new I94Lookup();
                    lookup.lookupI94(dbConnection); // Pass the Connection
                    break;
                case "3":
                    // Option 3: Generate Flight Manifest (Pass the Connection)
                    FlightManifestGenerator manifest = new FlightManifestGenerator();
                    manifest.generateManifest(dbConnection); // Pass the Connection
                    break;
                case "quit":
                case "exit":
                    running = false;
                    System.out.println("Exit command received. Shutting down connection...");
                    break;
                default:
                    System.out.println("Invalid option. Please enter 1, 2, 3, or 'quit'.");
            }
        }
        scanner.close();
    }

    /**
     * Prints the application's main menu to the console.
     */
    private static void displayMenu() {
        System.out.println("\n--- CBP FIELD OPS NEWARK LIBERTY AIRPORT OPS ---");
        System.out.println("1. Admit New Traveler ");
        System.out.println("2. I-94 Lookup");
        System.out.println("3. Generate Flight Manifest");
        System.out.println("Type 'quit' or 'exit' to disconnect and close.");
        System.out.println("-----------------");
    }
}