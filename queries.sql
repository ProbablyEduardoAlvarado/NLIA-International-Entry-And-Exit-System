/*
* Eduardo Alvarado
* 12/17/2025
* CST-204 Database Management Systems
* Prof. Elble
* queries.sql
*/

/**
* Query 1: Admit_New_Traveler function (Schema Lines: 374-476)
* The primary DML transaction for inserting data into the database.  Performs all phases of the inspection process by:
* Phase A: Recording Traveler information from the passenger's biographical data (Passport)
* Phase B: Processing the origin flight of the traveler (Flight data from boarding pass) (In real life practice, this information is already present via the flight manifest transmitted to CBP when the flight is boarded)
* Phase C: Recording the basis of admission and inspection of the passenger (Using ARCs/Visa Information/VWP class), determination of admissibility or potential inadmissibility and subsequent removal 
* 
* The function condenses a multi-table, complicated data insertion sequence by providing a single transaction method to insert all necessary
* records into the database and using the schema, provides reasonable checks for certain DB data, by rejecting invalid country abbreviations, invalid admission classes using constraints within the tables, 
* or automatically appending Alien Numbers to the proper format using the enforce_anumber_format() trigger, when any A-Numbers are included into the transaction. 
* This most importantly preserves and enforces data integrity in the most volatile period of data insertion by providing a uniform insertion and upsert sequence, along with validation.
*/

-- Transaction execution of Admit_New_Traveler
-- Below will provide the entry of Alejandro Vargas, a returning Lawful Permanent Resident 
-- from the Dominican Republic returning to the US after a trip back home.

-- Transaction Demo: Admit_New_Traveler should succeed or roll back as a unit

BEGIN;
SAVEPOINT admit_tx;

