/*
Eduardo Alvarado
11/05/2025
CST-204-001
Prof. Elble
functions.sql
*/

-- =========================================================================
-- FUNCTION 1: Admit_New_Traveler
-- Inserts records into Passport, Person, Flight, and I_94 tables in a single transaction.
-- =========================================================================
CREATE OR REPLACE FUNCTION public."Admit_New_Traveler"(
    p_given_name character varying,
    p_surname character varying,
    p_dob date,
    p_passport_num character varying,
    p_passport_country_code character(3),
    p_passport_issue_date date,
    p_passport_exp_date date,
    p_flight_airline_code character(3),
    p_flight_number character varying,
    p_flight_origin_code character(3),
    p_flight_country_code character(3),
    p_arrival_date date,
    p_admission_class_code character varying(4),
    p_admitted boolean,
    p_a_number character varying DEFAULT NULL,
    p_exit_date date DEFAULT NULL,
    p_not_admitted_reason character varying DEFAULT NULL
)
RETURNS TABLE(i94_record_id bigint, status text)
LANGUAGE plpgsql
AS $$
DECLARE
    v_person_id bigint;
    v_flight_id bigint;
    v_i94_id bigint;
BEGIN
    -- 1. Insert or check for Passport record
    INSERT INTO public."Passport" ("PassportNumber", "CountryCode", "IssueDate", "ExpirationDate")
    VALUES (p_passport_num, p_passport_country_code, p_passport_issue_date, p_passport_exp_date)
    ON CONFLICT ("PassportNumber", "CountryCode") DO NOTHING;

    -- 2. Insert or check for Person record
    -- A person is identified by Name, DOB, and Passport
    INSERT INTO public."Person" ("GivenName", "Surname", "DateOfBirth", "PassportNumber", "PassportCountryCode", "AlienRegistrationNumber")
    VALUES (p_given_name, p_surname, p_dob, p_passport_num, p_passport_country_code, p_a_number)
    ON CONFLICT DO NOTHING
    RETURNING "PersonID" INTO v_person_id;

    -- If the person was not just inserted (i.e., they already existed), retrieve their ID
    IF v_person_id IS NULL THEN
        SELECT "PersonID" INTO v_person_id
        FROM public."Person"
        WHERE "GivenName" = p_given_name
          AND "Surname" = p_surname
          AND "DateOfBirth" = p_dob
          AND "PassportNumber" = p_passport_num;
    END IF;

    -- 3. Insert or check for Flight record
    INSERT INTO public."Flight" ("AirlineCode", "FlightNumber", "OriginAirportCode", "OriginCountryCode", "FlightDate")
    VALUES (p_flight_airline_code, p_flight_number, p_flight_origin_code, p_flight_country_code, p_arrival_date)
    ON CONFLICT ("AirlineCode", "FlightNumber", "OriginAirportCode", "FlightDate") DO NOTHING
    RETURNING "FlightID" INTO v_flight_id;

    -- If the flight was not just inserted, retrieve its ID
    IF v_flight_id IS NULL THEN
        SELECT "FlightID" INTO v_flight_id
        FROM public."Flight"
        WHERE "AirlineCode" = p_flight_airline_code
          AND "FlightNumber" = p_flight_number
          AND "OriginAirportCode" = p_flight_origin_code
          AND "FlightDate" = p_arrival_date;
    END IF;

    -- 4. Insert the I_94 Entry Record
    INSERT INTO public."I_94" ("PersonID", "FlightID", "ClassCode", "ArrivalDate", "Admitted", "ExitDate", "NotAdmittedReason")
    VALUES (v_person_id, v_flight_id, p_admission_class_code, p_arrival_date, p_admitted, p_exit_date, p_not_admitted_reason)
    RETURNING "RecordID" INTO v_i94_id;

    -- 5. Insert into the Person_Admission_Class junction table
    INSERT INTO public."Person_Admission_Class" ("PersonID", "ClassCode", "I94RecordID")
    VALUES (v_person_id, p_admission_class_code, v_i94_id);

    -- Return the newly created I-94 Record ID
    i94_record_id := v_i94_id;
    status := 'Traveler admitted and I-94 record created successfully.';
    RETURN NEXT;
