/*
Eduardo Alvarado
10/31/2025
CST-204-001
Prof. Elble
data.sql
*/

/*
I would like to first apologize for the amount of insertions in here, I may have gotten completely fixated on this but I do hope
 I have given enough data to show variation and a comprehensive set of notes to discuss reasoning and relation */

/*--I will be notating this in a main document to show the purposes and expanded uses for the insertions--
	1. Populating Countries:  The Country table will populate the selectable countries for the data validation 
		for Passport input, Entry Information for an Admission of an origin flight eventual use for I-94 lookup 
*/
INSERT INTO
	PUBLIC."Country" ("CountryCode", "CountryName")
VALUES
	('AFG', 'Afghanistan'),
	('ALB', 'Albania'),
	('DZA', 'Algeria'),
	('ASM', 'American Samoa'),
	('AND', 'Andorra'),
	('AGO', 'Angola'),
	('AIA', 'Anguilla'),
	('ATA', 'Antarctica'),
	('ATG', 'Antigua And Barbuda'),
	('ARG', 'Argentina'),
	('ARM', 'Armenia'),
	('ABW', 'Aruba'),
	('AUS', 'Australia'),
	('AUT', 'Austria'),
	('AZE', 'Azerbaijan'),
	('BHS', 'Bahamas'),
	('BHR', 'Bahrain'),
	('BGD', 'Bangladesh'),
	('BRB', 'Barbados'),
	('BLR', 'Belarus'),
	('BEL', 'Belgium'),
	('BLZ', 'Belize'),
	('BEN', 'Benin'),
	('BMU', 'Bermuda'),
	('BTN', 'Bhutan'),
	('BOL', 'Bolivia'),
	('BIH', 'Bosnia And Herzegovina'),
	('BWA', 'Botswana'),
	('BVT', 'Bouvet Island'),
	('BRA', 'Brazil'),
	('IOT', 'British Indian Ocean Territory'),
	('BRN', 'Brunei Darussalam'),
	('BGR', 'Bulgaria'),
	('BFA', 'Burkina Faso'),
	('BDI', 'Burundi'),
	('KHM', 'Cambodia'),
	('CMR', 'Cameroon'),
	('CAN', 'Canada'),
	('CPV', 'Cape Verde'),
	('CYM', 'Cayman Islands'),
	('CAF', 'Central African Republic'),
	('TCD', 'Chad'),
	('CHL', 'Chile'),
	('CHN', 'China'),
	('CXR', 'Christmas Island'),
	('CCK', 'Cocos (Keeling) Islands'),
	('COL', 'Colombia'),
	('COM', 'Comoros'),
	('COG', 'Congo'),
	('COD', 'Congo, The Democratic Republic Of The'),
	('COK', 'Cook Islands'),
	('CRI', 'Costa Rica'),
	('CIV', 'Cote D''ivoire'),
	('HRV', 'Croatia'),
	('CUB', 'Cuba'),
	('CYP', 'Cyprus'),
	('CZE', 'Czech Republic'),
	('DNK', 'Denmark'),
	('DJI', 'Djibouti'),
	('DMA', 'Dominica'),
	('DOM', 'Dominican Republic'),
	('TMP', 'East Timor'),
	('ECU', 'Ecuador'),
	('EGY', 'Egypt'),
	('SLV', 'El Salvador'),
	('GNQ', 'Equatorial Guinea'),
	('ERI', 'Eritrea'),
	('EST', 'Estonia'),
	('ETH', 'Ethiopia'),
	('FLK', 'Falkland Islands (Malvinas)'),
	('FRO', 'Faroe Islands'),
	('FJI', 'Fiji'),
	('FIN', 'Finland'),
	('FRA', 'France'),
	('GUF', 'French Guiana'),
	('PYF', 'French Polynesia'),
	('ATF', 'French Southern Territories'),
	('GAB', 'Gabon'),
	('GMB', 'Gambia'),
	('GEO', 'Georgia'),
	('DEU', 'Germany'),
	('GHA', 'Ghana'),
	('GIB', 'Gibraltar'),
	('GRC', 'Greece'),
	('GRL', 'Greenland'),
	('GRD', 'Grenada'),
	('GLP', 'Guadeloupe'),
	('GUM', 'Guam'),
	('GTM', 'Guatemala'),
	('GIN', 'Guinea'),
	('GNB', 'Guinea-Bissau'),
	('GUY', 'Guyana'),
	('HTI', 'Haiti'),
	('HMD', 'Heard Island And Mcdonald Islands'),
	('VAT', 'Holy See (Vatican City State)'),
	('HND', 'Honduras'),
	('HKG', 'Hong Kong'),
	('HUN', 'Hungary'),
	('ISL', 'Iceland'),
	('IND', 'India'),
	('IDN', 'Indonesia'),
	('IRN', 'Iran, Islamic Republic Of'),
	('IRQ', 'Iraq'),
	('IRL', 'Ireland'),
	('ISR', 'Israel'),
	('ITA', 'Italy'),
	('JAM', 'Jamaica'),
	('JPN', 'Japan'),
	('JOR', 'Jordan'),
	('KAZ', 'Kazakhstan'),
	('KEN', 'Kenya'),
	('KIR', 'Kiribati'),
	('PRK', 'Korea, Democratic People''s Republic Of'),
	('KOR', 'Korea, Republic Of'),
	('KWT', 'Kuwait'),
	('KGZ', 'Kyrgyzstan'),
	('LAO', 'Lao People''s Democratic Republic'),
	('LVA', 'Latvia'),
	('LBN', 'Lebanon'),
	('LSO', 'Lesotho'),
	('LBR', 'Liberia'),
	('LBY', 'Libyan Arab Jamahiriya'),
	('LIE', 'Liechtenstein'),
	('LTU', 'Lithuania'),
	('LUX', 'Luxembourg'),
	('MAC', 'Macao'),
	('MKD', 'North Macedonia'),
	('MDG', 'Madagascar'),
	('MWI', 'Malawi'),
	('MYS', 'Malaysia'),
	('MDV', 'Maldives'),
	('MLI', 'Mali'),
	('MLT', 'Malta'),
	('MHL', 'Marshall Islands'),
	('MTQ', 'Martinique'),
	('MRT', 'Mauritania'),
	('MUS', 'Mauritius'),
	('MYT', 'Mayotte'),
	('MEX', 'Mexico'),
	('FSM', 'Micronesia, Federated States Of'),
	('MDA', 'Moldova, Republic Of'),
	('MCO', 'Monaco'),
	('MNG', 'Mongolia'),
	('MSR', 'Montserrat'),
	('MAR', 'Morocco'),
	('MOZ', 'Mozambique'),
	('MMR', 'Myanmar'),
	('NAM', 'Namibia'),
	('NRU', 'Nauru'),
	('NPL', 'Nepal'),
	('ANT', 'Netherlands Antilles'),
	('NLD', 'Netherlands'),
	('NCL', 'New Caledonia'),
	('NZL', 'New Zealand'),
	('NIC', 'Nicaragua'),
	('NER', 'Niger'),
	('NGA', 'Nigeria'),
	('NIU', 'Niue'),
	('NFK', 'Norfolk Island'),
	('MNP', 'Northern Mariana Islands'),
	('NOR', 'Norway'),
	('OMN', 'Oman'),
	('PAK', 'Pakistan'),
	('PLW', 'Palau'),
	('PAN', 'Panama'),
	('PNG', 'Papua New Guinea'),
	('PRY', 'Paraguay'),
	('PER', 'Peru'),
	('PHL', 'Philippines'),
	('PCN', 'Pitcairn'),
	('POL', 'Poland'),
	('PRT', 'Portugal'),
	('PRI', 'Puerto Rico'),
	('QAT', 'Qatar'),
	('REU', 'Reunion'),
	('ROU', 'Romania'),
	('RUS', 'Russian Federation'),
	('RWA', 'Rwanda'),
	('SHN', 'Saint Helena'),
	('KNA', 'Saint Kitts And Nevis'),
	('LCA', 'Saint Lucia'),
	('SPM', 'Saint Pierre And Miquelon'),
	('VCT', 'Saint Vincent And The Grenadines'),
	('WSM', 'Samoa'),
	('SMR', 'San Marino'),
	('STP', 'Sao Tome And Principe'),
	('SAU', 'Saudi Arabia'),
	('SEN', 'Senegal'),
	('SCG', 'Serbia And Montenegro'),
	('SYC', 'Seychelles'),
	('SLE', 'Sierra Leone'),
	('SGP', 'Singapore'),
	('SVK', 'Slovakia'),
	('SVN', 'Slovenia'),
	('SLB', 'Solomon Islands'),
	('SOM', 'Somalia'),
	('ZAF', 'South Africa'),
	('SGS', 'S. Georgia/S. Sandwich Is.'),
	('ESP', 'Spain'),
	('LKA', 'Sri Lanka'),
	('SDN', 'Sudan'),
	('SUR', 'Suriname'),
	('SJM', 'Svalbard And Jan Mayen'),
	('SWZ', 'Swaziland'),
	('SWE', 'Sweden'),
	('CHE', 'Switzerland'),
	('SYR', 'Syrian Arab Republic'),
	('TWN', 'Taiwan, Province Of China'),
	('TJK', 'Tajikistan'),
	('TZA', 'Tanzania, United Republic Of'),
	('THA', 'Thailand'),
	('TGO', 'Togo'),
	('TKL', 'Tokelau'),
	('TON', 'Tonga'),
	('TTO', 'Trinidad And Tobago'),
	('TUN', 'Tunisia'),
	('TUR', 'Turkey'),
	('TKM', 'Turkmenistan'),
	('TCA', 'Turks And Caicos Islands'),
	('TUV', 'Tuvalu'),
	('UGA', 'Uganda'),
	('UKR', 'Ukraine'),
	('ARE', 'United Arab Emirates'),
	('GBR', 'United Kingdom'),
	('USA', 'United States'),
	('UMI', 'United States Minor Outlying Islands'),
	('URY', 'Uruguay'),
	('UZB', 'Uzbekistan'),
	('VUT', 'Vanuatu'),
	('VEN', 'Venezuela'),
	('VNM', 'Viet Nam'),
	('VGB', 'Virgin Islands, British'),
	('VIR', 'Virgin Islands, U.S.'),
	('WLF', 'Wallis And Futuna'),
	('ESH', 'Western Sahara'),
	('YEM', 'Yemen'),
	('ZMB', 'Zambia'),
	('ZWE', 'Zimbabwe'),
	-- Administrative Codes (Stateless/Refugee)
	('XXC', 'REFUGEE OTHERS'),
	('XXB', 'REFUGEE STATUS'),
	('XXA', 'STATELESS PERSON');
	
