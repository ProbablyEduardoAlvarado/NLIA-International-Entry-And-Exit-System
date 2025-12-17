package org.example;

import java.io.BufferedWriter;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

import static org.example.Validators.isValidDate;

public class FlightManifestGenerator {

    public void generateManifest(Connection conn) {
        System.out.println("\n--- Generate Flight Manifest Interface ---");

        if (conn == null) {
            System.err.println("Database connection is null. Cannot generate manifest.");
            return;
        }

        // --- 1) Collect inputs ---
        Scanner scanner = new Scanner(System.in);

        String airlineCode;
        do {
            System.out.print("Enter Airline Code (3 letters): ");
            airlineCode = scanner.nextLine().trim().toUpperCase();
            if (airlineCode.length() != 3 || !airlineCode.matches("[A-Z]{3}")) {
                System.err.println("Invalid input. Airline Code must be exactly 3 letters.\n");
                airlineCode = null;
            }
        } while (airlineCode == null);

        String flightNumber;
        do {
            System.out.print("Enter Flight Number (1-4 digits): ");
            flightNumber = scanner.nextLine().trim();
            if (flightNumber.isEmpty() || flightNumber.length() > 4 || !flightNumber.matches("\\d+")) {
                System.err.println("Invalid input. Flight Number must be 1-4 digits.\n");
                flightNumber = null;
            }
        } while (flightNumber == null);

        String flightDate;
        do {
            System.out.print("Enter Flight Date (YYYY-MM-DD): ");
            flightDate = scanner.nextLine().trim();
            if (!isValidDate(flightDate)) {
                System.err.println("Invalid input. Date must be in YYYY-MM-DD format.\n");
                flightDate = null;
            }
        } while (flightDate == null);

        // --- 2) Query DB for manifest rows (from the view) ---
        final String sql =
                "SELECT " +
                        "  \"Flight\", " +
                        "  \"Date\", " +
                        "  \"Origin\", " +
                        "  \"Name\", " +
                        "  \"Passport\", " +
                        "  \"DOB\", " +
                        "  \"Admit\", " +
                        "  \"AdmissionClass\", " +
                        "  \"NotAdmitReason\" " +
                        "FROM public.\"Flight_Manifest\" " +
                        "WHERE \"Flight\" = ? " +
                        "  AND \"Date\" = ?::date " +
                        "ORDER BY \"Name\";";

        // --- 3) Prepare output file (AirlineCode + FlightNumber + Date) ---
        String safeFileName = (airlineCode + flightNumber + "_" + flightDate).replaceAll("[^A-Za-z0-9_\\-]", "");
        Path outDir = Paths.get("manifests");
        Path outFile = outDir.resolve(safeFileName + ".txt");

        int rowCount = 0;

        try {
            Files.createDirectories(outDir);

            try (PreparedStatement ps = conn.prepareStatement(sql)) {

                ps.setString(1, airlineCode + flightNumber);
                ps.setString(2, flightDate);

                ArrayList<String> lines = new ArrayList<>();

                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        rowCount++; // ✅ critical fix

                        String flight = rs.getString("Flight");
                        if (flight == null) flight = "";

                        java.sql.Date dateObj = rs.getDate("Date");
                        String date = (dateObj == null) ? "" : dateObj.toString();

                        String origin = rs.getString("Origin");
                        if (origin == null) origin = "";

                        String name = rs.getString("Name");
                        if (name == null) name = "";

                        String passport = rs.getString("Passport");
                        if (passport == null) passport = "";

                        java.sql.Date dobObj = rs.getDate("DOB");
                        String dob = (dobObj == null) ? "" : dobObj.toString();

                        boolean admit = rs.getBoolean("Admit");

                        String admissionClass = rs.getString("AdmissionClass");
                        if (admissionClass == null) admissionClass = "";

                        String reason = rs.getString("NotAdmitReason");
                        if (reason == null) reason = ""; // keep nulls blank

                        String line =
                                flight + " | " + date + " | " + origin + " | " +
                                        name + " | DOB " + dob + " | " +
                                        passport + " | " +
                                        (admit ? "ADMITTED" : "DENIED") + " | " +
                                        admissionClass + " | " +
                                        reason;

                        lines.add(line);
                    }
                }

                // If no rows, write a simple file and exit (no header spam)
                if (rowCount == 0) {
                    System.err.println("No manifest rows found for " + airlineCode + flightNumber + " on " + flightDate + ".");
                    try (BufferedWriter writer = Files.newBufferedWriter(outFile, StandardCharsets.UTF_8)) {
                        writer.write("No manifest rows found for " + airlineCode + flightNumber + " on " + flightDate + ".");
                        writer.newLine();
                    }
                    return;
                }

                // Console header
                System.out.println("\nManifest: " + airlineCode + flightNumber + " on " + flightDate);
                System.out.println("Writing output to: " + outFile.toAbsolutePath());
                System.out.println("--------------------------------------------------------------------------");

                // Convert to array (keeps your array requirement story)
                String[] manifestLines = lines.toArray(new String[0]);

                // Print
                for (String s : manifestLines) System.out.println(s);

                // Write full file headers
                try (BufferedWriter writer = Files.newBufferedWriter(outFile, StandardCharsets.UTF_8)) {
                    writer.write("CBP FIELD OPS NEWARK LIBERTY INTL AIRPORT PNR MANIFEST ");
                    writer.newLine();
                    writer.write("FLIGHT MANIFEST: " + airlineCode + flightNumber + " | Date: " + flightDate);
                    writer.newLine();
                    writer.write("--------------------------------------------------------------------------");
                    writer.newLine();
                    writer.write("Flight | Date | Origin | Name | DOB | Passport | Admit | AdmissionClass | Removal Reason");
                    writer.newLine();
                    writer.write("--------------------------------------------------------------------------");
                    writer.newLine();

                    for (String s : manifestLines) {
                        writer.write(s);
                        writer.newLine();
                    }
                }

                System.out.println("--------------------------------------------------------------------------");
                System.out.println("✅ Manifest complete. Rows written: " + rowCount);
            }

        } catch (SQLException e) {
            System.err.println("❌ Database error while generating manifest: " + e.getMessage());
        } catch (IOException e) {
            System.err.println("❌ File I/O error while writing manifest: " + e.getMessage());
        }
    }

}