SELECT * FROM public."Admit_New_Traveler"(
    -- Phase A: Biographical information
    p_given_name := 'Alejandro',             -- character varying Given Name
    p_surname := 'Vargas',                   -- character varying Surname
    p_dob := '1985-06-15',                   -- date (YYYY-MM-DD format)
    p_passport_num := 'D10938472',           -- character varying(9) (e.g., 'D10938472')
    p_passport_country_code := 'DOM',        -- character(3) (e.g., 'DOM' - Dominican Republic)
    p_passport_issue_date := '2023-03-10',   -- date (YYYY-MM-DD format)
    p_passport_exp_date := '2033-03-10',     -- date (YYYY-MM-DD format)
    -- Phase B: Recording Origin Flight Details
    p_flight_airline_code := 'UAL',           -- character varying(3) (e.g., 'UAL' - United Airlines)
    p_flight_number := '340',                -- character varying(6) (e.g., '340')
    p_flight_origin_code := 'PUJ',           -- character varying(3) (e.g., 'PUJ' (Punta Cana Intl.) - IATA Airport Code )
    p_flight_country_code := 'DOM',          -- character(3) (e.g., 'DOM' - Country Code - Dominican Republic)
    p_arrival_date := '2025-10-01',          -- date (YYYY-MM-DD format)
    -- Phase C: Recording Basis of Admission and I-94 record creation
    p_admission_class_code := 'PR',          -- character varying(4) (e.g., 'PR' - Returning Lawful Permanent Resident)
    p_admitted := TRUE,                      -- boolean (TRUE or FALSE)
    p_a_number := 'A301859341',              -- character varying(9) or NULL (PR's enter using their passport and ARC/PR Card and the officer will record their A-Number attached to their file and ARC)
    p_exit_date := '2028-06-30',             -- date (YYYY-MM-DD format) or NULL (Permanent Residents are not required to depart the US)
    p_not_admitted_reason := NULL            -- character varying(255) or NULL (with his admission, there is no need for a reason for denial and shall be Null.)
);
-- Transaction Demo: Admit_New_Traveler should succeed or roll back as a unit

/*
-- Failure case
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Alejandro',
    p_surname := 'Vargas',
    p_dob := '1985-06-15',
    p_passport_num := 'D10938472',
    p_passport_country_code := 'DOM',
    p_passport_issue_date := '2023-03-10',
    p_passport_exp_date := '2033-03-10',
    p_flight_airline_code := 'UAL',
    p_flight_number := '340',
    p_flight_origin_code := 'PUJ',
    p_flight_country_code := 'CB0', -- Not a country code
    p_arrival_date := '2025-10-01',
    p_admission_class_code := 'PR',
    p_admitted := TRUE,
    p_a_number := 'Vs', -- invalid A Number
    p_exit_date := '2028-06-30',
    p_not_admitted_reason := NULL
);

-- If the prior statement fails, run this next (it clears the failed state back to the savepoint):
-- ROLLBACK TO SAVEPOINT admit_tx;
*/

RELEASE SAVEPOINT admit_tx;
COMMIT;


/**
* Query 2: Lookup_I94_Record function (Schema Lines: 480-591)
* Provides two methods of looking up an individual's complete I-94 Entry and Departure history by
* a. Lookup via Alien Registration Number (A-Number)
* b. Lookup via Passport Country+Passport Number composite key
*/


-- 2.a Using an Alien Registration Number (A-Number) for lookup
SELECT * FROM public."Lookup_I94_Record"(
    p_a_number := 'A203430239'
);

-- 2.b Using the Passport Number and Issuing Country to lookup

SELECT * FROM public."Lookup_I94_Record"(
    p_passport_num := '561171535',
    p_passport_country_code := 'USA'
);

/**
* Query 3: Flight Manifest
* Base Query creates a view to return a complete manifest of flights which made entry into the United States.  While a base assists for overall viewing, 
* the main purpose of generating the Flight Manifest is the parameterized query: created to return a manifest of a specific flight on a given day.
* This is simply for the list of passengers, and not specific to consider the results an inspection, as the I-94 record is inspection specific.
*/

CREATE OR REPLACE VIEW public."Flight_Manifest"
 AS
 SELECT f."AirlineCode" AS "Airline",
    f."FlightNumber",
    f."FlightDate" AS "Date",
    f."OriginAirportCode" AS "Origin",
    p."Surname",
    p."GivenName",
    p."PassportNumber",
    p."PassportCountryCode" AS "Nationality",
    p."DateOfBirth" AS "DOB",
    i."Admitted" AS "Admit",
    ac."ClassCode" AS "COA", -- Class Of Admission
    ac."ClassDescription" -- Descriptor of the COA code
   FROM "Flight" f
     JOIN "I_94" i ON f."FlightID" = i."FlightID"
     JOIN "Person" p ON i."PersonID" = p."PersonID"
     JOIN "Admission_Class" ac ON i."ClassCode"::text = ac."ClassCode"::text;

ALTER TABLE public."Flight_Manifest"
    OWNER TO postgres;
COMMENT ON VIEW public."Flight_Manifest"
    IS 'Creates a baseline view for a flight manifest by providing the base columns, permits using the following for querying

SELECT * FROM public."Flight_Manifest"
WHERE "AirlineCode" = ''UAL''  -- edit this
  AND "FlightNumber" = ''340'' -- edit this
  AND "Date" = ''2025-10-01''
ORDER BY "Surname", "GivenName";';

/*
* Query 3.a - Flight Manifest query of a Specific Flight -
* The heart of the query, using the following parameters to return solely the Manifest of a specific flight:
* Airline, Flight Number, FlightDate
*/

SELECT * FROM public."Flight_Manifest"
WHERE "Airline" = 'QTR'  
  AND "FlightNumber" = '402' 
  AND "Date" = '2025-11-24'
ORDER BY "Surname", "GivenName";


/**
* Query 4: Overstay Watchlist
* A view to provide a view of all admitted individuals whose authorized stay expires is imminent (ExitDate < 2 weeks)
* AND who are from certain high risk of overstay countries (Where the overstay rate for a visa > 15%)
*/

CREATE OR REPLACE VIEW public."OverstayWatchlist"
 AS
 SELECT p."Surname",
    p."GivenName",
    p."PassportCountryCode" AS "Nationality",
    p."PassportNumber",
    i."EntryDate",
    ac."ClassCode",
    i."ExitDate" AS "Expected Departure"
   FROM "I_94" i
     JOIN "Person" p ON p."PersonID" = i."PersonID"
     JOIN "Admission_Class" ac ON ac."ClassCode"::text = i."ClassCode"::text
  WHERE i."ExitDate" >= CURRENT_DATE AND i."ExitDate" < (CURRENT_DATE + '14 days'::interval) AND (p."PassportCountryCode" = ANY (ARRAY['AFG'::bpchar, 'AND'::bpchar, 'BWA'::bpchar, 'MMR'::bpchar, 'BDI'::bpchar, 'CMR'::bpchar, 'CAF'::bpchar, 'COG'::bpchar, 'CUB'::bpchar, 'SLV'::bpchar, 'ERI'::bpchar, 'FJI'::bpchar, 'GAB'::bpchar, 'GMB'::bpchar, 'GHA'::bpchar, 'GTM'::bpchar, 'GIN'::bpchar, 'HTI'::bpchar, 'TCD'::bpchar, 'COD'::bpchar, 'DJI'::bpchar, 'GNQ'::bpchar, 'LAO'::bpchar, 'LBR'::bpchar, 'SLE'::bpchar, 'SDN'::bpchar, 'TGO'::bpchar, 'TKM'::bpchar, 'YEM'::bpchar]))
  ORDER BY i."ExitDate";

ALTER TABLE public."OverstayWatchlist"
    OWNER TO postgres;
COMMENT ON VIEW public."OverstayWatchlist"
    IS 'A tool to retrieve all nonimmigrant visa holders with an imminent ExitDate and are expected to depart the US within 2-weeks of the current date.  Important for C-1 visas and certain B2 visa holders of high risk countries.

Data retrieved from https://www.dhs.gov/sites/default/files/2024-10/24_1011_CBP-Entry-Exit-Overstay-Report-FY23-Data.pdf ';

SELECT * FROM public."OverstayWatchlist"

/*
* Query 5: System Overview
* The DB will be queried to total the number of individuals inspected overall and certain classes of admission to provide the overall extent of the system.
*/
CREATE OR REPLACE VIEW public."NLIASystemSummary"
 AS
 SELECT count(DISTINCT f."FlightID") AS "Flights Recorded", -- Total Number of flights recorded
    count(*) AS "Total Inspections", -- All inspections of arriving passengers that have been recorded in the database.
    count(*) FILTER (WHERE pac."ClassCode"::text = 'C'::text) AS "Citizens Inspected", -- Counts all US Passport holders who were admitted to the US
    count(*) FILTER (WHERE pac."ClassCode"::text = 'PR'::text) AS "PRs Inspected", -- Counts all entries of Lawful Permanent Residents using their ARC
    count(*) FILTER (WHERE pac."ClassCode"::text = ANY (ARRAY['DV'::character varying::text, 'EB1'::character varying::text, 'EB2'::character varying::text, 'EB3'::character varying::text, 'EB4'::character varying::text, 'EB5'::character varying::text, 'F2A'::character varying::text, 'FX1'::character varying::text, 'FX2'::character varying::text,'F3'::character varying::text, 'F4'::character varying::text, 'IR1'::character varying::text, 'IR2'::character varying::text, 'IR5'::character varying::text, 'SB'::character varying::text])) AS "IVs Inspected", -- Handles all Immigrant visa initial entries
    count(*) FILTER (WHERE pac."ClassCode"::text <> ALL (ARRAY['C'::character varying::text, 'PR'::character varying::text, 'DV'::character varying::text, 'EB1'::character varying::text, 'EB2'::character varying::text, 'EB3'::character varying::text, 'EB4'::character varying::text, 'EB5'::character varying::text, 'F2A'::character varying::text, 'FX1'::character varying::text, 'FX2'::character varying::text,'F3'::character varying::text, 'F4'::character varying::text, 'IR1'::character varying::text, 'IR2'::character varying::text, 'IR5'::character varying::text, 'SB'::character varying::text])) AS "Nonimmigrants", -- All other Nonimmigrant Classes of Inspection
    count(*) FILTER (WHERE pac."ClassCode"::text = ANY (ARRAY['TN'::character varying::text, 'O1'::character varying::text, 'L1'::character varying::text, 'H1B'::character varying::text, 'E1'::character varying::text, 'E2'::character varying::text])) AS "Alien Employees Inspected", -- All nonimmigrants who entered under employment based Visas (TN, O1, L1, H1B, E1, E2)
    count(*) FILTER (WHERE pac."ClassCode"::text = 'F1'::text) AS "Alien Students Inspected", -- All nonimmigrants who entered under student F1 visa
    count(*) FILTER (WHERE pac."ClassCode"::text = ANY (ARRAY['B1'::character varying::text, 'B2'::character varying::text, 'J'::character varying::text, 'C1'::character varying::text, 'D'::character varying::text, 'VWP'::character varying::text])) AS "Tourists Inspected", -- All other nonimmigrants not entering for Student/Employment reasons.
    count(*) FILTER (WHERE i94."Admitted" IS TRUE) AS "Persons Admitted", -- All admissions recorded into the database.
    count(*) FILTER (WHERE i94."Admitted" IS FALSE) AS "Inadmissible Aliens" -- All admissions attempted which resulted in denial of admission recorded into the database.
   FROM "Person" p
     JOIN "I_94" i94 ON p."PersonID" = i94."PersonID"
     JOIN "Flight" f ON i94."FlightID" = f."FlightID"
     JOIN "Person_Admission_Class" pac ON i94."RecordID" = pac."I94RecordID";

ALTER TABLE public."NLIASystemSummary"
    OWNER TO postgres;

SELECT * FROM public."NLIASystemSummary"

/**
* Query 6: Inadmissibility Report
* Base Query creates a view to return all inadmissible and removed aliens from the port of entry.  Below subquerying (7.a & 7.b) will permit
* returns based on - 
* a. Specific flight: f."AirlineCode" f."" f."FlightDate" 
* b. Country of Citizenship: p."PassportCountryCode"
*/

CREATE OR REPLACE VIEW public."InadmissibilityReport" AS
SELECT
    f."AirlineCode"          AS "Airline",
    f."FlightNumber",
    f."FlightDate"           AS "EntryDate",
    p."Surname",
    p."GivenName",
    p."ANumber"              AS "A-Number",                -- Alien Registration Number/Alien Number
    p."PassportCountryCode"  AS "Nationality",             -- Country of Citizenship
    i."ClassCode"            AS "COA",                     -- Attempted Class of Admission
    i."ExitDate"             AS "Removal Date",
    f."CountryCode"          AS "Removed to",
    i."NotAdmittedReason"    AS "Removal/Deportation Reason"
FROM "I_94"   i                                       -- I-94 record information
JOIN "Person" p ON p."PersonID" = i."PersonID"        -- Join to person registration based on passport
JOIN "Flight" f ON f."FlightID" = i."FlightID"        -- Join to flight to get entry details
WHERE i."Admitted" = FALSE                            -- Inadmissible and removed
ORDER BY i."ExitDate";

ALTER TABLE public."InadmissibilityReport"
    OWNER TO postgres;

SELECT *
FROM public."InadmissibilityReport"

/**
* Query 6.a: Filter of inadmissible aliens of a specific flight
* Returns the Inadmissibility Report of processed inadmissible aliens on a specific flight
* f."AirlineCode" f."FlightNumber" f."FlightDate" 
* For this specific output, United Airlines Flight 340 from Punta Cana (PUJ), DR (DOM), on 10/01/2025 will be queried to show all 
* inadmissible passengers who attempted entry on this specific flight
*/ 
SELECT *
FROM public."InadmissibilityReport"
WHERE "Airline" = 'UAL'
  AND "FlightNumber" = '340'
  AND "EntryDate"   = '2025-10-01';

/**
* Query 6.b: Filter of inadmissible aliens from a specific Country of Citizenship
* Returns the Inadmissibility Report of processed inadmissible aliens who hail from a specific country of citizenship
* 
* For this specific output, all citizens who are citizens (passport holders) of The Netherlands (NLD) will be queried to show all 
* Dutch inadmissible aliens.
*/ 
SELECT *
FROM public."InadmissibilityReport"
WHERE "Nationality" = 'NLD';

/**
* Query 7: Immigrant Visa Admission Log
* Returns a view of all individuals who have entered with an Immigrant Visa (Where all Admission Classes on IsPermanentResident are true, but not the ‘PR’ class.)
* The view will return a descending list by Last Name AND Nationality (to assist in showing familial entries), First Name, Country of Citizenship, Date of Entry, Alien Number, and Class of Admission.
*/

CREATE OR REPLACE VIEW public."IVAdmissionLog" AS
WITH iv_entries AS (
    SELECT
        i."RecordID",
        i."PersonID",
        i."EntryDate",
        i."ClassCode",
        /** Creates an order to find the initial IV entry.
        * There are uncommon cases in which IVs can be used on multiple entries.  
        * As upon endorsement (stamping over the visa), an IV becomes a temporary I-551 (Green Card) and someone can enter multiple times.
        * But this specific use case is to find the initial entry and initial I-94 entry of the Immigrating individual.  As this intiial entry can determine future immigration benefits.
        */
        ROW_NUMBER() OVER (  
            PARTITION BY i."PersonID"
            ORDER BY i."EntryDate", i."RecordID"
        ) AS rn
    FROM "I_94" i
    JOIN "Admission_Class" ac
      ON ac."ClassCode" = i."ClassCode"
    WHERE ac."IsPermanentResidentClass" = TRUE
      AND ac."ClassCode" <> 'PR'
      AND i."Admitted" = TRUE
)
SELECT
    p."Surname",
    p."GivenName",
    p."PassportCountryCode" AS "Nationality",
    iv."EntryDate"          AS "Resident Since",
    iv."ClassCode"          AS "IV Class",
    iv."RecordID"           AS "I-94 Record",
    p."ANumber"             AS "A-Number"
FROM iv_entries iv
JOIN "Person" p
  ON p."PersonID" = iv."PersonID"
WHERE iv.rn = 1
ORDER BY
    p."Surname",
    "Nationality";


SELECT * FROM "IVAdmissionLog"


/**
 * Query 8: Flight Entries Log
 * Returns a log of all flights recorded and provides a passenger count
 * and numerical details by admission outcome and class of admission.
 */
CREATE OR REPLACE VIEW public."FlightEntriesLog" AS
SELECT
    f."AirlineCode" || ' ' || f."FlightNumber" AS "Flight",   -- Unify the Airline IATA Code with the flight number for a cleaner presentation.
    f."OriginAirportCode" AS "Dep. Airport", 
    f."CountryCode"      AS "Dep. Country",
    f."FlightDate",
    -- Overall counts
    COUNT(DISTINCT i."PersonID")         AS "PassengerCount",
    COALESCE(SUM(CASE WHEN i."Admitted" THEN 1 ELSE 0 END), 0) AS "TotalAdmitted",
    COALESCE(SUM(CASE WHEN i."Admitted" = FALSE THEN 1 ELSE 0 END), 0) AS "TotalNotAdmitted",
    -- By key class categories
    COALESCE(SUM(CASE WHEN i."ClassCode" = 'C'   THEN 1 ELSE 0 END), 0) AS "Citizens",
    COALESCE(SUM(CASE WHEN i."ClassCode" = 'PR'  THEN 1 ELSE 0 END), 0) AS "PermanentResidents",
    COALESCE(SUM(CASE
                     WHEN ac."IsPermanentResidentClass" = TRUE
                      AND i."ClassCode" <> 'PR'
                     THEN 1 ELSE 0
                 END), 0) AS "Immigrant Visa",
    COALESCE(SUM(CASE WHEN i."ClassCode" = 'VWP' THEN 1 ELSE 0 END), 0) AS "Visa Waivers",
    -- All other *nonimmigrant* classes (non-PR, non-C, non-VWP)
    COALESCE(SUM(CASE
                     WHEN i."ClassCode" IS NOT NULL
                      AND i."ClassCode" NOT IN ('C','PR','VWP')
                      AND (ac."IsPermanentResidentClass" = FALSE
                           OR ac."IsPermanentResidentClass" IS NULL)
                     THEN 1 ELSE 0
                 END), 0) AS "Other Non-immigrants"
FROM public."Flight" f
LEFT JOIN public."I_94" i
       ON i."FlightID" = f."FlightID"
LEFT JOIN public."Admission_Class" ac
       ON ac."ClassCode" = i."ClassCode"
GROUP BY
    f."FlightID",
    f."FlightDate"
ORDER BY
    f."FlightDate" DESC;

COMMENT ON VIEW public."FlightEntriesLog" IS
    'Per-flight log with passenger counts, admission stats, and breakdown into Citizens (C), PR, VWP, IV IsPermanentResidentClass≠PR, and all other nonimmigrant classes.';

SELECT * FROM "FlightEntriesLog"


/**
 * Query 9: High-Risk Flights by Inadmissibility Rate 
 * Identifies flights where the number (or rate) of inadmissible passengers is unusually high.
 * Acknowledging for the purpose of the simulation, the numbers of inadmissibles are artificially inflated.  But in proper practice, this does give an operational view for officers and duty chiefs
 * to consider increased random selections and heightened inspections for certain flights that carry a trend of certain immigration issues.  
 * This application, could also be considered in the Customs context, of reporting of passengers seeking inspection could also count towards counts from certain countries of departure of contraband, currency violations, or trends. 
 * Which can be returned by this view if this were focused on the Customs Enforcement category.
 * Operational use: prioritize secondary staffing and carrier trend analysis.
 */
 CREATE OR REPLACE VIEW public."High Risk Flights by Inadmissibility"
 AS
 SELECT (f."AirlineCode"::text || ' '::text) || f."FlightNumber"::text AS "Flight",
    f."FlightDate" AS "Date",
    f."OriginAirportCode" AS "Dep. Airport",
    f."CountryCode" AS "Dep. Country",
    count(i."RecordID") AS "Inspections",
    sum(
        CASE
            WHEN i."Admitted" = false THEN 1
            ELSE 0
        END) AS "Denied",
    round(100.0 * sum(
        CASE
            WHEN i."Admitted" = false THEN 1
            ELSE 0
        END)::numeric / NULLIF(count(i."RecordID"), 0)::numeric, 2) AS "DeniedRatePct"
   FROM "Flight" f
     JOIN "I_94" i ON i."FlightID" = f."FlightID"
  GROUP BY f."AirlineCode", f."FlightNumber", f."FlightDate", f."OriginAirportCode", f."CountryCode"
 HAVING count(i."RecordID") >= 20 AND (sum(
        CASE
            WHEN i."Admitted" = false THEN 1
            ELSE 0
        END) >= 2 OR (sum(
        CASE
            WHEN i."Admitted" = false THEN 1
            ELSE 0
        END)::numeric / NULLIF(count(i."RecordID"), 0)::numeric) >= 0.05)
  ORDER BY (round(100.0 * sum(
        CASE
            WHEN i."Admitted" = false THEN 1
            ELSE 0
        END)::numeric / NULLIF(count(i."RecordID"), 0)::numeric, 2)) DESC, (sum(
        CASE
            WHEN i."Admitted" = false THEN 1
            ELSE 0
        END)) DESC, f."FlightDate" DESC;

ALTER TABLE public."High Risk Flights by Inadmissibility"
    OWNER TO postgres;
COMMENT ON VIEW public."High Risk Flights by Inadmissibility"
    IS 'Retrieves a view of recorded flights which have an inadmissibility rate >';
    
SELECT * FROM public."High Risk Flights by Inadmissibility"


/**
 * Query 10: Re-Entry After Prior Denial (Use case scenario in the query notes )
 * Finds travelers (by Alien Number) who were denied at least once, but later were admitted again.
 * Rationale: passport number/country may change over time; A-Number is the stable identifier as all future applications for entry would require the A-Number for all future file checks.
 */
CREATE OR REPLACE VIEW public."Re-EntryAfterPriorDenial"
 AS
 SELECT p."Surname",
    p."GivenName",
    p."ANumber" AS "A-Number",
    p."PassportCountryCode" AS "Nationality",
    (p."PassportCountryCode"::text || ' '::text) || p."PassportNumber"::text AS "Passport",
    i."RecordID" AS "I-94 #",
    (f."AirlineCode"::text || ' '::text) || f."FlightNumber"::text AS "Flight",
    f."CountryCode" AS "Origin",
    i."EntryDate" AS "AdmittedEntryDate",
    i."ClassCode" AS "COA",
    ( SELECT max(COALESCE(i2."ExitDate", i2."EntryDate")) AS max
           FROM "I_94" i2
             JOIN "Person" p2 ON p2."PersonID" = i2."PersonID"
          WHERE p2."ANumber"::text = p."ANumber"::text AND i2."Admitted" = false AND i2."ClassCode"::text <> 'PAR'::text) AS "MostRecentExit/RemovalDate"
   FROM "I_94" i
     JOIN "Person" p ON p."PersonID" = i."PersonID"
     JOIN "Flight" f ON f."FlightID" = i."FlightID"
  WHERE p."ANumber" IS NOT NULL AND p."ANumber"::text <> ''::text AND i."Admitted" = true AND i."ClassCode"::text <> 'PAR'::text AND (EXISTS ( SELECT 1
           FROM "I_94" i3
             JOIN "Person" p3 ON p3."PersonID" = i3."PersonID"
          WHERE p3."ANumber"::text = p."ANumber"::text AND i3."Admitted" = false AND i3."ClassCode"::text <> 'PAR'::text)) AND i."EntryDate" >= (( SELECT max(COALESCE(i2."ExitDate", i2."EntryDate")) AS max
           FROM "I_94" i2
             JOIN "Person" p2 ON p2."PersonID" = i2."PersonID"
          WHERE p2."ANumber"::text = p."ANumber"::text AND i2."Admitted" = false AND i2."ClassCode"::text <> 'PAR'::text))
  ORDER BY (( SELECT max(COALESCE(i2."ExitDate", i2."EntryDate")) AS max
           FROM "I_94" i2
             JOIN "Person" p2 ON p2."PersonID" = i2."PersonID"
          WHERE p2."ANumber"::text = p."ANumber"::text AND i2."Admitted" = false AND i2."ClassCode"::text <> 'PAR'::text)) DESC, i."EntryDate" DESC, p."Surname", p."GivenName";

ALTER TABLE public."Re-EntryAfterPriorDenial"
    OWNER TO postgres;


/*Query 10 Use case: 
Valeria Hernandez is a Mexican national who entered the US with her family in 2009 with a B2 Visa (I-94: 1411), but her family misrepresented their entry to escape violence in Mexico and not to be tourists ever since her tourist visa expired.  
Since then, she has been unlawfully present in the US, but all she’s really known is the United States, permitted to apply for Deferred Action for Childhood Arrivals (DACA) as she was under 13 when she entered initially, 
and she is permitted to live and work in the United States, given she renews every two years.  She goes to school in New Jersey, and graduates, but is unable to be petitioned by employers due to her inadmissible status.  
Given this status, she cannot leave the United States, or the immediate 10-year bar from reentry will come into effect, and her deferred status will be terminated.  
In 2020, she met a man who is a citizen, and eventually they get married, and she is now able to be petitioned as an Alien Relative as the spouse of a U.S. citizen (IR1).  
The marriage is found to be legitimate, and the underlying petition is approved, but given her inadmissible status, she is not permitted to seek adjustment of status in the US and must go to a consulate in Mexico.  
She applies for Advance Parole and must demonstrate extreme hardship, at the discretion of CBP, to be approved; if not, she will be exiting without the ability to re-enter due to the inadmissibility.  
She leaves (see exit date and corresponding “MostRecentDenialDate”), triggering the immediate 10-year bar to admission.  And goes to her Immigrant Visa appointment. 
Her Immigrant Visa is approved, and the Department of State grants her waiver of inadmissibility due to unlawful presence from her overstay as a child.  
She seeks admission back in Newark Airport, and CBP paroles her (I-94: 1412) and collects the document of the advance parole, and admits her under the terms of her immigrant visa (I-94: 1413 and “AdmittedEntryDate”),
 and is finally permitted to lawfully live in the United States and become a Lawful Permanent Resident. 
*/

--  1) 2009 B2 entry; exit 2025-03-15
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Valeria',
    p_surname := 'Hernandez',
    p_dob := '1999-08-07',

    p_passport_num := 'G49823107',
    p_passport_country_code := 'MEX',
    p_passport_issue_date := '2008-06-01',
    p_passport_exp_date := '2013-05-31',

    p_flight_airline_code := 'UAL',
    p_flight_number := '118',
    p_flight_origin_code := 'MEX',
    p_flight_country_code := 'MEX',
    p_arrival_date := '2009-01-23',

    p_admission_class_code := 'B2',
    p_admitted := FALSE, -- While lawfully admitted, as she's overstayed her permitted entry date, this would become false and be treated as a future inadmissibility and basis for removal.

    p_a_number := 'A095362018',
    p_exit_date := '2025-03-15',
    p_not_admitted_reason := 'AUTOMATED EXIT REPORT: Overstay exit reported; DACA status terminated; inadmissible; prior I-94 terminated'
);