-- ------------------------------------------------

/*2. Insertion of Admission Classes to PUBLIC.Admission_Class
	- Classes of admission that will be used for the insertion, calling and validation for a person applying for entry 
	- U.S. Citizens in practice, don't have a class for admission, but for the sake of records creation, the class 'C' will be used for this 
	- Permanent Residents (IsPermanentResidentClass is TRUE) and Citizens, when creating the admission record and I-94 Entry/Departure, dates will be formatted to the MAX, 
	  as they are not required to depart the US and should be indeterminate.  
	- Non-Permanent Residents (Non-citizens/Aliens (is FALSE)) - on the arrival record will have a date to depart, consummate to their GrantDate
*/

INSERT INTO
	PUBLIC."Admission_Class" (
		"ClassCode",
		"ClassDescription",
		"IsPermanentResidentClass"
	)
VALUES
	(
		'A1',
		'Ambassador, Public Minister, Career Diplomatic/Consular Officer',
		FALSE
	),
	(
		'A2',
		'Other Foreign Government Official or Employee',
		FALSE
	),
	('AS', 'Asylee Status Granted', FALSE),
	('B1', 'Business Visitor', FALSE),
	(
		'B2',
		'Tourist Visitor or Medical Treatment',
		FALSE
	),
	(
		'C',
		'Citizen (Used for record identification)',
		FALSE
	),
	('C1', 'Transit Alien', FALSE),
	('D', 'Crewman (Sea or Air)', FALSE),
	('DV', 'Diversity Visa Lottery Immigrant', TRUE),
	('E1', 'Treaty Trader', FALSE),
	('E2', 'Treaty Investor', FALSE),
	(
		'EB1',
		'Employment-Based First Preference (Priority Workers)',
		TRUE
	),
	(
		'EB2',
		'Employment-Based Second Preference (Advanced Degrees)',
		TRUE
	),
	(
		'EB3',
		'Employment-Based Third Preference (Skilled/Other Workers)',
		TRUE
	),
	(
		'EB4',
		'Employment-Based Fourth Preference (Special Immigrants)',
		TRUE
	),
	(
		'EB5',
		'Employment-Based Fifth Preference (Immigrant Investor)',
		TRUE
	),
	('F1', 'Academic Student', FALSE),
	(
		'F2A',
		'Second Preference A - Spouses/Children of Permanent Residents',
		TRUE
	),
	(
		'F3',
		'Third Preference - Married Sons/Daughters of US Citizens',
		TRUE
	),
	(
		'F4',
		'Fourth Preference - Siblings of US Citizens',
		TRUE
	),
	('H1B', 'Specialty Occupation Professional', FALSE),
	(
		'IR1',
		'Immediate Relative - Spouse of US Citizen',
		TRUE
	),
	(
		'IR2',
		'Immediate Relative - Child of US Citizen',
		TRUE
	),
	(
		'IR5',
		'Immediate Relative - Parent of US Citizen',
		TRUE
	),
	('J1', 'Exchange Visitor', FALSE),
	('L1', 'Intracompany Transferee', FALSE),
	('O1', 'Extraordinary Ability', FALSE),
	('PAR', 'Parolee Status', FALSE),
	(
		'PR',
		'Lawful Permanent Resident (General Status)',
		TRUE
	),
	('RF', 'Refugee Status Granted', FALSE),
	('SB', 'Returning Resident', TRUE),
	('TN', 'NAFTA Professional', FALSE),
	('VWP', 'Visa Waiver Program (ESTA)', FALSE);
	
	
-- -----------------------------------------------
/*3. Creating a function to simplify a single admission record
	A Single admission consists of multiple tables being used along with creating new IDs to point to a person and Passport information -
	to sustain an admission record and eventual validation for an I-94 record.  So a proactive function which permits inputting values saves
	all the time possible.  
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

    -----------------------------------
    -- 2. Check for existing Person by Composite Passport ID
    -----------------------------------
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

    -----------------------------------
    -- 3. Insert Flight Record
    -----------------------------------
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

    -----------------------------------
    -- 4. Insert I_94 (Arrival/Departure) Record
    -----------------------------------
    INSERT INTO public."I_94" ("PersonID", "FlightID", "ClassCode", "EntryDate", "Admitted", "ExitDate", "NotAdmittedReason")
    VALUES (v_person_id, v_flight_id, p_admission_class_code, p_arrival_date, p_admitted, p_exit_date, p_not_admitted_reason)
    RETURNING "RecordID" INTO v_i94_record_id;

    -----------------------------------
    -- 5. Insert Person_Admission_Class Record
    -----------------------------------
    INSERT INTO public."Person_Admission_Class" ("PersonID", "ClassCode", "I94RecordID", "GrantDate")
    VALUES (v_person_id, p_admission_class_code, v_i94_record_id, p_arrival_date);

    -- Return the generated IDs
    RETURN QUERY SELECT v_person_id, v_i94_record_id;

END;
$$
LANGUAGE plpgsql;


/*3.1 . Using the Admit_New_Traveler function to input an arrival record - 

SCENARIO 1: John Childs, a British Citizen, is coming to the US as a Visa Waiver Program (VWP/ESTA) holder and will be a tourist in New York.
	He Flew to Newark Airport on BAW (British Airways) Flight 400 from London Heathrow (IATA: LHR), GB (CountryCode: GBR) on 10/30/2025
	Since his prior admission on 05/10/2020, he was convicted of a felony and sentenced to 3 years in prison in the UK. 
	Due to this conviction, when he presented himself for inspection at Newark Airport, he was flagged for secondary screening after noting he had a felony conviction in the UK.
	With this, he was denied entry from the US for a felony conviction, rendering him permanently inadmissible. INA(2)(A)(i), and assigned A-Number A203430239.
	He will be deported on the first flight back to LHR on 10/31/2025.

SCENARIO 2: Sarah Chen is a student coming to the United States to study at New York University.  
	She flew to Newark Airport on UAL Flight 302 from Taipei (IATA: TPE), Taiwan (CountryCode: TWN) on 10/30/2025
	She was admitted with an F1 Visa for the Duration of her program (for the sake of simplicity, it will be 3 years and one month from her expected graduation date) 
	She entered with her Taiwanese Passport, Number: TN5315559
*/
-- SCENARIO 1: 
-- His First Admission on 5/10/2020
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'John',                 -- character varying (e.g., 'NAME')
    p_surname := 'Childs',                    -- character varying (e.g., 'SURNAME')
    p_dob := '1989-06-25',                   -- date (YYYY-MM-DD format)
    p_passport_num := 'GB4897423',           -- character varying(9) (e.g., 'A87654321')
    p_passport_country_code := 'GBR',        -- character(3) (e.g., 'TWN' - Taiwan)
    p_passport_issue_date := '2020-03-15',   -- date (YYYY-MM-DD format)
    p_passport_exp_date := '2030-03-14',     -- date (YYYY-MM-DD format)
    
    p_flight_airline_code := 'JBU',           -- character varying(3) ('BAW')
    p_flight_number := '20',                -- character varying(6) (e.g., '006')
    p_flight_origin_code := 'LGW',           -- character varying(3) (e.g., 'LHR' - Airport Code)
    p_flight_country_code := 'GBR',          -- character(3) (e.g., 'GBR' - Country Code)
    p_arrival_date := '2020-05-10',          -- date (YYYY-MM-DD format)
    
    p_admission_class_code := 'VWP',          -- character varying(4) (e.g., 'VWP' - VISA WAIVER PROG. (ESTA))
    p_admitted := TRUE,                      -- boolean (TRUE or FALSE)
    
    p_a_number := NULL,                      -- character varying(9) or NULL (Removed Aliens will be assigned an A-Number)
    p_exit_date := '2020-06-10',             -- date (YYYY-MM-DD format) or NULL (Expected program end)
    p_not_admitted_reason := NULL            -- character varying(255) or NULL
);
-- SCENARIO 1 (Continued): 
-- His attempted admission in 10/30/2025
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'John',                 -- character varying (e.g., 'NAME')
    p_surname := 'Childs',                    -- character varying (e.g., 'SURNAME')
    p_dob := '1989-06-25',                   -- date (YYYY-MM-DD format)
    p_passport_num := 'GB4897423',           -- character varying(9) (e.g., 'A87654321')
    p_passport_country_code := 'GBR',        -- character(3) (e.g., 'TWN' - Taiwan)
    p_passport_issue_date := '2020-03-15',   -- date (YYYY-MM-DD format)
    p_passport_exp_date := '2030-03-14',     -- date (YYYY-MM-DD format)
    
    p_flight_airline_code := 'BAW',           -- character varying(3) ('BAW')
    p_flight_number := '302',                -- character varying(6) (e.g., '006')
    p_flight_origin_code := 'LHR',           -- character varying(3) (e.g., 'LHR' - Airport Code)
    p_flight_country_code := 'GBR',          -- character(3) (e.g., 'GBR' - Country Code)
    p_arrival_date := '2025-10-30',          -- date (YYYY-MM-DD format)
    
    p_admission_class_code := 'VWP',          -- character varying(4) (e.g., 'VWP' - VISA WAIVER PROG. (ESTA))
    p_admitted := FALSE,                      -- boolean (TRUE or FALSE)
    
    p_a_number := 'A203430239',                      -- character varying(9) or NULL (Removed Aliens will be assigned an A-Number)
    p_exit_date := '2025-10-31',             -- date (YYYY-MM-DD format) or NULL (Expected program end)
    p_not_admitted_reason := 'Inadmissible for crimes of moral terpetude INA(2)(A)(i).  No waiver or visa presented.'            -- character varying(255) or NULL
);

