#Team Name: Team 1
#Course: CSC 415
#Semester: Spring 2016
#Instructor: Dr. Pulimood 
#Project name: SOAP Data Update Module
#Description: The module uses scraped data to update the data on the SOAP system.
#Filename: Excel_scraper_csv.rb
#Description: The Excel scraper file scrapes, processes and outputs data from an EPA csv file
#to an sql file that will update various SOAP tables, including chemicals, facilities, locations,
#contains, nn_data, owners and owned_by. 
#Last modified on: 5/2/2016

#The following packages enable the user to scrape from a csv file. 

require "csv"
require 'open-uri'

#Contents is the big array that will be comprised of multiple entry arrays. An entry 
#is each line of the csv file, which in this case represents a facility and its data.  
#The contents array provides all of the data which will be used to easily create other
#arrays which will have the data to refill the tables in SOAP's database. 

contents = Array.new

#Initializes the positions of each of the variables in an entry array. These will be 
#changed later. 

facility_id_position = 0
facility_name_position = 0
street_address_position = 0
municipality_position = 0
county_position = 0
latitude_position = 0
longitude_position = 0
chemical_position = 0
clean_air_act_position = 0
pbt_status_position = 0
metal_position = 0
carcinogen_position = 0
stack_air_position = 0
water_position = 0
total_releases_position = 0
parent_company_name_position = 0
effects_position = 0
danger_level_position = 0
brownfield_position = 0
chemical_id_position = 0
fugitive_air_position = 0

#The following CSV.foreach process reads each line of the csv file, remembering that the first line
#is a header line. 
 
CSV.foreach("TRI_2014_NJ.csv", {:force_quotes => true, :headers => true}) do |row|

#Each row of the csv file constitutes a facility entry. For each facility entry, an entry 
#array is created. The first column of the csv file is considered index 0. The csv files
#contains more data points than what has been stored into the array, but only the extracted
#data was required by the SOAP system. 

	entry = Array.new
	
	facility_id = row[1]
	facility_name = row[2]
	street_address = row[3]
	municipality = row[4]
	county = row[5]
	latitude = row[10]
	longitude = row[11]
	chemical = row[26]
	chemical_id = row[27]
	clean_air_act = row[28]	
	
#The classification variable will be used to determine if a chemical is PBT or non-PBT.
#The current csv file has multiple classifications beyond just PBT, but for the purposes
#of the current system, this script only accounts for PBT and non-PBT.  

	classification = row[29]
	
	metal = row[30]	
	carcinogen = row[32]
	fugitive_air = row[35]
	stack_air = row[36]
	water = row[37]
	total_releases = row[85]
	parent_company_name = row[100]
	
#The csv file does not provide danger levels or brownfield status. 	

	danger_level = "N/A"
	brownfield = "N/A"
	
#Because the csv file does not give effects of each facilities chemicals, this module 
#simply considers whether a chemical "Causes cancer" or "Does not cause cancer" based on
#its carcinogen status. 

	if carcinogen == "YES"
		effects = "Causes cancer"
	else
		effects = "Does not cause cancer"
	end
	
#A new pbt_status variable is created based on what is in the classification variable.
#Ultimately, the pbt_status, not the classification, variable is pushed into each entry
#array. 

	if classification == "PBT"
		pbt_status = "PBT"
	else
		pbt_status = "NON_PBT"
	end

#The extracted and processed data points are pushed into the entry variable. 	

	entry.push(facility_id, facility_name, street_address, municipality, county, latitude, 
				longitude, chemical,  clean_air_act, pbt_status, metal, carcinogen,
			   stack_air, water, total_releases, parent_company_name, effects, danger_level,
			    brownfield, chemical_id,fugitive_air)

#Each entry variable is pushed into the larger contents array. The contents array 
#ultimately becomes an array of arrays. 
					 
	contents.push(entry)

#The following lines are used to record the index positions of each variable in an entry
#array. This will make it easier to write the sql output code without hardcoding
 
facility_id_position = entry.index(facility_id) #0 
facility_name_position = entry.index(facility_name) #1
street_address_position = entry.index(street_address) #2
municipality_position = entry.index(municipality) #3
county_position = entry.index(county) #4
latitude_position = entry.index(latitude) #5
longitude_position = entry.index(longitude) #6
chemical_position = entry.index(chemical) #7 
clean_air_act_position = entry.index(clean_air_act) #8
pbt_status_position = entry.index(pbt_status) #9
metal_position = entry.index(metal) #10
carcinogen_position = entry.index(carcinogen) #11
stack_air_position = entry.index(stack_air) #12
water_position = entry.index(water) #13
total_releases_position = entry.index(total_releases) #14
parent_company_name_position = entry.index(parent_company_name) #15
effects_position = entry.index(effects_position) #16
danger_level_position = entry.index(danger_level) #17
brownfield_position = entry.index(brownfield) #18
chemical_id_position = entry.index(chemical_id) #19
fugitive_air_position = entry.index(fugitive_air) #20	

end	

#The final variable establishes the end point employed in for loops throughout this script. 

final = contents.length - 1

#The below code creates all of the arrays that will have the necessary data to upload to the sql file. 

chemicals = Array.new
facilities = Array.new
locations = Array.new
contains = Array.new
nn_data = Array.new
owners_id = Array.new
owned_by = Array.new

#The below process fills all of the previously created arrays with the necessary data as per 
#the structure of the current SOAP system.  

for i in 0..final
	chemicals[i] = "#{contents[i][chemical_id_position]}" + "\t" + "#{contents[i][chemical_position]}" +
					"\t" + "#{contents[i][carcinogen_position]}" + "\t" + "#{contents[i][clean_air_act_position]}" +
					 "\t" + "#{contents[i][metal_position]}" + "\t" + "#{contents[i][pbt_status_position]}" + "\n"

								
	facilities[i] = "#{contents[i][facility_id_position]}" + "\t" +  "#{contents[i][facility_name_position]}" +
					"\t" + "#{contents[i][street_address_position]}" + "\t" + 
					"#{contents[i][brownfield_position]}" + "\n"					
					
	locations[i] =  "#{contents[i][street_address_position]}" + "\t" +  "#{contents[i][county_position]}" +
					"\t" + "#{contents[i][municipality_position]}" + "\t" +
 					"#{contents[i][latitude_position]}" + "\t" + "#{contents[i][longitude_position]}" +
					"\n"				
	
	contains[i] = "#{contents[i][facility_id_position]}" + "\t" +  "#{contents[i][chemical_id_position]}" + "\t" + 
					"#{contents[i][total_releases_position]}" + " Pounds\t" + 
					"#{contents[i][fugitive_air_position]}" + " Pounds\t" + "#{contents[i][water_position]}" +
					 " Pounds\t" + "#{contents[i][stack_air_position]}" + " Pounds\t" + "\n"				
	
	nn_data[i] = "#{contents[i][facility_id_position]}" + "\t" + "#{contents[i][danger_level_position]}" +
			      "\t" + "#{contents[i][latitude_position]}" + "\t" + "#{contents[i][longitude_position]}" +
				  "\n"	
				  
	owners_id[i] = "#{contents[i][parent_company_name_position]}"
					+ "\n"													
end
 
#The current csv file lists unique facility id's, but multiple facility id's can share a 
#chemical. Therfore, the following process is used to create an array in which each entry 
#is a unique chemical. 

sorted_chemicals = chemicals.sort

consolidated_chemicals = Array.new

# chemical_i = Index for the consolidated_chemicals array.

chemical_i = 0

#If an entry matches the previous entry, it is not added to the consolidated_chemicals array.
#An entry is only added to the consolidated_chemicals array if it is the first entry or 
#if it does not match the previous entry. 

for i in 0..final
	if i == 0
		consolidated_chemicals[chemical_i] = sorted_chemicals[i]
		chemical_i = chemical_i + 1 
		i = i + 1
	elsif sorted_chemicals[i] == sorted_chemicals[i-1]
		i = i + 1	
	else
		consolidated_chemicals[chemical_i] = sorted_chemicals[i]
		chemical_i = chemical_i + 1
		i = i + 1
	end
end

#The below code sorts and consolidates the facilities from the csv file, as there may be 
#repeating facility id numbers in the source data.  

sorted_facilities = facilities.sort

consolidated_facilities = Array.new

#facilities_i = Index for consolidated_facilities array.

facilities_i = 0

#If an entry matches the previous entry, it is not added to the consolidated_facilities array.
#An entry is only added to the consolidated_facilities array if it is the first entry or 
#if it does not match the previous entry. 