END;
$$;


-- =========================================================================
-- FUNCTION 2: Lookup_I94_Record
-- Retrieves a person's most recent I-94 record based on their passport details.
-- =========================================================================
CREATE OR REPLACE FUNCTION public."Lookup_I94_Record"(
    p_passport_num character varying,
    p_passport_country_code character(3)
)
RETURNS TABLE (
    "I94RecordID" bigint,
    "FullName" character varying,
    "DateOfBirth" date,
    "PassportNumber" character varying,
    "PassportCountry" character varying,
    "ArrivalDate" date,
    "AdmissionClass" character varying,
    "AdmittedStatus" boolean,
    "ExitDate" date,
    "FlightInfo" character varying
)
LANGUAGE sql
AS $$
    SELECT
        i94."RecordID",
        p."GivenName" || ' ' || p."Surname" AS "FullName",
        p."DateOfBirth",
        p."PassportNumber",
        c_passport."CountryName" AS "PassportCountry",
        i94."ArrivalDate",
        ac."ClassCode" || ' - ' || ac."ClassDescription" AS "AdmissionClass",
        i94."Admitted" AS "AdmittedStatus",
        i94."ExitDate",
        f."AirlineCode" || f."FlightNumber" || ' from ' || f."OriginAirportCode" AS "FlightInfo"
    FROM
        public."I_94" i94
    JOIN
        public."Person" p ON i94."PersonID" = p."PersonID"
    JOIN
        public."Flight" f ON i94."FlightID" = f."FlightID"
    JOIN
        public."Admission_Class" ac ON i94."ClassCode" = ac."ClassCode"
    JOIN
        public."Country" c_passport ON p."PassportCountryCode" = c_passport."CountryCode"
    WHERE
        p."PassportNumber" = p_passport_num
        AND p."PassportCountryCode" = p_passport_country_code
    ORDER BY
        i94."ArrivalDate" DESC
    LIMIT 1;
$$;


-- =========================================================================
-- FUNCTION 3: Generate_Flight_Manifest
-- Retrieves all travelers associated with a specific flight arrival event.
-- =========================================================================
CREATE OR REPLACE FUNCTION public."Generate_Flight_Manifest"(
    p_airline_code character(3),
    p_flight_number character varying,
    p_origin_airport_code character(3),
    p_arrival_date date
)
RETURNS TABLE (
    "I94RecordID" bigint,
    "FullName" character varying,
    "DateOfBirth" date,
    "AdmissionClass" character varying,
    "Admitted" boolean,
    "PassportCountry" character varying
)
LANGUAGE sql
AS $$
    SELECT
        i94."RecordID",
        p."GivenName" || ' ' || p."Surname" AS "FullName",
        p."DateOfBirth",
        ac."ClassCode" AS "AdmissionClass",
        i94."Admitted",
        c_passport."CountryName" AS "PassportCountry"
    FROM
        public."Flight" f
    JOIN
        public."I_94" i94 ON f."FlightID" = i94."FlightID"
    JOIN
        public."Person" p ON i94."PersonID" = p."PersonID"
    JOIN
        public."Admission_Class" ac ON i94."ClassCode" = ac."ClassCode"
    JOIN
        public."Country" c_passport ON p."PassportCountryCode" = c_passport."CountryCode"
    WHERE
        f."AirlineCode" = p_airline_code
        AND f."FlightNumber" = p_flight_number
        AND f."OriginAirportCode" = p_origin_airport_code
        AND f."FlightDate" = p_arrival_date
    ORDER BY
        p."Surname", p."GivenName";
$$;