/*
* Eduardo Alvarado
* 12/17/2025
* CST-204 Database Management Systems
* Prof. Elble
* Schema.sql
*/

-----------------------------------------------------
-- SEQUENCES 
-----------------------------------------------------

-- public.Country_CountryID_seq (Creates CountryIDs for easy referencing in referencing and lookups)

CREATE SEQUENCE IF NOT EXISTS public."Country_CountryID_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 32767
    CACHE 1;

ALTER SEQUENCE public."Country_CountryID_seq"
    OWNER TO postgres;


-- public.Flight_FlightID_seq (Creates a sequence of every new unique flight entered into the DB)

CREATE SEQUENCE IF NOT EXISTS public."Flight_FlightID_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."Flight_FlightID_seq"
    OWNER TO postgres;


-- public.I_94_RecordID_seq (A New I-94 record number is issued by the sequence as another Admit_New_Traveler is successfully executed.)

CREATE SEQUENCE IF NOT EXISTS public."I_94_RecordID_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."I_94_RecordID_seq"
    OWNER TO postgres;


-- public.Person_PersonID_seq (Creates a unique personID for any newly inserted biographical details of an individual is detected in the A Phase of Admit_New_Traveler)

CREATE SEQUENCE IF NOT EXISTS public."Person_PersonID_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."Person_PersonID_seq"
    OWNER TO postgres;


-- public.a_number_seq (Primarily serves a purpose in the Java program to assign Alien Registration Numbers using a generator to return an A-Number in the sequence if one is not provided and one is required to be generated for a passenger)

CREATE SEQUENCE IF NOT EXISTS public.a_number_seq
    INCREMENT 1
    START 581020155
    MINVALUE 1
    MAXVALUE 999999999
    CACHE 1;

ALTER SEQUENCE public.a_number_seq
    OWNER TO postgres;

COMMENT ON SEQUENCE public.a_number_seq
    IS 'Creates an Alien Registration Number Generator when an A-Number is not present in the holder''s file when needed.
'; -- This sequence is used for the A-Number generator in the Java program.

GRANT USAGE, SELECT ON SEQUENCE public.a_number_seq TO nliaees;
GRANT ALL ON SEQUENCE public.a_number_seq TO postgres;


-----------------------------------------------------
-- TABLES 
-----------------------------------------------------

-- Table: public.Admission_Class