for j in 0..final
	if j == 0
		consolidated_facilities[facilities_i] = sorted_facilities[j]
		facilities_i = facilities_i + 1 
		j = j + 1
	elsif sorted_facilities[j] == sorted_facilities[j-1]
		j = j + 1	
	else
		consolidated_facilities[facilities_i] = sorted_facilities[j]
		facilities_i = facilities_i + 1
		j = j + 1
	end
end  

#The below code sorts and consolidates the locations from the csv file. 

sorted_locations = locations.sort

consolidated_locations = Array.new

#locations_i = Index for consolidated_locations array. 

locations_i = 0

#If an entry matches the previous entry, it is not added to the consolidated_locations array.
#An entry is only added to the consolidated_locations array if it is the first entry or 
#if it does not match the previous entry. 

#j = Index for sorted_locations array. 

for j in 0..final
	if j == 0
		consolidated_locations[locations_i] = sorted_locations[j]
		locations_i = locations_i + 1 
		j = j + 1
	elsif sorted_locations[j] == sorted_locations[j-1]
		j = j + 1	
	else
		consolidated_locations[locations_i] = sorted_locations[j]
		locations_i = locations_i + 1
		j = j + 1
	end
end

#The below process sorts and consolidates the contains array. 
  
sorted_contains = contains.sort

consolidated_contains = Array.new

#contains_i = Index for consolidated_contains array. 

contains_i = 0

#If an entry matches the previous entry, it is not added to the consolidated_contains array.
#An entry is only added to the consolidated_contains array if it is the first entry or 
#if it does not match the previous entry.

#j = Index for sorted_contains array. 

for j in 0..final
	if j == 0
		consolidated_contains[contains_i] = sorted_contains[j]
		contains_i = contains_i + 1 
		j = j + 1
	elsif sorted_contains[j] == sorted_contains[j-1]
		j = j + 1	
	else
		consolidated_contains[contains_i] = sorted_contains[j]
		contains_i = contains_i + 1
		j = j + 1
	end
end  

#The below code sorts and consolidates nn_data.  

sorted_nn_data = nn_data.sort

consolidated_nn_data = Array.new

#nn_data_i = Index for consolidated_nn_data.

nn_data_i = 0

#If an entry matches the previous entry, it is not added to the consolidated_nn_data array.
#An entry is only added to the consolidated_nn_data array if it is the first entry or 
#if it does not match the previous entry.

#j = Index for sorted_nn_data.

for j in 0..final
	if j == 0
		consolidated_nn_data[nn_data_i] = sorted_nn_data[j]
		nn_data_i = nn_data_i + 1 
		j = j + 1
	elsif sorted_nn_data[j] == sorted_nn_data[j-1]
		j = j + 1	
	else
		consolidated_nn_data[nn_data_i] = sorted_nn_data[j]
		nn_data_i = nn_data_i + 1
		j = j + 1
	end
end  

#The below code sorts and consolidates owners.  

sorted_owners_id = owners_id.sort

consolidated_owners_id = Array.new

#owners_id_i = Index for consolidated_owners_id. 

owners_id_i = 0

#If an entry matches the previous entry, it is not added to the consolidated_owners_id array.
#An entry is only added to the consolidated_owners_id array if it is the first entry or 
#if it does not match the previous entry.

#j = Index for sorted_owners_id. 

for j in 0..final
	if j == 0
		consolidated_owners_id[owners_id_i] = sorted_owners_id[j]
		owners_id_i = owners_id_i + 1 
		j = j + 1
	elsif sorted_owners_id[j] == sorted_owners_id[j-1]
		j = j + 1	
	else
		consolidated_owners_id[owners_id_i] = sorted_owners_id[j]
		owners_id_i = owners_id_i + 1
		j = j + 1
	end
end  

#As the csv file does not provide an owners id, which is required in the SOAP system, the 
#below process adds an owners id to each entry based on the the position within the 
#consolidated_owners array. 

consolidated_owners = Array.new
for i in 0..(consolidated_owners_id).length-1
	consolidated_owners[i] = "#{i}" + "\t" + "#{consolidated_owners_id[i]}"
					+ "\n"
end	

#The below code creates the necessary consolidated data for the owned_by table, as per
#the specifications of the SOAP system. If an entry from the large contents array is in the 
#consolidated_owners_id array, the appropriate id numbers for owners and facilities are 
#associated with the owned_by entry

for i in 0..final
  temp = contents[i][parent_company_name_position]
  value = consolidated_owners_id.include?(temp)
    if value == true
      id = consolidated_owners_id.index(temp)
	    owned_by[i] = "#{id}" + "\t" + "#{contents[i][facility_id_position]}" + "\t" + "\\N" + "\t" + "\\N" + "\t" + "\\N" + "\n"
    else
      i = i+1
    end
end	

#The below code sorts and consolidates the owned_by data. 

sorted_owned_by = owned_by.sort

consolidated_owned_by = Array.new

#owned_by_i = Index for consolidated owned_by.

owned_by_i = 0

#j = Index for sorted owned_by. 

for j in 0..final
	if j == 0
		consolidated_owned_by[owned_by_i] = sorted_owned_by[j]
		owned_by_i = owned_by_i + 1 
		j = j + 1
	elsif sorted_owned_by[j] == sorted_owned_by[j-1]
		j = j + 1	
	else
		consolidated_owned_by[owned_by_i] = sorted_owned_by[j]
		owned_by_i = owned_by_i + 1
		j = j + 1
	end
end  

#The below puts statements test how many data points are in each of the consolidated 
#arrays. These output statements can be compared to the number of entries in the SOAP
#tables once the outputted sql file is uploaded to the SOAP database. Any deviations 
#between the consolidated_arrays and the number of entries in the database tables implies
#that some or all or the data was not uploaded successfully. 

puts "Chemicals length #{consolidated_chemicals.length}"
puts "Facilities length #{consolidated_facilities.length}"
puts "Locations length #{consolidated_locations.length}"
puts "Contains length #{consolidated_contains.length}"
puts "nn_data length #{consolidated_nn_data.length}"
puts "owners length #{consolidated_owners.length}"
puts "owned_by length #{consolidated_owned_by.length}"

#The script creates an sql file that outputs the data from the previously consolidated arrays.
#The script drops all of the previously established tables in the current SOAP system
#and copies new data from the csv file into the following tables: chemicals, facilities, locations 
#contains, nn_data, owners and owned_by.

File.new("updatesoap.sql", "w+")
File.open("updatesoap.sql", "w+") do |f|
	
