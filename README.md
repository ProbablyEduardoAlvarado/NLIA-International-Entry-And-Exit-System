This is a jointed project for CST-222: Computer Architecture and Assembly (Java Frontend), and CST-204: Database Management Systems (PostgreSQL backend).
This project creates a frontend for the database and to simulate the admission of an international arrival presenting themselves for inspection at U.S. Customs and Border Protection checkpoint in an Airport.

This project is not affiliated with CBP or any governmental entity nor should any use of its name and actions constitute an opinion, representation, or endorsement.  All names, A-Numbers, data, and uses are purely fictional and any connection is merely coincidental.


This project will:
- Create an SSH Tunnel from the local computer to the remote-host
- Upon connecting the SSH Tunnel, using the JDBC to connect to a PostgreSQL database
- Initially upon connecting an individual should have the option to "Admit a Passenger", Lookup an I-94 Record, and Lookup a Flight Manifest.
  - Admit a Passenger
    - Provides the officer the ability to interface with the database by providing the officer the ability to enter the following:
        * Biographical Details (Phase A)
        * Flight Details (Phase B)
        * Admission details, class and determination/removability for those not admitted (Phase C)
  - Lookup I-94 Arrival/Departure Records -
    - Provides the officer the ability to look up a descending list of an individual's I-94 records using: 
      - CountryCode+Passport Number composite key, OR
      - Alien Number (ANumber)
    - All I-94 records will be returned and if any records of inadmissibility/removal is returned,
      the console will throw a warning of potential inadmissibility, and a corresponding Alien Number if one was filed in other cases.
  - Generate a Flight Manifest
    - The officer will be able to enter the following to retrieve a manifest of a recorded flight who are connected to the FlightID of the flight. By filtering from the Flight_Manifest SQL view.
      - AirlineCode
      - FlightNumber
      - FlightDate
    - Upon execution, the Console will return a manifest using that filtered view and write a .txt file of the manifest 
      and all individuals, admission class, admission status and potential inadmissibility.

- Future Plans:
  - Expand the DB to include exit record reporting (Expand the I-94 record to amend exit date to AdmitUntil, and add an ActualExit(ExitDate proper) for when a traveler exited)
    - This would permit a reasonable view for overstays and the analysis of potential inadmissibility for future entries in context of the INA or immigration benefits.
  - Create (first learn of course) a JavaFX version of the system to be friendlier to entering details of a flight and permit look up (PassportLookupResult) to expedite the admission process.
