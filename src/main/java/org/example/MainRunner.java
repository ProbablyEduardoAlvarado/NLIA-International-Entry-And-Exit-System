package org.example;

import com.jcraft.jsch.JSchException;

/**
 * The application's main entry point class.
 * It is responsible only for initializing the bootstrapping mechanism and launching the core logic.
 */
public class MainRunner {

    public static void main(String[] args) {
        System.out.println("MainRunner starting application...");

        try (ApplicationBootstrapper bootstrapper = new ApplicationBootstrapper()) {

            // 1. Establish all connections (SSH tunnel)
            bootstrapper.startup();

            // 2. --- Core Application Logic Starts Here ---

            int dbPort = bootstrapper.getLocalDbPort();

            // Example: Test the connection
            DatabaseTester.testConnection(dbPort);

            System.out.println("\n--- Application is live. Running for 5 seconds... ---");
            Thread.sleep(5000);

            // ------------------------------------------

        } catch (JSchException e) {
            System.err.println("FATAL ERROR: Could not establish SSH tunnel. Application aborted.");
            System.err.println("Details: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("An unexpected application error occurred: " + e.getMessage());
        } // The 'finally' behavior is now handled by the 'AutoCloseable' interface on ApplicationBootstrapper.

        System.out.println("MainRunner exiting.");
    }
}