-- SCENARIO 2: 
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Sarah',                 -- character varying (e.g., 'Sarah')
    p_surname := 'Chen',                    -- character varying (e.g., 'Chen')
    p_dob := '2005-03-15',                   -- date (YYYY-MM-DD format)
    p_passport_num := 'TN5315559',           -- character varying(9) (e.g., 'A87654321')
    p_passport_country_code := 'TWN',        -- character(3) (e.g., 'TWN' - Taiwan)
    p_passport_issue_date := '2024-06-01',   -- date (YYYY-MM-DD format)
    p_passport_exp_date := '2034-05-30',     -- date (YYYY-MM-DD format)
    
    p_flight_airline_code := 'UAL',           -- character varying(3) (e.g., 'CI' - China Airlines)
    p_flight_number := '302',                -- character varying(6) (e.g., '006')
    p_flight_origin_code := 'TPE',           -- character varying(3) (e.g., 'TPE' - Airport Code)
    p_flight_country_code := 'TWN',          -- character(3) (e.g., 'TWN' - Country Code)
    p_arrival_date := '2025-10-30',          -- date (YYYY-MM-DD format)
    
    p_admission_class_code := 'F1',          -- character varying(4) (e.g., 'F1' - Academic Student)
    p_admitted := TRUE,                      -- boolean (TRUE or FALSE)
    
    p_a_number := NULL,                      -- character varying(9) or NULL (F1 students usually don't have an A-Number on entry)
    p_exit_date := '2028-06-30',             -- date (YYYY-MM-DD format) or NULL (Expected program end)
    p_not_admitted_reason := NULL            -- character varying(255) or NULL
);


/*
4. Creating a Function to retrieve an I-94 Record 
	The doc will specify and present the case of an I-94 Record and its use in Immigration 
	
	But this function will provide a way for an individual to look up a Persons Departures and Arrivals and most recent I-94 Record via -
	
	Case 1: An individual using their "ANumber", this is useful for:
		- Lawful Permanent Residents ('PR') or individuals assigned A-Numbers to look up their entries to the US
		- Aliens denied entry to the US to look up their assigned A-Number to find their prior entries and reason for denial and removal date.
	
	Case 2: An individual may use their "PassportNumber" AND their "CountryCode" to look up their entries to the US.
		This is useful for:
			- Citizens, who are not assigned A-Numbers, including naturalized citizens who no longer require Alien Registration (A-Number usage)
			- Aliens who are tourists not assigned A-Numbers nor have ever had any interaction with ICE/USCIS/CBP/Consular Services
			- Individuals who are not aware of their A-Number
*/

CREATE OR REPLACE FUNCTION PUBLIC."Lookup_I94_Record" (
	P_PASSPORT_NUM CHARACTER VARYING DEFAULT NULL,
	P_PASSPORT_COUNTRY_CODE CHARACTER(3) DEFAULT NULL,
	P_A_NUMBER CHARACTER VARYING(10) DEFAULT NULL
) RETURNS SETOF PUBLIC."I_94" AS $$
DECLARE
    v_person_id INTEGER;
BEGIN
    -- 1. Check for A-Number lookup (highest priority if provided)
    IF p_a_number IS NOT NULL AND p_a_number != '' THEN
        SELECT "PersonID" INTO v_person_id
        FROM public."Person"
        WHERE "ANumber" = p_a_number;

    -- 2. Check for Composite Passport lookup
    ELSIF p_passport_num IS NOT NULL AND p_passport_country_code IS NOT NULL AND p_passport_num != '' THEN
        SELECT "PersonID" INTO v_person_id
        FROM public."Person"
        WHERE "PassportNumber" = p_passport_num
          AND "PassportCountryCode" = p_passport_country_code;

    -- 3. If neither is provided, raise a notice and return nothing
    ELSE
        RAISE NOTICE 'Must provide either A-Number or Passport Number AND Country Code.';
        RETURN;
    END IF;

    -- 4. If a Person was found, return all their I-94 records
    IF v_person_id IS NOT NULL THEN
        RETURN QUERY
        SELECT *
        FROM public."I_94"
        WHERE "PersonID" = v_person_id
        ORDER BY "EntryDate" DESC; -- Return most recent entry first
    END IF;

END;
$$ LANGUAGE PLPGSQL;

-- -----------------------------------------------
/*
4.1 Using the Lookup_I94_Record to lookup an individuals entries

The First Scenario will use John Child's denial of admission to show his I-94 via his A-Number.
For this scenario this will use Sarah Chen's (3.1)'s admission to show her I-94 via her Passport and CountryCode.

*/
-- SCENARIO 1: Will look up Childs from his A-Number and will show his prior entry to the US, and his recent denial of entry as the top of the descending.
SELECT * FROM public."Lookup_I94_Record"(
    p_a_number := 'A203430239'
);

-- SCENARIO 2: Will look up Chen's from her PassportNumber and CountryCode 

SELECT * FROM public."Lookup_I94_Record"(
    p_passport_num := 'TN5315559',
    p_passport_country_code := 'TWN'
);

-- -----------------------------------------------
/*Logging a Flight and populating the table 

SCENARIO: United Airlines (UAL) Flight 340, from PUNTA CANA (AirportCode PUJ), DR (DOM) has arrived
Passengers of a 120 seat flight have presented themselves for Inspection and Admission to the US at Newark Airport
This flight will include:

70 Citizens (Admission_Class 'C')
15 Returning Permanent Residents (Admission_Class 'PR')
5 Business Visitors (Admission_Class 'B1')
20 Tourists (Admission_Class 'B2')
5 Immigrant Visas Holders (Admission_Class: 'IR1','IR2','IR2','EB1','F3') (For this scenario it will be a family of 3 entering (IR1/IR2) for the first time)
5 Inadmissible Aliens (GrantDate: NULL) 
	- In real life practice the officer will document their reason for inadmissibility ("NotAdmittedReason")
	- Under the Immigration and Nationality Act generally airport arrivals are subject to expedited removal, thus not eligible for claims of status
	- Aliens not admitted will usually be assigned an Alien-Number ("ANumber", A-Number, hereinafter) unless they have had an A-Number assigned prior
	  in previous interactions.  
	- Removed (deported) aliens will be usually have their removal "ExitDate" executed the day of, or day after they are denied entry to the U.S., 
	  generally on the next flight to the origin airport.
*/

-- For the sake of uniqueness in the data (and the ungodly amount of scrolling), 
-- I will go by the Inadmissibles first, then Permanent Residents, Business visitors, Tourists, IV, and citizens (as those are the bulk and not varied).

-- Inadmissibles 

-- 6 Inadmissible Travelers

-- 5 DOM (Dominican Republic) Inadmissible with Sequential A-Numbers
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Ramona', p_surname := 'De La Cruz', p_dob := '1970-07-07',
    p_passport_num := 'D90870123', p_passport_country_code := 'DOM', p_passport_issue_date := '2021-03-01', p_passport_exp_date := '2031-03-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'B2', p_admitted := FALSE, p_a_number := 'A328000001', p_exit_date := '2025-10-01', p_not_admitted_reason := '212(a)(6)(C)(i) - Misrepresentation of admission for immigration'
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jesus', p_surname := 'Alcantara', p_dob := '1995-12-12',
    p_passport_num := 'D56781234', p_passport_country_code := 'DOM', p_passport_issue_date := '2024-05-15', p_passport_exp_date := '2034-05-15',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'B2', p_admitted := FALSE, p_a_number := 'A328000002', p_exit_date := '2025-10-01', p_not_admitted_reason := '212(a)(2)(A)(i)(I) - Prior Crimes involving moral terpetude'
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Marta', p_surname := 'Jimenez', p_dob := '1980-04-20',
    p_passport_num := 'D10543678', p_passport_country_code := 'DOM', p_passport_issue_date := '2020-09-09', p_passport_exp_date := '2030-09-09',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'B1', p_admitted := FALSE, p_a_number := 'A328000003', p_exit_date := '2025-10-01', p_not_admitted_reason := '212(a)(4) - Insufficient Funds, likely to become Public Charge'
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Pedro', p_surname := 'Lopez', p_dob := '1990-01-01',
    p_passport_num := 'D27658901', p_passport_country_code := 'DOM', p_passport_issue_date := '2023-02-28', p_passport_exp_date := '2033-02-28',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'B2', p_admitted := FALSE, p_a_number := 'A328000004', p_exit_date := '2025-10-01', p_not_admitted_reason := '212(a)(6)(C)(i) - Misrepresentation of admission for immigration'
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Teresa', p_surname := 'Rivas', p_dob := '1985-05-10',
    p_passport_num := 'D89012345', p_passport_country_code := 'DOM', p_passport_issue_date := '2022-08-01', p_passport_exp_date := '2032-08-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'B2', p_admitted := FALSE, p_a_number := 'A328000005', p_exit_date := '2025-10-01', p_not_admitted_reason := '212(a)(4) - Insufficient Funds, likely to become Public Charge'
);
-- 1 HTI (Haiti) Inadmissible with Specific A-Number
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Franck', p_surname := 'Dumas', p_dob := '1978-02-02',
    p_passport_num := 'H65432109', p_passport_country_code := 'HTI', p_passport_issue_date := '2020-11-20', p_passport_exp_date := '2030-11-20',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'B2', p_admitted := FALSE, p_a_number := 'A270233991', p_exit_date := '2025-10-01', p_not_admitted_reason := '212(a)(9)(B)(i)(II) - Prior Unlawful Presence'
);