CREATE TABLE IF NOT EXISTS public."Admission_Class"
(
    "ClassCode" character varying(4) COLLATE pg_catalog."default" NOT NULL,
    "ClassDescription" character varying(255) COLLATE pg_catalog."default" NOT NULL,
    "IsPermanentResidentClass" boolean NOT NULL,
    CONSTRAINT "Admission_Class_pkey" PRIMARY KEY ("ClassCode")
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Admission_Class"
    OWNER to postgres;

GRANT INSERT, DELETE, MAINTAIN, SELECT, TRIGGER, UPDATE, REFERENCES
    ON TABLE public."Admission_Class" TO nliaees;

GRANT ALL ON TABLE public."Admission_Class" TO postgres;

COMMENT ON TABLE public."Admission_Class"
    IS 'Classes of Admission for nonimmigrant visas, immigrant visas, ARC (Alien Resident Card), Citizens';


-- Table: public.Country

CREATE TABLE IF NOT EXISTS public."Country"
(
    "CountryID" smallint NOT NULL
        DEFAULT nextval('"Country_CountryID_seq"'::regclass),
    "CountryCode" character(3) COLLATE pg_catalog."default" NOT NULL,
    "CountryName" character varying(40) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Country_pkey" PRIMARY KEY ("CountryCode"),
    CONSTRAINT "Country_CountryID_key" UNIQUE ("CountryID")
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Country"
    OWNER to postgres;

GRANT INSERT, DELETE, MAINTAIN, SELECT, TRIGGER, UPDATE, REFERENCES
    ON TABLE public."Country" TO nliaees;

GRANT ALL ON TABLE public."Country" TO postgres;

COMMENT ON TABLE public."Country"
    IS 'Gives a list of countries by their name and country code (including administrative codes (Stateless/Refugee documents)) to enable direct validation against table values as they''re entered.';


-- Table: public.Passport

CREATE TABLE IF NOT EXISTS public."Passport"
(
    "PassportNumber" character varying(9) COLLATE pg_catalog."default" NOT NULL,
    "CountryCode" character(3) COLLATE pg_catalog."default" NOT NULL,
    "GivenName" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "Surname" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "IssueDate" date NOT NULL,
    "ExpDate" date NOT NULL,
    CONSTRAINT "Passport_pkey" PRIMARY KEY ("PassportNumber", "CountryCode"),
    CONSTRAINT fk_passport_country FOREIGN KEY ("CountryCode")
        REFERENCES public."Country" ("CountryCode") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE RESTRICT
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Passport"
    OWNER to postgres;

GRANT INSERT, DELETE, MAINTAIN, SELECT, TRIGGER, UPDATE, REFERENCES
    ON TABLE public."Passport" TO nliaees;

GRANT ALL ON TABLE public."Passport" TO postgres;

COMMENT ON TABLE public."Passport"
    IS 'Stores passport details; Primary key is composite to handle non-unique passport numbers globally.';


-- Table: public.Person

CREATE TABLE IF NOT EXISTS public."Person"
(
    "PersonID" integer NOT NULL
        DEFAULT nextval('"Person_PersonID_seq"'::regclass),
    "GivenName" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "Surname" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "ANumber" character varying(10) COLLATE pg_catalog."default",
    "DateOfBirth" date NOT NULL,
    "PassportNumber" character varying(9) COLLATE pg_catalog."default" NOT NULL,
    "PassportCountryCode" character(3) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Person_pkey" PRIMARY KEY ("PersonID"),
    CONSTRAINT "Person_Unique_Passport" UNIQUE ("PassportNumber", "PassportCountryCode"),
    CONSTRAINT fk_person_passport FOREIGN KEY ("PassportNumber", "PassportCountryCode")
        REFERENCES public."Passport" ("PassportNumber", "CountryCode") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE RESTRICT
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Person"
    OWNER to postgres;

GRANT INSERT, DELETE, MAINTAIN, SELECT, TRIGGER, UPDATE, REFERENCES
    ON TABLE public."Person" TO nliaees;

GRANT ALL ON TABLE public."Person" TO postgres;

COMMENT ON TABLE public."Person"
    IS 'Stores biographic details for each individual. Links to the unique passport record via the composite key.';


-- Table: public.Flight

CREATE TABLE IF NOT EXISTS public."Flight"
(
    "FlightID" integer NOT NULL
        DEFAULT nextval('"Flight_FlightID_seq"'::regclass),
    "AirlineCode" character varying(3) COLLATE pg_catalog."default" NOT NULL,
    "FlightNumber" character varying(6) COLLATE pg_catalog."default" NOT NULL,
    "OriginAirportCode" character varying(3) COLLATE pg_catalog."default" NOT NULL,
    "FlightDate" date NOT NULL,
    "CountryCode" character(3) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Flight_pkey" PRIMARY KEY ("FlightID"),
    CONSTRAINT "Flight_Unique_Event" UNIQUE ("AirlineCode", "FlightNumber", "OriginAirportCode", "FlightDate"),
    CONSTRAINT fk_flight_country FOREIGN KEY ("CountryCode")
        REFERENCES public."Country" ("CountryCode") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE RESTRICT
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Flight"
    OWNER to postgres;

GRANT INSERT, DELETE, MAINTAIN, SELECT, TRIGGER, UPDATE, REFERENCES
    ON TABLE public."Flight" TO nliaees;

GRANT ALL ON TABLE public."Flight" TO postgres;

COMMENT ON TABLE public."Flight"
    IS 'Stores details about incoming flights.';


-- Table: public.I_94

CREATE TABLE IF NOT EXISTS public."I_94"
(
    "RecordID" integer NOT NULL
        DEFAULT nextval('"I_94_RecordID_seq"'::regclass),
    "PersonID" integer NOT NULL,
    "FlightID" integer NOT NULL,
    "ClassCode" character varying(4) COLLATE pg_catalog."default" NOT NULL,
    "EntryDate" date NOT NULL,
    "Admitted" boolean NOT NULL,
    "ExitDate" date,
    "NotAdmittedReason" character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT "I_94_pkey" PRIMARY KEY ("RecordID"),
    CONSTRAINT i94_unique_person_flight UNIQUE ("PersonID", "FlightID", "ClassCode", "EntryDate"),
    CONSTRAINT fk_i94_admission_class FOREIGN KEY ("ClassCode")
        REFERENCES public."Admission_Class" ("ClassCode") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE RESTRICT,
    CONSTRAINT fk_i94_flight FOREIGN KEY ("FlightID")
        REFERENCES public."Flight" ("FlightID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT fk_i94_person FOREIGN KEY ("PersonID")
        REFERENCES public."Person" ("PersonID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."I_94"
    OWNER to postgres;

GRANT INSERT, DELETE, MAINTAIN, SELECT, TRIGGER, UPDATE, REFERENCES
    ON TABLE public."I_94" TO nliaees;

GRANT ALL ON TABLE public."I_94" TO postgres;

COMMENT ON TABLE public."I_94"
    IS 'The core arrival/departure record (I-94), linking a person and a flight to an admission class.';


-- Table: public.Person_Admission_Class

CREATE TABLE IF NOT EXISTS public."Person_Admission_Class"
(
    "PersonID" integer NOT NULL,
    "ClassCode" character varying(4) COLLATE pg_catalog."default" NOT NULL,
    "I94RecordID" integer NOT NULL,
    "GrantDate" date NOT NULL,
    CONSTRAINT "Person_Admission_Class_pkey" PRIMARY KEY ("PersonID", "ClassCode", "I94RecordID"),
    CONSTRAINT fk_pac_admission_class FOREIGN KEY ("ClassCode")
        REFERENCES public."Admission_Class" ("ClassCode") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_pac_i94 FOREIGN KEY ("I94RecordID")
        REFERENCES public."I_94" ("RecordID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT fk_pac_person FOREIGN KEY ("PersonID")
        REFERENCES public."Person" ("PersonID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Person_Admission_Class"
    OWNER to postgres;

GRANT INSERT, DELETE, MAINTAIN, SELECT, TRIGGER, UPDATE, REFERENCES
    ON TABLE public."Person_Admission_Class" TO nliaees;

GRANT ALL ON TABLE public."Person_Admission_Class" TO postgres;

COMMENT ON TABLE public."Person_Admission_Class"
    IS 'Bridge table to track the history of admission classes granted to a person.';




-- SEQUENCE OWNERSHIP 

ALTER SEQUENCE public."Country_CountryID_seq"
    OWNED BY public."Country"."CountryID";

ALTER SEQUENCE public."Flight_FlightID_seq"
    OWNED BY public."Flight"."FlightID";

ALTER SEQUENCE public."I_94_RecordID_seq"
    OWNED BY public."I_94"."RecordID";

ALTER SEQUENCE public."Person_PersonID_seq"
    OWNED BY public."Person"."PersonID";



-- ========================================================================
-- FUNCTIONS
-- ========================================================================

/*
* fn_enforce_anumber_format()
* The function executed by the enforce_a_number_format trigger that is placed on the Person table to listen 
* for any insertions of an Alien Number to a person's record, and initiates a review that the A number is in correct format
* A#########
*
*/

CREATE OR REPLACE FUNCTION public.fn_enforce_anumber_format()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE
    clean_digits text;
BEGIN
    -- 1. If the ANumber is NULL, do nothing and return.
    IF NEW."ANumber" IS NULL OR NEW."ANumber" = '' THEN
        RETURN NEW;
    END IF;

    -- 2. Extract only the numbers (removes 'A', spaces, dashes, etc.)
    clean_digits := regexp_replace(NEW."ANumber", '\D', '', 'g');

    -- 3. If there are digits found, format them to A#########
    IF length(clean_digits) > 0 THEN
        -- LPAD(string, length, fill_text) ensures we have 9 digits
        NEW."ANumber" := 'A' || lpad(clean_digits, 9, '0');
    END IF;

    RETURN NEW;
END;
$BODY$;

ALTER FUNCTION public.fn_enforce_anumber_format()
    OWNER TO postgres;

COMMENT ON FUNCTION public.fn_enforce_anumber_format()
    IS 'Utilizes the function public.fn_enforce_anumber_format() to detect and fix anytime an Alien Number is attempted to be entered or updated on a person record by ensuring it is formatted to comply with A######### and if anything less than 9 numbers, the trigger will fix it to pad 0s in the left of the entry and insert an A to ensure data integrity and compliance to formatting.';


/*
* Admit_New_Traveler: See Query 1: lines 9-82
* The primary DML transaction for inserting data into the database.  Performs all phases of the inspection process by:
* Phase A: Recording Traveler information from the passenger's biographical data (Passport)
* Phase B: Processing the origin flight of the traveler (Flight data from boarding pass) (In real life practice, this information is already present via the flight manifest transmitted to CBP when the flight is boarded)
* Phase C: Recording the basis of admission and inspection of the passenger (Using ARCs/Visa Information/VWP class), determination of admissibility or potential inadmissibility and subsequent removal 
*/
*/
CREATE OR REPLACE FUNCTION public."Admit_New_Traveler"(
    p_given_name character varying,
    p_surname character varying,
    p_dob date,
    p_passport_num character varying,
    p_passport_country_code character(3),
    p_passport_issue_date date,
    p_passport_exp_date date,
    p_flight_airline_code character varying,
    p_flight_number character varying,
    p_flight_origin_code character varying,
    p_flight_country_code character(3),
    p_arrival_date date,
    p_admission_class_code character varying,
    p_admitted boolean,
    p_a_number character varying(10) DEFAULT NULL,
    p_exit_date date DEFAULT NULL,
    p_not_admitted_reason character varying DEFAULT NULL
)
RETURNS TABLE (person_id integer, i94_record_id integer) AS
$$
DECLARE
    v_person_id INTEGER;
    v_flight_id INTEGER;
    v_i94_record_id INTEGER;
BEGIN
    -- 1. Insert/Verify Passport Record
    -- Passport insert is safe due to ON CONFLICT DO NOTHING
    INSERT INTO public."Passport" ("PassportNumber", "CountryCode", "GivenName", "Surname", "IssueDate", "ExpDate")
    VALUES (p_passport_num, p_passport_country_code, p_given_name, p_surname, p_passport_issue_date, p_passport_exp_date)
    ON CONFLICT ("PassportNumber", "CountryCode") DO NOTHING;

    -- 2. Check for existing Person by Composite Passport ID

    SELECT "PersonID" INTO v_person_id
    FROM public."Person"
    WHERE "PassportNumber" = p_passport_num
      AND "PassportCountryCode" = p_passport_country_code;

    IF v_person_id IS NULL THEN
        -- Person does NOT exist, so insert new record
        INSERT INTO public."Person" ("GivenName", "Surname", "DateOfBirth", "PassportNumber", "PassportCountryCode", "ANumber")
        VALUES (p_given_name, p_surname, p_dob, p_passport_num, p_passport_country_code, p_a_number)
        RETURNING "PersonID" INTO v_person_id;
    ELSE
        -- Person DOES exist (v_person_id is set). 
        -- Update ANumber if a new one is provided
        IF p_a_number IS NOT NULL THEN
            UPDATE public."Person"
            SET "ANumber" = p_a_number
            WHERE "PersonID" = v_person_id;
        END IF;
    END IF;

    -- 3. Insert Flight Record

    SELECT "FlightID" INTO v_flight_id
    FROM public."Flight"
    WHERE "AirlineCode" = p_flight_airline_code
      AND "FlightNumber" = p_flight_number
      AND "OriginAirportCode" = p_flight_origin_code
      AND "FlightDate" = p_arrival_date;

    IF v_flight_id IS NULL THEN
        INSERT INTO public."Flight" ("AirlineCode", "FlightNumber", "OriginAirportCode", "CountryCode", "FlightDate")
        VALUES (p_flight_airline_code, p_flight_number, p_flight_origin_code, p_flight_country_code, p_arrival_date)
        RETURNING "FlightID" INTO v_flight_id;
    END IF;

    -- 4. Insert I_94 (Arrival/Departure) Record

    INSERT INTO public."I_94" ("PersonID", "FlightID", "ClassCode", "EntryDate", "Admitted", "ExitDate", "NotAdmittedReason")
    VALUES (v_person_id, v_flight_id, p_admission_class_code, p_arrival_date, p_admitted, p_exit_date, p_not_admitted_reason)
    RETURNING "RecordID" INTO v_i94_record_id;

    -- 5. Insert Person_Admission_Class Record

    INSERT INTO public."Person_Admission_Class" ("PersonID", "ClassCode", "I94RecordID", "GrantDate")
    VALUES (v_person_id, p_admission_class_code, v_i94_record_id, p_arrival_date);

    -- Return the generated IDs
    RETURN QUERY SELECT v_person_id, v_i94_record_id;

END;
$$
LANGUAGE plpgsql;

ALTER FUNCTION public."Admit_New_Traveler"(character varying, character varying, date, character varying, character, date, date, character varying, character varying, character varying, character, date, character varying, boolean, character varying, date, character varying)
    OWNER TO postgres;

GRANT EXECUTE ON FUNCTION public."Admit_New_Traveler"(character varying, character varying, date, character varying, character, date, date, character varying, character varying, character varying, character, date, character varying, boolean, character varying, date, character varying) TO PUBLIC;

GRANT EXECUTE ON FUNCTION public."Admit_New_Traveler"(character varying, character varying, date, character varying, character, date, date, character varying, character varying, character varying, character, date, character varying, boolean, character varying, date, character varying) TO nliaees WITH GRANT OPTION;

GRANT EXECUTE ON FUNCTION public."Admit_New_Traveler"(character varying, character varying, date, character varying, character, date, date, character varying, character varying, character varying, character, date, character varying, boolean, character varying, date, character varying) TO postgres;



/*
* Lookup_I94_Record function  -- Query 2: Lines 77-95
* Provides two methods of looking up an individual's complete I-94 Entry and Departure history by
* a. Lookup via Alien Registration Number (A-Number)
* b. Lookup via Passport Country+Passport Number composite key
*/

CREATE OR REPLACE FUNCTION public."Lookup_I94_Record"(
	p_passport_num character varying DEFAULT NULL::character varying,
	p_passport_country_code character DEFAULT NULL::bpchar,
	p_a_number character varying DEFAULT NULL::character varying)
    RETURNS TABLE("I-94 #" integer, "Passport" text, "Flight" text, "Origin" character, "EntryDate" date, "ExitDate" date, "COA" character varying, "Admitted" boolean, "NotAdmittedReason" character varying) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
DECLARE
    v_person_id      integer;
    v_norm_anumber   text;
    v_clean_digits   text;
    v_given_name     text;
    v_surname        text;
BEGIN
    -- Normalize inputs
    p_passport_num          := NULLIF(trim(p_passport_num), '');
    p_passport_country_code := NULLIF(trim(p_passport_country_code), '');
    p_a_number              := NULLIF(upper(trim(p_a_number)), '');

    -- Normalize A-Number to A#########
    IF p_a_number IS NOT NULL THEN
        v_clean_digits := regexp_replace(p_a_number, '\D', '', 'g');
        IF length(v_clean_digits) > 0 THEN
            v_norm_anumber := 'A' || lpad(v_clean_digits, 9, '0');
        ELSE
            v_norm_anumber := NULL;
        END IF;
    END IF;

    -- Locate traveler (for NOTICE only). For A-number, pick the newest Person row.
    IF v_norm_anumber IS NOT NULL THEN
        SELECT p."PersonID", p."GivenName", p."Surname"
        INTO  v_person_id, v_given_name, v_surname
        FROM public."Person" p
        WHERE p."ANumber" = v_norm_anumber
        ORDER BY p."PersonID" DESC
        LIMIT 1;

    ELSIF p_passport_num IS NOT NULL
       AND p_passport_country_code IS NOT NULL THEN

        SELECT p."PersonID", p."GivenName", p."Surname"
        INTO  v_person_id, v_given_name, v_surname
        FROM public."Person" p
        WHERE p."PassportNumber"      = p_passport_num
          AND p."PassportCountryCode" = p_passport_country_code;

    ELSE
        RAISE NOTICE 'Must provide either an A-Number or Passport Number AND Country Code.';
        RETURN;
    END IF;

    IF v_person_id IS NULL THEN
        RAISE NOTICE 'No traveler found matching supplied identifiers.';
        RETURN;
    END IF;

    RAISE NOTICE 'Found the following: %, %', v_surname, v_given_name;

    -- Return full I-94 history
    RETURN QUERY
    SELECT
        i."RecordID"                                         AS "I-94 #",
        (p."PassportCountryCode" || ' ' || p."PassportNumber") AS "Passport",
        (f."AirlineCode" || ' ' || f."FlightNumber")         AS "Flight",
        f."CountryCode"                                      AS "Origin",
        i."EntryDate"                                        AS "EntryDate",
        i."ExitDate"                                         AS "ExitDate",
        i."ClassCode"                                        AS "COA",
        i."Admitted"                                         AS "Admitted",
        i."NotAdmittedReason"                                AS "NotAdmittedReason"
    FROM public."I_94"   i
    JOIN public."Person" p ON p."PersonID" = i."PersonID"
    JOIN public."Flight" f ON f."FlightID" = i."FlightID"
    WHERE
        (
            v_norm_anumber IS NOT NULL
            AND p."ANumber" = v_norm_anumber
        )
        OR
        (
            v_norm_anumber IS NULL
            AND p."PersonID" = v_person_id
        )
    ORDER BY i."EntryDate" DESC, i."RecordID" DESC;

END;
$BODY$;

ALTER FUNCTION public."Lookup_I94_Record"(character varying, character, character varying)
    OWNER TO postgres;



-- Trigger to execute the enforce_anumber_format function on any insertion to ensure a uniform entry of A-Numbers to 'A#########'

CREATE OR REPLACE TRIGGER trg_fix_anumber
    BEFORE INSERT OR UPDATE
    ON public."Person"
    FOR EACH ROW
    EXECUTE FUNCTION public.fn_enforce_anumber_format();



