package org.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseTester {

    // --- POSTGRESQL CREDENTIALS ---\r
    private static final String DB_NAME = "Insert Name here";
    private static final String DB_USER = "Insert User";
    private static final String DB_PASSWORD = "Insert Password";
    // ------------------------------------\r

    /**
     * Attempts a single connection to test the SSH tunnel. This method is now
     * mainly for checking connectivity during startup.
     */
    public static boolean testConnection(int localPort) {
        final String DB_URL = "jdbc:postgresql://localhost:" + localPort + "/" + DB_NAME;

        System.out.println("\n--- Attempting JDBC Connection via Tunnel (localhost:" + localPort + ") ---");

        try {
            Class.forName("org.postgresql.Driver");

            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {

                if (connection != null && !connection.isClosed()) {
                    System.out.println("✅ SUCCESS: JDBC Connection established to database '" + DB_NAME + "'.");
                    return true;
                }
            }
        } catch (ClassNotFoundException e) {
            System.err.println("🔴 ERROR: PostgreSQL JDBC Driver not found. Ensure the JAR is in your classpath.");
        } catch (SQLException e) {
            System.err.println("❌ FAILURE: Could not connect to the database.");
            System.err.println("  > Details: " + e.getMessage());
            System.err.println("  > Tip: Check DB credentials, database name, and ensure the SSH tunnel is stable.");
        }
        return false;
    }

    /**
     * Creates and returns a live database Connection object, called once by MainRunner.
     * @param localPort The local port where the SSH tunnel is listening (5000).
     * @return The active Connection object.
     * @throws SQLException If the connection fails.
     * @throws ClassNotFoundException If the JDBC driver is missing.
     */
    public static Connection getConnection(int localPort) throws SQLException, ClassNotFoundException {
        final String DB_URL = "jdbc:postgresql://localhost:" + localPort + "/" + DB_NAME;
        Class.forName("org.postgresql.Driver");
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }
}