-- 2) Parole Granted and handles the underlying inadmissibility.  Parole is not a lawful admission, hence it is FALSE.
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Valeria',
    p_surname := 'Hernandez',
    p_dob := '1999-08-07',

    p_passport_num := 'G49826907',
    p_passport_country_code := 'MEX',
    p_passport_issue_date := '2024-09-28',
    p_passport_exp_date := '2034-09-27',

    p_flight_airline_code := 'AAL',
    p_flight_number := '900',
    p_flight_origin_code := 'MEX',
    p_flight_country_code := 'MEX',
    p_arrival_date := '2025-03-18',

    p_admission_class_code := 'PAR',
    p_admitted := FALSE,

    p_a_number := 'A095362018',
    p_exit_date := '2025-03-18',
    p_not_admitted_reason := 'Paroled granted, inadmissibility waived at Consular processing. See Next I-94 for IV admission.'
);

-- 3) Next I-94: IR1 admitted on the same entry as the parole
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Valeria',
    p_surname := 'Hernandez',
    p_dob := '1999-08-07',

    p_passport_num := 'G49826907',
    p_passport_country_code := 'MEX',
    p_passport_issue_date := '2024-09-28',
    p_passport_exp_date := '2034-09-27',

    p_flight_airline_code := 'AAL',
    p_flight_number := '900',
    p_flight_origin_code := 'MEX',
    p_flight_country_code := 'MEX',
    p_arrival_date := '2025-03-18',

    p_admission_class_code := 'IR1',
    p_admitted := TRUE,

    p_a_number := 'A095362018',
    p_exit_date := NULL,
    p_not_admitted_reason := NULL
);

SELECT * FROM public."Lookup_I94_Record"(
    p_a_number := 'A095362018'
);