#The below puts statement is responsible for outputting the sql file. Most of the below 
#content was copied and pasted from the original copy of SOAP's sql. However, 
#Team Shampoo made two major modifications to the sql file. First, this script includes 
#DROP TABLE [table name] CASCADE commands, which were necessary to ensure that the new upload 
#did not encounter errors caused by previously established constraints in the system. 
#Second, the COPY commands for the tables this script updates utilizes data from the consolidated
#arrays. 

	f.puts("--
-- PostgreSQL database dump
--






SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: newsoap; Type: SCHEMA; Schema: -; Owner: postgres
--

ALTER SCHEMA newsoap OWNER TO postgres;

--
-- Name: SCHEMA newsoap; Type: COMMENT; Schema: -; Owner: postgres
--

DROP TABLE newsoap.chemicals CASCADE;
DROP TABLE newsoap.locations CASCADE;
DROP TABLE newsoap.facilities CASCADE;
DROP TABLE newsoap.contains CASCADE;
DROP TABLE newsoap.nn_data CASCADE;
DROP TABLE newsoap.owned_by CASCADE;
DROP TABLE newsoap.owners CASCADE;
DROP TABLE newsoap.bills CASCADE;
DROP TABLE newsoap.contributed CASCADE;
DROP TABLE newsoap.politicians CASCADE;
DROP TABLE newsoap.regulates CASCADE;
DROP TABLE newsoap.sources CASCADE;
DROP TABLE newsoap.standards CASCADE;
DROP TABLE newsoap.votes_on CASCADE;
DROP TABLE newsoap.comments CASCADE;
DROP TABLE newsoap.posts CASCADE;
DROP TABLE newsoap.uploads CASCADE;
DROP TABLE newsoap.users CASCADE;

DROP SEQUENCE newsoap.posts_id_seq CASCADE;
DROP SEQUENCE newsoap.users_id_seq CASCADE;


COMMENT ON SCHEMA newsoap IS 'Revised during Winter 2014';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = newsoap, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bills; Type: TABLE; Schema: newsoap; Owner: postgres; Tablespace: 
--

CREATE TABLE bills (
    bill_id character varying NOT NULL,
    pass_status character(1),
    topic character varying
);


ALTER TABLE newsoap.bills OWNER TO postgres;

--
-- Name: COLUMN bills.pass_status; Type: COMMENT; Schema: newsoap; Owner: postgres
--

COMMENT ON COLUMN bills.pass_status IS '''P'' for passed, ''N'' for not passed';


--
-- Name: Bill_Bill_ID_seq; Type: SEQUENCE; Schema: newsoap; Owner: postgres
--

CREATE SEQUENCE \"Bill_Bill_ID_seq\"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsoap.\"Bill_Bill_ID_seq\" OWNER TO postgres;

--
-- Name: Bill_Bill_ID_seq; Type: SEQUENCE OWNED BY; Schema: newsoap; Owner: postgres
--

ALTER SEQUENCE \"Bill_Bill_ID_seq\" OWNED BY bills.bill_id;


--
-- Name: facilities; Type: TABLE; Schema: newsoap; Owner: postgres; Tablespace: 
--

CREATE TABLE facilities (
    id character varying NOT NULL,
    facility_name character varying,
    location_id character varying,
    is_brownfield character varying
);


ALTER TABLE newsoap.facilities OWNER TO postgres;

--
-- Name: COLUMN facilities.location_id; Type: COMMENT; Schema: newsoap; Owner: postgres
--

COMMENT ON COLUMN facilities.location_id IS 'address';


--
-- Name: COLUMN facilities.is_brownfield; Type: COMMENT; Schema: newsoap; Owner: postgres
--

COMMENT ON COLUMN facilities.is_brownfield IS '''Yes'' or ''No''';


--
-- Name: Brownfield_Brownfield_ID_seq; Type: SEQUENCE; Schema: newsoap; Owner: postgres
--

CREATE SEQUENCE \"Brownfield_Brownfield_ID_seq\"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsoap.\"Brownfield_Brownfield_ID_seq\" OWNER TO postgres;

--
-- Name: Brownfield_Brownfield_ID_seq; Type: SEQUENCE OWNED BY; Schema: newsoap; Owner: postgres
--

ALTER SEQUENCE \"Brownfield_Brownfield_ID_seq\" OWNED BY facilities.id;


--
-- Name: contributed; Type: TABLE; Schema: newsoap; Owner: postgres; Tablespace: 
--

CREATE TABLE contributed (
    facility_id character varying NOT NULL,
    source_id integer NOT NULL
);


ALTER TABLE newsoap.contributed OWNER TO postgres;

--
-- Name: Contributed_Brownfield_ID_seq; Type: SEQUENCE; Schema: newsoap; Owner: postgres
--

CREATE SEQUENCE \"Contributed_Brownfield_ID_seq\"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsoap.\"Contributed_Brownfield_ID_seq\" OWNER TO postgres;

--
-- Name: Contributed_Brownfield_ID_seq; Type: SEQUENCE OWNED BY; Schema: newsoap; Owner: postgres
--

ALTER SEQUENCE \"Contributed_Brownfield_ID_seq\" OWNED BY contributed.facility_id;


--
-- Name: Contributed_Source_ID_seq; Type: SEQUENCE; Schema: newsoap; Owner: postgres
--

CREATE SEQUENCE \"Contributed_Source_ID_seq\"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsoap.\"Contributed_Source_ID_seq\" OWNER TO postgres;

--
-- Name: Contributed_Source_ID_seq; Type: SEQUENCE OWNED BY; Schema: newsoap; Owner: postgres
--

ALTER SEQUENCE \"Contributed_Source_ID_seq\" OWNED BY contributed.source_id;


--
-- Name: nn_data; Type: TABLE; Schema: newsoap; Owner: postgres; Tablespace: 
--

CREATE TABLE nn_data (
    facility_id character varying NOT NULL,
    dangerous_state character varying NOT NULL,
    longitude character varying NOT NULL,
    latitude character varying NOT NULL
);


ALTER TABLE newsoap.nn_data OWNER TO postgres;

--
-- Name: TABLE nn_data; Type: COMMENT; Schema: newsoap; Owner: postgres
--

COMMENT ON TABLE nn_data IS 'Team 3';


--
-- Name: NNData_Dangerous_State_seq; Type: SEQUENCE; Schema: newsoap; Owner: postgres
--

CREATE SEQUENCE \"NNData_Dangerous_State_seq\"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsoap.\"NNData_Dangerous_State_seq\" OWNER TO postgres;

--
-- Name: NNData_Dangerous_State_seq; Type: SEQUENCE OWNED BY; Schema: newsoap; Owner: postgres
--

ALTER SEQUENCE \"NNData_Dangerous_State_seq\" OWNED BY nn_data.dangerous_state;


--
-- Name: NNData_Latitude_seq; Type: SEQUENCE; Schema: newsoap; Owner: postgres
--

CREATE SEQUENCE \"NNData_Latitude_seq\"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsoap.\"NNData_Latitude_seq\" OWNER TO postgres;

--
-- Name: NNData_Latitude_seq; Type: SEQUENCE OWNED BY; Schema: newsoap; Owner: postgres
--

ALTER SEQUENCE \"NNData_Latitude_seq\" OWNED BY nn_data.latitude;


--
-- Name: NNData_Longitude_seq; Type: SEQUENCE; Schema: newsoap; Owner: postgres
--

CREATE SEQUENCE \"NNData_Longitude_seq\"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsoap.\"NNData_Longitude_seq\" OWNER TO postgres;

--
-- Name: NNData_Longitude_seq; Type: SEQUENCE OWNED BY; Schema: newsoap; Owner: postgres
--

ALTER SEQUENCE \"NNData_Longitude_seq\" OWNED BY nn_data.longitude;


--
-- Name: owners; Type: TABLE; Schema: newsoap; Owner: postgres; Tablespace: 
--

CREATE TABLE owners (
    id integer NOT NULL,
    owner_name character varying
);


ALTER TABLE newsoap.owners OWNER TO postgres;

--
-- Name: TABLE owners; Type: COMMENT; Schema: newsoap; Owner: postgres
--

COMMENT ON TABLE owners IS 'Team 2';


--
-- Name: Owner_Owner_ID_seq; Type: SEQUENCE; Schema: newsoap; Owner: postgres
--

CREATE SEQUENCE \"Owner_Owner_ID_seq\"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsoap.\"Owner_Owner_ID_seq\" OWNER TO postgres;

--
-- Name: Owner_Owner_ID_seq; Type: SEQUENCE OWNED BY; Schema: newsoap; Owner: postgres
--

ALTER SEQUENCE \"Owner_Owner_ID_seq\" OWNED BY owners.id;


--
-- Name: politicians; Type: TABLE; Schema: newsoap; Owner: postgres; Tablespace: 
--

CREATE TABLE politicians (
    congress_id character varying NOT NULL,
    name character varying,
    party character varying,
    date_elected character varying,
    state_name character varying,
    district_no integer,
    image_link character varying,
    chamber character varying
);


ALTER TABLE newsoap.politicians OWNER TO postgres;

--
-- Name: COLUMN politicians.chamber; Type: COMMENT; Schema: newsoap; Owner: postgres
--

COMMENT ON COLUMN politicians.chamber IS '\"upper\" for Senate and \"lower\" for Representative';


--
-- Name: Politician_Congress_ID_seq; Type: SEQUENCE; Schema: newsoap; Owner: postgres
--

CREATE SEQUENCE \"Politician_Congress_ID_seq\"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsoap.\"Politician_Congress_ID_seq\" OWNER TO postgres;

--
-- Name: Politician_Congress_ID_seq; Type: SEQUENCE OWNED BY; Schema: newsoap; Owner: postgres
--

ALTER SEQUENCE \"Politician_Congress_ID_seq\" OWNED BY politicians.congress_id;


--
-- Name: sources; Type: TABLE; Schema: newsoap; Owner: postgres; Tablespace: 
--

CREATE TABLE sources (
    source_id integer NOT NULL,
    source_name character varying,
    trusted_or_user character varying
);


ALTER TABLE newsoap.sources OWNER TO postgres;

--
-- Name: Source_Source_ID_seq; Type: SEQUENCE; Schema: newsoap; Owner: postgres
--

CREATE SEQUENCE \"Source_Source_ID_seq\"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsoap.\"Source_Source_ID_seq\" OWNER TO postgres;

--
-- Name: Source_Source_ID_seq; Type: SEQUENCE OWNED BY; Schema: newsoap; Owner: postgres
--

ALTER SEQUENCE \"Source_Source_ID_seq\" OWNED BY sources.source_id;


--
-- Name: standards; Type: TABLE; Schema: newsoap; Owner: postgres; Tablespace: 
--

CREATE TABLE standards (
    standard_no integer NOT NULL,
    cas_no integer NOT NULL,
    state_soil integer,
    federal_soil integer,
    state_water integer,
    federal_water integer
);


ALTER TABLE newsoap.standards OWNER TO postgres;

--
-- Name: TABLE standards; Type: COMMENT; Schema: newsoap; Owner: postgres
--

COMMENT ON TABLE standards IS 'Team 4';


--
-- Name: Standards_Standard_No_seq; Type: SEQUENCE; Schema: newsoap; Owner: postgres
--

CREATE SEQUENCE \"Standards_Standard_No_seq\"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsoap.\"Standards_Standard_No_seq\" OWNER TO postgres;

--
-- Name: Standards_Standard_No_seq; Type: SEQUENCE OWNED BY; Schema: newsoap; Owner: postgres
--

ALTER SEQUENCE \"Standards_Standard_No_seq\" OWNED BY standards.standard_no;


--
-- Name: votes_on; Type: TABLE; Schema: newsoap; Owner: postgres; Tablespace: 
--

CREATE TABLE votes_on (
    bill_id character varying NOT NULL,
    congress_id character varying NOT NULL,
    vote_type character varying,
    date_voted_on date
);


ALTER TABLE newsoap.votes_on OWNER TO postgres;

--
-- Name: Votes_On_Bill_ID_seq; Type: SEQUENCE; Schema: newsoap; Owner: postgres
--

CREATE SEQUENCE \"Votes_On_Bill_ID_seq\"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsoap.\"Votes_On_Bill_ID_seq\" OWNER TO postgres;

--
-- Name: Votes_On_Bill_ID_seq; Type: SEQUENCE OWNED BY; Schema: newsoap; Owner: postgres
--

ALTER SEQUENCE \"Votes_On_Bill_ID_seq\" OWNED BY votes_on.bill_id;


--
-- Name: Votes_On_Congress_ID_seq; Type: SEQUENCE; Schema: newsoap; Owner: postgres
--

CREATE SEQUENCE \"Votes_On_Congress_ID_seq\"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsoap.\"Votes_On_Congress_ID_seq\" OWNER TO postgres;

--
-- Name: Votes_On_Congress_ID_seq; Type: SEQUENCE OWNED BY; Schema: newsoap; Owner: postgres
--

ALTER SEQUENCE \"Votes_On_Congress_ID_seq\" OWNED BY votes_on.congress_id;


--
-- Name: chemicals; Type: TABLE; Schema: newsoap; Owner: postgres; Tablespace: 
--

CREATE TABLE chemicals (
    id character varying NOT NULL,
    chemical_name character varying,
    carcinogenic character varying,
    clean_air_act character varying,
    metal character varying,
    pbt character varying
);


ALTER TABLE newsoap.chemicals OWNER TO postgres;

--
-- Name: COLUMN chemicals.id; Type: COMMENT; Schema: newsoap; Owner: postgres
--

COMMENT ON COLUMN chemicals.id IS 'cas no';


--
-- Name: COLUMN chemicals.carcinogenic; Type: COMMENT; Schema: newsoap; Owner: postgres
--

COMMENT ON COLUMN chemicals.carcinogenic IS '''Yes'' or ''No''';


--
-- Name: COLUMN chemicals.clean_air_act; Type: COMMENT; Schema: newsoap; Owner: postgres
--

COMMENT ON COLUMN chemicals.clean_air_act IS '''Yes'' or ''No''';


--
-- Name: COLUMN chemicals.metal; Type: COMMENT; Schema: newsoap; Owner: postgres
--

COMMENT ON COLUMN chemicals.metal IS '''Yes'' or ''No''';


--
-- Name: COLUMN chemicals.pbt; Type: COMMENT; Schema: newsoap; Owner: postgres
--

COMMENT ON COLUMN chemicals.pbt IS '''PBT'' or ''NON-PBT''';


--
-- Name: comments; Type: TABLE; Schema: newsoap; Owner: postgres; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    post_id integer,
    name character varying(255),
    email character varying(255),
    text text,
    created date
);


ALTER TABLE newsoap.comments OWNER TO postgres;

--
-- Name: contains; Type: TABLE; Schema: newsoap; Owner: postgres; Tablespace: 
--

CREATE TABLE contains (
    facility_id character varying NOT NULL,
    chemical_id character varying NOT NULL,
    total_amount character varying,
    fugair_amount character varying,
    water_amount character varying,
    stackair_amount character varying
);


ALTER TABLE newsoap.contains OWNER TO postgres;

--
-- Name: locations; Type: TABLE; Schema: newsoap; Owner: postgres; Tablespace: 
--

CREATE TABLE locations (
    id character varying NOT NULL,
    county character varying,
    municipality character varying,
    x_coor double precision,
    y_coor double precision
);


ALTER TABLE newsoap.locations OWNER TO postgres;

--
-- Name: COLUMN locations.id; Type: COMMENT; Schema: newsoap; Owner: postgres
--

COMMENT ON COLUMN locations.id IS 'address';


--
-- Name: COLUMN locations.x_coor; Type: COMMENT; Schema: newsoap; Owner: postgres
--

COMMENT ON COLUMN locations.x_coor IS 'In decimal degrees.';


--
-- Name: COLUMN locations.y_coor; Type: COMMENT; Schema: newsoap; Owner: postgres
--

COMMENT ON COLUMN locations.y_coor IS 'In decimal degrees.';


--
-- Name: owned_by; Type: TABLE; Schema: newsoap; Owner: postgres; Tablespace: 
--

CREATE TABLE owned_by (
    owner_id integer NOT NULL,
    facility_id character varying NOT NULL,
    start_date date,
    end_date date,
    purpose character varying
);


ALTER TABLE newsoap.owned_by OWNER TO postgres;

--
-- Name: TABLE owned_by; Type: COMMENT; Schema: newsoap; Owner: postgres
--

COMMENT ON TABLE owned_by IS 'Team 2';


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: newsoap; Owner: postgres
--

CREATE SEQUENCE posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsoap.posts_id_seq OWNER TO postgres;

--
-- Name: posts; Type: TABLE; Schema: newsoap; Owner: postgres; Tablespace: 
--

CREATE TABLE posts (
    id integer DEFAULT nextval('posts_id_seq'::regclass) NOT NULL,
    title character varying(50),
    body text,
    created date,
    modified date
);


ALTER TABLE newsoap.posts OWNER TO postgres;

--
-- Name: regulates; Type: TABLE; Schema: newsoap; Owner: postgres; Tablespace: 
--

CREATE TABLE regulates (
    bill_id character varying NOT NULL,
    cas_no character varying NOT NULL
);


ALTER TABLE newsoap.regulates OWNER TO postgres;

--
-- Name: uploads; Type: TABLE; Schema: newsoap; Owner: postgres; Tablespace: 
--

CREATE TABLE uploads (
    name character varying(20) NOT NULL,
    date character varying(20) NOT NULL
);


ALTER TABLE newsoap.uploads OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: newsoap; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999
    CACHE 1;


ALTER TABLE newsoap.users_id_seq OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: newsoap; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer DEFAULT nextval('users_id_seq'::regclass) NOT NULL,
    username character varying(50),
    password character varying(50),
    created date,
    modified date,
    role character varying(20),
    facebook_id bigint,
    uid character varying(50)
);


ALTER TABLE newsoap.users OWNER TO postgres;

--
-- Name: id; Type: DEFAULT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY facilities ALTER COLUMN id SET DEFAULT nextval('\"Brownfield_Brownfield_ID_seq\"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY owners ALTER COLUMN id SET DEFAULT nextval('\"Owner_Owner_ID_seq\"'::regclass);


--
-- Name: source_id; Type: DEFAULT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY sources ALTER COLUMN source_id SET DEFAULT nextval('\"Source_Source_ID_seq\"'::regclass);


--
-- Name: standard_no; Type: DEFAULT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY standards ALTER COLUMN standard_no SET DEFAULT nextval('\"Standards_Standard_No_seq\"'::regclass);


--
-- Name: Bill_Bill_ID_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('\"Bill_Bill_ID_seq\"', 1, false);


--
-- Name: Brownfield_Brownfield_ID_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('\"Brownfield_Brownfield_ID_seq\"', 2, true);


--
-- Name: Contributed_Brownfield_ID_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('\"Contributed_Brownfield_ID_seq\"', 1, false);


--
-- Name: Contributed_Source_ID_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('\"Contributed_Source_ID_seq\"', 1, false);


--
-- Name: NNData_Dangerous_State_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('\"NNData_Dangerous_State_seq\"', 1, false);


--
-- Name: NNData_Latitude_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('\"NNData_Latitude_seq\"', 1, false);


--
-- Name: NNData_Longitude_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('\"NNData_Longitude_seq\"', 1, false);


--
-- Name: Owner_Owner_ID_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('\"Owner_Owner_ID_seq\"', 7189, true);


--
-- Name: Politician_Congress_ID_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('\"Politician_Congress_ID_seq\"', 1, false);


--
-- Name: Source_Source_ID_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('\"Source_Source_ID_seq\"', 1, false);


--
-- Name: Standards_Standard_No_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('\"Standards_Standard_No_seq\"', 1, false);


--
-- Name: Votes_On_Bill_ID_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('\"Votes_On_Bill_ID_seq\"', 1, false);


--
-- Name: Votes_On_Congress_ID_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('\"Votes_On_Congress_ID_seq\"', 1, false);


--
-- Data for Name: bills; Type: TABLE DATA; Schema: newsoap; Owner: postgres
--

COPY newsoap.bills (bill_id, pass_status, topic) FROM stdin;
\\.")


	f.puts("--")
	f.puts("-- Data for Name: chemicals; Type: TABLE DATA; Schema: newsoap; Owner: postgres")
	f.puts("--")
	f.puts("\n")
	f.puts("COPY newsoap.chemicals (id, chemical_name, carcinogenic, clean_air_act, metal, pbt) FROM stdin;")
	f.puts(consolidated_chemicals)

	f.puts("\\.\n\n")	
	
	f.puts("--
-- Data for Name: comments; Type: TABLE DATA; Schema: newsoap; Owner: postgres
--

COPY newsoap.comments (id, post_id, name, email, text, created) FROM stdin;
\\.")
			
	#The below code outputs the delete and copy sql commands for contains.

	f.puts("--")
	f.puts("-- Data for Name: contains; Type: TABLE DATA; Schema: newsoap; Owner: postgres")
	f.puts("--")
	f.puts("\n")
	f.puts("COPY newsoap.contains (facility_id, chemical_id, total_amount, fugair_amount, water_amount, 
			stackair_amount) FROM stdin;")
	f.puts(consolidated_contains)		
	f.puts("\\.\n\n")	
	
	
	f.puts("--
-- Data for Name: contributed; Type: TABLE DATA; Schema: newsoap; Owner: postgres
--

COPY newsoap.contributed (facility_id, source_id) FROM stdin;
\\.")

#The below code outputs the delete and copy sql commands for facilities.

	f.puts("--")
	f.puts("-- Data for Name: facilities; Type: TABLE DATA; Schema: newsoap; Owner: postgres")
	f.puts("--")
	f.puts("\n")
	f.puts("COPY newsoap.facilities (id, facility_name, location_id, is_brownfield) FROM stdin;")	
	f.puts(consolidated_facilities)
	f.puts("\\.\n\n")	
	
	#The below code outputs the delete and copy sql commands for locations.

	f.puts("--")
	f.puts("-- Data for Name: locations; Type: TABLE DATA; Schema: newsoap; Owner: postgres")
	f.puts("--")
	f.puts("\n")
	f.puts("COPY newsoap.locations (id, county, municipality, x_coor, y_coor) FROM stdin;")	
	f.puts(consolidated_locations)
	f.puts("\\.\n\n")

#The below code outputs the delete and copy sql commands for nn.

	f.puts("--")
	f.puts("-- Data for Name: nn_data; Type: TABLE DATA; Schema: newsoap; Owner: postgres")
	f.puts("--")
	f.puts("\n")
	f.puts("COPY newsoap.nn_data (facility_id, dangerous_state, longitude, latitude) FROM stdin;")	
	f.puts(consolidated_nn_data)
	f.puts("\\.\n\n")

#The below code outputs the delete and copy sql commands for owned_by.

  f.puts("--")
  f.puts("-- Data for Name: owned_by; Type: TABLE DATA; Schema: newsoap; Owner: postgres")
  f.puts("--")
  f.puts("\n")
  f.puts("COPY newsoap.owned_by (owner_id, facility_id, start_date, end_date, purpose) FROM stdin;")
  f.puts(consolidated_owned_by)
  f.puts("\\.\n\n")

#The below code outputs the delete and copy sql commands for owners.

  f.puts("--")
  f.puts("-- Data for Name: owners; Type: TABLE DATA; Schema: newsoap; Owner: postgres")
  f.puts("--")
  f.puts("\n")
  f.puts("COPY newsoap.owners (id, owner_name) FROM stdin;")
  f.puts(consolidated_owners)
  f.puts("\\.\n\n")

  f.puts("--
-- Data for Name: politicians; Type: TABLE DATA; Schema: newsoap; Owner: postgres
--

COPY politicians (congress_id, name, party, date_elected, state_name, district_no, image_link, chamber) FROM stdin;
NJL000010	Fred H Madden Jr.	Democrat	2010	NJ	4	http://www.njleg.state.nj.us/members/memberphotos/madden_color.jpg	upper
NJL000080	Jay Webber	Republican	2010	NJ	26	http://www.njleg.state.nj.us/members/memberphotos/webber_color.jpg	lower
NJL000067	Linda Stender	Democrat	2010	NJ	22	http://www.njleg.state.nj.us/members/memberphotos/stender_color.jpg	lower
NJL000088	L. Grace Spencer	Democrat	2010	NJ	29	http://www.njleg.state.nj.us/members/memberphotos/spencer_color.jpg	lower
NJL000058	John S Wisniewski	Democrat	2010	NJ	19	http://www.njleg.state.nj.us/members/memberphotos/wisniewski_color.jpg	lower
NJL000129	Troy Singleton	Democrat	2010	NJ	7	http://www.njleg.state.nj.us/members/memberphotos/singleton_color.jpg	lower
NJL000104	Sheila Y Oliver	Democrat	2010	NJ	34	http://www.njleg.state.nj.us/members/memberphotos/oliver_color.jpg	lower
NJL000075	Anthony M Bucco	Republican	2010	NJ	25	http://www.njleg.state.nj.us/members/memberphotos/bucco_a_m_color.jpg	lower
NJL000177	Eliana Pintor Marin	Democrat	2012	NJ	29	http://www.njleg.state.nj.us/members/memberphotos/pintor_marin_color.jpg	lower
NJL000180	Carmelo G. Garcia	Democrat	2014	NJ	33	http://www.njleg.state.nj.us/members/memberphotos/garcia_color.jpg	lower
NJL000085	Cleopatra G Tucker	Democrat	2010	NJ	28	http://www.njleg.state.nj.us/members/memberphotos/tucker_color.jpg	lower
NJL000157	Robert D. Clifton	Republican	2012	NJ	12	http://www.njleg.state.nj.us/members/memberphotos/clifton_color.jpg	lower
NJL000184	Vincent Mazzeo	Democrat	2014	NJ	2	http://www.njleg.state.nj.us/members/memberphotos/mazzeo_color.jpg	lower
NJL000179	Maria Rodriguez-Gregg	Republican	2014	NJ	8	http://www.njleg.state.nj.us/members/memberphotos/	lower
NJL000019	Louis D Greenwald	Democrat	2010	NJ	6	http://www.njleg.state.nj.us/members/memberphotos/greenwald_color.jpg	lower
NJL000071	Erik Peterson	Republican	2010	NJ	23	http://www.njleg.state.nj.us/members/memberphotos/peterson_color.jpg	lower
NJL000032	Sean T. Kean	Republican	2010	NJ	30	http://www.njleg.state.nj.us/members/memberphotos/kean_sean_color.jpg	lower
NJL000036	Declan J. O'Scanlon Jr.	Republican	2010	NJ	13	http://www.njleg.state.nj.us/members/memberphotos/oscanlon_color.jpg	lower
NJL000122	David C Russo	Republican	2010	NJ	40	http://www.njleg.state.nj.us/members/memberphotos/russo_color.jpg	lower
NJL000113	Valerie Vainieri Huttle	Democrat	2010	NJ	37	http://www.njleg.state.nj.us/members/memberphotos/huttle_color.jpg	lower
NJL000169	Donna M. Simon	Republican	2012	NJ	16	http://www.njleg.state.nj.us/members/memberphotos/simon_color.jpg	lower
NJL000046	Bonnie Watson Coleman	Democrat	2010	NJ	15	http://www.njleg.state.nj.us/members/memberphotos/watson_coleman_color.jpg	lower
NJL000096	Jason O'Donnell	Democrat	2010	NJ	31	http://www.njleg.state.nj.us/members/memberphotos/odonnell_color.jpg	lower
NJL000064	Jon M Bramnick	Republican	2010	NJ	21	http://www.njleg.state.nj.us/members/memberphotos/bramnick_color.jpg	lower
NJL000176	Parker Space	Republican	2012	NJ	24	http://www.njleg.state.nj.us/members/memberphotos/space_color.jpg	lower
NJL000175	Bob Andrzejczak	Democrat	2012	NJ	1	http://www.njleg.state.nj.us/members/memberphotos/andrzejczak_color.jpg	lower
NJL000166	Marlene Caride	Democrat	2012	NJ	36	http://www.njleg.state.nj.us/members/memberphotos/caride_color.jpg	lower
NJL000170	BettyLou DeCroce	Republican	2012	NJ	26	http://www.njleg.state.nj.us/members/memberphotos/decroce_betty_lou_color.jpg	lower
NJL000059	Craig J Coughlin	Democrat	2010	NJ	19	http://www.njleg.state.nj.us/members/memberphotos/coughlin_color.jpg	lower
NJL000167	Timothy J. Eustace	Democrat	2012	NJ	38	http://www.njleg.state.nj.us/members/memberphotos/eustace_color.jpg	lower
NJL000131	Jack M. Ciattarelli	Republican	2010	NJ	16	http://www.njleg.state.nj.us/members/memberphotos/ciattarelli_color.jpg	lower
NJL000099	Vincent Prieto	Democrat	2010	NJ	32	http://www.njleg.state.nj.us/members/memberphotos/prieto_color.jpg	lower
NJL000171	Gabriela M. Mosquera	Democrat	2012	NJ	4	http://www.njleg.state.nj.us/members/memberphotos/mosquera_color.jpg	lower
NJL000164	Shavonda E. Sumter	Democrat	2012	NJ	35	http://www.njleg.state.nj.us/members/memberphotos/sumter_color.jpg	lower
NJL000123	Scott T Rumana	Republican	2010	NJ	40	http://www.njleg.state.nj.us/members/memberphotos/rumana_color.jpg	lower
NJL000065	Nancy F Munoz	Republican	2010	NJ	21	http://www.njleg.state.nj.us/members/memberphotos/munoz_color.jpg	lower
NJL000037	Caroline Casagrande	Republican	2010	NJ	11	http://www.njleg.state.nj.us/members/memberphotos/casagrande_color.jpg	lower
NJL000168	Holly Schepisi	Republican	2012	NJ	39	http://www.njleg.state.nj.us/members/memberphotos/schepisi_color.jpg	lower
NJL000165	Benjie E. Wimberly	Democrat	2012	NJ	35	http://www.njleg.state.nj.us/members/memberphotos/wimberly_color.jpg	lower
NJL000044	Wayne P DeAngelo	Democrat	2010	NJ	14	http://www.njleg.state.nj.us/members/memberphotos/deangelo_color.jpg	lower
NJL000152	Gregory P. McGuckin	Republican	2012	NJ	10	http://www.njleg.state.nj.us/members/memberphotos/mcguckin_color.jpg	lower
NJL000161	Angelica M. Jimenez	Democrat	2012	NJ	32	http://www.njleg.state.nj.us/members/memberphotos/jimenez_color.jpg	lower
NJL000149	Chris A. Brown	Republican	2012	NJ	2	http://www.njleg.state.nj.us/members/memberphotos/brown_chris_color.jpg	lower
NJL000182	Joseph A. Lagana	Democrat	2014	NJ	38	http://www.njleg.state.nj.us/members/memberphotos/lagana_color.jpg	lower
NJL000181	Robert Auth	Republican	2014	NJ	39	http://www.njleg.state.nj.us/members/memberphotos/auth_color.jpg	lower
NJL000186	Samuel L. Fiocchi	Republican	2014	NJ	1	http://www.njleg.state.nj.us/members/memberphotos/fiocchi_color.jpg	lower
NJL000052	Joseph V Egan	Democrat	2010	NJ	17	http://www.njleg.state.nj.us/members/memberphotos/egan_color.jpg	lower
NJL000150	Christopher J. Brown	Republican	2012	NJ	8	http://www.njleg.state.nj.us/members/memberphotos/brown_c_j_color.jpg	lower
NJL000185	Raj Mukherji	Democrat	2014	NJ	33	http://www.njleg.state.nj.us/members/memberphotos/mukherji_color.jpg	lower
NJL000183	Nancy J. Pinkin	Democrat	2014	NJ	18	http://www.njleg.state.nj.us/members/memberphotos/pinkin_color.jpg	lower
NJL000008	John J. Burzichelli	Democrat	2010	NJ	3	http://www.njleg.state.nj.us/members/memberphotos/burzichelli_color.jpg	lower
NJL000076	Michael Patrick Carroll	Republican	2010	NJ	25	http://www.njleg.state.nj.us/members/memberphotos/carroll_color.jpg	lower
NJL000114	Gordon M Johnson	Democrat	2010	NJ	37	http://www.njleg.state.nj.us/members/memberphotos/johnson_color.jpg	lower
NJL000061	Joseph Cryan	Democrat	2010	NJ	20	http://www.njleg.state.nj.us/members/memberphotos/cryan_color.jpg	lower
NJL000111	Gary S Schaer	Democrat	2010	NJ	36	http://www.njleg.state.nj.us/members/memberphotos/schaer_color.jpg	lower
NJL000018	Pamela R Lampitt	Democrat	2010	NJ	6	http://www.njleg.state.nj.us/members/memberphotos/lampitt_color.jpg	lower
NJL000034	Mary Pat Angelini	Republican	2010	NJ	11	http://www.njleg.state.nj.us/members/memberphotos/angelini_color.jpg	lower
NJL000128	Daniel R. Benson	Democrat	2010	NJ	14	http://www.njleg.state.nj.us/members/memberphotos/benson_color.jpg	lower
NJL000022	Herb Conaway Jr.	Democrat	2010	NJ	7	http://www.njleg.state.nj.us/members/memberphotos/conaway_color.jpg	lower
NJL000068	Jerry Green	Democrat	2010	NJ	22	http://www.njleg.state.nj.us/members/memberphotos/green_color.jpg	lower
NJL000040	Amy H Handlin	Republican	2010	NJ	13	http://www.njleg.state.nj.us/members/memberphotos/handlin_color.jpg	lower
NJL000047	Reed Gusciora	Democrat	2010	NJ	15	http://www.njleg.state.nj.us/members/memberphotos/gusciora_color.jpg	lower
NJL000053	Upendra J Chivukula	Democrat	2010	NJ	17	http://www.njleg.state.nj.us/members/memberphotos/chivukula_color.jpg	lower
NJL000062	Annette Quijano	Democrat	2010	NJ	20	http://www.njleg.state.nj.us/members/memberphotos/quijano_color.jpg	lower
NJL000095	Charles Mainor	Democrat	2010	NJ	31	http://www.njleg.state.nj.us/members/memberphotos/mainor_color.jpg	lower
NJL000014	Gilbert L Wilson	Democrat	2010	NJ	5	http://www.njleg.state.nj.us/members/memberphotos/wilson_color.jpg	lower
NJL000082	John F McKeon	Democrat	2010	NJ	27	http://www.njleg.state.nj.us/members/memberphotos/mckeon_color.jpg	lower
NJL000055	Patrick J Diegnan Jr.	Democrat	2010	NJ	18	http://www.njleg.state.nj.us/members/memberphotos/diegnan_color.jpg	lower
NJL000011	Paul D Moriarty	Democrat	2010	NJ	4	http://www.njleg.state.nj.us/members/memberphotos/moriarty_color.jpg	lower
NJL000009	Celeste M Riley	Democrat	2010	NJ	3	http://www.njleg.state.nj.us/members/memberphotos/riley_color.jpg	lower
NJL000027	Brian E Rumpf	Republican	2010	NJ	9	http://www.njleg.state.nj.us/members/memberphotos/rumpf_color.jpg	lower
NJL000070	John DiMaio	Republican	2010	NJ	23	http://www.njleg.state.nj.us/members/memberphotos/dimaio_color.jpg	lower
NJL000105	Thomas P Giblin	Democrat	2010	NJ	34	http://www.njleg.state.nj.us/members/memberphotos/giblin_color.jpg	lower
NJL000092	Ronald S. Dancer	Republican	2010	NJ	12	http://www.njleg.state.nj.us/members/memberphotos/dancer_color.jpg	lower
NJL000086	Ralph R Caputo	Democrat	2010	NJ	28	http://www.njleg.state.nj.us/members/memberphotos/caputo_color.jpg	lower
NJL000016	Angel Fuentes	Democrat	2010	NJ	5	http://www.njleg.state.nj.us/members/memberphotos/fuentes_color.jpg	lower
NJL000083	Mila M Jasey	Democrat	2010	NJ	27	http://www.njleg.state.nj.us/members/memberphotos/jasey_color.jpg	lower
NJL000033	David P. Rible	Republican	2010	NJ	30	http://www.njleg.state.nj.us/members/memberphotos/rible_color.jpg	lower
NJL000030	David W Wolfe	Republican	2010	NJ	10	http://www.njleg.state.nj.us/members/memberphotos/wolfe_color.jpg	lower
NJL000074	Alison Littell McHose	Republican	2010	NJ	24	http://www.njleg.state.nj.us/members/memberphotos/mchose_color.jpg	lower
NJL000028	DiAnne C Gove	Republican	2010	NJ	9	http://www.njleg.state.nj.us/members/memberphotos/gove_color.jpg	lower
NJL000112	Loretta Weinberg	Democrat	2010	NJ	37	http://www.njleg.state.nj.us/members/memberphotos/weinberg_color.jpg	upper
NJL000060	Raymond J Lesniak	Democrat	2010	NJ	20	http://www.njleg.state.nj.us/members/memberphotos/lesniak_color.jpg	upper
NJL000103	Nia H Gill Esq.	Democrat	2010	NJ	34	http://www.njleg.state.nj.us/members/memberphotos/gill_color.jpg	upper
NJL000007	Stephen M. Sweeney	Democrat	2010	NJ	3	http://www.njleg.state.nj.us/members/memberphotos/sweeney_color.jpg	upper
NJL000031	James W. Holzapfel	Republican	2010	NJ	10	http://www.njleg.state.nj.us/members/memberphotos/holzapfel_color.jpg	upper
NJL000174	Anthony R. Bucco	Republican	2012	NJ	25	http://www.njleg.state.nj.us/members/memberphotos/bucco_a_r_color.jpg	upper
NJL000072	Steven V Oroho	Republican	2010	NJ	24	http://www.njleg.state.nj.us/members/memberphotos/oroho_color.jpg	upper
NJL000063	Thomas H Kean Jr.	Republican	2010	NJ	21	http://www.njleg.state.nj.us/members/memberphotos/kean_tom_color.jpg	upper
NJL000115	Robert M Gordon	Democrat	2010	NJ	38	http://www.njleg.state.nj.us/members/memberphotos/gordon_color.jpg	upper
NJL000109	Paul A Sarlo	Democrat	2010	NJ	36	http://www.njleg.state.nj.us/members/memberphotos/sarlo_color.jpg	upper
NJL000048	Christopher Bateman	Republican	2010	NJ	16	http://www.njleg.state.nj.us/members/memberphotos/bateman_color.jpg	upper
NJL000081	Richard J Codey	Democrat	2010	NJ	27	http://www.njleg.state.nj.us/members/memberphotos/codey_color.jpg	upper
NJL000043	Linda R. Greenstein	Democrat	2010	NJ	14	http://www.njleg.state.nj.us/members/memberphotos/greenstein_color.jpg	upper
NJL000078	Joseph Pennacchio	Republican	2010	NJ	26	http://www.njleg.state.nj.us/members/memberphotos/pennacchio_color.jpg	upper
NJL000097	Nicholas J Sacco	Democrat	2010	NJ	32	http://www.njleg.state.nj.us/members/memberphotos/sacco_color.jpg	upper
NJL000017	James Beach	Democrat	2010	NJ	6	http://www.njleg.state.nj.us/members/memberphotos/beach_color.jpg	upper
NJL000069	Michael J. Doherty	Republican	2010	NJ	23	http://www.njleg.state.nj.us/members/memberphotos/doherty_color.jpg	upper
NJL000087	M. Teresa Ruiz	Democrat	2010	NJ	29	http://www.njleg.state.nj.us/members/memberphotos/ruiz_color.jpg	upper
NJL000045	Shirley K Turner	Democrat	2010	NJ	15	http://www.njleg.state.nj.us/members/memberphotos/turner_color.jpg	upper
NJL000020	Diane B Allen	Republican	2010	NJ	7	http://www.njleg.state.nj.us/members/memberphotos/allen_color.jpg	upper
NJL000084	Ronald L Rice	Democrat	2010	NJ	28	http://www.njleg.state.nj.us/members/memberphotos/rice_color.jpg	upper
NJL000090	Robert W Singer	Republican	2010	NJ	30	http://www.njleg.state.nj.us/members/memberphotos/singer_color.jpg	upper
NJL000057	Joseph F Vitale	Democrat	2010	NJ	19	http://www.njleg.state.nj.us/members/memberphotos/vitale_color.jpg	upper
NJL000004	Jim Whelan	Democrat	2010	NJ	2	http://www.njleg.state.nj.us/members/memberphotos/whelan_color.jpg	upper
NJL000093	Sandra B Cunningham	Democrat	2010	NJ	31	http://www.njleg.state.nj.us/members/memberphotos/cunningham_color.jpg	upper
NJL000107	Nellie Pou	Democrat	2010	NJ	35	http://www.njleg.state.nj.us/members/memberphotos/pou_color.jpg	upper
NJL000038	Joseph M Kyrillos Jr.	Republican	2010	NJ	13	http://www.njleg.state.nj.us/members/memberphotos/kyrillos_color.jpg	upper
NJL000035	Jennifer Beck	Republican	2010	NJ	11	http://www.njleg.state.nj.us/members/memberphotos/beck_color.jpg	upper
NJL000026	Christopher J Connors	Republican	2010	NJ	9	http://www.njleg.state.nj.us/members/memberphotos/connors_chris_color.jpg	upper
NJL000100	Brian P Stack	Democrat	2010	NJ	33	http://www.njleg.state.nj.us/members/memberphotos/stack_color.jpg	upper
NJL000001	Jeff Van Drew	Democrat	2010	NJ	1	http://www.njleg.state.nj.us/members/memberphotos/vandrew_color.jpg	upper
NJL000013	Donald Norcross	Democrat	2010	NJ	5	http://www.njleg.state.nj.us/members/memberphotos/norcross_color.jpg	upper
NJL000118	Gerald Cardinale	Republican	2010	NJ	39	http://www.njleg.state.nj.us/members/memberphotos/cardinale_bw.jpg	upper
NJL000121	Kevin J O'Toole	Republican	2010	NJ	40	http://www.njleg.state.nj.us/members/memberphotos/otoole_color.jpg	upper
NJL000066	Nicholas P Scutari	Democrat	2010	NJ	22	http://www.njleg.state.nj.us/members/memberphotos/scutari_color.jpg	upper
NJL000051	Bob Smith	Democrat	2010	NJ	17	http://www.njleg.state.nj.us/members/memberphotos/smith_color.jpg	upper
NJL000056	Peter J Barnes III	Democrat	2010	NJ	18	http://www.njleg.state.nj.us/members/memberphotos/barnes_color.jpg	upper
NJL000039	Samuel D. Thompson	Republican	2010	NJ	12	http://www.njleg.state.nj.us/members/memberphotos/thompson_color.jpg	upper
NJL000024	Dawn Marie Addiego	Republican	2010	NJ	8	http://www.njleg.state.nj.us/members/memberphotos/addiego_color.jpg	upper
\\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: newsoap; Owner: postgres
--

COPY posts (id, title, body, created, modified) FROM stdin;
11	Test	Test	2014-08-06	2014-08-06
1	test	test	2014-08-06	2014-08-06
2	Testing	Test	2014-09-04	2014-09-04
\\.


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('posts_id_seq', 2, true);


--
-- Data for Name: regulates; Type: TABLE DATA; Schema: newsoap; Owner: postgres
--

COPY regulates (bill_id, cas_no) FROM stdin;
\\.


--
-- Data for Name: sources; Type: TABLE DATA; Schema: newsoap; Owner: postgres
--

COPY sources (source_id, source_name, trusted_or_user) FROM stdin;
\\.


--
-- Data for Name: standards; Type: TABLE DATA; Schema: newsoap; Owner: postgres
--

COPY standards (standard_no, cas_no, state_soil, federal_soil, state_water, federal_water) FROM stdin;
\\.


--
-- Data for Name: uploads; Type: TABLE DATA; Schema: newsoap; Owner: postgres
--

COPY uploads (name, date) FROM stdin;
\\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: newsoap; Owner: postgres
--

COPY users (id, username, password, created, modified, role, facebook_id, uid) FROM stdin;
111	Duchesd1	2acf80a85ddc0cd3ffb68d8885fb0487cda32c09	2014-07-28	2014-07-28	\N	\N	\N
112	smp	96e04f5c1e86366a0244dc578d897b0af5021c87	2014-07-28	2014-07-28	\N	\N	\N
114	duchesd1	8ee56a3fe11b07e94a9712d2de920c980633e9d7	2014-08-06	2014-08-06	\N	\N	\N
116	Derek Duchesne	dae985ed19d29056586538ece068c05466e71c12	2014-08-07	2014-08-07	user	684374648322536	\N
117	Kpearson	0b130baa679694ea04e2ad5d3fbd6268a6ad513d	2014-08-13	2014-08-13	\N	\N	\N
118	letsTryIt	e0734a46c0a73d5103c8300ae87ecfba57002d21	2014-09-01	2014-09-01	\N	\N	\N
119	evansk6	dfc740891b63e1d700674ef44e4994d5b4c0c2bb	2014-09-02	2014-09-02	\N	\N	\N
120	letstryit	e0734a46c0a73d5103c8300ae87ecfba57002d21	2014-09-02	2014-09-02	\N	\N	\N
121	letstryit	0204adbee2c75db14fcf343b43df8ecb5fb63ab8	2014-09-02	2014-09-02	\N	\N	\N
122	evansk6	dfc740891b63e1d700674ef44e4994d5b4c0c2bb	2014-09-02	2014-09-02	\N	\N	\N
123	evansk6	dfc740891b63e1d700674ef44e4994d5b4c0c2bb	2014-09-02	2014-09-02	\N	\N	\N
124	evansk6	dfc740891b63e1d700674ef44e4994d5b4c0c2bb	2014-09-02	2014-09-02	\N	\N	\N
125	letstryit	e0734a46c0a73d5103c8300ae87ecfba57002d21	2014-09-04	2014-09-04	\N	\N	\N
126	hola	8ae2cf1a4d3b8cb7129987f6ebbaae54d58ac22e	2014-09-04	2014-09-04	\N	\N	\N
127	hola	7752d90e4d73ebb6d90835097b66eefd0101bee3	2014-09-04	2014-09-04	\N	\N	\N
128	hola	8ae2cf1a4d3b8cb7129987f6ebbaae54d58ac22e	2014-09-04	2014-09-04	\N	\N	\N
129	hola	8ae2cf1a4d3b8cb7129987f6ebbaae54d58ac22e	2014-09-04	2014-09-04	\N	\N	\N
130	hola	8ae2cf1a4d3b8cb7129987f6ebbaae54d58ac22e	2014-09-04	2014-09-04	\N	\N	\N
131	hola	403977e5a3c3ebef2ba30796cd59cd326ea81550	2014-09-04	2014-09-04	\N	\N	\N
132	hola	79921993ba94fbab69586ad129b770b136ffb177	2014-09-04	2014-09-04	\N	\N	\N
133	hola	486703c92d60682db8e3599aba7513ec4dc757d2	2014-09-04	2014-09-04	\N	\N	\N
134	pulimoodisdope	b24c06363d81465ea526df73a42ec4e69f385e86	2014-09-04	2014-09-04	\N	\N	\N
135	pulimoodisdope	b24c06363d81465ea526df73a42ec4e69f385e86	2014-09-04	2014-09-04	\N	\N	\N
136	hola	8ae2cf1a4d3b8cb7129987f6ebbaae54d58ac22e	2014-09-08	2014-09-08	\N	\N	\N
137	hola	8ae2cf1a4d3b8cb7129987f6ebbaae54d58ac22e	2014-09-08	2014-09-08	\N	\N	\N
138	hola	8ae2cf1a4d3b8cb7129987f6ebbaae54d58ac22e	2014-09-08	2014-09-08	\N	\N	\N
139	hola	8ae2cf1a4d3b8cb7129987f6ebbaae54d58ac22e	2014-09-08	2014-09-08	\N	\N	\N
140	hola	8ae2cf1a4d3b8cb7129987f6ebbaae54d58ac22e	2014-09-08	2014-09-08	\N	\N	\N
141	gouldn1	91947e507be31b13b04c747f5f67a8882a36100b	2014-09-11	2014-09-11	\N	\N	\N
142	gouldnathan0	91947e507be31b13b04c747f5f67a8882a36100b	2014-09-11	2014-09-11	\N	\N	\N
143	clewsa1	d974418e9a9026c820fe5bfe52e7a4a7da3c28ca	2014-09-25	2014-09-25	\N	\N	\N
\\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Data for Name: votes_on; Type: TABLE DATA; Schema: newsoap; Owner: postgres
--

COPY votes_on (bill_id, congress_id, vote_type, date_voted_on) FROM stdin;
\\.


--
-- Name: Bill_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bills
    ADD CONSTRAINT \"Bill_pkey\" PRIMARY KEY (bill_id);


--
-- Name: Brownfield_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY facilities
    ADD CONSTRAINT \"Brownfield_pkey\" PRIMARY KEY (id);


--
-- Name: Chemical_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY chemicals
    ADD CONSTRAINT \"Chemical_pkey\" PRIMARY KEY (id);


--
-- Name: Contains_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contains
    ADD CONSTRAINT \"Contains_pkey\" PRIMARY KEY (facility_id, chemical_id);


--
-- Name: Contributed_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contributed
    ADD CONSTRAINT \"Contributed_pkey\" PRIMARY KEY (facility_id);


--
-- Name: Location_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT \"Location_pkey\" PRIMARY KEY (id);


--
-- Name: NNData_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY nn_data
    ADD CONSTRAINT \"NNData_pkey\" PRIMARY KEY (facility_id);


--
-- Name: Owned_By_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY owned_by
    ADD CONSTRAINT \"Owned_By_pkey\" PRIMARY KEY (owner_id, facility_id);


--
-- Name: Owner_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY owners
    ADD CONSTRAINT \"Owner_pkey\" PRIMARY KEY (id);


--
-- Name: Politician_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY politicians
    ADD CONSTRAINT \"Politician_pkey\" PRIMARY KEY (congress_id);


--
-- Name: Regulates_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY regulates
    ADD CONSTRAINT \"Regulates_pkey\" PRIMARY KEY (bill_id, cas_no);


--
-- Name: Source_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sources
    ADD CONSTRAINT \"Source_pkey\" PRIMARY KEY (source_id);


--
-- Name: Standards_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY standards
    ADD CONSTRAINT \"Standards_pkey\" PRIMARY KEY (standard_no);


--
-- Name: Votes_On_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY votes_on
    ADD CONSTRAINT \"Votes_On_pkey\" PRIMARY KEY (bill_id, congress_id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: posts_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: uploads_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY uploads
    ADD CONSTRAINT uploads_pkey PRIMARY KEY (name, date);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: Brownfield_Address_fkey; Type: FK CONSTRAINT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY facilities
    ADD CONSTRAINT \"Brownfield_Address_fkey\" FOREIGN KEY (location_id) REFERENCES locations(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Contains_Brownfield_ID_fkey; Type: FK CONSTRAINT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY contains
    ADD CONSTRAINT \"Contains_Brownfield_ID_fkey\" FOREIGN KEY (facility_id) REFERENCES facilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Contains_Cas_No_fkey; Type: FK CONSTRAINT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY contains
    ADD CONSTRAINT \"Contains_Cas_No_fkey\" FOREIGN KEY (chemical_id) REFERENCES chemicals(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Contributed_Brownfield_ID_fkey; Type: FK CONSTRAINT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY contributed
    ADD CONSTRAINT \"Contributed_Brownfield_ID_fkey\" FOREIGN KEY (facility_id) REFERENCES facilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Contributed_Source_ID_fkey; Type: FK CONSTRAINT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY contributed
    ADD CONSTRAINT \"Contributed_Source_ID_fkey\" FOREIGN KEY (source_id) REFERENCES sources(source_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: NNData_NN_ID_fkey; Type: FK CONSTRAINT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY nn_data
    ADD CONSTRAINT \"NNData_NN_ID_fkey\" FOREIGN KEY (facility_id) REFERENCES facilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Owned_By_Brownfield_ID_fkey; Type: FK CONSTRAINT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY owned_by
    ADD CONSTRAINT \"Owned_By_Brownfield_ID_fkey\" FOREIGN KEY (facility_id) REFERENCES facilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Owned_By_Owner_ID_fkey; Type: FK CONSTRAINT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY owned_by
    ADD CONSTRAINT \"Owned_By_Owner_ID_fkey\" FOREIGN KEY (owner_id) REFERENCES owners(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Regulates_Bill_ID_fkey; Type: FK CONSTRAINT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY regulates
    ADD CONSTRAINT \"Regulates_Bill_ID_fkey\" FOREIGN KEY (bill_id) REFERENCES bills(bill_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Regulates_Cas_No_fkey; Type: FK CONSTRAINT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY regulates
    ADD CONSTRAINT \"Regulates_Cas_No_fkey\" FOREIGN KEY (cas_no) REFERENCES chemicals(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Votes_On_Bill_ID_fkey; Type: FK CONSTRAINT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY votes_on
    ADD CONSTRAINT \"Votes_On_Bill_ID_fkey\" FOREIGN KEY (bill_id) REFERENCES bills(bill_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Votes_On_Congress_ID_fkey; Type: FK CONSTRAINT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY votes_on
    ADD CONSTRAINT \"Votes_On_Congress_ID_fkey\" FOREIGN KEY (congress_id) REFERENCES politicians(congress_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--")


  

end
	










 








 


