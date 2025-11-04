package org.example;

import java.sql.Connection; // Required import

public class I94Lookup {
    public void lookupI94(Connection conn) { // Changed parameter to Connection
        System.out.println("\n--- I-94 Lookup Interface ---");
        // Use the 'conn' object here to query the database.
        System.out.println("I-94 Lookup feature initiated. (Implementation pending, connection passed.)");
    }
}