-- Returning Permanent Residents

	-- 8 DOM (Dominican Republic) Passports 
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Alejandro', p_surname := 'Vargas', p_dob := '1985-06-15',
    p_passport_num := 'D10938472', p_passport_country_code := 'DOM', p_passport_issue_date := '2023-03-10', p_passport_exp_date := '2033-03-10',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'PR', p_admitted := TRUE, p_a_number := 'A301859341', p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Sofia', p_surname := 'Tejeda', p_dob := '1978-11-20',
    p_passport_num := 'D45210983', p_passport_country_code := 'DOM', p_passport_issue_date := '2020-07-25', p_passport_exp_date := '2030-07-25',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'PR', p_admitted := TRUE, p_a_number := 'A304210765', p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Rafael', p_surname := 'De Leon', p_dob := '1990-02-08',
    p_passport_num := 'D98765432', p_passport_country_code := 'DOM', p_passport_issue_date := '2024-05-01', p_passport_exp_date := '2034-05-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'PR', p_admitted := TRUE, p_a_number := 'A300678902', p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Carmen', p_surname := 'Almonte', p_dob := '1965-09-01',
    p_passport_num := 'D30125678', p_passport_country_code := 'DOM', p_passport_issue_date := '2019-11-12', p_passport_exp_date := '2029-11-12',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'PR', p_admitted := TRUE, p_a_number := 'A302941583', p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Miguel', p_surname := 'Reyes', p_dob := '1982-04-18',
    p_passport_num := 'D76543210', p_passport_country_code := 'DOM', p_passport_issue_date := '2021-02-28', p_passport_exp_date := '2031-02-28',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'PR', p_admitted := TRUE, p_a_number := 'A303117409', p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Elena', p_surname := 'Batista', p_dob := '1995-12-05',
    p_passport_num := 'D24681357', p_passport_country_code := 'DOM', p_passport_issue_date := '2022-09-01', p_passport_exp_date := '2032-09-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'PR', p_admitted := TRUE, p_a_number := 'A305739268', p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Luis', p_surname := 'Mendez', p_dob := '1970-01-22',
    p_passport_num := 'D13579246', p_passport_country_code := 'DOM', p_passport_issue_date := '2018-10-15', p_passport_exp_date := '2028-10-15',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'PR', p_admitted := TRUE, p_a_number := 'A307008124', p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Ana', p_surname := 'Rosario', p_dob := '1989-07-30',
    p_passport_num := 'D86420975', p_passport_country_code := 'DOM', p_passport_issue_date := '2023-01-05', p_passport_exp_date := '2033-01-05',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'PR', p_admitted := TRUE, p_a_number := 'A309562107', p_exit_date := NULL, p_not_admitted_reason := NULL
);

	-- 2 HAI (Haiti) Passports
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jean-Claude', p_surname := 'Pierre', p_dob := '1975-03-10',
    p_passport_num := 'H60178954', p_passport_country_code := 'HAI', p_passport_issue_date := '2022-04-14', p_passport_exp_date := '2032-04-14',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'PR', p_admitted := TRUE, p_a_number := 'A310893015', p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Marie-Louise', p_surname := 'Charles', p_dob := '1980-08-28',
    p_passport_num := 'H39871265', p_passport_country_code := 'HAI', p_passport_issue_date := '2020-06-03', p_passport_exp_date := '2030-06-03',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'PR', p_admitted := TRUE, p_a_number := 'A312547890', p_exit_date := NULL, p_not_admitted_reason := NULL
);

	-- 3 ECU (Ecuador) Passports
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Carlos', p_surname := 'Benitez', p_dob := '1960-05-09',
    p_passport_num := 'E74521098', p_passport_country_code := 'ECU', p_passport_issue_date := '2019-01-20', p_passport_exp_date := '2029-01-20',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'PR', p_admitted := TRUE, p_a_number := 'A314902136', p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Isabel', p_surname := 'Proano', p_dob := '1998-04-03',
    p_passport_num := 'E02847163', p_passport_country_code := 'ECU', p_passport_issue_date := '2024-11-29', p_passport_exp_date := '2034-11-29',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'PR', p_admitted := TRUE, p_a_number := 'A316358471', p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Mateo', p_surname := 'Rivas', p_dob := '1973-10-12',
    p_passport_num := 'E51039874', p_passport_country_code := 'ECU', p_passport_issue_date := '2021-08-01', p_passport_exp_date := '2031-08-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'PR', p_admitted := TRUE, p_a_number := 'A318720593', p_exit_date := NULL, p_not_admitted_reason := NULL
);

	-- 2 MEX (Mexico) Passports
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Javier', p_surname := 'Solis', p_dob := '1992-01-28',
    p_passport_num := 'M27193845', p_passport_country_code := 'MEX', p_passport_issue_date := '2020-10-07', p_passport_exp_date := '2030-10-07',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'PR', p_admitted := TRUE, p_a_number := 'A320641987', p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Guadalupe', p_surname := 'Flores', p_dob := '1968-03-17',
    p_passport_num := 'M50921476', p_passport_country_code := 'MEX', p_passport_issue_date := '2022-05-19', p_passport_exp_date := '2032-05-19',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'PR', p_admitted := TRUE, p_a_number := 'A322305846', p_exit_date := NULL, p_not_admitted_reason := NULL
);

-- Business Visitors

-- 5 Dominican Business Visitors (Class B1) - DOM Passport Prefix D
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Esteban', p_surname := 'Marte', p_dob := '1975-02-14',
    p_passport_num := 'D20987654', p_passport_country_code := 'DOM', p_passport_issue_date := '2022-04-10', p_passport_exp_date := '2032-04-10',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'B1', p_admitted := TRUE, p_a_number := NULL, p_exit_date := '2025-10-08', p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Vivian', p_surname := 'Castro', p_dob := '1988-06-25',
    p_passport_num := 'D54321098', p_passport_country_code := 'DOM', p_passport_issue_date := '2024-01-01', p_passport_exp_date := '2034-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'B1', p_admitted := TRUE, p_a_number := NULL, p_exit_date := '2025-10-08', p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Fernando', p_surname := 'Velasquez', p_dob := '1965-11-30',
    p_passport_num := 'D10876543', p_passport_country_code := 'DOM', p_passport_issue_date := '2020-09-05', p_passport_exp_date := '2030-09-05',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'B1', p_admitted := TRUE, p_a_number := NULL, p_exit_date := '2025-10-08', p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Rosario', p_surname := 'Pena', p_dob := '1992-03-03',
    p_passport_num := 'D76543210', p_passport_country_code := 'DOM', p_passport_issue_date := '2023-11-20', p_passport_exp_date := '2033-11-20',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'B1', p_admitted := TRUE, p_a_number := NULL, p_exit_date := '2025-10-08', p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Oscar', p_surname := 'Guzman', p_dob := '1981-09-19',
    p_passport_num := 'D32109876', p_passport_country_code := 'DOM', p_passport_issue_date := '2021-07-15', p_passport_exp_date := '2031-07-15',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'B1', p_admitted := TRUE, p_a_number := NULL, p_exit_date := '2025-10-08', p_not_admitted_reason := NULL
);

-- 5 Immigrant Visa Holders (Granting PR Status on Entry)

	-- IR1 (Spouse) - DOM Passport
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Alonso', p_surname := 'Herrera', p_dob := '1980-08-01',
    p_passport_num := 'D45719382', p_passport_country_code := 'DOM', p_passport_issue_date := '2024-06-15', p_passport_exp_date := '2034-06-15',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'IR1', p_admitted := TRUE, p_a_number := 'A323115094', p_exit_date := NULL, p_not_admitted_reason := NULL
);
	-- IR2 (Child) - DOM Passport (Family of 3)
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Sofia', p_surname := 'Herrera', p_dob := '2010-03-20',
    p_passport_num := 'D90128374', p_passport_country_code := 'DOM', p_passport_issue_date := '2024-06-15', p_passport_exp_date := '2034-06-15',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'IR2', p_admitted := TRUE, p_a_number := 'A324567891', p_exit_date := NULL, p_not_admitted_reason := NULL
);
	-- IR2 (Child) - DOM Passport (Family of 3)
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Marcos', p_surname := 'Herrera', p_dob := '2015-11-11',
    p_passport_num := 'D61054928', p_passport_country_code := 'DOM', p_passport_issue_date := '2024-06-15', p_passport_exp_date := '2034-06-15',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'IR2', p_admitted := TRUE, p_a_number := 'A325876540', p_exit_date := NULL, p_not_admitted_reason := NULL
);
	-- EB1 (Priority Worker) - GBR Passport for variety
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Eleanor', p_surname := 'Hughes', p_dob := '1975-04-03',
    p_passport_num := 'G87621095', p_passport_country_code := 'GBR', p_passport_issue_date := '2023-01-20', p_passport_exp_date := '2033-01-20',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'EB1', p_admitted := TRUE, p_a_number := 'A326458921', p_exit_date := NULL, p_not_admitted_reason := NULL
);
	-- F3 (Family Preference) - PHL Passport for variety
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Roberto', p_surname := 'Ramos', p_dob := '1970-12-19',
    p_passport_num := 'P10593748', p_passport_country_code := 'PHL', p_passport_issue_date := '2022-09-10', p_passport_exp_date := '2032-09-10',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'F3', p_admitted := TRUE, p_a_number := 'A327902143', p_exit_date := NULL, p_not_admitted_reason := NULL
);
-- tourists
	-- 13 DOM (Dominican Republic) B2 Tourists - Prefix D (Corrected)
