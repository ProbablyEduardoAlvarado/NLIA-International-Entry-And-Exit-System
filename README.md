This is a project for CST-222: Computer Architecture and Assembly.
This project creates a frontend for a Database created with PostgreSQL that is meant to siumulate the admission of an international arrival presenting themselves for inspection at U.S. Customs and Border Protection checkpoint in an Airport.

This project will:
- Create an SSH Tunnel from the local computer to the remote-host
- Upon connecting the SSH Tunnel, using the JDBC to connect to a PostgreSQL database
- Initially upon connecting an individual should have the option to "Admit a Passenger", Lookup an I-94 Record, and Lookup a Flight Manifest.
  - Admit a Passenger
    - Provides the officer the ability to interface with the database by providing the officer the ability to enter the following:
      * GivenName
      * Surname
      * DateOfBirth
      * Passport Number
      * Issuing Country
      * Issue Date
      * Exp Date
      * Airline Code
      * Flight Number
      * Flight Origin Code (Using an Airport's IATA Code)
      * Flight Origin Country
      * Arrival Date
      * Admission Class
      * Admitted? (A boolean to flag whether a person was admitted to the US or denied entry and subsequently removed)
      * A-Number (An ability to enter an Alien Registration Number which are required for certain classes of passengers)
      * Exit Date (For certain Classes of admission the computer should calculate a certain time period for the maximum date of presence before a person must exit or when a person did leave if someone was not admitted, NULL for Citizens/Permanent Residents/Immigrant Visas)
      * Not Admitted Reason (Default: NULL, only to be filled when A Customs Officer denies entry to an individual and will present their reasoning and apply the INA appropriately)
  - 