SELECT * FROM public."Admit_New_Traveler"(p_given_name := 'Juan', p_surname := 'Gomez', p_dob := '1991-03-05', p_passport_num := 'D11223344', p_passport_country_code := 'DOM', p_passport_issue_date := '2023-08-01', p_passport_exp_date := '2033-08-01', p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01', p_admission_class_code := 'B2', p_admitted := TRUE, p_a_number := NULL, p_exit_date := '2025-10-28', p_not_admitted_reason := NULL);
SELECT * FROM public."Admit_New_Traveler"(p_given_name := 'Maria', p_surname := 'Perez', p_dob := '1987-11-21', p_passport_num := 'D55667788', p_passport_country_code := 'DOM', p_passport_issue_date := '2021-04-10', p_passport_exp_date := '2031-04-10', p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01', p_admission_class_code := 'B2', p_admitted := TRUE, p_a_number := NULL, p_exit_date := '2025-10-28', p_not_admitted_reason := NULL);
SELECT * FROM public."Admit_New_Traveler"(p_given_name := 'Antonio', p_surname := 'Cruz', p_dob := '1975-02-14', p_passport_num := 'D99001122', p_passport_country_code := 'DOM', p_passport_issue_date := '2022-01-05', p_passport_exp_date := '2032-01-05', p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01', p_admission_class_code := 'B2', p_admitted := TRUE, p_a_number := NULL, p_exit_date := '2025-10-28', p_not_admitted_reason := NULL);
SELECT * FROM public."Admit_New_Traveler"(p_given_name := 'Laura', p_surname := 'Nunez', p_dob := '1995-07-07', p_passport_num := 'D33445566', p_passport_country_code := 'DOM', p_passport_issue_date := '2024-02-20', p_passport_exp_date := '2034-02-20', p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01', p_admission_class_code := 'B2', p_admitted := TRUE, p_a_number := NULL, p_exit_date := '2025-10-28', p_not_admitted_reason := NULL);
SELECT * FROM public."Admit_New_Traveler"(p_given_name := 'Jose', p_surname := 'Santana', p_dob := '1980-08-10', p_passport_num := 'D77889900', p_passport_country_code := 'DOM', p_passport_issue_date := '2020-05-15', p_passport_exp_date := '2030-05-15', p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01', p_admission_class_code := 'B2', p_admitted := TRUE, p_a_number := NULL, p_exit_date := '2025-10-28', p_not_admitted_reason := NULL);
SELECT * FROM public."Admit_New_Traveler"(p_given_name := 'Patricia', p_surname := 'Rodriguez', p_dob := '1972-12-01', p_passport_num := 'D00112233', p_passport_country_code := 'DOM', p_passport_issue_date := '2019-09-01', p_passport_exp_date := '2029-09-01', p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01', p_admission_class_code := 'B2', p_admitted := TRUE, p_a_number := NULL, p_exit_date := '2025-10-28', p_not_admitted_reason := NULL);
SELECT * FROM public."Admit_New_Traveler"(p_given_name := 'Daniel', p_surname := 'Gil', p_dob := '1984-06-25', p_passport_num := 'D44556677', p_passport_country_code := 'DOM', p_passport_issue_date := '2023-03-30', p_passport_exp_date := '2033-03-30', p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01', p_admission_class_code := 'B2', p_admitted := TRUE, p_a_number := NULL, p_exit_date := '2025-10-28', p_not_admitted_reason := NULL);
SELECT * FROM public."Admit_New_Traveler"(p_given_name := 'Gabriela', p_surname := 'Pena', p_dob := '1999-01-15', p_passport_num := 'D88990011', p_passport_country_code := 'DOM', p_passport_issue_date := '2024-01-01', p_passport_exp_date := '2034-01-01', p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01', p_admission_class_code := 'B2', p_admitted := TRUE, p_a_number := NULL, p_exit_date := '2025-10-28', p_not_admitted_reason := NULL);
SELECT * FROM public."Admit_New_Traveler"(p_given_name := 'Carlos', p_surname := 'Acosta', p_dob := '1960-10-20', p_passport_num := 'D11335577', p_passport_country_code := 'DOM', p_passport_issue_date := '2020-08-18', p_passport_exp_date := '2030-08-18', p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01', p_admission_class_code := 'B2', p_admitted := TRUE, p_a_number := NULL, p_exit_date := '2025-10-28', p_not_admitted_reason := NULL);
SELECT * FROM public."Admit_New_Traveler"(p_given_name := 'Emilia', p_surname := 'Liranzo', p_dob := '1981-04-04', p_passport_num := 'D22446688', p_passport_country_code := 'DOM', p_passport_issue_date := '2023-06-15', p_passport_exp_date := '2033-06-15', p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01', p_admission_class_code := 'B2', p_admitted := TRUE, p_a_number := NULL, p_exit_date := '2025-10-28', p_not_admitted_reason := NULL);
SELECT * FROM public."Admit_New_Traveler"(p_given_name := 'Hector', p_surname := 'Frias', p_dob := '1977-09-09', p_passport_num := 'D66880022', p_passport_country_code := 'DOM', p_passport_issue_date := '2021-12-01', p_passport_exp_date := '2031-12-01', p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01', p_admission_class_code := 'B2', p_admitted := TRUE, p_a_number := NULL, p_exit_date := '2025-10-28', p_not_admitted_reason := NULL);
SELECT * FROM public."Admit_New_Traveler"(p_given_name := 'Luisa', p_surname := 'Velez', p_dob := '1990-05-27', p_passport_num := 'D00224466', p_passport_country_code := 'DOM', p_passport_issue_date := '2024-05-10', p_passport_exp_date := '2034-05-10', p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01', p_admission_class_code := 'B2', p_admitted := TRUE, p_a_number := NULL, p_exit_date := '2025-10-28', p_not_admitted_reason := NULL);
SELECT * FROM public."Admit_New_Traveler"(p_given_name := 'Ricardo', p_surname := 'Reyes', p_dob := '1986-03-03', p_passport_num := 'D77991133', p_passport_country_code := 'DOM', p_passport_issue_date := '2022-07-22', p_passport_exp_date := '2032-07-22', p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01', p_admission_class_code := 'B2', p_admitted := TRUE, p_a_number := NULL, p_exit_date := '2025-10-28', p_not_admitted_reason := NULL);

	-- 3 CAN (Canada) VWP Travelers - Prefix C
SELECT * FROM public."Admit_New_Traveler"(p_given_name := 'David', p_surname := 'Campbell', p_dob := '1983-04-12', p_passport_num := 'C40102938', p_passport_country_code := 'CAN', p_passport_issue_date := '2023-01-01', p_passport_exp_date := '2033-01-01', p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01', p_admission_class_code := 'VWP', p_admitted := TRUE, p_a_number := NULL, p_exit_date := '2026-03-29', p_not_admitted_reason := NULL);
SELECT * FROM public."Admit_New_Traveler"(p_given_name := 'Jennifer', p_surname := 'Lee', p_dob := '1997-06-30', p_passport_num := 'C67584930', p_passport_country_code := 'CAN', p_passport_issue_date := '2020-03-20', p_passport_exp_date := '2030-03-20', p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01', p_admission_class_code := 'VWP', p_admitted := TRUE, p_a_number := NULL, p_exit_date := '2026-03-29', p_not_admitted_reason := NULL);
SELECT * FROM public."Admit_New_Traveler"(p_given_name := 'Michael', p_surname := 'Chen', p_dob := '1970-11-11', p_passport_num := 'C19283746', p_passport_country_code := 'CAN', p_passport_issue_date := '2019-10-10', p_passport_exp_date := '2029-10-10', p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01', p_admission_class_code := 'VWP', p_admitted := TRUE, p_a_number := NULL, p_exit_date := '2026-03-29', p_not_admitted_reason := NULL);

	-- 4 MEX (Mexico) B2 Tourists - Prefix B (Retained 'B' prefix to provide variety, as 'M' is used for PRs)
SELECT * FROM public."Admit_New_Traveler"(p_given_name := 'Sofia', p_surname := 'Hernandez', p_dob := '1988-02-09', p_passport_num := 'B91028374', p_passport_country_code := 'MEX', p_passport_issue_date := '2021-06-05', p_passport_exp_date := '2031-06-05', p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01', p_admission_class_code := 'B2', p_admitted := TRUE, p_a_number := NULL, p_exit_date := '2025-10-28', p_not_admitted_reason := NULL);
SELECT * FROM public."Admit_New_Traveler"(p_given_name := 'Andres', p_surname := 'Lopez', p_dob := '1974-05-20', p_passport_num := 'B53748291', p_passport_country_code := 'MEX', p_passport_issue_date := '2023-11-15', p_passport_exp_date := '2033-11-15', p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01', p_admission_class_code := 'B2', p_admitted := TRUE, p_a_number := NULL, p_exit_date := '2025-10-28', p_not_admitted_reason := NULL);
SELECT * FROM public."Admit_New_Traveler"(p_given_name := 'Luz', p_surname := 'Garcia', p_dob := '1994-08-08', p_passport_num := 'B28471936', p_passport_country_code := 'MEX', p_passport_issue_date := '2024-03-01', p_passport_exp_date := '2034-03-01', p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01', p_admission_class_code := 'B2', p_admitted := TRUE, p_a_number := NULL, p_exit_date := '2025-10-28', p_not_admitted_reason := NULL);
SELECT * FROM public."Admit_New_Traveler"(p_given_name := 'Fernando', p_surname := 'Serrano', p_dob := '1965-01-24', p_passport_num := 'B70364918', p_passport_country_code := 'MEX', p_passport_issue_date := '2020-09-20', p_passport_exp_date := '2030-09-20', p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01', p_admission_class_code := 'B2', p_admitted := TRUE, p_a_number := NULL, p_exit_date := '2025-10-28', p_not_admitted_reason := NULL);
-- Immigrant Visas



-- US citizens

SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Michael', p_surname := 'Smith', p_dob := '1975-04-12',
    p_passport_num := 'A83742915', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Christopher', p_surname := 'Johnson', p_dob := '1962-11-20',
    p_passport_num := 'A19385627', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jessica', p_surname := 'Williams', p_dob := '1988-08-05',
    p_passport_num := 'A62840193', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Matthew', p_surname := 'Jones', p_dob := '1995-03-29',
    p_passport_num := 'A47302186', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Ashley', p_surname := 'Brown', p_dob := '1970-01-15',
    p_passport_num := 'A91648370', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jennifer', p_surname := 'Davis', p_dob := '1983-06-03',
    p_passport_num := 'A04572918', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Joshua', p_surname := 'Miller', p_dob := '1990-09-17',
    p_passport_num := 'A73910542', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Amanda', p_surname := 'Wilson', p_dob := '1967-02-28',
    p_passport_num := 'A28503719', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Daniel', p_surname := 'Moore', p_dob := '1985-12-10',
    p_passport_num := 'A56172043', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'David', p_surname := 'Taylor', p_dob := '1959-07-22',
    p_passport_num := 'A09483751', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'James', p_surname := 'Anderson', p_dob := '1978-05-01',
    p_passport_num := 'A38105629', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Robert', p_surname := 'Thomas', p_dob := '1955-10-18',
    p_passport_num := 'A74291830', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'John', p_surname := 'Jackson', p_dob := '1998-04-25',
    p_passport_num := 'A20546913', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Joseph', p_surname := 'White', p_dob := '1969-08-11',
    p_passport_num := 'A83917462', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Andrew', p_surname := 'Harris', p_dob := '1980-01-07',
    p_passport_num := 'A57204913', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Ryan', p_surname := 'Martin', p_dob := '1992-11-03',
    p_passport_num := 'A91836475', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Brandon', p_surname := 'Thompson', p_dob := '1965-06-19',
    p_passport_num := 'A04729183', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jason', p_surname := 'Garcia', p_dob := '1987-03-24',
    p_passport_num := 'A61839502', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Justin', p_surname := 'Martinez', p_dob := '1999-12-08',
    p_passport_num := 'A94720183', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Sarah', p_surname := 'Robinson', p_dob := '1973-10-31',
    p_passport_num := 'A35017294', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'William', p_surname := 'Clark', p_dob := '1958-09-02',
    p_passport_num := 'A71936485', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jonathan', p_surname := 'Rodriguez', p_dob := '1982-05-14',
    p_passport_num := 'A48205719', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Nicole', p_surname := 'Lewis', p_dob := '1994-07-27',
    p_passport_num := 'A10395726', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Kenneth', p_surname := 'Lee', p_dob := '1961-02-09',
    p_passport_num := 'A62749103', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Hannah', p_surname := 'Walker', p_dob := '1976-12-16',
    p_passport_num := 'A49301825', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Samantha', p_surname := 'Hall', p_dob := '1989-03-08',
    p_passport_num := 'A80572914', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Tyler', p_surname := 'Allen', p_dob := '1952-07-13',
    p_passport_num := 'A23910547', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Elizabeth', p_surname := 'Young', p_dob := '1997-01-04',
    p_passport_num := 'A95037182', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Adam', p_surname := 'Hernandez', p_dob := '1968-11-21',
    p_passport_num := 'A61048392', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Zachary', p_surname := 'King', p_dob := '1986-08-18',
    p_passport_num := 'A40275813', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Kevin', p_surname := 'Wright', p_dob := '1971-05-15',
    p_passport_num := 'A73918250', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Dennis', p_surname := 'Lopez', p_dob := '1993-02-27',
    p_passport_num := 'A05829173', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Cheryl', p_surname := 'Hill', p_dob := '1966-09-06',
    p_passport_num := 'A41730952', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Maria', p_surname := 'Scott', p_dob := '1981-04-19',
    p_passport_num := 'A92850371', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Larry', p_surname := 'Green', p_dob := '1954-10-25',
    p_passport_num := 'A60482915', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jeffrey', p_surname := 'Adams', p_dob := '1996-01-09',
    p_passport_num := 'A37194628', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Frank', p_surname := 'Baker', p_dob := '1979-08-30',
    p_passport_num := 'A91547038', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Scott', p_surname := 'Nelson', p_dob := '1964-03-12',
    p_passport_num := 'A28391745', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Eric', p_surname := 'Carter', p_dob := '1984-12-23',
    p_passport_num := 'A75029136', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Stephen', p_surname := 'Mitchell', p_dob := '1957-07-06',
    p_passport_num := 'A09374521', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Benjamin', p_surname := 'Perez', p_dob := '1991-02-17',
    p_passport_num := 'A54820193', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Raymond', p_surname := 'Roberts', p_dob := '1963-09-01',
    p_passport_num := 'A83719460', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Gregory', p_surname := 'Turner', p_dob := '1977-04-04',
    p_passport_num := 'A20546918', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Patrick', p_surname := 'Phillips', p_dob := '1995-12-19',
    p_passport_num := 'A61839504', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Alexander', p_surname := 'Campbell', p_dob := '1950-06-25',
    p_passport_num := 'A94720185', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Mark', p_surname := 'Parker', p_dob := '1988-01-03',
    p_passport_num := 'A35017296', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Paul', p_surname := 'Evans', p_dob := '1960-08-16',
    p_passport_num := 'A71936487', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'George', p_surname := 'Edwards', p_dob := '1974-05-28',
    p_passport_num := 'A48205710', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Timothy', p_surname := 'Collins', p_dob := '1997-02-11',
    p_passport_num := 'A10395728', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jack', p_surname := 'Stewart', p_dob := '1966-10-04',
    p_passport_num := 'A62749105', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Kathleen', p_surname := 'Sanchez', p_dob := '1981-03-17',
    p_passport_num := 'A49301827', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Pamela', p_surname := 'Morris', p_dob := '1955-12-30',
    p_passport_num := 'A80572916', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Virginia', p_surname := 'Rogers', p_dob := '1993-06-22',
    p_passport_num := 'A23910549', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Richard', p_surname := 'Reed', p_dob := '1967-01-05',
    p_passport_num := 'A95037184', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Lisa', p_surname := 'Cook', p_dob := '1984-11-18',
    p_passport_num := 'A61048394', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Helen', p_surname := 'Morgan', p_dob := '1959-04-02',
    p_passport_num := 'A40275815', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Betty', p_surname := 'Bell', p_dob := '1972-10-14',
    p_passport_num := 'A73918252', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Sandra', p_surname := 'Murphy', p_dob := '1990-07-26',
    p_passport_num := 'A05829175', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Donna', p_surname := 'Bailey', p_dob := '1953-04-09',
    p_passport_num := 'A41730954', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Carol', p_surname := 'Cooper', p_dob := '1985-01-21',
    p_passport_num := 'A92850373', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Ruth', p_surname := 'Howard', p_dob := '1970-11-03',
    p_passport_num := 'A60482917', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Sharon', p_surname := 'Ward', p_dob := '1998-08-15',
    p_passport_num := 'A37194630', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Michelle', p_surname := 'Cox', p_dob := '1965-03-27',
    p_passport_num := 'A91547040', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Laura', p_surname := 'Flores', p_dob := '1979-12-10',
    p_passport_num := 'A28391747', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Cynthia', p_surname := 'Kelly', p_dob := '1992-07-01',
    p_passport_num := 'A75029138', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Angela', p_surname := 'Price', p_dob := '1957-01-14',
    p_passport_num := 'A09374523', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Melissa', p_surname := 'Barnes', p_dob := '1989-10-26',
    p_passport_num := 'A54820195', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Rebecca', p_surname := 'Ross', p_dob := '1963-05-08',
    p_passport_num := 'A83719462', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Stephanie', p_surname := 'Henderson', p_dob := '1977-02-20',
    p_passport_num := 'A20546920', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Kimberly', p_surname := 'Coleman', p_dob := '1995-09-03',
    p_passport_num := 'A61839506', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Eric', p_surname := 'Kelly', p_dob := '1951-06-15',
    p_passport_num := 'A80145293', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Lisa', p_surname := 'Green', p_dob := '1968-02-07',
    p_passport_num := 'A34920158', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Mark', p_surname := 'Howard', p_dob := '1999-09-30',
    p_passport_num := 'A71563820', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Sarah', p_surname := 'Nelson', p_dob := '1956-04-23',
    p_passport_num := 'A04829173', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Kevin', p_surname := 'Perez', p_dob := '1983-11-09',
    p_passport_num := 'A49173056', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Justin', p_surname := 'Miller', p_dob := '1970-07-02',
    p_passport_num := 'A92501837', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jennifer', p_surname := 'Thomas', p_dob := '1996-02-15',
    p_passport_num := 'A68374921', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'James', p_surname := 'White', p_dob := '1953-09-28',
    p_passport_num := 'A10546283', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'David', p_surname := 'Jackson', p_dob := '1980-04-11',
    p_passport_num := 'A57291048', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Daniel', p_surname := 'Harris', p_dob := '1998-12-04',
    p_passport_num := 'A94683715', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Amanda', p_surname := 'Martin', p_dob := '1965-06-17',
    p_passport_num := 'A31852940', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Joshua', p_surname := 'Thompson', p_dob := '1973-03-29',
    p_passport_num := 'A76049183', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Ashley', p_surname := 'Garcia', p_dob := '1991-10-22',
    p_passport_num := 'A28391745', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Matthew', p_surname := 'Martinez', p_dob := '1960-05-05',
    p_passport_num := 'A61048392', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jessica', p_surname := 'Robinson', p_dob := '1987-01-18',
    p_passport_num := 'A95037184', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Christopher', p_surname := 'Clark', p_dob := '1995-08-31',
    p_passport_num := 'A40275815', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Michael', p_surname := 'Rodriguez', p_dob := '1972-03-14',
    p_passport_num := 'A73918252', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Elizabeth', p_surname := 'Lewis', p_dob := '1950-10-27',
    p_passport_num := 'A05829175', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Tyler', p_surname := 'Lee', p_dob := '1993-05-10',
    p_passport_num := 'A41730954', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Samantha', p_surname := 'Walker', p_dob := '1961-12-03',
    p_passport_num := 'A92850373', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Hannah', p_surname := 'Hall', p_dob := '1988-06-25',
    p_passport_num := 'A60482917', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Kenneth', p_surname := 'Allen', p_dob := '1976-02-08',
    p_passport_num := 'A37194630', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Nicole', p_surname := 'Young', p_dob := '1994-09-20',
    p_passport_num := 'A91547040', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jonathan', p_surname := 'Hernandez', p_dob := '1963-04-03',
    p_passport_num := 'A28391747', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'William', p_surname := 'King', p_dob := '1982-11-16',
    p_passport_num := 'A75029138', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Sarah', p_surname := 'Wright', p_dob := '1999-06-28',
    p_passport_num := 'A09374523', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Justin', p_surname := 'Lopez', p_dob := '1973-01-11',
    p_passport_num := 'A54820195', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jason', p_surname := 'Hill', p_dob := '1958-08-24',
    p_passport_num := 'A83719462', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Brandon', p_surname := 'Scott', p_dob := '1980-03-07',
    p_passport_num := 'A20546920', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Ryan', p_surname := 'Green', p_dob := '1997-10-19',
    p_passport_num := 'A61839506', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Andrew', p_surname := 'Adams', p_dob := '1965-05-02',
    p_passport_num := 'A94720185', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Joseph', p_surname := 'Baker', p_dob := '1983-12-15',
    p_passport_num := 'A35017296', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'John', p_surname := 'Nelson', p_dob := '1950-06-28',
    p_passport_num := 'A71936487', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Robert', p_surname := 'Carter', p_dob := '1978-01-20',
    p_passport_num := 'A48205710', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'James', p_surname := 'Mitchell', p_dob := '1955-08-03',
    p_passport_num := 'A10395728', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'David', p_surname := 'Perez', p_dob := '1994-03-16',
    p_passport_num := 'A62749105', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Daniel', p_surname := 'Roberts', p_dob := '1961-10-29',
    p_passport_num := 'A49301827', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Amanda', p_surname := 'Turner', p_dob := '1976-05-12',
    p_passport_num := 'A80572916', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Joshua', p_surname := 'Phillips', p_dob := '1989-12-25',
    p_passport_num := 'A23910549', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Ashley', p_surname := 'Campbell', p_dob := '1952-06-08',
    p_passport_num := 'A95037184', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Matthew', p_surname := 'Parker', p_dob := '1997-01-21',
    p_passport_num := 'A61048394', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jessica', p_surname := 'Evans', p_dob := '1968-08-04',
    p_passport_num := 'A40275815', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Christopher', p_surname := 'Edwards', p_dob := '1986-02-17',
    p_passport_num := 'A73918252', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Michael', p_surname := 'Collins', p_dob := '1971-09-30',
    p_passport_num := 'A05829175', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Elizabeth', p_surname := 'Stewart', p_dob := '1993-04-13',
    p_passport_num := 'A41730954', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Tyler', p_surname := 'Sanchez', p_dob := '1966-11-26',
    p_passport_num := 'A92850373', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Samantha', p_surname := 'Morris', p_dob := '1981-06-09',
    p_passport_num := 'A60482917', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Hannah', p_surname := 'Rogers', p_dob := '1954-01-22',
    p_passport_num := 'A37194630', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Kenneth', p_surname := 'Reed', p_dob := '1998-08-05',
    p_passport_num := 'A91547040', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Nicole', p_surname := 'Cook', p_dob := '1965-03-29',
    p_passport_num := 'A28391747', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jonathan', p_surname := 'Morgan', p_dob := '1979-12-12',
    p_passport_num := 'A75029138', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'William', p_surname := 'Bell', p_dob := '1992-07-03',
    p_passport_num := 'A09374523', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Sarah', p_surname := 'Murphy', p_dob := '1957-01-16',
    p_passport_num := 'A54820195', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Justin', p_surname := 'Bailey', p_dob := '1989-10-28',
    p_passport_num := 'A83719462', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jason', p_surname := 'Cooper', p_dob := '1963-05-10',
    p_passport_num := 'A20546920', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Brandon', p_surname := 'Howard', p_dob := '1977-02-22',
    p_passport_num := 'A61839506', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Ryan', p_surname := 'Ward', p_dob := '1995-09-05',
    p_passport_num := 'A94720185', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Andrew', p_surname := 'Cox', p_dob := '1950-06-30',
    p_passport_num := 'A35017296', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Joseph', p_surname := 'Flores', p_dob := '1978-01-22',
    p_passport_num := 'A71936487', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'John', p_surname := 'Kelly', p_dob := '1955-08-05',
    p_passport_num := 'A48205710', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Robert', p_surname := 'Price', p_dob := '1994-03-18',
    p_passport_num := 'A10395728', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'James', p_surname := 'Barnes', p_dob := '1961-10-31',
    p_passport_num := 'A62749105', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'David', p_surname := 'Ross', p_dob := '1976-05-14',
    p_passport_num := 'A49301827', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Daniel', p_surname := 'Henderson', p_dob := '1989-12-27',
    p_passport_num := 'A80572916', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Amanda', p_surname := 'Coleman', p_dob := '1952-06-10',
    p_passport_num := 'A23910549', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Joshua', p_surname := 'Johnson', p_dob := '1997-01-23',
    p_passport_num := 'A95037184', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Ashley', p_surname := 'Smith', p_dob := '1968-08-06',
    p_passport_num := 'A61048394', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Matthew', p_surname := 'Williams', p_dob := '1986-02-19',
    p_passport_num := 'A40275815', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jessica', p_surname := 'Jones', p_dob := '1971-10-02',
    p_passport_num := 'A73918252', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Christopher', p_surname := 'Brown', p_dob := '1993-04-15',
    p_passport_num := 'A05829175', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Michael', p_surname := 'Davis', p_dob := '1966-11-28',
    p_passport_num := 'A41730954', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Elizabeth', p_surname := 'Miller', p_dob := '1981-06-11',
    p_passport_num := 'A92850373', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Tyler', p_surname := 'Wilson', p_dob := '1954-01-24',
    p_passport_num := 'A60482917', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Samantha', p_surname := 'Moore', p_dob := '1998-08-07',
    p_passport_num := 'A37194630', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Hannah', p_surname := 'Taylor', p_dob := '1965-03-31',
    p_passport_num := 'A91547040', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Kenneth', p_surname := 'Anderson', p_dob := '1979-12-14',
    p_passport_num := 'A28391747', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Nicole', p_surname := 'Thomas', p_dob := '1992-07-05',
    p_passport_num := 'A75029138', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jonathan', p_surname := 'Jackson', p_dob := '1957-01-18',
    p_passport_num := 'A09374523', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'William', p_surname := 'White', p_dob := '1989-10-30',
    p_passport_num := 'A54820195', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Sarah', p_surname := 'Harris', p_dob := '1963-05-12',
    p_passport_num := 'A83719462', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Justin', p_surname := 'Martin', p_dob := '1977-02-24',
    p_passport_num := 'A20546920', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jason', p_surname := 'Thompson', p_dob := '1995-09-07',
    p_passport_num := 'A61839506', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Brandon', p_surname := 'Garcia', p_dob := '1950-07-02',
    p_passport_num := 'A94720185', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Ryan', p_surname := 'Martinez', p_dob := '1978-01-24',
    p_passport_num := 'A35017296', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Andrew', p_surname := 'Robinson', p_dob := '1955-08-07',
    p_passport_num := 'A71936487', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Joseph', p_surname := 'Clark', p_dob := '1994-03-20',
    p_passport_num := 'A48205710', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'John', p_surname := 'Rodriguez', p_dob := '1961-11-02',
    p_passport_num := 'A10395728', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Robert', p_surname := 'Lewis', p_dob := '1976-05-16',
    p_passport_num := 'A62749105', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'James', p_surname := 'Lee', p_dob := '1989-12-29',
    p_passport_num := 'A49301827', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'David', p_surname := 'Walker', p_dob := '1952-06-12',
    p_passport_num := 'A80572916', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Daniel', p_surname := 'Hall', p_dob := '1997-01-25',
    p_passport_num := 'A23910549', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Amanda', p_surname := 'Allen', p_dob := '1968-08-08',
    p_passport_num := 'A95037184', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Joshua', p_surname := 'Young', p_dob := '1986-02-21',
    p_passport_num := 'A61048394', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Ashley', p_surname := 'Hernandez', p_dob := '1971-10-04',
    p_passport_num := 'A40275815', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Matthew', p_surname := 'King', p_dob := '1993-04-17',
    p_passport_num := 'A73918252', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jessica', p_surname := 'Wright', p_dob := '1966-12-01',
    p_passport_num := 'A05829175', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Christopher', p_surname := 'Lopez', p_dob := '1981-06-13',
    p_passport_num := 'A41730954', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Michael', p_surname := 'Hill', p_dob := '1954-01-26',
    p_passport_num := 'A92850373', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Elizabeth', p_surname := 'Scott', p_dob := '1998-08-09',
    p_passport_num := 'A60482917', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Tyler', p_surname := 'Green', p_dob := '1965-04-02',
    p_passport_num := 'A37194630', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Samantha', p_surname := 'Adams', p_dob := '1979-12-16',
    p_passport_num := 'A91547040', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Hannah', p_surname := 'Baker', p_dob := '1992-07-07',
    p_passport_num := 'A28391747', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Kenneth', p_surname := 'Nelson', p_dob := '1957-01-20',
    p_passport_num := 'A75029138', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Nicole', p_surname := 'Carter', p_dob := '1989-11-01',
    p_passport_num := 'A09374523', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jonathan', p_surname := 'Mitchell', p_dob := '1963-05-14',
    p_passport_num := 'A54820195', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'William', p_surname := 'Perez', p_dob := '1977-02-26',
    p_passport_num := 'A83719462', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Sarah', p_surname := 'Roberts', p_dob := '1995-09-09',
    p_passport_num := 'A20546920', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Justin', p_surname := 'Turner', p_dob := '1950-07-04',
    p_passport_num := 'A61839506', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jason', p_surname := 'Phillips', p_dob := '1978-01-26',
    p_passport_num := 'A94720185', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Brandon', p_surname := 'Campbell', p_dob := '1955-08-09',
    p_passport_num := 'A35017296', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Ryan', p_surname := 'Parker', p_dob := '1994-03-22',
    p_passport_num := 'A71936487', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Andrew', p_surname := 'Evans', p_dob := '1961-11-04',
    p_passport_num := 'A48205710', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Joseph', p_surname := 'Edwards', p_dob := '1976-05-18',
    p_passport_num := 'A10395728', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'John', p_surname := 'Collins', p_dob := '1989-12-31',
    p_passport_num := 'A62749105', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Robert', p_surname := 'Stewart', p_dob := '1952-06-14',
    p_passport_num := 'A49301827', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'James', p_surname := 'Sanchez', p_dob := '1997-01-27',
    p_passport_num := 'A80572916', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'David', p_surname := 'Morris', p_dob := '1968-08-10',
    p_passport_num := 'A23910549', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Daniel', p_surname := 'Rogers', p_dob := '1986-02-23',
    p_passport_num := 'A95037184', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Amanda', p_surname := 'Reed', p_dob := '1971-10-06',
    p_passport_num := 'A61048394', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Joshua', p_surname := 'Cook', p_dob := '1993-04-19',
    p_passport_num := 'A40275815', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Ashley', p_surname := 'Morgan', p_dob := '1966-12-03',
    p_passport_num := 'A73918252', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Matthew', p_surname := 'Bell', p_dob := '1981-06-15',
    p_passport_num := 'A05829175', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jessica', p_surname := 'Murphy', p_dob := '1954-01-28',
    p_passport_num := 'A41730954', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Christopher', p_surname := 'Bailey', p_dob := '1998-08-11',
    p_passport_num := 'A92850373', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Michael', p_surname := 'Cooper', p_dob := '1965-04-04',
    p_passport_num := 'A60482917', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Elizabeth', p_surname := 'Howard', p_dob := '1979-12-18',
    p_passport_num := 'A37194630', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Tyler', p_surname := 'Ward', p_dob := '1992-07-09',
    p_passport_num := 'A91547040', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Samantha', p_surname := 'Cox', p_dob := '1957-01-22',
    p_passport_num := 'A28391747', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Hannah', p_surname := 'Flores', p_dob := '1989-11-03',
    p_passport_num := 'A75029138', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Kenneth', p_surname := 'Kelly', p_dob := '1963-05-16',
    p_passport_num := 'A09374523', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Nicole', p_surname := 'Price', p_dob := '1977-03-01',
    p_passport_num := 'A54820195', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jonathan', p_surname := 'Barnes', p_dob := '1995-09-11',
    p_passport_num := 'A83719462', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'William', p_surname := 'Ross', p_dob := '1950-07-06',
    p_passport_num := 'A20546920', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Sarah', p_surname := 'Henderson', p_dob := '1978-01-28',
    p_passport_num := 'A61839506', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Justin', p_surname := 'Coleman', p_dob := '1955-08-11',
    p_passport_num := 'A94720185', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jason', p_surname := 'Anderson', p_dob := '1994-03-24',
    p_passport_num := 'A35017296', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Brandon', p_surname := 'Thomas', p_dob := '1961-11-06',
    p_passport_num := 'A71936487', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Ryan', p_surname := 'Jackson', p_dob := '1976-05-20',
    p_passport_num := 'A48205710', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Andrew', p_surname := 'White', p_dob := '1989-12-07',
    p_passport_num := 'A10395728', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Joseph', p_surname := 'Harris', p_dob := '1952-06-16',
    p_passport_num := 'A62749105', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'John', p_surname := 'Martin', p_dob := '1997-01-29',
    p_passport_num := 'A49301827', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Robert', p_surname := 'Thompson', p_dob := '1968-08-12',
    p_passport_num := 'A80572916', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'James', p_surname := 'Garcia', p_dob := '1986-02-25',
    p_passport_num := 'A23910549', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'David', p_surname := 'Martinez', p_dob := '1971-10-08',
    p_passport_num := 'A95037184', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Daniel', p_surname := 'Robinson', p_dob := '1993-04-21',
    p_passport_num := 'A61048394', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Amanda', p_surname := 'Clark', p_dob := '1966-12-05',
    p_passport_num := 'A40275815', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Joshua', p_surname := 'Rodriguez', p_dob := '1981-06-17',
    p_passport_num := 'A73918252', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Ashley', p_surname := 'Lewis', p_dob := '1954-01-30',
    p_passport_num := 'A05829175', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Matthew', p_surname := 'Lee', p_dob := '1998-08-13',
    p_passport_num := 'A41730954', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jessica', p_surname := 'Walker', p_dob := '1965-04-06',
    p_passport_num := 'A92850373', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Christopher', p_surname := 'Hall', p_dob := '1979-12-20',
    p_passport_num := 'A60482917', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Michael', p_surname := 'Allen', p_dob := '1992-07-11',
    p_passport_num := 'A37194630', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Elizabeth', p_surname := 'Young', p_dob := '1957-01-24',
    p_passport_num := 'A91547040', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Tyler', p_surname := 'Hernandez', p_dob := '1989-11-05',
    p_passport_num := 'A28391747', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Samantha', p_surname := 'King', p_dob := '1963-05-18',
    p_passport_num := 'A75029138', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Hannah', p_surname := 'Wright', p_dob := '1977-03-03',
    p_passport_num := 'A09374523', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Kenneth', p_surname := 'Lopez', p_dob := '1995-09-13',
    p_passport_num := 'A54820195', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Nicole', p_surname := 'Hill', p_dob := '1950-07-08',
    p_passport_num := 'A83719462', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jonathan', p_surname := 'Scott', p_dob := '1978-01-30',
    p_passport_num := 'A20546920', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'William', p_surname := 'Green', p_dob := '1955-08-13',
    p_passport_num := 'A61839506', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Sarah', p_surname := 'Adams', p_dob := '1994-03-26',
    p_passport_num := 'A94720185', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Justin', p_surname := 'Baker', p_dob := '1961-11-08',
    p_passport_num := 'A35017296', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jason', p_surname := 'Nelson', p_dob := '1976-05-22',
    p_passport_num := 'A71936487', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Brandon', p_surname := 'Carter', p_dob := '1989-12-09',
    p_passport_num := 'A48205710', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Ryan', p_surname := 'Mitchell', p_dob := '1952-06-18',
    p_passport_num := 'A10395728', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Andrew', p_surname := 'Perez', p_dob := '1997-01-31',
    p_passport_num := 'A62749105', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Joseph', p_surname := 'Roberts', p_dob := '1968-08-14',
    p_passport_num := 'A49301827', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'John', p_surname := 'Turner', p_dob := '1986-02-27',
    p_passport_num := 'A80572916', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Robert', p_surname := 'Phillips', p_dob := '1971-10-10',
    p_passport_num := 'A23910549', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'James', p_surname := 'Campbell', p_dob := '1993-04-23',
    p_passport_num := 'A95037184', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'David', p_surname := 'Parker', p_dob := '1966-12-07',
    p_passport_num := 'A61048394', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Daniel', p_surname := 'Evans', p_dob := '1981-06-19',
    p_passport_num := 'A40275815', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Amanda', p_surname := 'Edwards', p_dob := '1954-02-01',
    p_passport_num := 'A73918252', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Joshua', p_surname := 'Collins', p_dob := '1998-08-15',
    p_passport_num := 'A05829175', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Ashley', p_surname := 'Stewart', p_dob := '1965-04-08',
    p_passport_num := 'A41730954', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Matthew', p_surname := 'Sanchez', p_dob := '1979-12-22',
    p_passport_num := 'A92850373', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jessica', p_surname := 'Morris', p_dob := '1992-07-13',
    p_passport_num := 'A60482917', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Christopher', p_surname := 'Rogers', p_dob := '1957-01-26',
    p_passport_num := 'A37194630', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Michael', p_surname := 'Reed', p_dob := '1989-11-07',
    p_passport_num := 'A91547040', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Elizabeth', p_surname := 'Cook', p_dob := '1963-05-20',
    p_passport_num := 'A28391747', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Tyler', p_surname := 'Morgan', p_dob := '1977-03-05',
    p_passport_num := 'A75029138', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Samantha', p_surname := 'Bell', p_dob := '1995-09-15',
    p_passport_num := 'A09374523', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Hannah', p_surname := 'Murphy', p_dob := '1950-07-10',
    p_passport_num := 'A54820195', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Kenneth', p_surname := 'Bailey', p_dob := '1978-02-01',
    p_passport_num := 'A83719462', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Nicole', p_surname := 'Cooper', p_dob := '1955-08-15',
    p_passport_num := 'A20546920', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jonathan', p_surname := 'Howard', p_dob := '1994-03-28',
    p_passport_num := 'A61839506', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'William', p_surname := 'Ward', p_dob := '1961-11-10',
    p_passport_num := 'A94720185', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Sarah', p_surname := 'Cox', p_dob := '1976-05-24',
    p_passport_num := 'A35017296', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Justin', p_surname := 'Flores', p_dob := '1989-12-11',
    p_passport_num := 'A71936487', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Jason', p_surname := 'Kelly', p_dob := '1952-06-20',
    p_passport_num := 'A48205710', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Brandon', p_surname := 'Price', p_dob := '1997-02-02',
    p_passport_num := 'A10395728', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Ryan', p_surname := 'Barnes', p_dob := '1968-08-16',
    p_passport_num := 'A62749105', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Andrew', p_surname := 'Ross', p_dob := '1986-03-01',
    p_passport_num := 'A49301827', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'Joseph', p_surname := 'Henderson', p_dob := '1971-10-12',
    p_passport_num := 'A80572916', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);
SELECT * FROM public."Admit_New_Traveler"(
    p_given_name := 'John', p_surname := 'Coleman', p_dob := '1993-04-25',
    p_passport_num := 'A23910549', p_passport_country_code := 'USA', p_passport_issue_date := '2020-01-01', p_passport_exp_date := '2030-01-01',
    p_flight_airline_code := 'UAL', p_flight_number := '340', p_flight_origin_code := 'PUJ', p_flight_country_code := 'DOM', p_arrival_date := '2025-10-01',
    p_admission_class_code := 'C', p_admitted := TRUE, p_a_number := NULL, p_exit_date := NULL, p_not_admitted_reason := NULL
);