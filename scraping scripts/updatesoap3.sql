--
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

CREATE SEQUENCE "Bill_Bill_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsoap."Bill_Bill_ID_seq" OWNER TO postgres;

--
-- Name: Bill_Bill_ID_seq; Type: SEQUENCE OWNED BY; Schema: newsoap; Owner: postgres
--

ALTER SEQUENCE "Bill_Bill_ID_seq" OWNED BY bills.bill_id;


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

CREATE SEQUENCE "Brownfield_Brownfield_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsoap."Brownfield_Brownfield_ID_seq" OWNER TO postgres;

--
-- Name: Brownfield_Brownfield_ID_seq; Type: SEQUENCE OWNED BY; Schema: newsoap; Owner: postgres
--

ALTER SEQUENCE "Brownfield_Brownfield_ID_seq" OWNED BY facilities.id;


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

CREATE SEQUENCE "Contributed_Brownfield_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsoap."Contributed_Brownfield_ID_seq" OWNER TO postgres;

--
-- Name: Contributed_Brownfield_ID_seq; Type: SEQUENCE OWNED BY; Schema: newsoap; Owner: postgres
--

ALTER SEQUENCE "Contributed_Brownfield_ID_seq" OWNED BY contributed.facility_id;


--
-- Name: Contributed_Source_ID_seq; Type: SEQUENCE; Schema: newsoap; Owner: postgres
--

CREATE SEQUENCE "Contributed_Source_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsoap."Contributed_Source_ID_seq" OWNER TO postgres;

--
-- Name: Contributed_Source_ID_seq; Type: SEQUENCE OWNED BY; Schema: newsoap; Owner: postgres
--

ALTER SEQUENCE "Contributed_Source_ID_seq" OWNED BY contributed.source_id;


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

CREATE SEQUENCE "NNData_Dangerous_State_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsoap."NNData_Dangerous_State_seq" OWNER TO postgres;

--
-- Name: NNData_Dangerous_State_seq; Type: SEQUENCE OWNED BY; Schema: newsoap; Owner: postgres
--

ALTER SEQUENCE "NNData_Dangerous_State_seq" OWNED BY nn_data.dangerous_state;


--
-- Name: NNData_Latitude_seq; Type: SEQUENCE; Schema: newsoap; Owner: postgres
--

CREATE SEQUENCE "NNData_Latitude_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsoap."NNData_Latitude_seq" OWNER TO postgres;

--
-- Name: NNData_Latitude_seq; Type: SEQUENCE OWNED BY; Schema: newsoap; Owner: postgres
--

ALTER SEQUENCE "NNData_Latitude_seq" OWNED BY nn_data.latitude;


--
-- Name: NNData_Longitude_seq; Type: SEQUENCE; Schema: newsoap; Owner: postgres
--

CREATE SEQUENCE "NNData_Longitude_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsoap."NNData_Longitude_seq" OWNER TO postgres;

--
-- Name: NNData_Longitude_seq; Type: SEQUENCE OWNED BY; Schema: newsoap; Owner: postgres
--

ALTER SEQUENCE "NNData_Longitude_seq" OWNED BY nn_data.longitude;


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

CREATE SEQUENCE "Owner_Owner_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsoap."Owner_Owner_ID_seq" OWNER TO postgres;

--
-- Name: Owner_Owner_ID_seq; Type: SEQUENCE OWNED BY; Schema: newsoap; Owner: postgres
--

ALTER SEQUENCE "Owner_Owner_ID_seq" OWNED BY owners.id;


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

COMMENT ON COLUMN politicians.chamber IS '"upper" for Senate and "lower" for Representative';


--
-- Name: Politician_Congress_ID_seq; Type: SEQUENCE; Schema: newsoap; Owner: postgres
--

CREATE SEQUENCE "Politician_Congress_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsoap."Politician_Congress_ID_seq" OWNER TO postgres;

--
-- Name: Politician_Congress_ID_seq; Type: SEQUENCE OWNED BY; Schema: newsoap; Owner: postgres
--

ALTER SEQUENCE "Politician_Congress_ID_seq" OWNED BY politicians.congress_id;


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

CREATE SEQUENCE "Source_Source_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsoap."Source_Source_ID_seq" OWNER TO postgres;

--
-- Name: Source_Source_ID_seq; Type: SEQUENCE OWNED BY; Schema: newsoap; Owner: postgres
--

ALTER SEQUENCE "Source_Source_ID_seq" OWNED BY sources.source_id;


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

CREATE SEQUENCE "Standards_Standard_No_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsoap."Standards_Standard_No_seq" OWNER TO postgres;

--
-- Name: Standards_Standard_No_seq; Type: SEQUENCE OWNED BY; Schema: newsoap; Owner: postgres
--

ALTER SEQUENCE "Standards_Standard_No_seq" OWNED BY standards.standard_no;


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

CREATE SEQUENCE "Votes_On_Bill_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsoap."Votes_On_Bill_ID_seq" OWNER TO postgres;

--
-- Name: Votes_On_Bill_ID_seq; Type: SEQUENCE OWNED BY; Schema: newsoap; Owner: postgres
--

ALTER SEQUENCE "Votes_On_Bill_ID_seq" OWNED BY votes_on.bill_id;


--
-- Name: Votes_On_Congress_ID_seq; Type: SEQUENCE; Schema: newsoap; Owner: postgres
--

CREATE SEQUENCE "Votes_On_Congress_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsoap."Votes_On_Congress_ID_seq" OWNER TO postgres;

--
-- Name: Votes_On_Congress_ID_seq; Type: SEQUENCE OWNED BY; Schema: newsoap; Owner: postgres
--

ALTER SEQUENCE "Votes_On_Congress_ID_seq" OWNED BY votes_on.congress_id;


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

ALTER TABLE ONLY facilities ALTER COLUMN id SET DEFAULT nextval('"Brownfield_Brownfield_ID_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY owners ALTER COLUMN id SET DEFAULT nextval('"Owner_Owner_ID_seq"'::regclass);


--
-- Name: source_id; Type: DEFAULT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY sources ALTER COLUMN source_id SET DEFAULT nextval('"Source_Source_ID_seq"'::regclass);


--
-- Name: standard_no; Type: DEFAULT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY standards ALTER COLUMN standard_no SET DEFAULT nextval('"Standards_Standard_No_seq"'::regclass);


--
-- Name: Bill_Bill_ID_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('"Bill_Bill_ID_seq"', 1, false);


--
-- Name: Brownfield_Brownfield_ID_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('"Brownfield_Brownfield_ID_seq"', 2, true);


--
-- Name: Contributed_Brownfield_ID_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('"Contributed_Brownfield_ID_seq"', 1, false);


--
-- Name: Contributed_Source_ID_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('"Contributed_Source_ID_seq"', 1, false);


--
-- Name: NNData_Dangerous_State_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('"NNData_Dangerous_State_seq"', 1, false);


--
-- Name: NNData_Latitude_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('"NNData_Latitude_seq"', 1, false);


--
-- Name: NNData_Longitude_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('"NNData_Longitude_seq"', 1, false);


--
-- Name: Owner_Owner_ID_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('"Owner_Owner_ID_seq"', 7189, true);


--
-- Name: Politician_Congress_ID_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('"Politician_Congress_ID_seq"', 1, false);


--
-- Name: Source_Source_ID_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('"Source_Source_ID_seq"', 1, false);


--
-- Name: Standards_Standard_No_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('"Standards_Standard_No_seq"', 1, false);


--
-- Name: Votes_On_Bill_ID_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('"Votes_On_Bill_ID_seq"', 1, false);


--
-- Name: Votes_On_Congress_ID_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('"Votes_On_Congress_ID_seq"', 1, false);


--
-- Data for Name: bills; Type: TABLE DATA; Schema: newsoap; Owner: postgres
--

COPY newsoap.bills (bill_id, pass_status, topic) FROM stdin;
\.
--
-- Data for Name: chemicals; Type: TABLE DATA; Schema: newsoap; Owner: postgres
--

COPY newsoap.chemicals (id, chemical_name, carcinogenic, clean_air_act, metal, pbt) FROM stdin;
100016	P-NITROANILINE	NO	NO	NO	NON_PBT
100027	4-NITROPHENOL	YES	YES	YES	NON_PBT
100254	P-DINITROBENZENE	NO	NO	NO	NON_PBT
10028156	OZONE	NO	NO	NO	NON_PBT
100414	ETHYLBENZENE	YES	YES	YES	NON_PBT
100425	STYRENE	YES	YES	YES	NON_PBT
100447	BENZYL CHLORIDE	YES	YES	YES	NON_PBT
10049044	CHLORINE DIOXIDE	NO	NO	NO	NON_PBT
101144	4,4'-METHYLENEBIS(2-CHLOROANILINE)	YES	YES	YES	NON_PBT
101906	DIGLYCIDYL RESORCINOL ETHER	NO	NO	NO	NON_PBT
106503	P-PHENYLENEDIAMINE	YES	YES	YES	NON_PBT
106898	EPICHLOROHYDRIN	YES	YES	YES	NON_PBT
106990	1,3-BUTADIENE	YES	YES	YES	NON_PBT
107051	ALLYL CHLORIDE	YES	YES	YES	NON_PBT
107131	ACRYLONITRILE	YES	YES	YES	NON_PBT
107197	PROPARGYL ALCOHOL	NO	NO	NO	NON_PBT
107211	ETHYLENE GLYCOL	YES	YES	YES	NON_PBT
108054	VINYL ACETATE	YES	YES	YES	NON_PBT
108101	METHYL ISOBUTYL KETONE	YES	YES	YES	NON_PBT
108316	MALEIC ANHYDRIDE	YES	YES	YES	NON_PBT
108452	1,3-PHENYLENEDIAMINE	NO	NO	NO	NON_PBT
108883	TOLUENE	YES	YES	YES	NON_PBT
108930	CYCLOHEXANOL	NO	NO	NO	NON_PBT
108952	PHENOL	YES	YES	YES	NON_PBT
110543	N-HEXANE	YES	YES	YES	NON_PBT
110827	CYCLOHEXANE	NO	NO	NO	NON_PBT
110861	PYRIDINE	NO	NO	NO	NON_PBT
111422	DIETHANOLAMINE	YES	YES	YES	NON_PBT
115071	PROPYLENE	NO	NO	NO	NON_PBT
116143	TETRAFLUOROETHYLENE	NO	NO	NO	NON_PBT
1163195	DECABROMODIPHENYL OXIDE	NO	NO	NO	NON_PBT
117817	DI(2-ETHYLHEXYL) PHTHALATE	YES	YES	YES	NON_PBT
120809	CATECHOL	YES	YES	YES	NON_PBT
121448	TRIETHYLAMINE	YES	YES	YES	NON_PBT
123386	PROPIONALDEHYDE	YES	YES	YES	NON_PBT
123911	1,4-DIOXANE	YES	YES	YES	NON_PBT
124403	DIMETHYLAMINE	NO	NO	NO	NON_PBT
127184	TETRACHLOROETHYLENE	YES	YES	YES	NON_PBT
131113	DIMETHYL PHTHALATE	YES	YES	YES	NON_PBT
1330207	XYLENE (MIXED ISOMERS)	YES	YES	YES	NON_PBT
1336363	POLYCHLORINATED BIPHENYLS	YES	YES	YES	PBT
140885	ETHYL ACRYLATE	YES	YES	YES	NON_PBT
141322	BUTYL ACRYLATE	NO	NO	NO	NON_PBT
1634044	METHYL TERT-BUTYL ETHER	YES	YES	YES	NON_PBT
1717006	1,1-DICHLORO-1-FLUOROETHANE	NO	NO	NO	NON_PBT
191242	BENZO(G,H,I)PERYLENE	YES	YES	YES	PBT
25376458	DIAMINOTOLUENE (MIXED ISOMERS)	NO	NO	NO	NON_PBT
26471625	TOLUENE DIISOCYANATE (MIXED ISOMERS)	NO	NO	NO	NON_PBT
2837890	2-CHLORO-1,1,1,2-TETRAFLUOROETHANE	NO	NO	NO	NON_PBT
302012	HYDRAZINE	YES	YES	YES	NON_PBT
306832	2,2-DICHLORO-1,1,1-TRIFLUOROETHANE	NO	NO	NO	NON_PBT
354256	1-CHLORO-1,1,2,2-TETRAFLUOROETHANE	NO	NO	NO	NON_PBT
50000	FORMALDEHYDE	YES	YES	YES	NON_PBT
51285	2,4-DINITROPHENOL	YES	YES	YES	NON_PBT
528290	O-DINITROBENZENE	NO	NO	NO	NON_PBT
55406536	3-IODO-2-PROPYNYL BUTYLCARBAMATE	NO	NO	NO	NON_PBT
554132	LITHIUM CARBONATE	NO	NO	NO	NON_PBT
57330	PENTOBARBITAL SODIUM	NO	NO	NO	NON_PBT
584849	TOLUENE-2,4-DIISOCYANATE	YES	YES	YES	NON_PBT
62533	ANILINE	YES	YES	YES	NON_PBT
64186	FORMIC ACID	NO	NO	NO	NON_PBT
67561	METHANOL	YES	YES	YES	NON_PBT
67630	ISOPROPYL ALCOHOL (MANUFACTURING,STRONG-ACID PROCESS ONLY,NO SUPPLIER)	NO	NO	NO	NON_PBT
67663	CHLOROFORM	YES	YES	YES	NON_PBT
67721	HEXACHLOROETHANE	YES	YES	YES	NON_PBT
68122	N,N-DIMETHYLFORMAMIDE	YES	YES	YES	NON_PBT
71363	N-BUTYL ALCOHOL	NO	NO	NO	NON_PBT
71432	BENZENE	YES	YES	YES	NON_PBT
71556	1,1,1-TRICHLOROETHANE	YES	YES	YES	NON_PBT
7429905	ALUMINUM (FUME OR DUST)	NO	NO	NO	NON_PBT
7439921	LEAD	YES	YES	YES	PBT
7439965	MANGANESE	YES	YES	YES	NON_PBT
7439976	MERCURY	YES	YES	YES	PBT
7440020	NICKEL	YES	YES	YES	NON_PBT
7440224	SILVER	NO	NO	NO	NON_PBT
7440360	ANTIMONY	YES	YES	YES	NON_PBT
7440473	CHROMIUM	YES	YES	YES	NON_PBT
7440484	COBALT	YES	YES	YES	NON_PBT
7440508	COPPER	NO	NO	NO	NON_PBT
7440666	ZINC (FUME OR DUST)	NO	NO	NO	NON_PBT
74851	ETHYLENE	NO	NO	NO	NON_PBT
74873	CHLOROMETHANE	YES	YES	YES	NON_PBT
74908	HYDROGEN CYANIDE	NO	NO	NO	NON_PBT
75003	CHLOROETHANE	YES	YES	YES	NON_PBT
75014	VINYL CHLORIDE	YES	YES	YES	NON_PBT
75058	ACETONITRILE	YES	YES	YES	NON_PBT
75070	ACETALDEHYDE	YES	YES	YES	NON_PBT
75092	DICHLOROMETHANE	YES	YES	YES	NON_PBT
75218	ETHYLENE OXIDE	YES	YES	YES	NON_PBT
75354	VINYLIDENE CHLORIDE	YES	YES	YES	NON_PBT
75445	PHOSGENE	YES	YES	YES	NON_PBT
75456	CHLORODIFLUOROMETHANE	NO	NO	NO	NON_PBT
7550450	TITANIUM TETRACHLORIDE	YES	YES	YES	NON_PBT
75569	PROPYLENE OXIDE	YES	YES	YES	NON_PBT
75650	TERT-BUTYL ALCOHOL	NO	NO	NO	NON_PBT
75683	1-CHLORO-1,1-DIFLUOROETHANE	NO	NO	NO	NON_PBT
75694	TRICHLOROFLUOROMETHANE	NO	NO	NO	NON_PBT
75718	DICHLORODIFLUOROMETHANE	NO	NO	NO	NON_PBT
75887	2-CHLORO-1,1,1-TRIFLUOROETHANE	NO	NO	NO	NON_PBT
76142	DICHLOROTETRAFLUOROETHANE (CFC-114)	NO	NO	NO	NON_PBT
76153	MONOCHLOROPENTAFLUOROETHANE	NO	NO	NO	NON_PBT
7632000	SODIUM NITRITE	NO	NO	NO	NON_PBT
7647010	HYDROCHLORIC ACID (1995 AND AFTER ACID AEROSOLS" ONLY)"	YES	YES	YES	NON_PBT
7664393	HYDROGEN FLUORIDE	YES	YES	YES	NON_PBT
7664417	AMMONIA	NO	NO	NO	NON_PBT
7664939	SULFURIC ACID (1994 AND AFTER ACID AEROSOLS" ONLY)"	NO	NO	NO	NON_PBT
7697372	NITRIC ACID	NO	NO	NO	NON_PBT
7723140	PHOSPHORUS (YELLOW OR WHITE)	YES	YES	YES	NON_PBT
77736	DICYCLOPENTADIENE	NO	NO	NO	NON_PBT
7782505	CHLORINE	YES	YES	YES	NON_PBT
7783064	HYDROGEN SULFIDE	YES	YES	YES	NON_PBT
78922	SEC-BUTYL ALCOHOL	NO	NO	NO	NON_PBT
79016	TRICHLOROETHYLENE	YES	YES	YES	NON_PBT
79061	ACRYLAMIDE	YES	YES	YES	NON_PBT
79107	ACRYLIC ACID	YES	YES	YES	NON_PBT
79210	PERACETIC ACID	NO	NO	NO	NON_PBT
79947	TETRABROMOBISPHENOL A	NO	NO	NO	PBT
8001589	CREOSOTE	NO	NO	NO	NON_PBT
80057	4,4'-ISOPROPYLIDENEDIPHENOL	NO	NO	NO	NON_PBT
80626	METHYL METHACRYLATE	YES	YES	YES	NON_PBT
84742	DIBUTYL PHTHALATE	YES	YES	YES	NON_PBT
85449	PHTHALIC ANHYDRIDE	YES	YES	YES	NON_PBT
872504	N-METHYL-2-PYRROLIDONE	NO	NO	NO	NON_PBT
88891	PICRIC ACID	NO	NO	NO	NON_PBT
90437	2-PHENYLPHENOL	NO	NO	NO	NON_PBT
91203	NAPHTHALENE	YES	YES	YES	NON_PBT
924425	N-METHYLOLACRYLAMIDE	NO	NO	NO	NON_PBT
94360	BENZOYL PEROXIDE	NO	NO	NO	NON_PBT
95476	O-XYLENE	YES	YES	YES	NON_PBT
95545	1,2-PHENYLENEDIAMINE	NO	NO	NO	NON_PBT
95636	1,2,4-TRIMETHYLBENZENE	NO	NO	NO	NON_PBT
96333	METHYL ACRYLATE	NO	NO	NO	NON_PBT
98828	CUMENE	YES	YES	YES	NON_PBT
98873	BENZAL CHLORIDE	NO	NO	NO	NON_PBT
98884	BENZOYL CHLORIDE	NO	NO	NO	NON_PBT
98953	NITROBENZENE	YES	YES	YES	NON_PBT
99650	M-DINITROBENZENE	NO	NO	NO	NON_PBT
N010	ANTIMONY COMPOUNDS	YES	YES	YES	NON_PBT
N020	ARSENIC COMPOUNDS	YES	YES	YES	NON_PBT
N040	BARIUM COMPOUNDS	NO	NO	NO	NON_PBT
N078	CADMIUM COMPOUNDS	YES	YES	YES	NON_PBT
N090	CHROMIUM COMPOUNDS(EXCEPT CHROMITE ORE MINED IN THE TRANSVAAL REGION)	YES	YES	YES	NON_PBT
N096	COBALT COMPOUNDS	YES	YES	YES	NON_PBT
N100	COPPER COMPOUNDS	NO	NO	NO	NON_PBT
N106	CYANIDE COMPOUNDS	YES	YES	YES	NON_PBT
N120	DIISOCYANATES	YES	YES	YES	NON_PBT
N150	DIOXIN AND DIOXIN-LIKE COMPOUNDS	YES	YES	YES	NON_PBT
N230	CERTAIN GLYCOL ETHERS	YES	YES	YES	NON_PBT
N420	LEAD COMPOUNDS	YES	YES	YES	PBT
N450	MANGANESE COMPOUNDS	YES	YES	YES	NON_PBT
N458	MERCURY COMPOUNDS	YES	YES	YES	PBT
N495	NICKEL COMPOUNDS	YES	YES	YES	NON_PBT
N511	NITRATE COMPOUNDS	NO	NO	NO	NON_PBT
N583	POLYCHLORINATED ALKANES	NO	NO	NO	NON_PBT
N590	POLYCYCLIC AROMATIC COMPOUNDS	YES	YES	YES	PBT
N740	SILVER COMPOUNDS	NO	NO	NO	NON_PBT
N770	VANADIUM COMPOUNDS	NO	NO	NO	NON_PBT
N982	ZINC COMPOUNDS	NO	NO	NO	NON_PBT
\.

--
-- Data for Name: comments; Type: TABLE DATA; Schema: newsoap; Owner: postgres
--

COPY newsoap.comments (id, post_id, name, email, text, created) FROM stdin;
\.
--
-- Data for Name: contains; Type: TABLE DATA; Schema: newsoap; Owner: postgres
--

COPY newsoap.contains (facility_id, chemical_id, total_amount, fugair_amount, water_amount, 
			stackair_amount) FROM stdin;
07001PLTLB267HO	111422	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07001PRDSL211RA	107211	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07001PRDSL211RA	108883	145 Pounds	109 Pounds	109 Pounds	109 Pounds	
07001PRDSL211RA	108930	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07001PRDSL211RA	110543	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07001PRDSL211RA	110827	340 Pounds	255 Pounds	255 Pounds	255 Pounds	
07001PRDSL211RA	117817	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07001PRDSL211RA	1634044	747 Pounds	560 Pounds	560 Pounds	560 Pounds	
07001PRDSL211RA	67561	155 Pounds	116 Pounds	116 Pounds	116 Pounds	
07001PRDSL211RA	68122	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07001PRDSL211RA	75092	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07001PRDSL211RA	75650	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07001PRDSL211RA	872504	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07001PRDSL211RA	95636	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07001PRDSL211RA	N230	39 Pounds	29 Pounds	29 Pounds	29 Pounds	
07001THPRC100ES	N230	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07002BYNNN141HD	7664417	85121 Pounds	84871 Pounds	84871 Pounds	84871 Pounds	
07002BYNNN141HD	N590	35.1 Pounds	35.1 Pounds	35.1 Pounds	35.1 Pounds	
07002KNRCH140E2	N420	13.7 Pounds	0.55 Pounds	0.55 Pounds	0.55 Pounds	
07002NRTNS148EA	100425	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07002NRTNS148EA	108054	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07002NRTNS148EA	141322	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07002NRTNS148EA	80626	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07002NRTNS148EA	N230	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07003BNKSB24FED	N120	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07003CMFRN13DEW	7664417	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07003GNRLP55LAF	67561	3606 Pounds	1697 Pounds	1697 Pounds	1697 Pounds	
07004CRMCM206RT	N450	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07004CRMCM206RT	N982	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07005DRNNC94FAN	67561	438 Pounds	350 Pounds	350 Pounds	350 Pounds	
07005RFLLC353PO	N420	1.4 Pounds	1 Pounds	1 Pounds	1 Pounds	
07006CNSTN17COM	108101	3114 Pounds	3114 Pounds	3114 Pounds	3114 Pounds	
07008MCLC0760RO	100414	114 Pounds	37 Pounds	37 Pounds	37 Pounds	
07008MCLC0760RO	108883	1560 Pounds	936 Pounds	936 Pounds	936 Pounds	
07008MCLC0760RO	110543	6208 Pounds	4562 Pounds	4562 Pounds	4562 Pounds	
07008MCLC0760RO	1330207	842 Pounds	312 Pounds	312 Pounds	312 Pounds	
07008MCLC0760RO	191242	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07008MCLC0760RO	71432	649 Pounds	460 Pounds	460 Pounds	460 Pounds	
07008MCLC0760RO	7439976	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07008MCLC0760RO	91203	27 Pounds	7 Pounds	7 Pounds	7 Pounds	
07008MCLC0760RO	95636	55 Pounds	8 Pounds	8 Pounds	8 Pounds	
07008MCLC0760RO	N420	0.92 Pounds	0 Pounds	0 Pounds	0 Pounds	
07008MCLC0760RO	N590	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07008SHLND350RO	100425	1853 Pounds	5 Pounds	5 Pounds	5 Pounds	
07008SHLND350RO	107211	1407 Pounds	5 Pounds	5 Pounds	5 Pounds	
07008SHLND350RO	108101	965 Pounds	250 Pounds	250 Pounds	250 Pounds	
07008SHLND350RO	108883	7952 Pounds	750 Pounds	750 Pounds	750 Pounds	
07008SHLND350RO	110543	1876 Pounds	750 Pounds	750 Pounds	750 Pounds	
07008SHLND350RO	111422	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07008SHLND350RO	117817	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07008SHLND350RO	1330207	21986 Pounds	250 Pounds	250 Pounds	250 Pounds	
07008SHLND350RO	67561	12621 Pounds	1782 Pounds	1782 Pounds	1782 Pounds	
07008SHLND350RO	71363	1376 Pounds	750 Pounds	750 Pounds	750 Pounds	
07008SHLND350RO	872504	595 Pounds	5 Pounds	5 Pounds	5 Pounds	
07008SHLND350RO	95636	2594 Pounds	250 Pounds	250 Pounds	250 Pounds	
07008SHLND350RO	98828	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07008SHLND350RO	N230	2594 Pounds	250 Pounds	250 Pounds	250 Pounds	
07008XFRDS600MI	67561	10 Pounds	5 Pounds	5 Pounds	5 Pounds	
07008XFRDS600MI	7439921	10.72 Pounds	1.6 Pounds	1.6 Pounds	1.6 Pounds	
07008XFRDS600MI	7440508	140 Pounds	0 Pounds	0 Pounds	0 Pounds	
07008XFRDS600MI	7697372	10 Pounds	5 Pounds	5 Pounds	5 Pounds	
0700WGSFLP19IND	7440508	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
0700WLTRDD1455B	N230	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
0700WLTSLH21HEN	108883	1108 Pounds	1108 Pounds	1108 Pounds	1108 Pounds	
0700WPPTMZ11MAD	7439921	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07011LMRTC16RIC	108883	3977 Pounds	3977 Pounds	3977 Pounds	3977 Pounds	
07011LMRTC16RIC	7439921	2051 Pounds	0 Pounds	0 Pounds	0 Pounds	
07011LMRTC16RIC	79947	232 Pounds	0 Pounds	0 Pounds	0 Pounds	
07011SFSCR2ACKE	100425	378 Pounds	3 Pounds	3 Pounds	3 Pounds	
07011SFSCR2ACKE	80626	248 Pounds	0 Pounds	0 Pounds	0 Pounds	
07012CMSNT454AL	7439976	0.5 Pounds	0.25 Pounds	0.25 Pounds	0.25 Pounds	
07012SCHRCONEST	111422	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07014TTVNC100KI	N420	94.6377 Pounds	0.046 Pounds	0.046 Pounds	0.046 Pounds	
07015SWPCT1CLIF	7439965	2 Pounds	0 Pounds	0 Pounds	0 Pounds	
07015SWPCT1CLIF	7440020	5 Pounds	0 Pounds	0 Pounds	0 Pounds	
07015SWPCT1CLIF	7440473	23 Pounds	0 Pounds	0 Pounds	0 Pounds	
07015SWPCT1CLIF	7440508	1 Pounds	0 Pounds	0 Pounds	0 Pounds	
07015SWPCT1CLIF	7664393	212 Pounds	0 Pounds	0 Pounds	0 Pounds	
07015SWPCT1CLIF	7697372	3042 Pounds	0 Pounds	0 Pounds	0 Pounds	
07015SWPCT1CLIF	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
0701WDRTCF6WEBR	1330207	26 Pounds	26 Pounds	26 Pounds	26 Pounds	
0701WDRTCF6WEBR	N120	2 Pounds	0 Pounds	0 Pounds	0 Pounds	
0701WDRTCF6WEBR	N982	2 Pounds	0 Pounds	0 Pounds	0 Pounds	
07026NLCLR61RIV	N982	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07029KRNYS936HA	7439921	2 Pounds	2 Pounds	2 Pounds	2 Pounds	
07029KRNYS936HA	7440020	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07029KRNYS936HA	7440508	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07029KRNYS936HA	N982	56 Pounds	45 Pounds	45 Pounds	45 Pounds	
07030SCSTN725JE	7439921	36 Pounds	30 Pounds	30 Pounds	30 Pounds	
07032KHNCH86HAC	7782505	0.5 Pounds	0 Pounds	0 Pounds	0 Pounds	
07032KRNYGHACKE	7664417	35169 Pounds	35169 Pounds	35169 Pounds	35169 Pounds	
07032SWWST115JA	108883	1160 Pounds	0 Pounds	0 Pounds	0 Pounds	
07032SWWST115JA	127184	277973 Pounds	0 Pounds	0 Pounds	0 Pounds	
07032SWWST115JA	1330207	960 Pounds	0 Pounds	0 Pounds	0 Pounds	
07032SWWST115JA	67561	900 Pounds	0 Pounds	0 Pounds	0 Pounds	
07032SWWST115JA	7697372	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07032SWWST115JA	79016	22560 Pounds	0 Pounds	0 Pounds	0 Pounds	
07032SWWST115JA	N020	22455.02 Pounds	0 Pounds	0 Pounds	0 Pounds	
07032SWWST115JA	N040	23100.14 Pounds	0 Pounds	0 Pounds	0 Pounds	
07032SWWST115JA	N090	19627.146 Pounds	0 Pounds	0 Pounds	0 Pounds	
07032SWWST115JA	N420	185553.53 Pounds	0 Pounds	0 Pounds	0 Pounds	
07032SWWST115JA	N982	12563.47 Pounds	0 Pounds	0 Pounds	0 Pounds	
07032VCKRD67CEN	64186	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07032VCKRD67CEN	67561	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07032VCKRD67CEN	7664417	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07032VCKRD67CEN	7697372	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07032VCKRD67CEN	N230	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07032WNSCRNEWAR	191242	10.17 Pounds	0 Pounds	0 Pounds	0 Pounds	
07032WNSCRNEWAR	7440508	0.76 Pounds	0.38 Pounds	0.38 Pounds	0.38 Pounds	
07032WNSCRNEWAR	N590	61.71 Pounds	2.6 Pounds	2.6 Pounds	2.6 Pounds	
07033SYNRY209NM	108883	480 Pounds	310 Pounds	310 Pounds	310 Pounds	
07033SYNRY209NM	1330207	660 Pounds	450 Pounds	450 Pounds	450 Pounds	
07033SYNRY209NM	80626	160 Pounds	122 Pounds	122 Pounds	122 Pounds	
07033SYNRY209NM	85449	16 Pounds	8 Pounds	8 Pounds	8 Pounds	
07035HSHPL600FR	117817	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07036CGNTCRAILR	7664417	159517 Pounds	155502 Pounds	155502 Pounds	155502 Pounds	
07036CNCPHFTFSW	100414	505 Pounds	250 Pounds	250 Pounds	250 Pounds	
07036CNCPHFTFSW	108883	505 Pounds	250 Pounds	250 Pounds	250 Pounds	
07036CNCPHFTFSW	110543	1005 Pounds	750 Pounds	750 Pounds	750 Pounds	
07036CNCPHFTFSW	110827	505 Pounds	250 Pounds	250 Pounds	250 Pounds	
07036CNCPHFTFSW	1330207	505 Pounds	250 Pounds	250 Pounds	250 Pounds	
07036CNCPHFTFSW	191242	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07036CNCPHFTFSW	71432	505 Pounds	250 Pounds	250 Pounds	250 Pounds	
07036CNCPHFTFSW	91203	505 Pounds	250 Pounds	250 Pounds	250 Pounds	
07036CNCPHFTFSW	95636	260 Pounds	250 Pounds	250 Pounds	250 Pounds	
07036CNCPHFTFSW	N590	0.6 Pounds	0 Pounds	0 Pounds	0 Pounds	
07036CTGPT4801S	100414	220 Pounds	193 Pounds	193 Pounds	193 Pounds	
07036CTGPT4801S	108883	1992 Pounds	1696 Pounds	1696 Pounds	1696 Pounds	
07036CTGPT4801S	110543	2329 Pounds	1954 Pounds	1954 Pounds	1954 Pounds	
07036CTGPT4801S	110827	139 Pounds	116 Pounds	116 Pounds	116 Pounds	
07036CTGPT4801S	1330207	825 Pounds	715 Pounds	715 Pounds	715 Pounds	
07036CTGPT4801S	191242	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07036CTGPT4801S	71432	684 Pounds	575 Pounds	575 Pounds	575 Pounds	
07036CTGPT4801S	91203	2 Pounds	0 Pounds	0 Pounds	0 Pounds	
07036CTGPT4801S	95636	1136 Pounds	1100 Pounds	1100 Pounds	1100 Pounds	
07036CTGPT4801S	98828	50 Pounds	42 Pounds	42 Pounds	42 Pounds	
07036CTGPT4801S	N420	2 Pounds	0 Pounds	0 Pounds	0 Pounds	
07036CTGPT4801S	N590	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07036GLFLL2600M	100414	337.05 Pounds	226 Pounds	226 Pounds	226 Pounds	
07036GLFLL2600M	108883	512.14 Pounds	343 Pounds	343 Pounds	343 Pounds	
07036GLFLL2600M	110543	455.08 Pounds	305 Pounds	305 Pounds	305 Pounds	
07036GLFLL2600M	110827	222.04 Pounds	149 Pounds	149 Pounds	149 Pounds	
07036GLFLL2600M	1330207	884.14 Pounds	592 Pounds	592 Pounds	592 Pounds	
07036GLFLL2600M	191242	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07036GLFLL2600M	71432	92.02 Pounds	90 Pounds	90 Pounds	90 Pounds	
07036GLFLL2600M	7439921	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07036GLFLL2600M	95636	30.05 Pounds	20 Pounds	20 Pounds	20 Pounds	
07036GLFLL2600M	N590	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07036LFLBR5NSTI	107211	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07036LFLBR5NSTI	N230	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07036LFLBR5NSTI	N583	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07036LFLBR5NSTI	N982	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07036LNDNGWOODA	10049044	89 Pounds	89 Pounds	89 Pounds	89 Pounds	
07036LNDNGWOODA	7664417	48489 Pounds	48489 Pounds	48489 Pounds	48489 Pounds	
07036LNDNGWOODA	N590	0.85 Pounds	0.05 Pounds	0.05 Pounds	0.05 Pounds	
07036PRMNT1515W	7697372	10 Pounds	5 Pounds	5 Pounds	5 Pounds	
07036PRMNT1515W	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07036SFTYK1200S	100414	1.01 Pounds	1 Pounds	1 Pounds	1 Pounds	
07036SFTYK1200S	107211	1.06 Pounds	0.27 Pounds	0.27 Pounds	0.27 Pounds	
07036SFTYK1200S	108101	22.02 Pounds	22 Pounds	22 Pounds	22 Pounds	
07036SFTYK1200S	108883	171.12 Pounds	171 Pounds	171 Pounds	171 Pounds	
07036SFTYK1200S	1330207	63.14 Pounds	63 Pounds	63 Pounds	63 Pounds	
07036SFTYK1200S	67561	204.07 Pounds	204 Pounds	204 Pounds	204 Pounds	
07036SFTYK1200S	68122	23 Pounds	23 Pounds	23 Pounds	23 Pounds	
07036SFTYK1200S	71363	1.92 Pounds	1.91 Pounds	1.91 Pounds	1.91 Pounds	
07036SFTYK1200S	7439921	47 Pounds	0 Pounds	0 Pounds	0 Pounds	
07036SFTYK1200S	75058	16.01 Pounds	16 Pounds	16 Pounds	16 Pounds	
07036SFTYK1200S	872504	109.03 Pounds	109 Pounds	109 Pounds	109 Pounds	
07036SFTYK1200S	N230	43.07 Pounds	43 Pounds	43 Pounds	43 Pounds	
07036XXNCH1400P	107211	6998 Pounds	2610 Pounds	2610 Pounds	2610 Pounds	
07036XXNCH1400P	108054	1047 Pounds	955 Pounds	955 Pounds	955 Pounds	
07036XXNCH1400P	108316	108 Pounds	108 Pounds	108 Pounds	108 Pounds	
07036XXNCH1400P	108883	181 Pounds	116 Pounds	116 Pounds	116 Pounds	
07036XXNCH1400P	108952	48243 Pounds	2007 Pounds	2007 Pounds	2007 Pounds	
07036XXNCH1400P	110543	1063 Pounds	70 Pounds	70 Pounds	70 Pounds	
07036XXNCH1400P	115071	21582 Pounds	20922 Pounds	20922 Pounds	20922 Pounds	
07036XXNCH1400P	74851	10335 Pounds	10335 Pounds	10335 Pounds	10335 Pounds	
07036XXNCH1400P	75650	227 Pounds	0 Pounds	0 Pounds	0 Pounds	
07036XXNCH1400P	7647010	2874 Pounds	2146 Pounds	2146 Pounds	2146 Pounds	
07036XXNCH1400P	7664417	4964 Pounds	3923 Pounds	3923 Pounds	3923 Pounds	
07036XXNCH1400P	7782505	1313 Pounds	1312 Pounds	1312 Pounds	1312 Pounds	
07036XXNCH1400P	7783064	18 Pounds	5 Pounds	5 Pounds	5 Pounds	
07036XXNCH1400P	78922	10152 Pounds	8094 Pounds	8094 Pounds	8094 Pounds	
07036XXNCH1400P	N420	1.3 Pounds	0.19 Pounds	0.19 Pounds	0.19 Pounds	
07036XXNCH1400P	N982	78518 Pounds	2176 Pounds	2176 Pounds	2176 Pounds	
0703WCLYTN2PRET	7439921	1.82 Pounds	1.82 Pounds	1.82 Pounds	1.82 Pounds	
0703WCLYTN2PRET	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
0703WDPNTD14PAR	100254	1 Pounds	0 Pounds	0 Pounds	0 Pounds	
0703WDPNTD14PAR	10028156	238.4347 Pounds	154.09 Pounds	154.09 Pounds	154.09 Pounds	
0703WDPNTD14PAR	528290	1 Pounds	0 Pounds	0 Pounds	0 Pounds	
0703WDPNTD14PAR	67561	10 Pounds	0 Pounds	0 Pounds	0 Pounds	
0703WDPNTD14PAR	74873	1 Pounds	0 Pounds	0 Pounds	0 Pounds	
0703WDPNTD14PAR	7664417	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
0703WDPNTD14PAR	7664939	25013 Pounds	22314 Pounds	22314 Pounds	22314 Pounds	
0703WDPNTD14PAR	7783064	263 Pounds	0 Pounds	0 Pounds	0 Pounds	
0703WDPNTD14PAR	98953	3 Pounds	0 Pounds	0 Pounds	0 Pounds	
0703WDPNTD14PAR	99650	1 Pounds	0 Pounds	0 Pounds	0 Pounds	
0703WDPNTD14PAR	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
0703WWLDNS2MARS	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
0703WWLDNS2MARS	N590	0.48 Pounds	0.19 Pounds	0.19 Pounds	0.19 Pounds	
07047WRGRC21338	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07054MTMCR700PA	7440020	3 Pounds	0 Pounds	0 Pounds	0 Pounds	
07054MTMCR700PA	7440473	2 Pounds	0 Pounds	0 Pounds	0 Pounds	
07054MTMCR700PA	7440484	2 Pounds	0 Pounds	0 Pounds	0 Pounds	
07054MTMCR700PA	7697372	128 Pounds	128 Pounds	128 Pounds	128 Pounds	
07054MTMCR700PA	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07054WMSTN29EHA	75092	8800 Pounds	8800 Pounds	8800 Pounds	8800 Pounds	
07054ZMMRT1PMER	7647010	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07054ZMMRT1PMER	7782505	1.25 Pounds	0 Pounds	0 Pounds	0 Pounds	
07057FRMLN52MAI	7697372	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07057FRMLN52MAI	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07058DCRNC5BADE	101144	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07059NDGCS141MT	872504	2037 Pounds	2037 Pounds	2037 Pounds	2037 Pounds	
07064NTDST300MA	7439921	0.441 Pounds	0.047 Pounds	0.047 Pounds	0.047 Pounds	
07064NTDST300MA	7439976	0.0364 Pounds	0.004 Pounds	0.004 Pounds	0.004 Pounds	
07064NTDST300MA	7440020	10.2 Pounds	1.1 Pounds	1.1 Pounds	1.1 Pounds	
07065DRPRN329NE	108101	909 Pounds	894 Pounds	894 Pounds	894 Pounds	
07065DRPRN329NE	108883	1896 Pounds	1865 Pounds	1865 Pounds	1865 Pounds	
07065DRPRN329NE	1330207	883 Pounds	868 Pounds	868 Pounds	868 Pounds	
07065DRPRN329NE	67561	87 Pounds	86 Pounds	86 Pounds	86 Pounds	
07065LCTRM827MA	N420	8 Pounds	8 Pounds	8 Pounds	8 Pounds	
07065MRCKC126EL	107211	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07065MRCKC126EL	108883	293 Pounds	237 Pounds	237 Pounds	237 Pounds	
07065MRCKC126EL	1634044	435 Pounds	351 Pounds	351 Pounds	351 Pounds	
07065MRCKC126EL	67561	348 Pounds	284 Pounds	284 Pounds	284 Pounds	
07065MRCKC126EL	68122	1 Pounds	1 Pounds	1 Pounds	1 Pounds	
07065MRCKC126EL	75058	256 Pounds	207 Pounds	207 Pounds	207 Pounds	
07065MRCKC126EL	872504	62 Pounds	50 Pounds	50 Pounds	50 Pounds	
07066KRNKC330CE	100414	10 Pounds	5 Pounds	5 Pounds	5 Pounds	
07066KRNKC330CE	1330207	618 Pounds	433 Pounds	433 Pounds	433 Pounds	
07066KRNKC330CE	67561	255 Pounds	5 Pounds	5 Pounds	5 Pounds	
07066KRNKC330CE	95636	134 Pounds	103 Pounds	103 Pounds	103 Pounds	
07066KRNKC330CE	98828	500 Pounds	250 Pounds	250 Pounds	250 Pounds	
07066KRNKC330CE	N590	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07066PLYCH160TE	67561	477 Pounds	477 Pounds	477 Pounds	477 Pounds	
07069FNWDSNEWPR	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07069FNWDSNEWPR	N590	1.21 Pounds	0.44 Pounds	0.44 Pounds	0.44 Pounds	
07070RCHTC359VE	1330207	31910 Pounds	919 Pounds	919 Pounds	919 Pounds	
07071PLYRT624SC	107211	240.5 Pounds	240 Pounds	240 Pounds	240 Pounds	
07071PLYRT624SC	108883	782 Pounds	754 Pounds	754 Pounds	754 Pounds	
07071PLYRT624SC	26471625	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07071PLYRT624SC	584849	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07071PLYRT624SC	68122	198 Pounds	170 Pounds	170 Pounds	170 Pounds	
07071PLYRT624SC	N120	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07071SKCRP201PO	100414	11 Pounds	7 Pounds	7 Pounds	7 Pounds	
07071SKCRP201PO	1330207	64 Pounds	40 Pounds	40 Pounds	40 Pounds	
07071SKCRP201PO	26471625	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07071SKCRP201PO	872504	1 Pounds	0 Pounds	0 Pounds	0 Pounds	
07071SKCRP201PO	N120	2 Pounds	1 Pounds	1 Pounds	1 Pounds	
07071SKCRP201PO	N450	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07072CKDNN700GO	N230	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07072PNTCH117MO	108101	546 Pounds	546 Pounds	546 Pounds	546 Pounds	
07072PNTCH117MO	108883	617 Pounds	617 Pounds	617 Pounds	617 Pounds	
07072PNTCH117MO	1330207	430 Pounds	430 Pounds	430 Pounds	430 Pounds	
07072PNTCH117MO	N420	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07072PTTRS6INDU	7440020	31 Pounds	0 Pounds	0 Pounds	0 Pounds	
07072PTTRS6INDU	7440224	10 Pounds	0 Pounds	0 Pounds	0 Pounds	
07072PTTRS6INDU	7440508	10 Pounds	0 Pounds	0 Pounds	0 Pounds	
07072PTTRS6INDU	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07073DBSCHUNION	111422	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07073DBSCHUNION	N230	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07073GNRLF13MAN	26471625	12.54 Pounds	6.11 Pounds	6.11 Pounds	6.11 Pounds	
07074CRSTF100CA	26471625	147 Pounds	140 Pounds	140 Pounds	140 Pounds	
07077SHLLL111ST	100414	1898 Pounds	246 Pounds	246 Pounds	246 Pounds	
07077SHLLL111ST	100425	19 Pounds	16 Pounds	16 Pounds	16 Pounds	
07077SHLLL111ST	107211	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07077SHLLL111ST	108883	3554 Pounds	3130 Pounds	3130 Pounds	3130 Pounds	
07077SHLLL111ST	110543	3740 Pounds	3547 Pounds	3547 Pounds	3547 Pounds	
07077SHLLL111ST	1330207	9418 Pounds	1130 Pounds	1130 Pounds	1130 Pounds	
07077SHLLL111ST	191242	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07077SHLLL111ST	71432	2303 Pounds	2145 Pounds	2145 Pounds	2145 Pounds	
07077SHLLL111ST	91203	626 Pounds	6 Pounds	6 Pounds	6 Pounds	
07077SHLLL111ST	95636	1021 Pounds	96 Pounds	96 Pounds	96 Pounds	
07077SHLLL111ST	N420	0.1 Pounds	0.1 Pounds	0.1 Pounds	0.1 Pounds	
07077SHLLL111ST	N590	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07080HMMLC10HAR	7632000	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07080HMMLC10HAR	7697372	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07080HMMLC10HAR	N040	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07080HMMLC10HAR	N420	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07080HMMLC10HAR	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07080MNRLP1CLID	100414	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07080MNRLP1CLID	1330207	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07080MNRLP1CLID	71363	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07080MNRLP1CLID	N982	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07080MTZMT3900S	302012	35 Pounds	35 Pounds	35 Pounds	35 Pounds	
07080MTZMT3900S	50000	41 Pounds	41 Pounds	41 Pounds	41 Pounds	
07080MTZMT3900S	67561	7698 Pounds	3717 Pounds	3717 Pounds	3717 Pounds	
07080MTZMT3900S	7429905	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07080MTZMT3900S	7664417	593 Pounds	593 Pounds	593 Pounds	593 Pounds	
07080MTZMT3900S	7697372	100 Pounds	100 Pounds	100 Pounds	100 Pounds	
07080MTZMT3900S	N100	74 Pounds	0 Pounds	0 Pounds	0 Pounds	
07080MTZMT3900S	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07080MTZMT3900S	N740	27 Pounds	0 Pounds	0 Pounds	0 Pounds	
07080TVCNC110PM	71363	10 Pounds	5 Pounds	5 Pounds	5 Pounds	
07080VNGRD239ST	N420	43 Pounds	2 Pounds	2 Pounds	2 Pounds	
07081BGLWC74DIA	7440020	0.0311 Pounds	0 Pounds	0 Pounds	0 Pounds	
07081BGLWC74DIA	7440508	0.1466 Pounds	0 Pounds	0 Pounds	0 Pounds	
07083FRMST941BA	7697372	512 Pounds	487 Pounds	487 Pounds	487 Pounds	
07083FRMST941BA	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07083LCNPW901LE	7439965	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07083LCNPW901LE	7440020	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07083LCNPW901LE	7440360	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07083LCNPW901LE	7440473	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07083LCNPW901LE	7440508	1000 Pounds	250 Pounds	250 Pounds	250 Pounds	
07083LCNPW901LE	7440666	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07083MRCNP610RA	7439921	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07083NTRNT2270M	100414	828 Pounds	56 Pounds	56 Pounds	56 Pounds	
07083NTRNT2270M	108883	505 Pounds	56 Pounds	56 Pounds	56 Pounds	
07083NTRNT2270M	1330207	5298 Pounds	350 Pounds	350 Pounds	350 Pounds	
07083NTRNT2270M	71363	857 Pounds	99 Pounds	99 Pounds	99 Pounds	
07083NTRNT2270M	95636	720 Pounds	55 Pounds	55 Pounds	55 Pounds	
07083NTRNT2270M	N100	10230 Pounds	114 Pounds	114 Pounds	114 Pounds	
07083NTRNT2270M	N982	4094 Pounds	70 Pounds	70 Pounds	70 Pounds	
07083TSSLR2389V	7664417	5 Pounds	2 Pounds	2 Pounds	2 Pounds	
0708WKYSTN3451S	7439965	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
0708WKYSTN3451S	7440020	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
0708WKYSTN3451S	7440473	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
0708WKYSTN3451S	N420	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
0708WVLDSX8MNTR	108883	10434 Pounds	10434 Pounds	10434 Pounds	10434 Pounds	
07095LCNBL11CRA	100414	411 Pounds	311 Pounds	311 Pounds	311 Pounds	
07095LCNBL11CRA	1330207	1086 Pounds	766 Pounds	766 Pounds	766 Pounds	
07095LCNBL11CRA	71363	681 Pounds	381 Pounds	381 Pounds	381 Pounds	
07095LCNBL11CRA	7439921	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07095LCNBL11CRA	7439965	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07095LCNBL11CRA	7440473	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07095LCNBL11CRA	91203	379 Pounds	179 Pounds	179 Pounds	179 Pounds	
07095LCNBL11CRA	95636	586 Pounds	456 Pounds	456 Pounds	456 Pounds	
07095LCNBL11CRA	N010	1640 Pounds	0 Pounds	0 Pounds	0 Pounds	
07095LCNBL11CRA	N230	909 Pounds	809 Pounds	809 Pounds	809 Pounds	
07095LCNBL11CRA	N450	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07095RSSLL14CON	100414	937 Pounds	930 Pounds	930 Pounds	930 Pounds	
07095RSSLL14CON	108883	1002 Pounds	998 Pounds	998 Pounds	998 Pounds	
07095RSSLL14CON	1330207	4661 Pounds	4625 Pounds	4625 Pounds	4625 Pounds	
07095RSSLL14CON	71363	3976 Pounds	3939 Pounds	3939 Pounds	3939 Pounds	
07095RSSLL14CON	95636	3048 Pounds	3018 Pounds	3018 Pounds	3018 Pounds	
07095RSSLL14CON	N230	10775 Pounds	10673 Pounds	10673 Pounds	10673 Pounds	
07101NHSRB200US	75456	14827 Pounds	0 Pounds	0 Pounds	0 Pounds	
07102PBLCS155RA	N590	0.02 Pounds	0.02 Pounds	0.02 Pounds	0.02 Pounds	
07105BNJMN134LI	107211	2265.57 Pounds	1.46 Pounds	1.46 Pounds	1.46 Pounds	
07105BNJMN134LI	7439921	0.3081 Pounds	0 Pounds	0 Pounds	0 Pounds	
07105BNJMN134LI	N230	3.77 Pounds	0.02 Pounds	0.02 Pounds	0.02 Pounds	
07105BNJMN134LI	N982	371.41 Pounds	0 Pounds	0 Pounds	0 Pounds	
07105CRDLT500DO	106898	500 Pounds	400 Pounds	400 Pounds	400 Pounds	
07105CRDLT500DO	108883	330 Pounds	300 Pounds	300 Pounds	300 Pounds	
07105CRDLT500DO	108952	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07105CRDLT500DO	1330207	3400 Pounds	2500 Pounds	2500 Pounds	2500 Pounds	
07105CRDLT500DO	71363	800 Pounds	700 Pounds	700 Pounds	700 Pounds	
07105CRDLT500DO	95636	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07105CWCND185FO	108883	1535 Pounds	1070 Pounds	1070 Pounds	1070 Pounds	
07105DCCHM49RUT	100414	159 Pounds	96 Pounds	96 Pounds	96 Pounds	
07105DCCHM49RUT	100425	122 Pounds	40 Pounds	40 Pounds	40 Pounds	
07105DCCHM49RUT	107211	20 Pounds	10 Pounds	10 Pounds	10 Pounds	
07105DCCHM49RUT	108054	509 Pounds	353 Pounds	353 Pounds	353 Pounds	
07105DCCHM49RUT	1330207	874 Pounds	609 Pounds	609 Pounds	609 Pounds	
07105DCCHM49RUT	26471625	18 Pounds	9 Pounds	9 Pounds	9 Pounds	
07105DCCHM49RUT	80626	649 Pounds	431 Pounds	431 Pounds	431 Pounds	
07105DCCHM49RUT	85449	721 Pounds	9 Pounds	9 Pounds	9 Pounds	
07105DLTMR26BLA	107211	10 Pounds	5 Pounds	5 Pounds	5 Pounds	
07105DLTMR26BLA	872504	10 Pounds	5 Pounds	5 Pounds	5 Pounds	
07105DLTMR26BLA	N230	10 Pounds	5 Pounds	5 Pounds	5 Pounds	
07105DLTMR26BLA	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07105FDRLB9BACK	7440508	243 Pounds	240 Pounds	240 Pounds	240 Pounds	
07105HRCSP65EUC	7439921	0.5 Pounds	0.4 Pounds	0.4 Pounds	0.4 Pounds	
07105HRCSP65EUC	7440224	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07105HRCSP65EUC	7440508	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07105LNCHM268DO	64186	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07105LNCHM268DO	67561	576 Pounds	307 Pounds	307 Pounds	307 Pounds	
07105LNCHM268DO	75003	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07105LNCHM268DO	79210	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07105MNPCN27215	7632000	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07105NWRKT909DE	100414	565 Pounds	25 Pounds	25 Pounds	25 Pounds	
07105NWRKT909DE	100425	5 Pounds	2 Pounds	2 Pounds	2 Pounds	
07105NWRKT909DE	108883	554 Pounds	291 Pounds	291 Pounds	291 Pounds	
07105NWRKT909DE	110543	428 Pounds	285 Pounds	285 Pounds	285 Pounds	
07105NWRKT909DE	1330207	2957 Pounds	111 Pounds	111 Pounds	111 Pounds	
07105NWRKT909DE	191242	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07105NWRKT909DE	71432	275 Pounds	179 Pounds	179 Pounds	179 Pounds	
07105NWRKT909DE	91203	8 Pounds	1 Pounds	1 Pounds	1 Pounds	
07105NWRKT909DE	95636	408 Pounds	12 Pounds	12 Pounds	12 Pounds	
07105NWRKT909DE	N420	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07105NWRKT909DE	N590	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07105PLYMR297FE	N420	4.8262 Pounds	0.0292 Pounds	0.0292 Pounds	0.0292 Pounds	
07105TRYCHONEAV	107197	860 Pounds	800 Pounds	800 Pounds	800 Pounds	
07105TRYCHONEAV	108316	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07105TRYCHONEAV	55406536	142356 Pounds	5 Pounds	5 Pounds	5 Pounds	
07105TRYCHONEAV	67561	11941 Pounds	5085 Pounds	5085 Pounds	5085 Pounds	
07105TRYCHONEAV	95636	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07111RCHRD517LY	7440508	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07114BPXPLBLDG3	110543	151.47 Pounds	115.43 Pounds	115.43 Pounds	115.43 Pounds	
07114BPXPLBLDG3	191242	0.0079 Pounds	0.0066 Pounds	0.0066 Pounds	0.0066 Pounds	
07114BPXPLBLDG3	91203	62.61 Pounds	42.8 Pounds	42.8 Pounds	42.8 Pounds	
07114BPXPLBLDG3	95636	116.56 Pounds	80.59 Pounds	80.59 Pounds	80.59 Pounds	
07114BPXPLBLDG3	N420	16.8594 Pounds	0.0292 Pounds	0.0292 Pounds	0.0292 Pounds	
07114BPXPLBLDG3	N590	0.79 Pounds	0.65 Pounds	0.65 Pounds	0.65 Pounds	
07114CHMFL92896	123386	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07114CHMFL92896	50000	25 Pounds	13 Pounds	13 Pounds	13 Pounds	
07114CHMFL92896	67561	3075 Pounds	2820 Pounds	2820 Pounds	2820 Pounds	
07114CHMFL92896	77736	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07114GJCHM37037	106898	6 Pounds	0 Pounds	0 Pounds	0 Pounds	
07114GJCHM37037	107211	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07114GJCHM37037	108101	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07114GJCHM37037	108883	223 Pounds	202 Pounds	202 Pounds	202 Pounds	
07114GJCHM37037	110827	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07114GJCHM37037	1330207	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07114GJCHM37037	141322	23 Pounds	21 Pounds	21 Pounds	21 Pounds	
07114GJCHM37037	1634044	116 Pounds	3 Pounds	3 Pounds	3 Pounds	
07114GJCHM37037	67561	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07114GJCHM37037	75058	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07114GJCHM37037	75092	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07114GJCHM37037	79107	1 Pounds	0 Pounds	0 Pounds	0 Pounds	
07114GJCHM37037	80626	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07114GJCHM37037	84742	2 Pounds	0 Pounds	0 Pounds	0 Pounds	
07114GJCHM37037	95476	5 Pounds	1 Pounds	1 Pounds	1 Pounds	
07114GJCHM37037	96333	441 Pounds	292 Pounds	292 Pounds	292 Pounds	
07114GJCHM37037	N230	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07114KPPRS480FR	N096	250 Pounds	0 Pounds	0 Pounds	0 Pounds	
07114KPPRS480FR	N100	250 Pounds	0 Pounds	0 Pounds	0 Pounds	
07114MRDCRBUILD	7440508	7312 Pounds	7293 Pounds	7293 Pounds	7293 Pounds	
07114NWJRS139HA	7439921	0.4 Pounds	0.1 Pounds	0.1 Pounds	0.1 Pounds	
07114NWJRS139HA	N982	33 Pounds	26 Pounds	26 Pounds	26 Pounds	
07114RHSKR131MA	7664417	10 Pounds	10 Pounds	10 Pounds	10 Pounds	
07114RHSKR131MA	N495	21472 Pounds	0 Pounds	0 Pounds	0 Pounds	
07114SHMRCFTFPA	N230	20100 Pounds	0 Pounds	0 Pounds	0 Pounds	
07201GDNVTNAVED	100414	86.7 Pounds	78.97 Pounds	78.97 Pounds	78.97 Pounds	
07201GDNVTNAVED	108883	268.11 Pounds	265.14 Pounds	265.14 Pounds	265.14 Pounds	
07201GDNVTNAVED	110543	99.38 Pounds	98.98 Pounds	98.98 Pounds	98.98 Pounds	
07201GDNVTNAVED	1330207	228.56 Pounds	226.58 Pounds	226.58 Pounds	226.58 Pounds	
07201GDNVTNAVED	1634044	183.9 Pounds	183.9 Pounds	183.9 Pounds	183.9 Pounds	
07201GDNVTNAVED	71432	44.68 Pounds	44.48 Pounds	44.48 Pounds	44.48 Pounds	
07201GDNVTNAVED	91203	57.32 Pounds	35.52 Pounds	35.52 Pounds	35.52 Pounds	
07203PMRCN209E1	N100	4128 Pounds	4 Pounds	4 Pounds	4 Pounds	
07203PMRCN209E1	N420	422 Pounds	0 Pounds	0 Pounds	0 Pounds	
07203RNBND304CO	7664417	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07205HHSWS1478C	7440508	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07206CYCLC217SF	107211	5025 Pounds	0 Pounds	0 Pounds	0 Pounds	
07206CYCLC217SF	191242	46.33 Pounds	0 Pounds	0 Pounds	0 Pounds	
07206CYCLC217SF	7429905	15674 Pounds	0 Pounds	0 Pounds	0 Pounds	
07206CYCLC217SF	7439976	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07206CYCLC217SF	7440020	15719 Pounds	0 Pounds	0 Pounds	0 Pounds	
07206CYCLC217SF	N420	10650 Pounds	0 Pounds	0 Pounds	0 Pounds	
07206CYCLC217SF	N590	4332.81 Pounds	0 Pounds	0 Pounds	0 Pounds	
07206PPTTS847NA	7697372	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07206PPTTS847NA	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07207KLPHR200EL	67561	494 Pounds	489 Pounds	489 Pounds	489 Pounds	
07207PHLPS720SO	67561	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07207PHLPS720SO	7440508	1265 Pounds	5 Pounds	5 Pounds	5 Pounds	
07304DNLPR400CL	100414	527 Pounds	303 Pounds	303 Pounds	303 Pounds	
07304DNLPR400CL	1330207	1876 Pounds	1079 Pounds	1079 Pounds	1079 Pounds	
07304DNLPR400CL	N230	1633 Pounds	939 Pounds	939 Pounds	939 Pounds	
07305CRLXN230CU	80626	10 Pounds	5 Pounds	5 Pounds	5 Pounds	
07306HDSNGDUFFI	191242	0.008 Pounds	0.008 Pounds	0.008 Pounds	0.008 Pounds	
07306HDSNGDUFFI	7647010	607 Pounds	607 Pounds	607 Pounds	607 Pounds	
07306HDSNGDUFFI	7664417	35011 Pounds	34351 Pounds	34351 Pounds	34351 Pounds	
07306HDSNGDUFFI	N420	28.9 Pounds	6.7 Pounds	6.7 Pounds	6.7 Pounds	
07306HDSNGDUFFI	N458	3.44 Pounds	3.4 Pounds	3.4 Pounds	3.4 Pounds	
07306NCHLS120DU	N420	0.2 Pounds	0.2 Pounds	0.2 Pounds	0.2 Pounds	
07306NCHLS120DU	N982	10 Pounds	8 Pounds	8 Pounds	8 Pounds	
07310STRNC18THS	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07310STRNC265CB	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07405BTLRP250HA	108101	15223 Pounds	4400 Pounds	4400 Pounds	4400 Pounds	
07407CSTMC30PAU	N982	1709 Pounds	141 Pounds	141 Pounds	141 Pounds	
07407MRCLP1MARK	1336363	12.8 Pounds	0 Pounds	0 Pounds	0 Pounds	
07407MRCLP1MARK	N150	48.067 Pounds	0 Pounds	0 Pounds	0 Pounds	
07410FSHRS1REAG	110543	96.14 Pounds	72.8 Pounds	72.8 Pounds	72.8 Pounds	
07410FSHRS1REAG	50000	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07410FSHRS1REAG	64186	3.97 Pounds	3.95 Pounds	3.95 Pounds	3.95 Pounds	
07410FSHRS1REAG	75058	375 Pounds	350 Pounds	350 Pounds	350 Pounds	
07410FSHRS1REAG	75092	2514.12 Pounds	2477 Pounds	2477 Pounds	2477 Pounds	
07410FSHRS1REAG	N420	83.29 Pounds	0 Pounds	0 Pounds	0 Pounds	
07410FSHRS1REAG	N458	3.84 Pounds	0 Pounds	0 Pounds	0 Pounds	
07410KRSCH2001P	7440473	1.07 Pounds	1.07 Pounds	1.07 Pounds	1.07 Pounds	
07410KRSCH2001P	7440484	24.57 Pounds	24.57 Pounds	24.57 Pounds	24.57 Pounds	
07410NBSCB2211R	7664417	31533 Pounds	31533 Pounds	31533 Pounds	31533 Pounds	
07419CCRTFRTE94	79016	12524 Pounds	607 Pounds	607 Pounds	607 Pounds	
07420RRWGRTHIRD	1330207	306 Pounds	90 Pounds	90 Pounds	90 Pounds	
07420RRWGRTHIRD	71363	389 Pounds	104 Pounds	104 Pounds	104 Pounds	
07420RRWGRTHIRD	95636	1286 Pounds	442 Pounds	442 Pounds	442 Pounds	
07420RRWGRTHIRD	N230	1043 Pounds	280 Pounds	280 Pounds	280 Pounds	
07420RRWGRTHIRD	N420	23.88 Pounds	0 Pounds	0 Pounds	0 Pounds	
07430HWMDC300CO	7440473	5761 Pounds	5 Pounds	5 Pounds	5 Pounds	
07430HWMDC300CO	7440484	10253 Pounds	10 Pounds	10 Pounds	10 Pounds	
07430HWMDC300CO	7697372	101 Pounds	100 Pounds	100 Pounds	100 Pounds	
07457FLTRC1NORT	N120	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
0745WTLCNN125HA	191242	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
0745WTLCNN125HA	N590	4.3 Pounds	4 Pounds	4 Pounds	4 Pounds	
07470CLFTNBURGE	108883	2115 Pounds	2115 Pounds	2115 Pounds	2115 Pounds	
07470CLFTNBURGE	110543	1178 Pounds	1178 Pounds	1178 Pounds	1178 Pounds	
07470CLFTNBURGE	110827	750 Pounds	750 Pounds	750 Pounds	750 Pounds	
07470NRTNC150DE	7664417	5 Pounds	5 Pounds	5 Pounds	5 Pounds	
07470NRTNC150DE	7697372	6 Pounds	5 Pounds	5 Pounds	5 Pounds	
07470NRTNC150DE	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07474PSSCR45DEM	N982	546 Pounds	0 Pounds	0 Pounds	0 Pounds	
07480GNRNT1865R	7439921	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07480GNRNT1865R	7440508	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07501LTTLF189CA	7440508	39.01 Pounds	0 Pounds	0 Pounds	0 Pounds	
07501LTTLF189CA	7664417	1 Pounds	0 Pounds	0 Pounds	0 Pounds	
07501LTTLF189CA	N420	0.0016 Pounds	0 Pounds	0 Pounds	0 Pounds	
07501PSSCC2836P	108452	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07501PSSCC2836P	25376458	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07501PSSCC2836P	62533	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07501PSSCC2836P	7632000	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07503CRWNR91ILL	108101	1852 Pounds	1842 Pounds	1842 Pounds	1842 Pounds	
07503CRWNR91ILL	108883	2830 Pounds	2820 Pounds	2820 Pounds	2820 Pounds	
07503PRSRN91MIC	N230	750 Pounds	0 Pounds	0 Pounds	0 Pounds	
07506FSKLL10THO	7440508	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07506FSKLL10THO	7664417	10 Pounds	5 Pounds	5 Pounds	5 Pounds	
07509CSTML932MA	108883	4583 Pounds	4333 Pounds	4333 Pounds	4333 Pounds	
07513KNTC 959MA	7440508	80 Pounds	46 Pounds	46 Pounds	46 Pounds	
07513KNTC 959MA	N420	72.3 Pounds	0.3 Pounds	0.3 Pounds	0.3 Pounds	
0751WDVNCD1TAFT	75070	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07544KRKRC1EAST	71363	10 Pounds	5 Pounds	5 Pounds	5 Pounds	
07601LCTRC75KEN	7664417	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07603STRNC35WFR	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07606MDSBT375HU	67561	14379 Pounds	6739 Pounds	6739 Pounds	6739 Pounds	
07607MYRNM205MA	7439921	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07607STPNC100WH	67561	1300 Pounds	1300 Pounds	1300 Pounds	1300 Pounds	
07607STPNC100WH	71363	1220 Pounds	1220 Pounds	1220 Pounds	1220 Pounds	
07607VCTRS25BRK	7664417	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07643SCNTF49IND	7440224	1952 Pounds	488 Pounds	488 Pounds	488 Pounds	
07643SCNTF49IND	7664417	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07644HKMTL35IND	7439965	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07644HKMTL35IND	7440020	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07644HKMTL35IND	7440473	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07644HKMTL35IND	7440508	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07644SFFRN210GA	N495	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07647TKSGN267UN	N230	6 Pounds	1 Pounds	1 Pounds	1 Pounds	
0764WCNNGN15MER	7439921	4 Pounds	0 Pounds	0 Pounds	0 Pounds	
0764WCNNGN15MER	7440508	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07656GNZYM1125P	67663	20 Pounds	19 Pounds	19 Pounds	19 Pounds	
07657BRGNGVICTO	10049044	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07657BRGNGVICTO	7664417	27997 Pounds	27997 Pounds	27997 Pounds	27997 Pounds	
07657BRGNGVICTO	N590	0.02 Pounds	0.02 Pounds	0.02 Pounds	0.02 Pounds	
07657BZZDR1145E	7697372	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07657BZZDR1145E	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07657CLRTP101RA	117817	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07657CLRTP101RA	N010	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07657CLRTP101RA	N040	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07657CLRTP101RA	N982	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07657KMBRM161RA	7440473	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07660CLLHN200IN	107211	2 Pounds	1 Pounds	1 Pounds	1 Pounds	
07660CLLHN200IN	67561	13 Pounds	12 Pounds	12 Pounds	12 Pounds	
07660CLLHN200IN	N230	7 Pounds	4 Pounds	4 Pounds	4 Pounds	
07662LLNFN271MA	7439921	0.6 Pounds	0 Pounds	0 Pounds	0 Pounds	
07662LLNFN271MA	7440020	18 Pounds	8 Pounds	8 Pounds	8 Pounds	
07722NVLWP201HW	7439921	0.88 Pounds	0 Pounds	0 Pounds	0 Pounds	
07722NVLWP201HW	7439921	132.4 Pounds	0 Pounds	0 Pounds	0 Pounds	
07724LCTRN1INDU	7439921	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07727BLRYCPOBOX	N010	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07727BLRYCPOBOX	N982	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07727PPLCD5029I	7439921	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07728FRSTB250HA	107211	54 Pounds	54 Pounds	54 Pounds	54 Pounds	
07728FRSTB250HA	67561	582 Pounds	582 Pounds	582 Pounds	582 Pounds	
07728FRSTB250HA	N230	6 Pounds	3 Pounds	3 Pounds	3 Pounds	
07728NSTLF61JER	7664417	8358 Pounds	4014 Pounds	4014 Pounds	4014 Pounds	
07728NSTLF61JER	7697372	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07728NSTLF61JER	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
0772WCLYTN225TH	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
0772WRLPHC1CMME	7439921	1.8 Pounds	1.8 Pounds	1.8 Pounds	1.8 Pounds	
0772WRLPHC1CMME	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
0773WSTRNC86YEL	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07740WHLCK273BR	N420	1.6 Pounds	1.6 Pounds	1.6 Pounds	1.6 Pounds	
0774WMNMTH75LNG	N120	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07753LCTRN405ES	7439921	240 Pounds	0 Pounds	0 Pounds	0 Pounds	
07753LCTRN405ES	7440508	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07801HWMTCROYST	7440020	0.871 Pounds	0.871 Pounds	0.871 Pounds	0.871 Pounds	
07801HWMTCROYST	7440020	290.63 Pounds	3 Pounds	3 Pounds	3 Pounds	
07801HWMTCROYST	7440473	0.2 Pounds	0.2 Pounds	0.2 Pounds	0.2 Pounds	
07801HWMTCROYST	7440473	41.5 Pounds	1.5 Pounds	1.5 Pounds	1.5 Pounds	
07801HWMTCROYST	7440484	0.1 Pounds	0.1 Pounds	0.1 Pounds	0.1 Pounds	
07801HWMTCROYST	7440484	41 Pounds	3 Pounds	3 Pounds	3 Pounds	
07801HWMTCROYST	80057	0.1 Pounds	0 Pounds	0 Pounds	0 Pounds	
07823HFFMN206RO	7664417	23189 Pounds	8153 Pounds	8153 Pounds	8153 Pounds	
07823HFFMN206RO	N511	132341 Pounds	0 Pounds	0 Pounds	0 Pounds	
07823HFFMN206RO	N982	962 Pounds	1 Pounds	1 Pounds	1 Pounds	
07828GVDNF300WA	N230	281 Pounds	157 Pounds	157 Pounds	157 Pounds	
07828L3CMM45CLA	7439921	0.04 Pounds	0.02 Pounds	0.02 Pounds	0.02 Pounds	
07840HTRNC999WI	7439921	151.7 Pounds	0 Pounds	0 Pounds	0 Pounds	
07840LSTMLESNAD	N120	5 Pounds	0 Pounds	0 Pounds	0 Pounds	
07840LSTMLESNAD	N420	582 Pounds	0 Pounds	0 Pounds	0 Pounds	
07840LSTMLESNAD	N982	1284 Pounds	0 Pounds	0 Pounds	0 Pounds	
07840MMMRSHIGHS	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07840NDRXN101BI	7439921	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07840TDMDL36NEW	7439921	0.25 Pounds	0.25 Pounds	0.25 Pounds	0.25 Pounds	
07850PRDNT400NF	7439921	0.14 Pounds	0 Pounds	0 Pounds	0 Pounds	
07850PRDNT400NF	7440360	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07853FRZRNFAIRV	95636	19493 Pounds	10388 Pounds	10388 Pounds	10388 Pounds	
07865BRLSC176TH	N010	2366.64 Pounds	15 Pounds	15 Pounds	15 Pounds	
07865BRLSC176TH	N982	362.88 Pounds	15 Pounds	15 Pounds	15 Pounds	
07866MCWLL1948F	7440020	492 Pounds	2 Pounds	2 Pounds	2 Pounds	
07866MCWLL1948F	7440473	78 Pounds	1 Pounds	1 Pounds	1 Pounds	
07866MCWLL1948F	7440484	76 Pounds	0 Pounds	0 Pounds	0 Pounds	
0786WLLDCN25FRA	7439921	0.02244 Pounds	0.02244 Pounds	0.02244 Pounds	0.02244 Pounds	
0786WTLCNNMTPIS	191242	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
0786WTLCNNMTPIS	N590	1.1 Pounds	1 Pounds	1 Pounds	1 Pounds	
0787WDMNDS33DEM	7439921	0.05692 Pounds	0.05692 Pounds	0.05692 Pounds	0.05692 Pounds	
07882BSFCRPERSH	107211	10309 Pounds	250 Pounds	250 Pounds	250 Pounds	
07882BSFCRPERSH	71363	750 Pounds	250 Pounds	250 Pounds	250 Pounds	
07882BSFCRPERSH	75218	500 Pounds	250 Pounds	250 Pounds	250 Pounds	
07882BSFCRPERSH	75569	500 Pounds	250 Pounds	250 Pounds	250 Pounds	
07928NTNLM12RIV	7440020	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07928NTNLM12RIV	7440473	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07928NTNLM12RIV	7440508	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07928STTNL116SU	50000	956 Pounds	916 Pounds	916 Pounds	916 Pounds	
07932PRCSN306CO	7440020	329 Pounds	320 Pounds	320 Pounds	320 Pounds	
07932PRCSN306CO	7440473	119 Pounds	116 Pounds	116 Pounds	116 Pounds	
07932PRCSN306CO	7440484	35 Pounds	35 Pounds	35 Pounds	35 Pounds	
07936FRTZSMERRY	67561	133 Pounds	128 Pounds	128 Pounds	128 Pounds	
07936FRTZSMERRY	7664417	1 Pounds	0 Pounds	0 Pounds	0 Pounds	
07936RYLLBMERRY	7647010	12 Pounds	12 Pounds	12 Pounds	12 Pounds	
07936RYLLBMERRY	78922	37 Pounds	37 Pounds	37 Pounds	37 Pounds	
07936RYLLBMERRY	N040	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07936SNDZP59ROU	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07962THMNNHANOV	50000	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07977KMLNS12HOL	7439965	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07977KMLNS12HOL	7440020	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
07977KMLNS12HOL	7440473	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08002MYCND616HO	67561	208 Pounds	177 Pounds	177 Pounds	177 Pounds	
08002MYCND616HO	80626	1746 Pounds	1573 Pounds	1573 Pounds	1573 Pounds	
08002MYCND616HO	94360	270 Pounds	0 Pounds	0 Pounds	0 Pounds	
08012TRNGL1TRIA	N120	250 Pounds	250 Pounds	250 Pounds	250 Pounds	
08014CSTMB210HI	107211	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08014CSTMB210HI	554132	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08014MNSNTROUTE	100447	1375 Pounds	1174 Pounds	1174 Pounds	1174 Pounds	
08014MNSNTROUTE	108883	16335.3 Pounds	10711 Pounds	10711 Pounds	10711 Pounds	
08014MNSNTROUTE	108952	1115 Pounds	394 Pounds	394 Pounds	394 Pounds	
08014MNSNTROUTE	121448	2535 Pounds	1920 Pounds	1920 Pounds	1920 Pounds	
08014MNSNTROUTE	71363	6431 Pounds	6383 Pounds	6383 Pounds	6383 Pounds	
08014MNSNTROUTE	75003	9176 Pounds	9135 Pounds	9135 Pounds	9135 Pounds	
08014MNSNTROUTE	75569	63 Pounds	0 Pounds	0 Pounds	0 Pounds	
08014MNSNTROUTE	7647010	293 Pounds	206 Pounds	206 Pounds	206 Pounds	
08014MNSNTROUTE	7664417	1152 Pounds	980 Pounds	980 Pounds	980 Pounds	
08014MNSNTROUTE	7782505	25 Pounds	6 Pounds	6 Pounds	6 Pounds	
08014MNSNTROUTE	79210	413 Pounds	2 Pounds	2 Pounds	2 Pounds	
08014MNSNTROUTE	85449	2709 Pounds	1623 Pounds	1623 Pounds	1623 Pounds	
08014MNSNTROUTE	98873	148 Pounds	10 Pounds	10 Pounds	10 Pounds	
08014PGCRPRTE13	110543	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08014PGCRPRTE13	7647010	7340 Pounds	7329 Pounds	7329 Pounds	7329 Pounds	
08014PGCRPRTE13	7664393	502 Pounds	501 Pounds	501 Pounds	501 Pounds	
08014PGCRPRTE13	7664417	5031 Pounds	807 Pounds	807 Pounds	807 Pounds	
08014PGCRPRTE13	91203	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08014PGCRPRTE13	95636	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08014PGCRPRTE13	N040	18621 Pounds	180 Pounds	180 Pounds	180 Pounds	
08014PGCRPRTE13	N420	2035.3 Pounds	8.55 Pounds	8.55 Pounds	8.55 Pounds	
08014PGCRPRTE13	N458	117.12 Pounds	0.97 Pounds	0.97 Pounds	0.97 Pounds	
08016BRLNGWBROA	N590	0.018 Pounds	0.0178 Pounds	0.0178 Pounds	0.0178 Pounds	
08016CMBRLCUMBE	7697372	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08016CMBRLCUMBE	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08016FRNKLBEVER	N010	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08016FRNKLBEVER	N040	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08016FRNKLBEVER	N420	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08016FRNKLBEVER	N982	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08016GLDBN1818R	N420	18.6 Pounds	1 Pounds	1 Pounds	1 Pounds	
0801WSVSNX1HARM	7439921	33.7 Pounds	0 Pounds	0 Pounds	0 Pounds	
08023DPNTCRT130	100016	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08023DPNTCRT130	100027	82.03 Pounds	0.03 Pounds	0.03 Pounds	0.03 Pounds	
08023DPNTCRT130	100254	20 Pounds	11 Pounds	11 Pounds	11 Pounds	
08023DPNTCRT130	106503	981.5 Pounds	520 Pounds	520 Pounds	520 Pounds	
08023DPNTCRT130	108101	2172 Pounds	455 Pounds	455 Pounds	455 Pounds	
08023DPNTCRT130	108452	4611 Pounds	302 Pounds	302 Pounds	302 Pounds	
08023DPNTCRT130	108952	8 Pounds	1 Pounds	1 Pounds	1 Pounds	
08023DPNTCRT130	110827	9426 Pounds	7322 Pounds	7322 Pounds	7322 Pounds	
08023DPNTCRT130	116143	18953 Pounds	18950 Pounds	18950 Pounds	18950 Pounds	
08023DPNTCRT130	124403	1616 Pounds	1414 Pounds	1414 Pounds	1414 Pounds	
08023DPNTCRT130	2837890	953 Pounds	0 Pounds	0 Pounds	0 Pounds	
08023DPNTCRT130	306832	2141 Pounds	0 Pounds	0 Pounds	0 Pounds	
08023DPNTCRT130	354256	7 Pounds	0 Pounds	0 Pounds	0 Pounds	
08023DPNTCRT130	51285	174 Pounds	0 Pounds	0 Pounds	0 Pounds	
08023DPNTCRT130	528290	2328 Pounds	40 Pounds	40 Pounds	40 Pounds	
08023DPNTCRT130	62533	610 Pounds	389 Pounds	389 Pounds	389 Pounds	
08023DPNTCRT130	67561	407.625 Pounds	403 Pounds	403 Pounds	403 Pounds	
08023DPNTCRT130	68122	203 Pounds	75 Pounds	75 Pounds	75 Pounds	
08023DPNTCRT130	74851	6105 Pounds	6105 Pounds	6105 Pounds	6105 Pounds	
08023DPNTCRT130	74873	5312 Pounds	5178 Pounds	5178 Pounds	5178 Pounds	
08023DPNTCRT130	75445	31 Pounds	29 Pounds	29 Pounds	29 Pounds	
08023DPNTCRT130	75887	70 Pounds	0 Pounds	0 Pounds	0 Pounds	
08023DPNTCRT130	76142	81 Pounds	0 Pounds	0 Pounds	0 Pounds	
08023DPNTCRT130	76153	2813 Pounds	0 Pounds	0 Pounds	0 Pounds	
08023DPNTCRT130	7632000	12833 Pounds	0 Pounds	0 Pounds	0 Pounds	
08023DPNTCRT130	7647010	5776 Pounds	3643 Pounds	3643 Pounds	3643 Pounds	
08023DPNTCRT130	7664393	638 Pounds	3 Pounds	3 Pounds	3 Pounds	
08023DPNTCRT130	7664417	5680.6 Pounds	806 Pounds	806 Pounds	806 Pounds	
08023DPNTCRT130	7697372	1320 Pounds	1320 Pounds	1320 Pounds	1320 Pounds	
08023DPNTCRT130	7782505	2519.5 Pounds	2518 Pounds	2518 Pounds	2518 Pounds	
08023DPNTCRT130	79107	15 Pounds	3 Pounds	3 Pounds	3 Pounds	
08023DPNTCRT130	8001589	34738 Pounds	0 Pounds	0 Pounds	0 Pounds	
08023DPNTCRT130	88891	153 Pounds	0 Pounds	0 Pounds	0 Pounds	
08023DPNTCRT130	95545	3819.5 Pounds	3116 Pounds	3116 Pounds	3116 Pounds	
08023DPNTCRT130	98953	1900 Pounds	1841 Pounds	1841 Pounds	1841 Pounds	
08023DPNTCRT130	99650	2130 Pounds	395 Pounds	395 Pounds	395 Pounds	
08023DPNTCRT130	N420	1314 Pounds	0 Pounds	0 Pounds	0 Pounds	
08023DPNTCRT130	N511	1771253 Pounds	0 Pounds	0 Pounds	0 Pounds	
08023DPNTCRT130	N590	4148.2 Pounds	0 Pounds	0 Pounds	0 Pounds	
08030KCHPTKINGW	191242	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08030KCHPTKINGW	N590	5 Pounds	0.9 Pounds	0.9 Pounds	0.9 Pounds	
08030NDCNCNRAIL	7632000	200 Pounds	100 Pounds	100 Pounds	100 Pounds	
08037KRRCN19212	7439921	0.0015 Pounds	0.0014 Pounds	0.0014 Pounds	0.0014 Pounds	
08037MRCNGRT54S	N982	43500 Pounds	250 Pounds	250 Pounds	250 Pounds	
08037MSSRL5SEGG	100425	2051 Pounds	5 Pounds	5 Pounds	5 Pounds	
08038NCLRBENDOF	302012	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08051HNGSTOGDEN	90437	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08052CVCSP2980R	101906	4 Pounds	3 Pounds	3 Pounds	3 Pounds	
08052CVCSP2980R	106898	32 Pounds	31 Pounds	31 Pounds	31 Pounds	
08052CVCSP2980R	124403	3 Pounds	2 Pounds	2 Pounds	2 Pounds	
08052CVCSP2980R	67561	3 Pounds	2 Pounds	2 Pounds	2 Pounds	
08052CVCSP2980R	95476	225 Pounds	222 Pounds	222 Pounds	222 Pounds	
08052STNHR1PARK	80057	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08052STNHR1PARK	N120	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08056BNNLL210HA	7664417	44866 Pounds	42816 Pounds	42816 Pounds	42816 Pounds	
08057GRSPCBORTO	7439921	4.14 Pounds	0 Pounds	0 Pounds	0 Pounds	
08057MCRRP1255N	N096	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08057MCRRP1255N	N450	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08057MRCNB105WG	108883	8101 Pounds	8101 Pounds	8101 Pounds	8101 Pounds	
08065CLLHNBROAD	100425	6 Pounds	4 Pounds	4 Pounds	4 Pounds	
08065CLLHNBROAD	108101	6 Pounds	5 Pounds	5 Pounds	5 Pounds	
08065CLLHNBROAD	67561	7 Pounds	6 Pounds	6 Pounds	6 Pounds	
08065CLLHNBROAD	N230	2 Pounds	1 Pounds	1 Pounds	1 Pounds	
08065RMTKN701PU	N100	633 Pounds	11 Pounds	11 Pounds	11 Pounds	
08065RMTKN701PU	N420	841 Pounds	0 Pounds	0 Pounds	0 Pounds	
08066BMPRS167IM	N120	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08066CPLYRMANTU	107211	1000 Pounds	750 Pounds	750 Pounds	750 Pounds	
08066CPLYRMANTU	108101	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08066CPLYRMANTU	123911	10 Pounds	5 Pounds	5 Pounds	5 Pounds	
08066CPLYRMANTU	26471625	10 Pounds	5 Pounds	5 Pounds	5 Pounds	
08066CPLYRMANTU	584849	39711 Pounds	5 Pounds	5 Pounds	5 Pounds	
08066CPLYRMANTU	68122	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08066CPLYRMANTU	85449	255 Pounds	5 Pounds	5 Pounds	5 Pounds	
08066CPLYRMANTU	98884	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08066CPLYRMANTU	N120	500 Pounds	250 Pounds	250 Pounds	250 Pounds	
08066DPNC 2000N	107211	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08066JHNSN2001A	108883	775 Pounds	260 Pounds	260 Pounds	260 Pounds	
08066JHNSN2001A	110543	42 Pounds	21 Pounds	21 Pounds	21 Pounds	
08066JHNSN2001A	1634044	180 Pounds	169 Pounds	169 Pounds	169 Pounds	
08066JHNSN2001A	302012	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08066JHNSN2001A	67561	1582 Pounds	1061 Pounds	1061 Pounds	1061 Pounds	
08066JHNSN2001A	71363	1029 Pounds	940 Pounds	940 Pounds	940 Pounds	
08066JHNSN2001A	7439976	6 Pounds	0 Pounds	0 Pounds	0 Pounds	
08066JHNSN2001A	75092	3716 Pounds	3300 Pounds	3300 Pounds	3300 Pounds	
08066JHNSN2001A	7647010	11246 Pounds	11246 Pounds	11246 Pounds	11246 Pounds	
08066JHNSN2001A	7664417	2819 Pounds	2819 Pounds	2819 Pounds	2819 Pounds	
08066JHNSN2001A	7664939	58 Pounds	58 Pounds	58 Pounds	58 Pounds	
08066JHNSN2001A	7697372	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08066JHNSN2001A	7782505	8160 Pounds	8160 Pounds	8160 Pounds	8160 Pounds	
08066JHNSN2001A	N090	18168 Pounds	2 Pounds	2 Pounds	2 Pounds	
08066JHNSN2001A	N420	205 Pounds	83 Pounds	83 Pounds	83 Pounds	
08066JHNSN2001A	N495	119832 Pounds	1 Pounds	1 Pounds	1 Pounds	
08066JHNSN2001A	N511	705 Pounds	0 Pounds	0 Pounds	0 Pounds	
08066JHNSN2001A	N740	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08066MBLLC1001B	N982	250.64 Pounds	0 Pounds	0 Pounds	0 Pounds	
08066MBLLCBILLI	100414	6149 Pounds	1320 Pounds	1320 Pounds	1320 Pounds	
08066MBLLCBILLI	106990	156 Pounds	116 Pounds	116 Pounds	116 Pounds	
08066MBLLCBILLI	108883	21915 Pounds	1672 Pounds	1672 Pounds	1672 Pounds	
08066MBLLCBILLI	110543	7376 Pounds	3316 Pounds	3316 Pounds	3316 Pounds	
08066MBLLCBILLI	110827	2524 Pounds	2502 Pounds	2502 Pounds	2502 Pounds	
08066MBLLCBILLI	111422	178 Pounds	0 Pounds	0 Pounds	0 Pounds	
08066MBLLCBILLI	115071	2966 Pounds	2901 Pounds	2901 Pounds	2901 Pounds	
08066MBLLCBILLI	127184	5 Pounds	0 Pounds	0 Pounds	0 Pounds	
08066MBLLCBILLI	1330207	16422 Pounds	1148 Pounds	1148 Pounds	1148 Pounds	
08066MBLLCBILLI	191242	0.6 Pounds	0.6 Pounds	0.6 Pounds	0.6 Pounds	
08066MBLLCBILLI	67561	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08066MBLLCBILLI	71432	11958 Pounds	6232 Pounds	6232 Pounds	6232 Pounds	
08066MBLLCBILLI	74851	5994 Pounds	5938 Pounds	5938 Pounds	5938 Pounds	
08066MBLLCBILLI	74908	193000 Pounds	193000 Pounds	193000 Pounds	193000 Pounds	
08066MBLLCBILLI	7647010	1767 Pounds	1767 Pounds	1767 Pounds	1767 Pounds	
08066MBLLCBILLI	7664393	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08066MBLLCBILLI	7664417	6819 Pounds	4418 Pounds	4418 Pounds	4418 Pounds	
08066MBLLCBILLI	7664939	30434 Pounds	30434 Pounds	30434 Pounds	30434 Pounds	
08066MBLLCBILLI	7783064	4969 Pounds	3908 Pounds	3908 Pounds	3908 Pounds	
08066MBLLCBILLI	91203	1682 Pounds	771 Pounds	771 Pounds	771 Pounds	
08066MBLLCBILLI	95636	2597 Pounds	27 Pounds	27 Pounds	27 Pounds	
08066MBLLCBILLI	98828	967 Pounds	118 Pounds	118 Pounds	118 Pounds	
08066MBLLCBILLI	N420	9 Pounds	9 Pounds	9 Pounds	9 Pounds	
08066MBLLCBILLI	N458	10.4 Pounds	10.4 Pounds	10.4 Pounds	10.4 Pounds	
08066MBLLCBILLI	N495	1082 Pounds	45 Pounds	45 Pounds	45 Pounds	
08066MBLLCBILLI	N511	642101 Pounds	0 Pounds	0 Pounds	0 Pounds	
08066MBLLCBILLI	N590	6.3 Pounds	6.3 Pounds	6.3 Pounds	6.3 Pounds	
08066MBLLCBILLI	N770	1727 Pounds	48 Pounds	48 Pounds	48 Pounds	
08066MBLLCBILLI	N982	1315 Pounds	542 Pounds	542 Pounds	542 Pounds	
08066RPRDCBILLI	101144	1100 Pounds	250 Pounds	250 Pounds	250 Pounds	
08066RPRDCBILLI	107211	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08066RPRDCBILLI	26471625	20854 Pounds	250 Pounds	250 Pounds	250 Pounds	
08066RPRDCBILLI	64186	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08066RPRDCBILLI	94360	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08066RPRDCBILLI	98884	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08066RPRDCBILLI	N120	255 Pounds	250 Pounds	250 Pounds	250 Pounds	
08066SVWLC4PARA	100414	789 Pounds	784 Pounds	784 Pounds	784 Pounds	
08066SVWLC4PARA	191242	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08066SVWLC4PARA	7439921	0.48 Pounds	0.13 Pounds	0.13 Pounds	0.13 Pounds	
08066SVWLC4PARA	7783064	3167 Pounds	160 Pounds	160 Pounds	160 Pounds	
08066SVWLC4PARA	N590	0.71 Pounds	0.71 Pounds	0.71 Pounds	0.71 Pounds	
08066SVWLC4PARA	N982	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08067PDRCK143US	7664417	8673 Pounds	8673 Pounds	8673 Pounds	8673 Pounds	
08067THBFGUSROU	100425	13 Pounds	0 Pounds	0 Pounds	0 Pounds	
08067THBFGUSROU	107131	16 Pounds	0 Pounds	0 Pounds	0 Pounds	
08067THBFGUSROU	140885	29 Pounds	0 Pounds	0 Pounds	0 Pounds	
08067THBFGUSROU	141322	19 Pounds	0 Pounds	0 Pounds	0 Pounds	
08067THBFGUSROU	50000	3 Pounds	0 Pounds	0 Pounds	0 Pounds	
08067THBFGUSROU	79061	8 Pounds	0 Pounds	0 Pounds	0 Pounds	
08067THBFGUSROU	79107	13 Pounds	0 Pounds	0 Pounds	0 Pounds	
08067THBFGUSROU	80626	13 Pounds	0 Pounds	0 Pounds	0 Pounds	
08067THBFGUSROU	924425	7 Pounds	0 Pounds	0 Pounds	0 Pounds	
08067THGNCUSRTE	140885	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08067THGNCUSRTE	75014	16317 Pounds	14444 Pounds	14444 Pounds	14444 Pounds	
08067THGNCUSRTE	79107	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08067THGNCUSRTE	96333	163 Pounds	0 Pounds	0 Pounds	0 Pounds	
08067XYVNYRTE13	75014	2610 Pounds	1310 Pounds	1310 Pounds	1310 Pounds	
08069CRNYS500SH	110543	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08069CRNYS500SH	7647010	20020 Pounds	20020 Pounds	20020 Pounds	20020 Pounds	
08069CRNYS500SH	7664393	3261 Pounds	3261 Pounds	3261 Pounds	3261 Pounds	
08069CRNYS500SH	7664417	25347 Pounds	3912 Pounds	3912 Pounds	3912 Pounds	
08069CRNYS500SH	91203	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08069CRNYS500SH	95636	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08069CRNYS500SH	N420	1819.53 Pounds	8.58 Pounds	8.58 Pounds	8.58 Pounds	
08069CRNYS500SH	N458	121.36 Pounds	2.36 Pounds	2.36 Pounds	2.36 Pounds	
08069CRNYS500SH	N770	2320 Pounds	9 Pounds	9 Pounds	9 Pounds	
08070GNSCHINDUS	100447	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08070GNSCHINDUS	107051	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08070GNSCHINDUS	108883	1207 Pounds	825 Pounds	825 Pounds	825 Pounds	
08070GNSCHINDUS	123911	30 Pounds	27 Pounds	27 Pounds	27 Pounds	
08070GNSCHINDUS	1634044	1578 Pounds	1522 Pounds	1522 Pounds	1522 Pounds	
08070GNSCHINDUS	57330	20 Pounds	20 Pounds	20 Pounds	20 Pounds	
08070GNSCHINDUS	67561	6917 Pounds	4975 Pounds	4975 Pounds	4975 Pounds	
08070GNSCHINDUS	75058	179 Pounds	108 Pounds	108 Pounds	108 Pounds	
08070GNSCHINDUS	75092	860 Pounds	729 Pounds	729 Pounds	729 Pounds	
08070GNSCHINDUS	7647010	114 Pounds	112 Pounds	112 Pounds	112 Pounds	
08070GNSCHINDUS	N106	21 Pounds	19 Pounds	19 Pounds	19 Pounds	
08071KTRNLRUTES	N420	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08073NDCTT10IND	107211	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08073NDCTT10IND	7440508	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08077HGNSCRIVER	7439965	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08077HGNSCRIVER	7440508	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08077HGNSCRIVER	N090	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08077HGNSCRIVER	N495	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08077KLSTR1050T	107211	930 Pounds	2 Pounds	2 Pounds	2 Pounds	
08077KLSTR1050T	7664417	1694 Pounds	1217 Pounds	1217 Pounds	1217 Pounds	
08077KLSTR1050T	N230	768 Pounds	7 Pounds	7 Pounds	7 Pounds	
08077KLSTR1050T	N511	942 Pounds	0 Pounds	0 Pounds	0 Pounds	
08077KLSTR1050T	N982	77 Pounds	0 Pounds	0 Pounds	0 Pounds	
08079MNNNGMANNI	N982	5352 Pounds	33 Pounds	33 Pounds	33 Pounds	
08079NCHRG83GRI	N420	608.1 Pounds	394 Pounds	394 Pounds	394 Pounds	
08085NGNRD2239H	N458	1.8 Pounds	0 Pounds	0 Pounds	0 Pounds	
08086GRLCK700MI	7439921	3796.11 Pounds	0.11 Pounds	0.11 Pounds	0.11 Pounds	
08086GRLCK700MI	7440508	3337 Pounds	0 Pounds	0 Pounds	0 Pounds	
08086PNNWLCROWN	1717006	416 Pounds	416 Pounds	416 Pounds	416 Pounds	
08086PNNWLCROWN	71556	1026 Pounds	1018 Pounds	1018 Pounds	1018 Pounds	
08086PNNWLCROWN	75354	154 Pounds	134 Pounds	134 Pounds	134 Pounds	
08086PNNWLCROWN	75683	2204 Pounds	1542 Pounds	1542 Pounds	1542 Pounds	
08086PNNWLCROWN	7647010	6444 Pounds	6256 Pounds	6256 Pounds	6256 Pounds	
08086PNNWLCROWN	7664393	566 Pounds	545 Pounds	545 Pounds	545 Pounds	
08088CLNLC78CAR	107211	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08088CLNLC78CAR	N450	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08088SFTYK123RE	107211	1 Pounds	1 Pounds	1 Pounds	1 Pounds	
08088SFTYK123RE	191242	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08088SFTYK123RE	7439921	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08088SFTYK123RE	N590	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08093CSTLGRTES1	100414	2454.21 Pounds	2439.38 Pounds	2439.38 Pounds	2439.38 Pounds	
08093CSTLGRTES1	108883	16167.79 Pounds	15987.86 Pounds	15987.86 Pounds	15987.86 Pounds	
08093CSTLGRTES1	110543	5417.14 Pounds	5386.13 Pounds	5386.13 Pounds	5386.13 Pounds	
08093CSTLGRTES1	110827	1070.815 Pounds	1060.6 Pounds	1060.6 Pounds	1060.6 Pounds	
08093CSTLGRTES1	1330207	13485.576 Pounds	13299.86 Pounds	13299.86 Pounds	13299.86 Pounds	
08093CSTLGRTES1	191242	0.513873 Pounds	0.5 Pounds	0.5 Pounds	0.5 Pounds	
08093CSTLGRTES1	71432	1110.44 Pounds	1067.07 Pounds	1067.07 Pounds	1067.07 Pounds	
08093CSTLGRTES1	7439976	0.47 Pounds	0 Pounds	0 Pounds	0 Pounds	
08093CSTLGRTES1	91203	293.33 Pounds	281.87 Pounds	281.87 Pounds	281.87 Pounds	
08093CSTLGRTES1	95636	3469.41 Pounds	3448 Pounds	3448 Pounds	3448 Pounds	
08093CSTLGRTES1	98828	839.11 Pounds	825.15 Pounds	825.15 Pounds	825.15 Pounds	
08093CSTLGRTES1	N420	81.78 Pounds	0 Pounds	0 Pounds	0 Pounds	
08093CSTLGRTES1	N590	12.0825 Pounds	3.61 Pounds	3.61 Pounds	3.61 Pounds	
08096GLFLL920KI	100414	138 Pounds	45 Pounds	45 Pounds	45 Pounds	
08096GLFLL920KI	108883	214 Pounds	68 Pounds	68 Pounds	68 Pounds	
08096GLFLL920KI	110543	188 Pounds	61 Pounds	61 Pounds	61 Pounds	
08096GLFLL920KI	110827	92 Pounds	30 Pounds	30 Pounds	30 Pounds	
08096GLFLL920KI	1330207	364 Pounds	118 Pounds	118 Pounds	118 Pounds	
08096GLFLL920KI	191242	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08096GLFLL920KI	71432	93 Pounds	90 Pounds	90 Pounds	90 Pounds	
08096GLFLL920KI	95636	14 Pounds	4 Pounds	4 Pounds	4 Pounds	
08096GLFLL920KI	N590	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08102FWWNTDELAW	N090	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08102FWWNTDELAW	N770	1 Pounds	0 Pounds	0 Pounds	0 Pounds	
08103DMTRN1101S	N420	0.1 Pounds	0.05 Pounds	0.05 Pounds	0.05 Pounds	
08103STTMT941SO	1336363	4.8794 Pounds	0.024 Pounds	0.024 Pounds	0.024 Pounds	
08103STTMT941SO	7429905	37466 Pounds	185 Pounds	185 Pounds	185 Pounds	
08103STTMT941SO	7439921	5.59 Pounds	0.05 Pounds	0.05 Pounds	0.05 Pounds	
08103STTMT941SO	7440508	378 Pounds	124 Pounds	124 Pounds	124 Pounds	
08103STTMT941SO	7782505	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08103STTMT941SO	N150	17.72317 Pounds	1.1362712 Pounds	1.1362712 Pounds	1.1362712 Pounds	
08110CLTXC1500J	N120	127.71 Pounds	127.71 Pounds	127.71 Pounds	127.71 Pounds	
08110CLTXC1500J	N230	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08110LMNMS9000R	7439921	47.3 Pounds	37.5 Pounds	37.5 Pounds	37.5 Pounds	
08110LMNMS9000R	7439965	593 Pounds	343 Pounds	343 Pounds	343 Pounds	
08110LMNMS9000R	7440508	1440.27 Pounds	1230 Pounds	1230 Pounds	1230 Pounds	
0821WDLPHN2141R	100425	8041 Pounds	6031 Pounds	6031 Pounds	6031 Pounds	
0821WRLPHC13CHE	7439921	1.1 Pounds	1.1 Pounds	1.1 Pounds	1.1 Pounds	
08223BLNGL900NS	191242	0.04 Pounds	0.04 Pounds	0.04 Pounds	0.04 Pounds	
08223BLNGL900NS	7647010	2382 Pounds	2382 Pounds	2382 Pounds	2382 Pounds	
08223BLNGL900NS	7664417	1588 Pounds	1575 Pounds	1575 Pounds	1575 Pounds	
08223BLNGL900NS	7664939	19507 Pounds	19507 Pounds	19507 Pounds	19507 Pounds	
08223BLNGL900NS	N040	1091 Pounds	606 Pounds	606 Pounds	606 Pounds	
08223BLNGL900NS	N420	633.21 Pounds	10.3 Pounds	10.3 Pounds	10.3 Pounds	
08223BLNGL900NS	N458	20.3 Pounds	2.1 Pounds	2.1 Pounds	2.1 Pounds	
08223BLNGL900NS	N590	31.9 Pounds	31.9 Pounds	31.9 Pounds	31.9 Pounds	
08224VKNGYRTE9	100425	37976 Pounds	37976 Pounds	37976 Pounds	37976 Pounds	
08302LNNDS443SE	N420	253.3 Pounds	253 Pounds	253 Pounds	253 Pounds	
08302WHTWV7RSEN	7697372	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08302WHTWV7RSEN	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08312PCKCK838ND	95636	76 Pounds	76 Pounds	76 Pounds	76 Pounds	
08312PCKCK838ND	N420	0.01 Pounds	0 Pounds	0 Pounds	0 Pounds	
08312PCKCK838ND	N450	6.308 Pounds	0 Pounds	0 Pounds	0 Pounds	
08320SBRFPFAIRT	7439921	573.43 Pounds	0 Pounds	0 Pounds	0 Pounds	
08332DRNDGWADEB	N420	4.1 Pounds	2.2 Pounds	2.2 Pounds	2.2 Pounds	
08332LCNPC1633W	N040	176 Pounds	141 Pounds	141 Pounds	141 Pounds	
08332WHTNG220GS	N040	10745 Pounds	454 Pounds	454 Pounds	454 Pounds	
08332WHTNG220GS	N450	3300 Pounds	89 Pounds	89 Pounds	89 Pounds	
08332WHTNG220GS	N982	115277 Pounds	5310 Pounds	5310 Pounds	5310 Pounds	
0833WCMBRL41EAS	7664417	5000 Pounds	5000 Pounds	5000 Pounds	5000 Pounds	
08352NTLRF661KE	2837890	850 Pounds	0 Pounds	0 Pounds	0 Pounds	
08352NTLRF661KE	306832	4735 Pounds	0 Pounds	0 Pounds	0 Pounds	
08352NTLRF661KE	75456	56516 Pounds	67 Pounds	67 Pounds	67 Pounds	
08352NTLRF661KE	75683	1 Pounds	0 Pounds	0 Pounds	0 Pounds	
08352NTLRF661KE	75694	2051 Pounds	0 Pounds	0 Pounds	0 Pounds	
08352NTLRF661KE	75718	834 Pounds	13 Pounds	13 Pounds	13 Pounds	
08360KMBLGCRYST	N040	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08362VNLNDNEWPE	91203	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08502LHNFNROUTE	N230	181 Pounds	108 Pounds	108 Pounds	108 Pounds	
08502LHNFNROUTE	N982	57 Pounds	0 Pounds	0 Pounds	0 Pounds	
08505NWLTR312RI	7439921	52 Pounds	0 Pounds	0 Pounds	0 Pounds	
08505NWLTR312RI	7440508	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08505STPNCFOURT	67561	2100 Pounds	0 Pounds	0 Pounds	0 Pounds	
08505STPNCFOURT	7664417	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08505STPNCFOURT	N230	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08512PLNTFHIGHT	7664417	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08512PLNTFHIGHT	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08512TWCVD32CMM	108101	509.2 Pounds	483.2 Pounds	483.2 Pounds	483.2 Pounds	
08512TWCVD32CMM	108883	1417.6 Pounds	1339.3 Pounds	1339.3 Pounds	1339.3 Pounds	
08530BRNCL11KAR	N420	0.5 Pounds	0.5 Pounds	0.5 Pounds	0.5 Pounds	
08530DVNCD245NM	7439921	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08536FRMNCPRINC	75070	48 Pounds	44 Pounds	44 Pounds	44 Pounds	
08536FRMNCPRINC	N230	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08543BRSTLRTE20	7664417	1212 Pounds	1012 Pounds	1012 Pounds	1012 Pounds	
08611MRCRGLAMBE	191242	0.02 Pounds	0.02 Pounds	0.02 Pounds	0.02 Pounds	
08611MRCRGLAMBE	7647010	803 Pounds	803 Pounds	803 Pounds	803 Pounds	
08611MRCRGLAMBE	7664417	2681 Pounds	2654 Pounds	2654 Pounds	2654 Pounds	
08611MRCRGLAMBE	7664939	21861 Pounds	21861 Pounds	21861 Pounds	21861 Pounds	
08611MRCRGLAMBE	N040	113 Pounds	108 Pounds	108 Pounds	108 Pounds	
08611MRCRGLAMBE	N420	5.3 Pounds	3.4 Pounds	3.4 Pounds	3.4 Pounds	
08611MRCRGLAMBE	N458	2.1 Pounds	2.1 Pounds	2.1 Pounds	2.1 Pounds	
08611MRCRGLAMBE	N590	0.2 Pounds	0.2 Pounds	0.2 Pounds	0.2 Pounds	
08619THTRN2231E	115071	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08619THTRN2231E	7439965	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08619THTRN2231E	7440020	0.0305 Pounds	0 Pounds	0 Pounds	0 Pounds	
08619THTRN2231E	7440473	0.0727 Pounds	0 Pounds	0 Pounds	0 Pounds	
08619THTRN2231E	N120	0.0251 Pounds	0.0251 Pounds	0.0251 Pounds	0.0251 Pounds	
08628RLLRBSULLI	7440473	82 Pounds	0 Pounds	0 Pounds	0 Pounds	
08638RCRRL157NL	67561	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08638RCRRL157NL	7440666	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08638RCRRL157NL	N982	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
0863WRLPHC1144N	7439921	1.23 Pounds	1.23 Pounds	1.23 Pounds	1.23 Pounds	
08640SRMYH5417A	7439921	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08640SRMYH5417A	7440508	57179 Pounds	0 Pounds	0 Pounds	0 Pounds	
08640SRMYH5417A	N420	82848.8 Pounds	0 Pounds	0 Pounds	0 Pounds	
08640SRMYH5417A	N511	27764 Pounds	0 Pounds	0 Pounds	0 Pounds	
08648MTLLT6LITH	100414	429 Pounds	386 Pounds	386 Pounds	386 Pounds	
08648MTLLT6LITH	108101	1078 Pounds	970 Pounds	970 Pounds	970 Pounds	
08648MTLLT6LITH	1330207	1350 Pounds	1215 Pounds	1215 Pounds	1215 Pounds	
08648MTLLT6LITH	71363	693 Pounds	624 Pounds	624 Pounds	624 Pounds	
08648MTLLT6LITH	95636	92 Pounds	83 Pounds	83 Pounds	83 Pounds	
08648MTLLT6LITH	N230	1757 Pounds	1581 Pounds	1581 Pounds	1581 Pounds	
08691WBTCH108NG	108101	49 Pounds	49 Pounds	49 Pounds	49 Pounds	
08691WBTCH108NG	108883	256 Pounds	256 Pounds	256 Pounds	256 Pounds	
08691WBTCH108NG	1330207	31 Pounds	31 Pounds	31 Pounds	31 Pounds	
08701CHRCH800AI	N982	2206 Pounds	2 Pounds	2 Pounds	2 Pounds	
08701FLXBR1969R	107211	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08701FLXBR1969R	108883	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08701FLXBR1969R	1330207	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08701FLXBR1969R	N100	5 Pounds	5 Pounds	5 Pounds	5 Pounds	
08701FLXBR1969R	N982	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08701GLSSL485OB	N420	0.086 Pounds	0 Pounds	0 Pounds	0 Pounds	
08701LKWDC123EN	7664417	2145 Pounds	2140 Pounds	2140 Pounds	2140 Pounds	
08701LPHSS145LE	108883	3287 Pounds	3287 Pounds	3287 Pounds	3287 Pounds	
08701LPHSS145LE	1163195	150 Pounds	0 Pounds	0 Pounds	0 Pounds	
08701LPHSS145LE	1330207	9024 Pounds	9024 Pounds	9024 Pounds	9024 Pounds	
08701LPHSS145LE	N010	2071 Pounds	0 Pounds	0 Pounds	0 Pounds	
08701PRMCL1990R	100414	685 Pounds	675 Pounds	675 Pounds	675 Pounds	
08701PRMCL1990R	108883	2167 Pounds	2067 Pounds	2067 Pounds	2067 Pounds	
08701PRMCL1990R	1330207	3127 Pounds	3027 Pounds	3027 Pounds	3027 Pounds	
08701PRMCL1990R	N982	30164 Pounds	4 Pounds	4 Pounds	4 Pounds	
0870WRLPHC7HAVE	7439921	3 Pounds	3 Pounds	3 Pounds	3 Pounds	
0870WRLPHC7HAVE	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08733NVLRNRTE54	107211	2.8 Pounds	0 Pounds	0 Pounds	0 Pounds	
08733NVLRNRTE54	7439921	1.15 Pounds	0.47 Pounds	0.47 Pounds	0.47 Pounds	
08759RGTHR35CLN	7429905	255 Pounds	5 Pounds	5 Pounds	5 Pounds	
08805PLYMR1EEAS	N120	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08807BRDDC123CH	67561	716 Pounds	0 Pounds	0 Pounds	0 Pounds	
08810CRYCM5NICH	117817	752.78 Pounds	8.13 Pounds	8.13 Pounds	8.13 Pounds	
08810CRYCM5NICH	80057	126.56 Pounds	1.42 Pounds	1.42 Pounds	1.42 Pounds	
08810CRYCM5NICH	N010	745.61 Pounds	8 Pounds	8 Pounds	8 Pounds	
08810CRYCM5NICH	N040	129.07 Pounds	2 Pounds	2 Pounds	2 Pounds	
08810CRYCM5NICH	N420	9.69 Pounds	0.09 Pounds	0.09 Pounds	0.09 Pounds	
08810CRYCM5NICH	N982	633.5 Pounds	8 Pounds	8 Pounds	8 Pounds	
08810RCHMN1CHRI	7439921	15.7 Pounds	5 Pounds	5 Pounds	5 Pounds	
08810RCHMN1CHRI	7440508	53.36 Pounds	5 Pounds	5 Pounds	5 Pounds	
08816MNCND5JOAN	108883	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08816MNCND5JOAN	110543	1151 Pounds	575 Pounds	575 Pounds	575 Pounds	
08816MNCND5JOAN	110827	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08817CLNLW85NAT	N010	4.6 Pounds	2.3 Pounds	2.3 Pounds	2.3 Pounds	
08817CLNLW85NAT	N100	7.6 Pounds	3.8 Pounds	3.8 Pounds	3.8 Pounds	
08817GRCDV34MEA	110543	77 Pounds	0 Pounds	0 Pounds	0 Pounds	
08817GRCDV34MEA	117817	1 Pounds	0 Pounds	0 Pounds	0 Pounds	
08817GRCDV34MEA	71363	257 Pounds	0 Pounds	0 Pounds	0 Pounds	
08817GRCDV34MEA	7550450	5 Pounds	1 Pounds	1 Pounds	1 Pounds	
08817GRCDV34MEA	N770	553 Pounds	18 Pounds	18 Pounds	18 Pounds	
08817KZCHMMEADO	110543	20976 Pounds	20739 Pounds	20739 Pounds	20739 Pounds	
08817KZCHMMEADO	7550450	1014 Pounds	1002 Pounds	1002 Pounds	1002 Pounds	
08817MRCNN135NA	71363	5000 Pounds	2500 Pounds	2500 Pounds	2500 Pounds	
08817MRCNN135NA	N230	12300 Pounds	2000 Pounds	2000 Pounds	2000 Pounds	
08817PCXTR18NAT	N010	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08817PDBSN54KEL	N090	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08817PDBSN54KEL	N420	14.802 Pounds	0.001 Pounds	0.001 Pounds	0.001 Pounds	
08818MBLCHRT27A	91203	3083 Pounds	3064 Pounds	3064 Pounds	3064 Pounds	
08818MTXCR970NE	7440020	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08818MTXCR970NE	7440473	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08818MTXCR970NE	7440508	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08821NDSTRVALLE	N100	1 Pounds	0 Pounds	0 Pounds	0 Pounds	
08821NDSTRVALLE	N982	1 Pounds	0 Pounds	0 Pounds	0 Pounds	
088223M   500RT	N420	544.3 Pounds	1.3 Pounds	1.3 Pounds	1.3 Pounds	
08822MGNSM500PO	7697372	500 Pounds	250 Pounds	250 Pounds	250 Pounds	
08822TLNTC137RT	N090	4 Pounds	4 Pounds	4 Pounds	4 Pounds	
08822TLNTC137RT	N495	2 Pounds	2 Pounds	2 Pounds	2 Pounds	
08829CSTML3WASH	7439921	750.681 Pounds	40 Pounds	40 Pounds	40 Pounds	
08829CSTML3WASH	7439965	33210.8 Pounds	3.9 Pounds	3.9 Pounds	3.9 Pounds	
08829CSTML3WASH	7440020	70349.3 Pounds	32.6 Pounds	32.6 Pounds	32.6 Pounds	
08829CSTML3WASH	7440473	38709.5 Pounds	36 Pounds	36 Pounds	36 Pounds	
08829CSTML3WASH	7440508	33079.86 Pounds	26.6 Pounds	26.6 Pounds	26.6 Pounds	
08829CSTML3WASH	7723140	38669.84 Pounds	0.04 Pounds	0.04 Pounds	0.04 Pounds	
08829GLSSM124WM	N420	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
0883WTRPRCFTFCR	191242	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
0883WTRPRCFTFCR	N590	4 Pounds	3.7 Pounds	3.7 Pounds	3.7 Pounds	
08846MRSLN125FA	100414	475 Pounds	306 Pounds	306 Pounds	306 Pounds	
08846MRSLN125FA	108101	1103 Pounds	509 Pounds	509 Pounds	509 Pounds	
08846MRSLN125FA	108883	4786 Pounds	546 Pounds	546 Pounds	546 Pounds	
08846MRSLN125FA	110543	1447 Pounds	334 Pounds	334 Pounds	334 Pounds	
08846MRSLN125FA	1330207	2573 Pounds	474 Pounds	474 Pounds	474 Pounds	
08846MRSLN125FA	67561	5250 Pounds	967 Pounds	967 Pounds	967 Pounds	
08846MRSLN125FA	67630	7285 Pounds	824 Pounds	824 Pounds	824 Pounds	
08846MRSLN125FA	75058	3692 Pounds	1718 Pounds	1718 Pounds	1718 Pounds	
08846MRSLN125FA	75092	9267 Pounds	3683 Pounds	3683 Pounds	3683 Pounds	
08846MRSLN125FA	79016	639 Pounds	368 Pounds	368 Pounds	368 Pounds	
08846MRSLN125FA	872504	1260 Pounds	330 Pounds	330 Pounds	330 Pounds	
08846MRSLN125FA	N040	19047 Pounds	0 Pounds	0 Pounds	0 Pounds	
08846MRSLN125FA	N090	8048 Pounds	0 Pounds	0 Pounds	0 Pounds	
08846MRSLN125FA	N230	35 Pounds	28 Pounds	28 Pounds	28 Pounds	
08846MRSLN125FA	N420	19556 Pounds	0 Pounds	0 Pounds	0 Pounds	
08846MRSLN125FA	N458	15 Pounds	0 Pounds	0 Pounds	0 Pounds	
08846MRSLN125FA	N590	7 Pounds	0 Pounds	0 Pounds	0 Pounds	
08846MRSLN125FA	N740	11491 Pounds	0 Pounds	0 Pounds	0 Pounds	
08846MRSLN125FA	N982	7418 Pounds	0 Pounds	0 Pounds	0 Pounds	
08846THBTHLINCO	108883	2147 Pounds	2142 Pounds	2142 Pounds	2142 Pounds	
08846THBTHLINCO	110543	255 Pounds	250 Pounds	250 Pounds	250 Pounds	
0884WCLYTN125US	7439921	3.1 Pounds	3.1 Pounds	3.1 Pounds	3.1 Pounds	
0884WCLYTN125US	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08852JHNCDNEWRO	100414	1.1 Pounds	0.08 Pounds	0.08 Pounds	0.08 Pounds	
08852JHNCDNEWRO	108316	13.39 Pounds	1.07 Pounds	1.07 Pounds	1.07 Pounds	
08852JHNCDNEWRO	1330207	1198.45 Pounds	95.87 Pounds	95.87 Pounds	95.87 Pounds	
08852MHWKLSTOUT	7632000	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08854NNCRB1RIVE	108883	84.529 Pounds	73.529 Pounds	73.529 Pounds	73.529 Pounds	
08854ZGLRC600PR	191242	0.0001253 Pounds	0.0000003 Pounds	0.0000003 Pounds	0.0000003 Pounds	
08854ZGLRC600PR	95636	48.97 Pounds	22.27 Pounds	22.27 Pounds	22.27 Pounds	
08854ZGLRC600PR	N590	0.00201 Pounds	0.00001 Pounds	0.00001 Pounds	0.00001 Pounds	
08857BLNDR1JAKE	N420	1.03 Pounds	0.535 Pounds	0.535 Pounds	0.535 Pounds	
08857LDBRDOLDWA	N100	1621 Pounds	1621 Pounds	1621 Pounds	1621 Pounds	
08857LDBRDOLDWA	N420	8 Pounds	8 Pounds	8 Pounds	8 Pounds	
08857LDBRDOLDWA	N982	156 Pounds	156 Pounds	156 Pounds	156 Pounds	
08857MDSNNOLDWA	N100	27 Pounds	3 Pounds	3 Pounds	3 Pounds	
08857MDSNNOLDWA	N420	23804 Pounds	2 Pounds	2 Pounds	2 Pounds	
08857MDSNNOLDWA	N450	744 Pounds	11 Pounds	11 Pounds	11 Pounds	
08857MDSNNOLDWA	N982	325872 Pounds	2509 Pounds	2509 Pounds	2509 Pounds	
08859CLPNP970WA	7664417	825 Pounds	825 Pounds	825 Pounds	825 Pounds	
08859DPNTPCHEES	107131	47.76 Pounds	45.17 Pounds	45.17 Pounds	45.17 Pounds	
08859DPNTPCHEES	108101	528.98 Pounds	479.12 Pounds	479.12 Pounds	479.12 Pounds	
08859DPNTPCHEES	121448	279 Pounds	278 Pounds	278 Pounds	278 Pounds	
08859DPNTPCHEES	141322	10.025 Pounds	1.99 Pounds	1.99 Pounds	1.99 Pounds	
08859DPNTPCHEES	872504	446 Pounds	429 Pounds	429 Pounds	429 Pounds	
08859DPNTPCHEES	N230	8.37 Pounds	1.38 Pounds	1.38 Pounds	1.38 Pounds	
08859HDMCR500CH	872504	144 Pounds	119 Pounds	119 Pounds	119 Pounds	
08859HRCLSSOUTH	107211	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08859HRCLSSOUTH	75218	710.4 Pounds	86.4 Pounds	86.4 Pounds	86.4 Pounds	
08859HRCLSSOUTH	75650	11451 Pounds	48 Pounds	48 Pounds	48 Pounds	
08859HRCLSSOUTH	7697372	452 Pounds	360 Pounds	360 Pounds	360 Pounds	
08859HRCLSSOUTH	N230	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08859HRCLSSOUTH	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08861NGLRT1200A	131113	2 Pounds	2 Pounds	2 Pounds	2 Pounds	
08861NGLRT1200A	1330207	3 Pounds	3 Pounds	3 Pounds	3 Pounds	
08861NGLRT1200A	71363	1 Pounds	1 Pounds	1 Pounds	1 Pounds	
08861NGLRT1200A	91203	3 Pounds	3 Pounds	3 Pounds	3 Pounds	
08861NGLRT1200A	95636	3 Pounds	3 Pounds	3 Pounds	3 Pounds	
08861NGLRT1200A	N230	7 Pounds	7 Pounds	7 Pounds	7 Pounds	
08861VSMBY1190A	7439921	195.1 Pounds	1.8 Pounds	1.8 Pounds	1.8 Pounds	
08861VSMBY1190A	N982	26881 Pounds	69 Pounds	69 Pounds	69 Pounds	
08862WTCCR1000C	107211	1701 Pounds	1650 Pounds	1650 Pounds	1650 Pounds	
08862WTCCR1000C	121448	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08862WTCCR1000C	302012	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08862WTCCR1000C	872504	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08862WTCCR1000C	N120	327 Pounds	180 Pounds	180 Pounds	180 Pounds	
08863HTCCRKINGG	85449	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08865JTBKR600NO	108883	86 Pounds	60 Pounds	60 Pounds	60 Pounds	
08865JTBKR600NO	110543	3177 Pounds	2584 Pounds	2584 Pounds	2584 Pounds	
08865JTBKR600NO	120809	1 Pounds	1 Pounds	1 Pounds	1 Pounds	
08865JTBKR600NO	67561	2559 Pounds	1450 Pounds	1450 Pounds	1450 Pounds	
08865JTBKR600NO	75058	710 Pounds	59 Pounds	59 Pounds	59 Pounds	
08865JTBKR600NO	75092	1510 Pounds	677 Pounds	677 Pounds	677 Pounds	
08865JTBKR600NO	7647010	3176 Pounds	1704 Pounds	1704 Pounds	1704 Pounds	
08865JTBKR600NO	7664417	8999 Pounds	0 Pounds	0 Pounds	0 Pounds	
08865JTBKR600NO	7664939	2041 Pounds	1821 Pounds	1821 Pounds	1821 Pounds	
08865JTBKR600NO	7697372	689 Pounds	689 Pounds	689 Pounds	689 Pounds	
08865JTBKR600NO	872504	713 Pounds	330 Pounds	330 Pounds	330 Pounds	
08865JTBKR600NO	N100	1790 Pounds	0 Pounds	0 Pounds	0 Pounds	
08865JTBKR600NO	N230	7 Pounds	0 Pounds	0 Pounds	0 Pounds	
08865JTBKR600NO	N450	6054 Pounds	28 Pounds	28 Pounds	28 Pounds	
08865JTBKR600NO	N495	119 Pounds	20 Pounds	20 Pounds	20 Pounds	
08865JTBKR600NO	N511	255372 Pounds	0 Pounds	0 Pounds	0 Pounds	
08865JTBKR600NO	N982	3097 Pounds	47 Pounds	47 Pounds	47 Pounds	
08865TLNTC183SI	N420	23314.8316 Pounds	10.9 Pounds	10.9 Pounds	10.9 Pounds	
08865TLNTC183SI	N450	21440 Pounds	22 Pounds	22 Pounds	22 Pounds	
08865TLNTC183SI	N458	24 Pounds	0.3 Pounds	0.3 Pounds	0.3 Pounds	
08865TLNTC183SI	N982	200580 Pounds	200 Pounds	200 Pounds	200 Pounds	
08869RTHDGROUTE	67561	1388 Pounds	1388 Pounds	1388 Pounds	1388 Pounds	
08872CNFLD1SCRO	7439921	327.2 Pounds	0.3 Pounds	0.3 Pounds	0.3 Pounds	
08872NWJRSNORTH	N100	13385 Pounds	0 Pounds	0 Pounds	0 Pounds	
08872NWJRSNORTH	N150	0.4038 Pounds	0.4037876 Pounds	0.4037876 Pounds	0.4037876 Pounds	
08872NWJRSNORTH	N420	251580 Pounds	1724 Pounds	1724 Pounds	1724 Pounds	
08872NWJRSNORTH	N450	28144 Pounds	539 Pounds	539 Pounds	539 Pounds	
08872NWJRSNORTH	N458	781 Pounds	245 Pounds	245 Pounds	245 Pounds	
08872NWJRSNORTH	N495	20 Pounds	5 Pounds	5 Pounds	5 Pounds	
08872NWJRSNORTH	N982	218691 Pounds	1495 Pounds	1495 Pounds	1495 Pounds	
08872PHRMT65JER	108316	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08873NNCRB40VER	67561	1523 Pounds	244 Pounds	244 Pounds	244 Pounds	
08873WMZNS39BEL	100425	1375 Pounds	413 Pounds	413 Pounds	413 Pounds	
08873WMZNS39BEL	107211	20534 Pounds	8 Pounds	8 Pounds	8 Pounds	
08873WMZNS39BEL	140885	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08873WMZNS39BEL	141322	1177 Pounds	317 Pounds	317 Pounds	317 Pounds	
08873WMZNS39BEL	7632000	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08873WMZNS39BEL	7664417	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08873WMZNS39BEL	79107	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08873WMZNS39BEL	80626	389 Pounds	283 Pounds	283 Pounds	283 Pounds	
08873WMZNS39BEL	N230	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08873WMZNS39BEL	N982	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08875RTRCL187DA	7440666	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08875RTRCL187DA	7632000	13120 Pounds	0 Pounds	0 Pounds	0 Pounds	
08876DVRNCSOUTH	7664417	24878 Pounds	14016 Pounds	14016 Pounds	14016 Pounds	
08876FSHRS755RT	107211	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08876FSHRS755RT	108883	108.63 Pounds	5.08 Pounds	5.08 Pounds	5.08 Pounds	
08876FSHRS755RT	110543	48.05 Pounds	40.36 Pounds	40.36 Pounds	40.36 Pounds	
08876FSHRS755RT	110861	0.1 Pounds	0.09 Pounds	0.09 Pounds	0.09 Pounds	
08876FSHRS755RT	1330207	2.89 Pounds	2.63 Pounds	2.63 Pounds	2.63 Pounds	
08876FSHRS755RT	50000	23.91 Pounds	0.09 Pounds	0.09 Pounds	0.09 Pounds	
08876FSHRS755RT	67561	1005.71 Pounds	47.67 Pounds	47.67 Pounds	47.67 Pounds	
08876FSHRS755RT	67663	22.55 Pounds	12.47 Pounds	12.47 Pounds	12.47 Pounds	
08876FSHRS755RT	68122	0.57 Pounds	0.37 Pounds	0.37 Pounds	0.37 Pounds	
08876FSHRS755RT	71363	0.07 Pounds	0.05 Pounds	0.05 Pounds	0.05 Pounds	
08876FSHRS755RT	75058	20.43 Pounds	18.79 Pounds	18.79 Pounds	18.79 Pounds	
08876FSHRS755RT	75092	144.56 Pounds	142.78 Pounds	142.78 Pounds	142.78 Pounds	
08876FSHRS755RT	872504	0.00191 Pounds	0 Pounds	0 Pounds	0 Pounds	
08876FSHRS755RT	N420	40.19 Pounds	0 Pounds	0 Pounds	0 Pounds	
08876FSHRS755RT	N458	0.01 Pounds	0 Pounds	0 Pounds	0 Pounds	
08876GBSNT100AS	7439965	1 Pounds	1 Pounds	1 Pounds	1 Pounds	
08876GBSNT100AS	7440020	1 Pounds	1 Pounds	1 Pounds	1 Pounds	
08876GBSNT100AS	7440473	1 Pounds	1 Pounds	1 Pounds	1 Pounds	
08876GBSNT100AS	7440508	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08876PRNTN50MEI	872504	500 Pounds	250 Pounds	250 Pounds	250 Pounds	
08876PRNTN50MEI	91203	10 Pounds	5 Pounds	5 Pounds	5 Pounds	
08876RMTCT130IN	N230	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08876RMTCT197ME	N230	3 Pounds	2 Pounds	2 Pounds	2 Pounds	
08876THCNNROUTE	7440473	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
0887WNWWRL1RAND	7440020	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
0887WNWWRL1RAND	7440473	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
0887WRCHML18USH	67561	37 Pounds	32 Pounds	32 Pounds	32 Pounds	
0887WRCHML18USH	75058	82 Pounds	41 Pounds	41 Pounds	41 Pounds	
0887WRCHML18USH	75092	114 Pounds	105 Pounds	105 Pounds	105 Pounds	
08884KMBRL85MAI	10049044	1480 Pounds	1480 Pounds	1480 Pounds	1480 Pounds	
08884KMBRL85MAI	67561	110 Pounds	110 Pounds	110 Pounds	110 Pounds	
08884SPRRSPOBOX	67721	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08884SPRRSPOBOX	7440666	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08884SPRRSPOBOX	N982	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08888DRLNGPOBOX	7697372	1 Pounds	0 Pounds	0 Pounds	0 Pounds	
08901SPCTR755JE	110827	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08901SPCTR755JE	67561	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08901SPCTR755JE	75058	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08901SPCTR755JE	N420	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08901SPCTR755JE	N458	12 Pounds	0 Pounds	0 Pounds	0 Pounds	
08902BRNTC1010J	7697372	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08902BRNTC1010J	N106	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08902RSQBBONESQ	108883	500 Pounds	250 Pounds	250 Pounds	250 Pounds	
08902RSQBBONESQ	1634044	500 Pounds	250 Pounds	250 Pounds	250 Pounds	
08902RSQBBONESQ	67561	1000 Pounds	250 Pounds	250 Pounds	250 Pounds	
08902RSQBBONESQ	68122	255 Pounds	5 Pounds	5 Pounds	5 Pounds	
08902RSQBBONESQ	7439965	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08902RSQBBONESQ	7440020	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08902RSQBBONESQ	7440473	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08902RSQBBONESQ	75058	1000 Pounds	250 Pounds	250 Pounds	250 Pounds	
08902RSQBBONESQ	75092	500 Pounds	250 Pounds	250 Pounds	250 Pounds	
08902RSQBBONESQ	872504	500 Pounds	250 Pounds	250 Pounds	250 Pounds	
08902SLVRL1SILV	107211	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08902SLVRL1SILV	N120	0.23 Pounds	0.23 Pounds	0.23 Pounds	0.23 Pounds	
08903KZCHM500JE	67561	52 Pounds	36 Pounds	36 Pounds	36 Pounds	
08903KZCHM500JE	7697372	94 Pounds	94 Pounds	94 Pounds	94 Pounds	
08903KZCHM500JE	95636	41 Pounds	23 Pounds	23 Pounds	23 Pounds	
08903KZCHM500JE	N020	10 Pounds	5 Pounds	5 Pounds	5 Pounds	
08903KZCHM500JE	N040	1369 Pounds	5 Pounds	5 Pounds	5 Pounds	
08903KZCHM500JE	N078	38 Pounds	5 Pounds	5 Pounds	5 Pounds	
08903KZCHM500JE	N096	476 Pounds	5 Pounds	5 Pounds	5 Pounds	
08903KZCHM500JE	N230	213 Pounds	208 Pounds	208 Pounds	208 Pounds	
08903KZCHM500JE	N450	68 Pounds	3 Pounds	3 Pounds	3 Pounds	
08903KZCHM500JE	N511	0 Pounds	0 Pounds	0 Pounds	0 Pounds	
08903KZCHM500JE	N982	238 Pounds	5 Pounds	5 Pounds	5 Pounds	
\.

--
-- Data for Name: contributed; Type: TABLE DATA; Schema: newsoap; Owner: postgres
--

COPY newsoap.contributed (facility_id, source_id) FROM stdin;
\.
--
-- Data for Name: facilities; Type: TABLE DATA; Schema: newsoap; Owner: postgres
--

COPY newsoap.facilities (id, facility_name, location_id, is_brownfield) FROM stdin;
07001PLTLB267HO	PILOT LABORATORIES	267 HOMESTEAD AVE	N/A
07001PRDSL211RA	PRIDE SOLVENTS & CHEMICAL CO OF NEW JERSEY	211 RANDOLPH AVE	N/A
07001THPRC100ES	THE PROCTER & GAMBLE CO	100 ESSEX AVE E	N/A
07002BYNNN141HD	BAYONNE ENERGY CENTER	401 HOOK RD	N/A
07002KNRCH140E2	KENRICH PETROCHEMICALS INC	140 E 22ND ST	N/A
07002NRTNS148EA	MURALO CO INC NORTON & SON DIV	148 E FIFTH ST	N/A
07003BNKSB24FED	BANKS BROTHERS CORP	24  FEDERAL  PLAZA	N/A
07003CMFRN13DEW	CM FURNACES INC	103 DEWEY ST	N/A
07003GNRLP55LAF	GENERAL PLASTICS INC	55 LA FRANCE AVE	N/A
07004CRMCM206RT	CERAMIC MAGNETICS INC	16 LAW DR	N/A
07005DRNNC94FAN	ADRON INC	94 FANNY RD	N/A
07005RFLLC353PO	RFL ELECTRONICS INC	353 POWERVILLE RD	N/A
07006CNSTN17COM	CONSTANT SERVICES INC	17 COMMERCE RD	N/A
07008MCLC0760RO	BP PRODUCTS NA INC CARTERET TERMINAL	760 ROOSEVELT AVE	N/A
07008SHLND350RO	NEXEO SOLUTIONS LLC-CARTERET	350 ROOSEVELT AVE	N/A
07008XFRDS600MI	OXFORD INSTRUMENTS	600 MILIK ST	N/A
0700WGSFLP19IND	GASFLO PRODUCTS	19 IND US TRIAL RD	N/A
0700WLTRDD1455B	ULTRA ADDITIVES LLC	1455 BROAD ST SUITE 3	N/A
0700WLTSLH21HEN	LTS LOHMANN THERAPY SYSTEMS CORP	21 HENDERSON DR	N/A
0700WPPTMZ11MAD	PPI-TIME ZERO INC	11 MADISON RD	N/A
07011LMRTC16RIC	LAMART CORP	16 RICHMOND ST	N/A
07011SFSCR2ACKE	SAFAS CORP	2 ACKERMAN AVE	N/A
07012CMSNT454AL	COMUS INTERNATIONAL INC	454 ALWOOD RD	N/A
07012SCHRCONEST	LUBRIZOL ADVANCED MATERIALS INC	1 IND US TRIAL W	N/A
07014TTVNC100KI	INTEGRATED ELECTRONIC WARFARE SYSTEMS	77 RIVER RD	N/A
07015SWPCT1CLIF	SWEPCO TUBE LLC	1 CLIFTON BLVD	N/A
0701WDRTCF6WEBR	DRITAC FLOORING PRODUCTS LLC	60 WEBRO RD	N/A
07026NLCLR61RIV	O'NEIL COLOR & COMPOUNDING	61 RIVER DR	N/A
07029KRNYS936HA	KEARNY SMELTING & REFINING CORP	936 HARRISON AVE	N/A
07030SCSTN725JE	US CASTINGS CORP	4407 PARK AVE	N/A
07032KHNCH86HAC	KUEHNE CHEMICAL CO INC	84 N HACKENSACK AVE	N/A
07032KRNYGHACKE	PSEG KEARNY GENERATING STATION	HACKENSACK AVE	N/A
07032SWWST115JA	CLEAN EARTH OF NORTH JERSEY INC	105 JACOBUS AVE	N/A
07032VCKRD67CEN	VECKRIDGE CHEMICAL	60-70 CENTRAL AVE	N/A
07032WNSCRNEWAR	OWENS CORNING ROOFING & ASPHALT LLC	1249 NEWARK TURNPIKE	N/A
07033SYNRY209NM	SYNRAY CORP	209 N MICHIGAN AVE	N/A
07035HSHPL600FR	HISHI PLASTICS USA INC	600 RYERSON RD	N/A
07036CGNTCRAILR	COGEN TECHNOLOGIES LINDEN VENTURE LP	RAILROAD AVE BAYWAY REFINER	N/A
07036CNCPHFTFSW	PHILLIPS 66 CO TREMLEY POINT TERMINAL	FOOT OF S WOOD AVE	N/A
07036CTGPT4801S	CITGO PETROLEUM CORP	4801 S WOOD AVE	N/A
07036GLFLL2600M	GULF OIL LP LINDEN TERMINAL	2600 MARSHES DOCK RD	N/A
07036LFLBR5NSTI	TOTAL SPECIALTIES USA INC	5 N STILES ST	N/A
07036LNDNGWOODA	LINDEN GENERATING STATION	WOOD AVE S	N/A
07036PRMNT1515W	PARAMOUNT METAL FINISHING	1515 W ELIZABETH AVE	N/A
07036SFTYK1200S	SAFETY-KLEEN SYSTEMS INC	1200 SYLVAN ST	N/A
07036XXNCH1400P	INFINEUM USA LP-BAYWAY CHEMICAL PLANT	CORNER OF PARK & BRUNSWICK AVENUES	N/A
0703WCLYTN2PRET	RALPH CLAYTON & SONS	2 PORETE AVE	N/A
0703WDPNTD14PAR	E I DUPONT DE NEMOURS-MORSES MILL	1400 PARK AVE	N/A
0703WWLDNS2MARS	WELDON ASPHALT CO	2000 MARSHES DOCK RD	N/A
07047WRGRC21338	WR GRACE & CO - CONN GRACE CONSTRUCTION PRODUCTS	2133 85TH ST	N/A
07054MTMCR700PA	METEM CORP	700 PARSIPPANY RD	N/A
07054WMSTN29EHA	WM STEINEN MANUFACTURING CO	29 E HALSEY RD	N/A
07054ZMMRT1PMER	ZIMMER TRABECULAR METAL TECHNOLOGY	10 POMEROY RD	N/A
07057FRMLN52MAI	FARMLAND DAIRIES LLC	520 MAIN AVE	N/A
07058DCRNC5BADE	DICAR INC	5 BADER RD	N/A
07059NDGCS141MT	ANADIGICS INC	141 MOUNT BETHEL RD	N/A
07064NTDST300MA	US GYPSUM CO	300 MARKLEY ST	N/A
07065DRPRN329NE	API FOILS INC	329 NEW BRUNSWICK AVE	N/A
07065LCTRM827MA	ELECTRUM RECOVERY WORKS INC	827 MARTIN ST	N/A
07065MRCKC126EL	MERCK SHARP & DOHME CORP	126 E LINCOLN AVE	N/A
07066KRNKC330CE	KARNAK CORP	330 CENTRAL AVE	N/A
07066PLYCH160TE	KERRY INC	160 TERMINAL AVE	N/A
07069FNWDSNEWPR	FANWOOD CRUSHED STONE	NEW PROVIDENCE RD	N/A
07070RCHTC359VE	ARCHITECTURAL WINDOW MANUFACTURING CORP	359 VETERANS BLVD	N/A
07071PLYRT624SC	POLYURETHANE SPECIALTIES COIN C	624 SCHUYLER AVE	N/A
07071SKCRP201PO	SIKA CORP	201 POLITO AVE	N/A
07072CKDNN700GO	PENETONE CORP	700 GOTHAM PKWY	N/A
07072PNTCH117MO	PAN TECHNOLOGY	117 MOONACHIE AVE	N/A
07072PTTRS6INDU	POTTERS INDUSTRIES LLC	600 IND US TRIAL RD	N/A
07073DBSCHUNION	DIAMOND CHEMICAL CO INC	UNION AVE & DUBOIS ST	N/A
07073GNRLF13MAN	FXI INC	13 MANOR RD	N/A
07074CRSTF100CA	CREST FOAM INDUSTRIES INC	100 CAROL PL	N/A
07077SHLLL111ST	MOTIVA SEWAREN TERMINAL	111 STATE ST	N/A
07080HMMLC10HAR	HUMMEL CROTON INC	10 HARMICH RD	N/A
07080MNRLP1CLID	BRENNTAG SPECIALTIES INC	1000 COOLIDGE ST	N/A
07080MTZMT3900S	AMES ADVANCED MATERIALS CORP	3900 S CLINTON AVE	N/A
07080TVCNC110PM	TEVCO ENTERPRISES INC	110 POMPONIO AVE	N/A
07080VNGRD239ST	VANGUARD RESEARCH INDUSTRIES INC	239 SAINT NICHOLAS AVE	N/A
07081BGLWC74DIA	BIGELOW COMPONENTS CORP	74 DIAMOND RD	N/A
07083FRMST941BA	FOREMOST MANUFACTURING CO INC	941 BALL AVE	N/A
07083LCNPW901LE	ACUPOWDER INTERNATIONAL LLC	901 LEHIGH AVE	N/A
07083MRCNP610RA	AMERICAN PRODUCTS CO	610 RAHWAY AVE	N/A
07083NTRNT2270M	INTERNATIONAL PAINT LLC	2270 MORRIS AVE	N/A
07083TSSLR2389V	TESSLER & WEISS/PREMESCO INC	2389 VAUXHALL RD	N/A
0708WKYSTN3451S	KEYSTONE PLASTICS INC	3451 S CLINTON AVE	N/A
0708WVLDSX8MNTR	VALID USA	800 MONTROSE AVE CN1037	N/A
07095LCNBL11CRA	GENTEK BUILDING PRODUCTS	11 CRAGWOOD RD	N/A
07095RSSLL14CON	MAUSER CORP	14 CONVERY BLVD	N/A
07101NHSRB200US	ANHEUSER-BUSCH LLC (NEWARK BREWERY)	200 US HWY ONE	N/A
07102PBLCS155RA	PUBLIC SERVICE ENTERPRISE GROUP ESSEX GENERATING STATION	155 RAYMOND BLVD	N/A
07105BNJMN134LI	BENJAMIN MOORE & CO-NEWARK	134 LISTER AVE	N/A
07105CRDLT500DO	CARDOLITE CORP	500 DOREMUS AVE	N/A
07105CWCND185FO	CWC INDUSTRIES INC	185 FOUNDRY ST	N/A
07105DCCHM49RUT	DELTECH RESIN CO	49 RUTHERFORD ST	N/A
07105DLTMR26BLA	DELEET MERCHANDISING	26 BLANCHARD ST	N/A
07105FDRLB9BACK	FEDERAL BRONZE CASTING INDUSTRY INC	9 BACKUS ST	N/A
07105HRCSP65EUC	HERAEUS PRECIOUS METALS MANAGEMENT LLC	65 EUCLID AVE	N/A
07105LNCHM268DO	ELAN CHEMICAL CO INC	268 DOREMUS AVE	N/A
07105MNPCN27215	MANOPCO INC NEWARK POLYMER DIV	207-215 AVE L	N/A
07105NWRKT909DE	MOTIVA NEWARK TERMINAL	909 DELANCY ST	N/A
07105PLYMR297FE	POLYONE DESIGNED STRUCTURES & SOLUTIONS	297 FERRY ST	N/A
07105TRYCHONEAV	TROY CHEMICAL CORP	ONE AVE L	N/A
07111RCHRD517LY	RICHARDS MANUFACTURING CO	517 LYONS AVE	N/A
07114BPXPLBLDG3	BP PRODUCTS NA INC	BLDG 350 COASTAL ST	N/A
07114CHMFL92896	CHEM FLUER/FIRMENICH INC	150 FIRMENICH WAY	N/A
07114GJCHM37037	DOREMUS TERMINAL LLC	128 DOREMUS AVE	N/A
07114KPPRS480FR	RUST-OLEUM CORP	480 FRELINGHUYSEN AVE	N/A
07114MRDCRBUILD	AMROD CORP	305A CRANEWAY ST	N/A
07114NWJRS139HA	NEW JERSEY GALVANIZING & TINNING WORKS	139 HAYNES AVE	N/A
07114RHSKR131MA	AAK USA INC PORT NEWARK	131 MARSH ST	N/A
07114SHMRCFTFPA	SHAMROCK TECHNOLOGIES INC	299 PACIFIC ST	N/A
07201GDNVTNAVED	ALLIED AVIATION SERVICE CO OF NEW JERSEY INC	BUILDING 116 FUEL FARM RD NEWARK INTERNATIONAL AIRPORT	N/A
07203PMRCN209E1	PAMARCO GLOBAL GRAPHICS	235 E ELEVENTH AVE	N/A
07203RNBND304CO	BODYCOTE THERMAL PROCESSING	304 COX ST	N/A
07205HHSWS1478C	H&H SWISS SCREW MACHINE PRODUCTS CO	1478 CHESTNUT AVE	N/A
07206CYCLC217SF	CYCLE CHEM INC	217 S FIRST ST	N/A
07206PPTTS847NA	PAPETTI'S HYGRADE EGG PRODUCTS INC	847 N AVE	N/A
07207KLPHR200EL	ACTAVIS ELIZABETH LLC	200 ELMORA AVE	N/A
07207PHLPS720SO	PHELPS DODGE INDUSTRIES INC DBA FREEPORT-MCMORAN INC	48-94 BAYWAY AVE	N/A
07304DNLPR400CL	ELEMENTIS SPECIALTIES	400 CLAREMONT AVE	N/A
07305CRLXN230CU	ACRILEX INC	230 CULVER AVE	N/A
07306HDSNGDUFFI	PSEG POWER LLC HUDSON GENERATING STATION	DUFFIELD & VAN KEUREN AVE	N/A
07306NCHLS120DU	NICHOLAS GALVANIZING	120 DUFFIELD AVE	N/A
07310STRNC18THS	EASTERN CONCRETE MATERIALS NEWPORT	18TH & WASHINGTON ST	N/A
07310STRNC265CB	EASTERN CONCRETE MATERIALS BROADWAY	265C BROADWAY	N/A
07405BTLRP250HA	BUTLER PRINTING & LAMINATING INC	250 HAMBURG TURNPIKE	N/A
07407CSTMC30PAU	CUSTOM CHEMICALS CORP	30 PAUL KOHNER PL	N/A
07407MRCLP1MARK	MARCAL  MANUFACTURING LLC	1 MARKET ST	N/A
07410FSHRS1REAG	FISHER SCIENTIFIC CO LL C	1 REAGENT LN	N/A
07410KRSCH2001P	BIOMET FAIR LAWN LP	20-01 POLLITT DR	N/A
07410NBSCB2211R	MONDELEZ GLOBAL LLC FAIR LAWN BAKERY	22-11 RT 208	N/A
07419CCRTFRTE94	ACCURATE FORMING LLC	24 AMES BLVD	N/A
07420RRWGRTHIRD	ARROW SHED LLC	1 THIRD AVE	N/A
07430HWMDC300CO	STRYKER ORTHOPAEDICS	325 CORPORATE DR	N/A
07457FLTRC1NORT	CAMFIL USA INC	1 N CORPORATE DR	N/A
0745WTLCNN125HA	TILCON NEW JERSEY RIVERDALE QUARRY	125 HAMBURG TURNPIKE	N/A
07470CLFTNBURGE	ROYAL ADHESIVES & SEALANTS LLC	48 BURGESS PL	N/A
07470NRTNC150DE	SAINT GOBAIN PERFORMANCE PLASTICS CORP	150 DEY RD	N/A
07474PSSCR45DEM	PASSAIC RUBBER CO	45 DEMAREST DR	N/A
07480GNRNT1865R	GENERANT CO INC	1865 RT 23 S	N/A
07501LTTLF189CA	LITTLE FALLS ALLOYS	171-191 CALDWELL AVE	N/A
07501PSSCC2836P	ROYCE ASSOCIATES L P PASSAIC COLOR CHEMICAL CO DIV	28-36 PATERSON ST	N/A
07503CRWNR91ILL	CROWN ROLL LEAF INC	91 ILLINOIS AVE	N/A
07503PRSRN91MIC	PARISER INDUSTRIES INC	91 MICHIGAN AVE	N/A
07506FSKLL10THO	FISK ALLOY WIRE INC	10 THOMAS RD	N/A
07509CSTML932MA	MICROSEAL INC	610 E 36TH ST	N/A
07513KNTC 959MA	OKONITE CO INC	959 MARKET ST	N/A
0751WDVNCD1TAFT	ADVANCED BIOTECH	10 TAFT RD	N/A
07544KRKRC1EAST	KIRKER ENTERPRISES INC	1 E 11TH ST	N/A
07601LCTRC75KEN	ELECTRO CERAMIC INDUSTRIES	75 KENNEDY ST	N/A
07603STRNC35WFR	EASTERN CONCRETE MATERIALS BOGOTA	305 W FORT LEE RD	N/A
07606MDSBT375HU	NATUREX INC	375 HUYLER ST	N/A
07607MYRNM205MA	MYRON MANUFACTURING CO	205 MAYWOOD AVE	N/A
07607STPNC100WH	STEPAN CO MAYWOOD	100 W HUNTER AVE	N/A
07607VCTRS25BRK	VICTOR'S THREE-D	25 BROOK AVE	N/A
07643SCNTF49IND	SCIENTIFIC DESIGN CO INC	49 INDUSTRIAL AVE	N/A
07644HKMTL35IND	HK METALCRAFT MANUFACTURING CORP	35 INDUSTRIAL RD	N/A
07644SFFRN210GA	SUFFERN PLATING CORP	210 GARIBALDI AVE	N/A
07647TKSGN267UN	TAKASAGO INTERNATIONAL CORP (USA)	267 UNION ST	N/A
0764WCNNGN15MER	COINING INC	15 MERCEDES DR	N/A
07656GNZYM1125P	GENZYME BIOSURGERY	1125 PLEASANTVIEW TERRACE	N/A
07657BRGNGVICTO	BERGEN GENERATING STATION	VICTORIA TERRACE	N/A
07657BZZDR1145E	BIAZZO DAIRY PRODUCTS INC	1145 EDGEWATER AVE	N/A
07657CLRTP101RA	COLORITE PLASTICS CO	101 RAILROAD AVE	N/A
07657KMBRM161RA	KIMBER MFG INC	161 RAILROAD AVE	N/A
07660CLLHN200IN	CALLAHAN CHEMICAL CO	200 INDUSTRIAL AVE	N/A
07662LLNFN271MA	ARROW FASTENER CO	271 MAYHILL ST	N/A
07722NVLWP201HW	US DOD NAVAL WEAPONS STATION EARLE	201 HWY 34 BLDG C-2	N/A
07724LCTRN1INDU	ELECTRONICS INTEGRATION TECHNOLOGY INC	10 INDUSTRIAL WAY E	N/A
07727BLRYCPOBOX	BEL-RAY CO INC	1201 BOWMAN AVE	N/A
07727PPLCD5029I	APPLICAD INC	5029 INDUSTRIAL RD	N/A
07728FRSTB250HA	PRESTONE PRODUCTS CORP	250 HALLS MILL RD	N/A
07728NSTLF61JER	NESTLE USA INC BEVERAGE DIV	61 JERSEYVILLE AVE	N/A
0772WCLYTN225TH	RALPH CLAYTON & SONS	225 THROCKMORTON ST	N/A
0772WRLPHC1CMME	RALPH CLAYTON & SONS	100 COMMERCE DR	N/A
0773WSTRNC86YEL	EASTERN CONCRETE MATERIALS - HOWELL PLANT	86 YELLOWBROOK RD	N/A
07740WHLCK273BR	COOPER WHEELOCK INC	273 BRANCHPORT AVE	N/A
0774WMNMTH75LNG	MONMOUTH RUBBER & PLASTICS CORP	75 LONG BRANCH AVE	N/A
07753LCTRN405ES	TDK-LAMBDA AMERICAS INC	405 ESSEX RD	N/A
07801HWMTCROYST	HOWMET CASTINGS & SERVICES	9 ROY ST	N/A
07823HFFMN206RO	DSM NUTRITIONAL PRODUCTS LLC	205 MACKS ISLAND DR	N/A
07828GVDNF300WA	GIVAUDAN FRAGRANCES CORP - MOUNT OLIVE SITE	300 WATERLOO VALLEY RD	N/A
07828L3CMM45CLA	L-3 COMMUNICATIONS SPACE & NAVIGATION DIV	450 CLARK DR	N/A
07840HTRNC999WI	HI-TRONICS DESIGNS INC (DBA ST JUDE MEDICAL NEUROMODUALT)	999 WILLOW GROVE ST	N/A
07840LSTMLESNAD	THOMAS & BETTS/ELASTIMOLD	1 ESNA DR	N/A
07840MMMRSHIGHS	MARS CHOCOLATE NA LLC	700 HIGH ST	N/A
07840NDRXN101BI	ANDREX	101 BILBY RD SUITE E	N/A
07840TDMDL36NEW	MODULAR POWER SYSTEMS DIV OF TDI	36 NEWBURGH RD	N/A
07850PRDNT400NF	PRUDENT PUBLISHING CO	400 N FRONTAGE RD	N/A
07853FRZRNFAIRV	FRAZIER INDUSTRIAL CO	95 FAIRVIEW AVE	N/A
07865BRLSC176TH	BOREALIS COMPOUNDS INC	176 THOMAS RD	N/A
07866MCWLL1948F	MCWILLIAMS FORGE CO	387 FRANKLIN AVE	N/A
0786WLLDCN25FRA	ALLIED CONCRETE CO INC-ROCKAWAY	205 FRANKLIN AVE	N/A
0786WTLCNNMTPIS	TILCON NEW JERSEY OXFORD QUARRY	MT PISGAH AVE	N/A
0787WDMNDS33DEM	DIAMOND SAND & GRAVEL INC	33 DEMAREST RD	N/A
07882BSFCRPERSH	BASF CORP	2 PLEASANT VIEW AVE	N/A
07928NTNLM12RIV	NATIONAL MANUFACTURING CO INC	12 RIVER RD	N/A
07928STTNL116SU	ISP CHEMICALS LLC	116 SUMMIT AVE	N/A
07932PRCSN306CO	VDM METALS USA LLC	306 COLUMBIA TURNPIKE	N/A
07936FRTZSMERRY	GIVAUDAN FLAVORS CORP	245 MERRY LN	N/A
07936RYLLBMERRY	CHEMTURA CORP D/B/A ANDEROL INC	215 MERRY LN	N/A
07936SNDZP59ROU	NOVARTIS PHARMACEUTICALS CORP	59 RT 10	N/A
07962THMNNHANOV	COLGATE PALMOLIVE CO	191 E HANOVER AVE	N/A
07977KMLNS12HOL	KOMLINE-SANDERSON ENGINEERING CORP	12 HOLLAND AVE	N/A
08002MYCND616HO	MYCONE DENTAL	616 HOLLYWOOD AVE	N/A
08012TRNGL1TRIA	TRIANGLE TUBE/PHASE III CO INC	1 TRIANGLE LN	N/A
08014CSTMB210HI	CUSTOM BUILDING PRODUCTS	2115 HIGH HILL RD	N/A
08014MNSNTROUTE	VALERUS SPECIALTY CHEMICALS-DELAWARE RIVER PLANT	170 RT 130 S	N/A
08014PGCRPRTE13	LOGAN GENERATING CO LP	75 RT 130	N/A
08016BRLNGWBROA	PSEG POWER/FOSSIL LLC BURLINGTON GENERATING STATION	W BROAD ST & DEVLIN AVE	N/A
08016CMBRLCUMBE	GARELICK FARMS LLC	117 CUMBERLAND BLVD	N/A
08016FRNKLBEVER	RIMTEC CORP	1702 BEVERLY RD	N/A
08016GLDBN1818R	NEW NGC INC D/B/A NATIONAL GYPSUM CO	1818 RIVER RD	N/A
0801WSVSNX1HARM	US VISION	10 HARMON DR	N/A
08023DPNTCRT130	DUPONT CHAMBERS WORKS	RT 130	N/A
08030KCHPTKINGW	BKEP MATERIALS LLC -- GLOUCESTER CITY	KING ST & JERSEY AVE	N/A
08030NDCNCNRAIL	INDCO INC	N RAILROAD & ESSEX ST	N/A
08037KRRCN19212	OLDCASTLE PRECAST INC	RT 54	N/A
08037MRCNGRT54S	AMERICAN GALVANIZING CO	1919 12TH ST RT 54	N/A
08037MSSRL5SEGG	MASSARELLI'S LAWN ORNAMENTS INC	500 S EGG HARBOR RD	N/A
08038NCLRBENDOF	SALEM & HOPE CREEK GENERATIN G STATIONS	END OF ALLOWAY CREEK NECK RD	N/A
08051HNGSTOGDEN	HANGSTERFER'S LABORATORIES INC	175 OGDEN RD	N/A
08052CVCSP2980R	CVC SPECIALTY CHEMICALS INC	2980 RT 73 N	N/A
08052STNHR1PARK	STONCOR GROUP INC	1000 E PARK AVE	N/A
08056BNNLL210HA	SAINT-GOBAIN PPL MICKLETON	210 HARMONY RD	N/A
08057GRSPCBORTO	LOCKHEED MARTIN	199 BORTON LANDING RD BLDG 137-133	N/A
08057MCRRP1255N	JET PULVERIZER CO	1255 N CHURCH ST	N/A
08057MRCNB105WG	AMERICAN BILTRITE INC	105 WHITTENDALE DR	N/A
08065CLLHNBROAD	CALLAHAN CHEMICAL CO	BROAD ST & FILMORE AVE	N/A
08065RMTKN701PU	ARMOTEK INDUSTRIES INC	1 ROTO AVE	N/A
08066BMPRS167IM	BUMPER SPECIALTIES INC	1607 IMPERIAL WAY	N/A
08066CPLYRMANTU	COIM USA INC	286 MANTUA GROVE RD BUILDING # 1	N/A
08066DPNC 2000N	BOSTIK INC	2000 NOLTE DR	N/A
08066JHNSN2001A	JOHNSON MATTHEY	2001 NOLTE DR	N/A
08066MBLLC1001B	EXXONMOBIL PAULSBORO LUBE PLANT	1001 BILLINGSPORT RD	N/A
08066MBLLCBILLI	PAULSBORO REFINING CO LLC	800 BILLINGSPORT RD	N/A
08066RPRDCBILLI	COIM USA INC	675 BILLINGSPORT RD	N/A
08066SVWLC4PARA	AXEON REFINING LLC	4 PARADISE RD	N/A
08067PDRCK143US	PEDRICKTOWN COGENERATION CO LP	143 HWY 130 PO BOX 404	N/A
08067THBFGUSROU	LUBRIZOL CORP	76 PORCUPINE RD	N/A
08067THGNCUSRTE	MEXICHEM SPECIALTY RESINS INC	US RT 130 & PORCUPINE RD	N/A
08067XYVNYRTE13	OXY VINYLS LP	RT 130 & PORCUPINE RD	N/A
08069CRNYS500SH	CHAMBERS COGENERATION LP	500 SHELL RD	N/A
08070GNSCHINDUS	SIEGFRIED USA LLC	33 INDUSTRIAL PARK RD	N/A
08071KTRNLRUTES	K-TRON ELECTRONICS	RT 55 & 553	N/A
08073NDCTT10IND	INDUCTOTHERM CORP	10 INDEL AVE	N/A
08077HGNSCRIVER	HOEGANAES CORP	1001 TAYLORS LN	N/A
08077KLSTR1050T	ACTEGA KELSTAR INC	1050 TAYLORS LN	N/A
08079MNNNGMANNI	MANNINGTON MILLS INC	75 MANNINGTON MILLS RD	N/A
08079NCHRG83GRI	ARDAGH GLASS INC	83 GRIFFITH ST	N/A
08085NGNRD2239H	ENGINEERED ARRESTING SYSTEMS CORP	2239 HIGH HILL RD	N/A
08086GRLCK700MI	GLACIER GARLOCK BEARINGS LLC	700 MID ATLANTIC PKWY	N/A
08086PNNWLCROWN	SOLVAY SPECIALTY POLYMERS USA LLC	10 LEONARD LN	N/A
08088CLNLC78CAR	COLONIAL CHEMICAL CO	78 CARRANZA RD	N/A
08088SFTYK123RE	SAFETY-KLEEN SYSTEMS VINCENTOWN (VIN)	123 RED LION RD	N/A
08093CSTLGRTES1	SPMT-EAGLE POINT TANK FARM	RT 130 & I-295 S	N/A
08096GLFLL920KI	GULF OIL LP WOODBURY TERMINAL	920 KINGS HWY	N/A
08102FWWNTDELAW	FW WINTER INC & CO	DELAWARE AVE & ELM ST	N/A
08103DMTRN1101S	GEORGIA-PACIFIC GYPSUM LLC	1101 S FRONT ST	N/A
08103STTMT941SO	STATE METAL INDUSTRIES INC	941 S SECOND ST	N/A
08110CLTXC1500J	DOW CHEMICAL - PENNSAUKEN SITE	1500 JOHN TIPTON BLVD	N/A
08110LMNMS9000R	ALUMINUM SHAPES LLC	9000 RIVER RD	N/A
0821WDLPHN2141R	DOLPHIN INDUSTRIES LTD	2141 RIVER RD	N/A
0821WRLPHC13CHE	RALPH CLAYTON & SONS	103 CHESTNUT AVE	N/A
08223BLNGL900NS	BL ENGLAND GENERATING STATION	900 N SHORE RD	N/A
08224VKNGYRTE9	VIKING YACHT CO INC	5738 RT 9	N/A
08302LNNDS443SE	ARDAGH GLASS INC	443 SE AVE	N/A
08302WHTWV7RSEN	WWF OPERATING CO	70 ROSENHAYN AVE	N/A
08312PCKCK838ND	ALERIS ROLLED PRODUCTS INC	838 N DELSEA DR	N/A
08320SBRFPFAIRT	US BUREAU OF PRISONS FEDERAL CORRECTIONAL INSTITUTION	655 FAIRTON MILLVILLE RD	N/A
08332DRNDGWADEB	DURAND GLASS MANUFACTURING CO INC	901 S WADE BLVD	N/A
08332LCNPC1633W	NIPRO GLASS AMERICAS (MILLVILLE TUBING)	1633 WHEATON AVE	N/A
08332WHTNG220GS	GERRESHEIMER MOULDED GLASS	1300 WHEATON AVE	N/A
0833WCMBRL41EAS	CUMBERLAND ENERGY CENTER	4001 E MAIN ST	N/A
08352NTLRF661KE	NATIONAL REFRIGERANTS INC	661 KENYON AVE	N/A
08360KMBLGCRYST	GERRESHEIMER GLASS INC	537 CRYSTAL AVE	N/A
08362VNLNDNEWPE	VINELAND MUNICIPAL ELECTRIC UTILITY-WEST STATION	NEW PEACH & LUBIN LN	N/A
08502LHNFNROUTE	RB MANUFACTURING LLC	799 RT 206 & HILLSBOROUGH RD	N/A
08505NWLTR312RI	NWL TRANSFORMERS INC -- BORDENTOWN PLANT	312 RISING SUN RD	N/A
08505STPNCFOURT	STEPAN CO - FIELDSBORO PL ANT	201 FOURTH ST	N/A
08512PLNTFHIGHT	PLANT FOOD CO INC	38 HIGHTSTOWN-CRANBURY STATION	N/A
08512TWCVD32CMM	ITWCOVID SECURITY GROUP	32 COMMERCE DR N SUITE #1	N/A
08530BRNCL11KAR	BREEN COLOR CONCENTRATES	11 KARI DR	N/A
08530DVNCD245NM	ADVANCED CERAMETRICS INC	245 N MAIN ST	N/A
08536FRMNCPRINC	FIRMENICH INC	250 PLAINSBORO RD	N/A
08543BRSTLRTE20	E R SQUIBB & SONS LLC	RT 206 & PROVINCE LINE RD	N/A
08611MRCRGLAMBE	MERCER GENERATING STATION	2512 LAMBERTON RD	N/A
08619THTRN2231E	TRANE CO	2231 E STATE ST	N/A
08628RLLRBSULLI	ROLLER BEARING CO OF AMERICA	400 SULLIVAN WAY	N/A
08638RCRRL157NL	RE CARROLL  INC	1570 N OLDEN AVE	N/A
0863WRLPHC1144N	RALPH CLAYTON & SONS	1144 NEW YORK AVE	N/A
08640SRMYH5417A	JOINT BASE MCGUIRE-DIX-L AKHURST DIX AREA	2404 VANDENBERG AVE	N/A
08648MTLLT6LITH	B-WAY PACKAGING INC	6 LITHO RD	N/A
08691WBTCH108NG	WEBTECH INC	108 NGOLD DR	N/A
08701CHRCH800AI	CHURCH & DWIGHT CO INC	800 AIRPORT RD	N/A
08701FLXBR1969R	FLEXABAR CORP	1969 RUTGERS UNIVERSITY BLVD	N/A
08701GLSSL485OB	GLASSEAL PRODUCTS INC	485 OBERLIN AVE S	N/A
08701LKWDC123EN	ESSENTIAL POWER LLC	123 ENERGY WAY	N/A
08701LPHSS145LE	ALPHA ASSOCIATES INC	145 LEHIGH AVE	N/A
08701PRMCL1990R	NITTO DENKO AUTOMOTIVE NEW JERSEY INC	1990 RUTGERS UNIVERSITY BLVD	N/A
0870WRLPHC7HAVE	RALPH CLAYTON & SONS	7 HAVENWOOD CT	N/A
08733NVLRNRTE54	JOINT BASE MCGUIRE-DIX-LAKEHURST LAKEHURST AREA	HWY 547	N/A
08759RGTHR35CLN	ORGOT-THERMIT INC	3500 COLONIAL DR N	N/A
08805PLYMR1EEAS	POLYMER MOLDED PRODUCTS LLC	10E EASY ST	N/A
08807BRDDC123CH	BRADDOCK HEAT TREATING INC	123 CHIMNEY ROCK RD	N/A
08810CRYCM5NICH	CARY COMPOUNDS LLC	5 NICHOLAS CT	N/A
08810RCHMN1CHRI	RICHMOND INDUSTRIES INC	1 CHRIS CT	N/A
08816MNCND5JOAN	MON-ECO INDUSTRIES INC	5 JOANNA CT	N/A
08817CLNLW85NAT	COLONIAL WIRE & CABLE OF NEW JERSEY	85 NATIONAL RD	N/A
08817GRCDV34MEA	GRACE DAVISON-EDISON	340 MEADOW RD	N/A
08817KZCHMMEADO	EQUISTAR CHEMICALS LP	340 MEADOW RD	N/A
08817MRCNN135NA	SILGAN CONTAINERS MANUFACTURING CORP	135 NATIONAL RD	N/A
08817PCXTR18NAT	APCO EXTRUDERS INC	180 NATIONAL RD	N/A
08817PDBSN54KEL	FERRO CORP	54 KELLOGG CT	N/A
08818MBLCHRT27A	MOBIL CHEMICAL CO SYNTHETICS DIV	2195 RT 27 AT VINEYARD RD	N/A
08818MTXCR970NE	METAL TEXTILES CORP	970 NEW DURHAM RD	N/A
08821NDSTRVALLE	INDUSTRIAL TUBE CORP	297 VALLEY RD	N/A
088223M   500RT	3M CO - FLEMINGTON	500 RT 202 N	N/A
08822MGNSM500PO	MEL CHEMICALS INC	500 BARBERTOWN POINT BREEZE RD	N/A
08822TLNTC137RT	MW INDUSTRIES ATLANTIC SPRING DIV	137 RT 202 S	N/A
08829CSTML3WASH	CUSTOM ALLOY CORP	3 WASHINGTON AVE	N/A
08829GLSSM124WM	GLASSMAN HIGH VOLTAGE INC	124 W MAIN ST	N/A
0883WTRPRCFTFCR	TRAP ROCK INDUSTRIES LLC	FOOT OF CROWS MILL RD	N/A
08846MRSLN125FA	VEOLIA ES TECHNICAL SOLUTIONS LLC	125 FACTORY LN	N/A
08846THBTHLINCO	COVALENCE ADHESIVES	87 LINCOLN BLVD	N/A
0884WCLYTN125US	CLAYTON BLOCK CO INC	1025 US HWY 1 S	N/A
08852JHNCDNEWRO	JOHN C DOLPH A VON ROLL CO	320 NEW RD	N/A
08852MHWKLSTOUT	NCH CORP MOHAWK LABS DIV	34 STOUTS LN	N/A
08854NNCRB1RIVE	BOUND BROOK FACILITY UNION CARBIDE CORP	65 BAEKELAND AVE	N/A
08854ZGLRC600PR	ZIEGLER CHEMICAL & MINERAL CORP	600 PROSPECT AVE	N/A
08857BLNDR1JAKE	BLONDER TONGUE LABORATORIES	1 JAKE BROWN RD	N/A
08857LDBRDOLDWA	OLD BRIDGE CHEMIACLS INC	554 OLD WATERWORKS RD	N/A
08857MDSNNOLDWA	MADISON INDUSTRIES	554 WATERWORKS RD	N/A
08859CLPNP970WA	EFS PARLIN HOLDINGS LLC	790 WASHINGTON RD	N/A
08859DPNTPCHEES	DUPONT PARLIN PLANT	CHEESEQUAKE RD	N/A
08859HDMCR500CH	HD MICROSYSTEMS LLC	250 CHEESEQUAKE RD C/O DUPONT BUILDING 424	N/A
08859HRCLSSOUTH	ASHLAND SPECIALTY INGREDIENTS (PARLIN PLANT)	50 S MINISINK AVE	N/A
08861NGLRT1200A	ENGLERT INC	1200 AMBOY AVE	N/A
08861VSMBY1190A	V&S AMBOY GALVANIZING LLC	1190 AMBOY AVE	N/A
08862WTCCR1000C	CHEMTURA CORP	1000 CONVERY BLVD	N/A
08863HTCCRKINGG	CHEMTURA CORP D/B/A HATCO CORP	1020 KING GEORGES POST RD	N/A
08865JTBKR600NO	AVANTOR PERFORMANCE MATERIALS	600 N BROAD ST	N/A
08865TLNTC183SI	MCWANE DUCTILE-NEW JERSEY	183 SITGREAVES ST	N/A
08869RTHDGROUTE	ORTHO-CLINICAL DIAGNOSTICS	1001 US RT 202	N/A
08872CNFLD1SCRO	CANFIELD TECHNOLOGIES	1 S CROSSMAN RD	N/A
08872NWJRSNORTH	GERDAU AMERISTEEL SAYREVILLE INC	N CROSSMAN RD	N/A
08872PHRMT65JER	PHARMETIC MANFACTURING CO	650 JERNEE MILL RD	N/A
08873NNCRB40VER	FANCYHEAT CORP	40 VERONICA AVE	N/A
08873WMZNS39BEL	RUST-OLEUM CORP	173 BELMONT DR	N/A
08875RTRCL187DA	ROTOR CLIP CO INC	187 DAVIDSON AVE	N/A
08876DVRNCSOUTH	NITTA CASINGS INC	141 SOUTHSIDE AVE	N/A
08876FSHRS755RT	FISHER SCIENTIFIC CO LLC	755 RT 202	N/A
08876GBSNT100AS	RATHGIBSON NORTH BRANCH	100 ASPEN HILL RD	N/A
08876PRNTN50MEI	AZ ELECTRONIC MATERIALS USA CORP	50-70 MEISTER AVE	N/A
08876RMTCT130IN	AGILEX FLAVORS & FRAGRANCES	130 INDUSTRIAL PKWY	N/A
08876RMTCT197ME	AIR LIQUIDE ADVANCED MATERIALS INC	197 MEISTER AVE	N/A
08876THCNNROUTE	ETHICON	RT 22 W	N/A
0887WNWWRL1RAND	NEW WORLD STAINLESS	100 RANDOLPH RD	N/A
0887WRCHML18USH	ROCHE MOLECULAR SYSTEMS INC	1080 US HWY 202 S	N/A
08884KMBRL85MAI	SCHWEITZER-MAUDUIT INTERNATIONAL INC	85 MAIN ST	N/A
08884SPRRSPOBOX	SUPERIOR SIGNAL CO LLC	178 - 182 W GREYSTONE RD	N/A
08888DRLNGPOBOX	READINGTON FARMS INC	12 MILL RD	N/A
08901SPCTR755JE	SPECTRUM LABORATORY PRODUCTS ( NEW JERSEY)	755 JERSEY AVE	N/A
08902BRNTC1010J	NEW BRUNSWICK PLATING INC	1010 JERSEY AVE	N/A
08902RSQBBONESQ	E R SQUIBB & SONS LLC	ONE SQUIBB DR	N/A
08902SLVRL1SILV	SILVER LINE BUILDING PRODUCTS LLC	1 SILVER LINE DR US HWY 1N	N/A
08903KZCHM500JE	AKCROS CHEMICALS INC	500 JERSEY AVE	N/A
\.

--
-- Data for Name: locations; Type: TABLE DATA; Schema: newsoap; Owner: postgres
--

COPY newsoap.locations (id, county, municipality, x_coor, y_coor) FROM stdin;
1 CHRIS CT	MIDDLESEX	DAYTON	40.37181	-74.49684
1 CLIFTON BLVD	PASSAIC	CLIFTON	40.86209	-74.14279
1 E 11TH ST	PASSAIC	PATERSON	40.936287	-74.156929
1 ESNA DR	MORRIS	HACKETTSTOWN	40.820611	-74.833
1 IND US TRIAL W	PASSAIC	CLIFTON	40.84483	-74.15471
1 JAKE BROWN RD	MIDDLESEX	OLD BRIDGE	40.40986	-74.32759
1 MARKET ST	BERGEN	ELMWOOD PARK	40.90232	-74.13179
1 N CORPORATE DR	MORRIS	RIVERDALE	40.98996	-74.29937
1 REAGENT LN	BERGEN	FAIR LAWN	40.9375	-74.13193
1 ROTO AVE	BURLINGTON	PALMYRA	39.996772	-75.03032
1 S CROSSMAN RD	MIDDLESEX	SAYREVILLE	40.47539	-74.31903
1 SILVER LINE DR US HWY 1N	MIDDLESEX	NORTH BRUNSWICK	40.4652	-74.43642
1 THIRD AVE	PASSAIC	HASKELL	41.02925	-74.295694
1 TRIANGLE LN	CAMDEN	BLACKWOOD	39.77916	-75.0455
10 HARMICH RD	MIDDLESEX	SOUTH PLAINFIELD	40.56915	-74.39865
10 HARMON DR	CAMDEN	BLACKWOOD	39.829553	-75.075693
10 INDEL AVE	BURLINGTON	RANCOCAS	40.010321	-74.847239
10 INDUSTRIAL WAY E	MONMOUTH	EATONTOWN	40.27663	-74.04071
10 LEONARD LN	GLOUCESTER	THOROFARE	39.845474	-75.209486
10 POMEROY RD	MORRIS	PARSIPPANY	40.851715	-74.423751
10 TAFT RD	PASSAIC	TOTOWA	40.904221	-74.24583
10 THOMAS RD	PASSAIC	HAWTHORNE	40.94134	-74.16261
100 ASPEN HILL RD	SOMERSET	NORTH BRANCH	40.59611	-74.68181
100 CAROL PL	BERGEN	MOONACHIE	40.837222	-74.048889
100 COMMERCE DR	MONMOUTH	TINTON FALLS	40.30204	-74.06855
100 ESSEX AVE E	MIDDLESEX	AVENEL	40.57699	-74.26059
100 RANDOLPH RD	SOMERSET	SOMERSET	40.543587	-74.555658
100 W HUNTER AVE	BERGEN	MAYWOOD	40.89623	-74.06827
1000 CONVERY BLVD	MIDDLESEX	PERTH AMBOY	40.539003	-74.275635
1000 COOLIDGE ST	MIDDLESEX	SOUTH PLAINFIELD	40.55125	-74.40484
1000 E PARK AVE	BURLINGTON	MAPLE SHADE	39.961734	-74.992226
1001 BILLINGSPORT RD	GLOUCESTER	PAULSBORO	39.829664	-75.254053
1001 TAYLORS LN	BURLINGTON	CINNAMINSON	40.02229	-74.989799
1001 US RT 202	SOMERSET	RARITAN	40.572486	-74.649095
101 BILBY RD SUITE E	WARREN	HACKETTSTOWN	40.87103	-74.82127
101 RAILROAD AVE	BERGEN	RIDGEFIELD	40.82599	-74.01389
1010 JERSEY AVE	MIDDLESEX	NEW BRUNSWICK	40.468745	-74.478183
1020 KING GEORGES POST RD	MIDDLESEX	FORDS	40.5252	-74.319423
1025 US HWY 1 S	MIDDLESEX	EDISON	40.521013	-74.364875
103 CHESTNUT AVE	ATLANTIC	EGG HARBOR TOWNSHIP	39.423984	-74.567468
103 DEWEY ST	ESSEX	BLOOMFIELD	40.82122	-74.18157
105 JACOBUS AVE	HUDSON	KEARNY	40.738726	-74.112656
105 WHITTENDALE DR	BURLINGTON	MOORESTOWN	39.97525	-74.97233
1050 TAYLORS LN	BURLINGTON	CINNAMINSON	40.022751	-74.982746
108 NGOLD DR	MERCER	ROBBINSVILLE	40.206874	-74.625518
1080 US HWY 202 S	SOMERSET	BRANCHBURG	40.563159	-74.699455
10E EASY ST	SOMERSET	BOUND BROOK	40.572182	-74.561398
11 CRAGWOOD RD	MIDDLESEX	AVENEL	40.595252	-74.254772
11 KARI DR	HUNTERDON	LAMBERTVILLE	40.3828	-74.91956
11 MADISON RD	ESSEX	FAIRFIELD	40.87133	-74.30859
110 POMPONIO AVE	MIDDLESEX	SOUTH PLAINFIELD	40.569118	-74.426345
1101 S FRONT ST	CAMDEN	CAMDEN	39.931776	-75.129552
111 STATE ST	MIDDLESEX	SEWAREN	40.541944	-74.254722
1125 PLEASANTVIEW TERRACE	BERGEN	RIDGEFIELD	40.82722	-74.01594
1144 NEW YORK AVE	MERCER	TRENTON	40.240904	-74.740907
1145 EDGEWATER AVE	BERGEN	RIDGEFIELD	40.83668	-74.01528
116 SUMMIT AVE	MORRIS	CHATHAM	40.73485	-74.37765
117 CUMBERLAND BLVD	BURLINGTON	BURLINGTON	40.104569	-74.788863
117 MOONACHIE AVE	BERGEN	CARLSTADT	40.834971	-74.058442
1190 AMBOY AVE	MIDDLESEX	PERTH AMBOY	40.53805	-74.27078
12 HOLLAND AVE	SOMERSET	PEAPACK	40.709091	-74.670599
12 MILL RD	HUNTERDON	WHITEHOUSE STATION	40.650102	-74.75794
12 RIVER RD	MORRIS	CHATHAM	40.72973	-74.38134
120 DUFFIELD AVE	HUDSON	JERSEY CITY	40.743354	-74.074289
1200 AMBOY AVE	MIDDLESEX	PERTH AMBOY	40.539677	-74.272621
1200 SYLVAN ST	UNION	LINDEN	40.614135	-74.252579
1201 BOWMAN AVE	MONMOUTH	WALL	40.22461	-74.13625
123 CHIMNEY ROCK RD	SOMERSET	BRIDGEWATER	40.56634	-74.56338
123 ENERGY WAY	OCEAN	LAKEWOOD	40.061211	-74.167904
123 RED LION RD	BURLINGTON	SOUTHAMPTON	39.8935	-74.74419
124 W MAIN ST	HUNTERDON	HIGH BRIDGE	40.66112	-74.90248
1249 NEWARK TURNPIKE	HUDSON	KEARNY	40.744813	-74.08795
125 FACTORY LN	MIDDLESEX	MIDDLESEX	40.560538	-74.520639
125 HAMBURG TURNPIKE	MORRIS	RIVERDALE	40.997694	-74.3105
1255 N CHURCH ST	BURLINGTON	MOORESTOWN	39.976998	-74.983059
126 E LINCOLN AVE	UNION	RAHWAY	40.612743	-74.260921
128 DOREMUS AVE	ESSEX	NEWARK	40.72865	-74.12194
13 MANOR RD	BERGEN	EAST RUTHERFORD	40.82558	-74.088563
130 INDUSTRIAL PKWY	SOMERSET	SOMERVILLE	40.598	-74.70943
1300 WHEATON AVE	CUMBERLAND	MILLVILLE	39.407778	-75.034444
131 MARSH ST	ESSEX	NEWARK	40.69288	-74.142643
134 LISTER AVE	ESSEX	NEWARK	40.74001	-74.132483
135 NATIONAL RD	MIDDLESEX	EDISON	40.538538	-74.386195
137 RT 202 S	HUNTERDON	RARITAN TWP	40.470555	-74.861944
139 HAYNES AVE	ESSEX	NEWARK	40.701944	-74.189592
14 CONVERY BLVD	MIDDLESEX	WOODBRIDGE	40.54081	-74.27705
140 E 22ND ST	HUDSON	BAYONNE	40.657559	-74.107129
1400 PARK AVE	UNION	LINDEN	40.640616	-74.21907
141 MOUNT BETHEL RD	SOMERSET	WARREN	40.63392	-74.5044
141 SOUTHSIDE AVE	SOMERSET	BRIDGEWATER	40.562403	-74.604058
143 HWY 130 PO BOX 404	SALEM	PEDRICKTOWN	39.766944	-75.421361
145 LEHIGH AVE	OCEAN	LAKEWOOD	40.07484	-74.17057
1455 BROAD ST SUITE 3	ESSEX	BLOOMFIELD	40.83925	-74.18486
1478 CHESTNUT AVE	UNION	HILLSIDE	40.708667	-74.233079
148 E FIFTH ST	HUDSON	BAYONNE	40.650443	-74.121871
15 MERCEDES DR	BERGEN	MONTVALE	41.047948	-74.062786
150 DEY RD	PASSAIC	WAYNE	40.912663	-74.252217
150 FIRMENICH WAY	ESSEX	NEWARK	40.699553	-74.130817
1500 JOHN TIPTON BLVD	CAMDEN	PENNSAUKEN	39.982667	-75.040611
1515 W ELIZABETH AVE	UNION	LINDEN	40.619973	-74.263704
155 RAYMOND BLVD	ESSEX	NEWARK	40.736952	-74.117676
1570 N OLDEN AVE	MERCER	TRENTON	40.24259	-74.75583
16 LAW DR	ESSEX	FAIRFIELD	40.87001	-74.30189
16 RICHMOND ST	PASSAIC	CLIFTON	40.889432	-74.160195
160 TERMINAL AVE	UNION	CLARK	40.628279	-74.319298
1607 IMPERIAL WAY	GLOUCESTER	WEST DEPTFORD	39.82878	-75.20478
161 RAILROAD AVE	BERGEN	RIDGEFIELD	40.828407	-74.012113
1633 WHEATON AVE	CUMBERLAND	MILLVILLE	39.412481	-75.03134
17 COMMERCE RD	ESSEX	FAIRFIELD	40.87184	-74.31854
170 RT 130 S	GLOUCESTER	BRIDGEPORT	39.792583	-75.395278
1702 BEVERLY RD	BURLINGTON	BURLINGTON	40.068513	-74.883871
171-191 CALDWELL AVE	PASSAIC	PATERSON	40.908937	-74.186924
173 BELMONT DR	SOMERSET	SOMERSET	40.535292	-74.540919
175 OGDEN RD	GLOUCESTER	MANTUA	39.802387	-75.184909
176 THOMAS RD	WARREN	PORT MURRAY	40.813361	-74.888111
178 - 182 W GREYSTONE RD	MIDDLESEX	OLD BRIDGE	40.38662	-74.371352
180 NATIONAL RD	MIDDLESEX	EDISON	40.5353	-74.38434
1818 RIVER RD	BURLINGTON	BURLINGTON	40.10465	-74.82958
183 SITGREAVES ST	WARREN	PHILLIPSBURG	40.684667	-75.186167
185 FOUNDRY ST	ESSEX	NEWARK	40.72716	-74.13197
1865 RT 23 S	PASSAIC	WEST MILFORD	41.013408	-74.384034
187 DAVIDSON AVE	SOMERSET	SOMERSET	40.538075	-74.522885
18TH & WASHINGTON ST	HUDSON	JERSEY CITY	40.733167	-74.034079
19 IND US TRIAL RD	ESSEX	FAIRFIELD	40.86324	-74.30971
191 E HANOVER AVE	MORRIS	MORRISTOWN	40.813267	-74.475711
1919 12TH ST RT 54	ATLANTIC	FOLSOM	39.612532	-74.830518
1969 RUTGERS UNIVERSITY BLVD	OCEAN	LAKEWOOD	40.071809	-74.161324
197 MEISTER AVE	SOMERSET	BRANCHBURG	40.605745	-74.715119
199 BORTON LANDING RD BLDG 137-133	BURLINGTON	MOORESTOWN	39.976785	-74.917626
1990 RUTGERS UNIVERSITY BLVD	OCEAN	LAKEWOOD	40.070784	-74.163312
2 ACKERMAN AVE	PASSAIC	CLIFTON	40.87918	-74.12225
2 PLEASANT VIEW AVE	WARREN	WASHINGTON	40.754803	-74.9731
2 PORETE AVE	BERGEN	NORTH ARLINGTON	40.7739	-74.12754
20-01 POLLITT DR	BERGEN	FAIR LAWN	40.946417	-74.130417
200 ELMORA AVE	UNION	ELIZABETH	40.664574	-74.233828
200 INDUSTRIAL AVE	BERGEN	RIDGEFIELD PARK	40.86212	-74.031536
200 US HWY ONE	ESSEX	NEWARK	40.693625	-74.195918
2000 MARSHES DOCK RD	UNION	LINDEN	40.60382	-74.23549
2000 NOLTE DR	GLOUCESTER	WEST DEPTFORD	39.818448	-75.206721
2001 NOLTE DR	GLOUCESTER	WEST DEPTFORD	39.81925	-75.2045
201 FOURTH ST	BURLINGTON	FIELDSBORO	40.134387	-74.735599
201 HWY 34 BLDG C-2	MONMOUTH	COLTS NECK	40.26458	-74.16291
201 POLITO AVE	BERGEN	LYNDHURST	40.804839	-74.108591
205 FRANKLIN AVE	MORRIS	ROCKAWAY	40.893783	-74.513901
205 MACKS ISLAND DR	WARREN	BELVIDERE	40.843611	-75.066389
205 MAYWOOD AVE	BERGEN	MAYWOOD	40.894692	-74.066612
207-215 AVE L	ESSEX	NEWARK	40.72393	-74.14087
209 N MICHIGAN AVE	UNION	KENILWORTH	40.68091	-74.288354
21 HENDERSON DR	ESSEX	WEST CALDWELL	40.85554	-74.29463
210 GARIBALDI AVE	BERGEN	LODI	40.880695	-74.075396
210 HARMONY RD	GLOUCESTER	MICKLETON	39.813532	-75.255069
211 RANDOLPH AVE	MIDDLESEX	AVENEL	40.59668	-74.25741
2115 HIGH HILL RD	GLOUCESTER	LOGAN TOWNSHIP	39.77313	-75.36288
2133 85TH ST	HUDSON	NORTH BERGEN	40.811223	-74.016843
2141 RIVER RD	BURLINGTON	EGG HARBOR CITY	39.59439	-74.54943
215 MERRY LN	MORRIS	EAST HANOVER	40.818561	-74.341494
217 S FIRST ST	UNION	ELIZABETH	40.64451	-74.19434
2195 RT 27 AT VINEYARD RD	MIDDLESEX	EDISON	40.533148	-74.382098
22-11 RT 208	BERGEN	FAIR LAWN	40.946528	-74.132528
2231 E STATE ST	MERCER	TRENTON	40.24035	-74.72242
2239 HIGH HILL RD	GLOUCESTER	LOGAN TOWNSHIP	39.781383	-75.366082
225 THROCKMORTON ST	MONMOUTH	FREEHOLD	40.26551	-74.28819
2270 MORRIS AVE	UNION	UNION	40.698071	-74.284097
230 CULVER AVE	HUDSON	JERSEY CITY	40.71551	-74.09405
235 E ELEVENTH AVE	UNION	ROSELLE	40.64861	-74.2564
2389 VAUXHALL RD	UNION	UNION	40.707659	-74.276547
239 SAINT NICHOLAS AVE	MIDDLESEX	SOUTH PLAINFIELD	40.563181	-74.421928
24  FEDERAL  PLAZA	ESSEX	BLOOMFIELD	40.77892	-74.19392
24 AMES BLVD	SUSSEX	HAMBURG	41.152263	-74.579358
2404 VANDENBERG AVE	BURLINGTON	MCGUIRE AFB	40.017715	-74.609706
245 MERRY LN	MORRIS	EAST HANOVER	40.817577	-74.343855
245 N MAIN ST	HUNTERDON	LAMBERTVILLE	40.374856	-74.945575
25 BROOK AVE	BERGEN	MAYWOOD	40.90252	-74.07021
250 CHEESEQUAKE RD C/O DUPONT BUILDING 424	MIDDLESEX	PARLIN	40.456303	-74.335961
250 HALLS MILL RD	MONMOUTH	FREEHOLD	40.242056	-74.246722
250 HAMBURG TURNPIKE	MORRIS	BUTLER	41.010969	-74.35279
250 PLAINSBORO RD	MIDDLESEX	PLAINSBORO	40.331944	-74.619722
2512 LAMBERTON RD	MERCER	HAMILTON TOWNSHIP	40.178882	-74.733936
26 BLANCHARD ST	ESSEX	NEWARK	40.735404	-74.127623
2600 MARSHES DOCK RD	UNION	LINDEN	40.604569	-74.23465
265C BROADWAY	HUDSON	JERSEY CITY	40.73843	-74.07994
267 HOMESTEAD AVE	MIDDLESEX	AVENEL	40.578324	-74.257432
267 UNION ST	BERGEN	NORTHVALE	41.01333	-73.94141
268 DOREMUS AVE	ESSEX	NEWARK	40.723333	-74.123333
271 MAYHILL ST	BERGEN	SADDLE BROOK	40.9022	-74.08871
273 BRANCHPORT AVE	MONMOUTH	LONG BRANCH	40.308425	-74.004513
28-36 PATERSON ST	PASSAIC	PATERSON	40.922662	-74.168197
286 MANTUA GROVE RD BUILDING # 1	GLOUCESTER	WEST DEPTFORD	39.819904	-75.216447
29 E HALSEY RD	MORRIS	PARSIPPANY	40.848516	-74.423428
297 FERRY ST	ESSEX	NEWARK	40.72904	-74.15005
297 VALLEY RD	SOMERSET	SOMERVILLE	40.528632	-74.646103
2980 RT 73 N	BURLINGTON	MAPLE SHADE	39.959179	-74.987685
299 PACIFIC ST	ESSEX	NEWARK	40.7162	-74.1706
3 WASHINGTON AVE	HUNTERDON	HIGH BRIDGE	40.667022	-74.887635
30 PAUL KOHNER PL	BERGEN	ELMWOOD PARK	40.901587	-74.110146
300 MARKLEY ST	MIDDLESEX	PORT READING	40.56857	-74.26317
300 WATERLOO VALLEY RD	MORRIS	BUDD LAKE	40.907034	-74.731248
304 COX ST	UNION	ROSELLE	40.653892	-74.280739
305 W FORT LEE RD	BERGEN	BOGOTA	40.87986	-74.03753
305A CRANEWAY ST	ESSEX	NEWARK	40.69531	-74.13368
306 COLUMBIA TURNPIKE	MORRIS	FLORHAM PARK	40.797222	-74.401889
312 RISING SUN RD	BURLINGTON	BORDENTOWN	40.121704	-74.713161
32 COMMERCE DR N SUITE #1	MIDDLESEX	CRANBURY	40.34439	-74.48725
320 NEW RD	MIDDLESEX	MONMOUTH JUNCTION	40.384465	-74.548853
325 CORPORATE DR	BERGEN	MAHWAH	41.0833	-74.1537
329 NEW BRUNSWICK AVE	UNION	RAHWAY	40.593631	-74.286341
33 DEMAREST RD	SUSSEX	SPARTA	41.07114	-74.66419
33 INDUSTRIAL PARK RD	SALEM	PENNSVILLE	39.629032	-75.533973
330 CENTRAL AVE	UNION	CLARK	40.632853	-74.313037
34 STOUTS LN	MIDDLESEX	MONMOUTH JUNCTION	40.380278	-74.567333
340 MEADOW RD	MIDDLESEX	EDISON	40.491583	-74.386244
3451 S CLINTON AVE	MIDDLESEX	SOUTH PLAINFIELD	40.56995	-74.42852
35 INDUSTRIAL RD	BERGEN	LODI	40.8841	-74.07374
350 ROOSEVELT AVE	MIDDLESEX	CARTERET	40.578374	-74.214418
3500 COLONIAL DR N	OCEAN	MANCHESTER	40.022608	-74.301552
353 POWERVILLE RD	MORRIS	BOONTON	40.932155	-74.4255
359 VETERANS BLVD	BERGEN	RUTHERFORD	40.81352	-74.09967
36 NEWBURGH RD	MORRIS	HACKETTSTOWN	40.822515	-74.828096
375 HUYLER ST	BERGEN	SOUTH HACKENSACK	40.866421	-74.050087
38 HIGHTSTOWN-CRANBURY STATION	MIDDLESEX	CRANBURY	40.28611	-74.50851
387 FRANKLIN AVE	MORRIS	ROCKAWAY	40.888988	-74.516768
3900 S CLINTON AVE	MIDDLESEX	SOUTH PLAINFIELD	40.564611	-74.429638
4 PARADISE RD	GLOUCESTER	PAULSBORO	39.840932	-75.226205
40 VERONICA AVE	SOMERSET	SOMERSET	40.480582	-74.49998
400 CLAREMONT AVE	HUDSON	JERSEY CITY	40.715504	-74.089306
400 N FRONTAGE RD	MORRIS	LANDING	40.89453	-74.6764
400 SULLIVAN WAY	MERCER	WEST TRENTON	40.256583	-74.814528
4001 E MAIN ST	CUMBERLAND	MILLVILLE	39.3754	-74.9654
401 HOOK RD	HUDSON	BAYONNE	40.66494	-74.11046
405 ESSEX RD	MONMOUTH	TINTON FALLS	40.225285	-74.090606
4407 PARK AVE	HUDSON	UNION CITY	40.7772	-74.019043
443 SE AVE	CUMBERLAND	BRIDGETON	39.40778	-75.21889
45 DEMAREST DR	PASSAIC	WAYNE	40.904749	-74.262659
450 CLARK DR	MORRIS	BUDD LAKE	40.900966	-74.72517
454 ALWOOD RD	PASSAIC	CLIFTON	40.84215	-74.15692
48 BURGESS PL	PASSAIC	WAYNE	40.905944	-74.259944
48-94 BAYWAY AVE	UNION	ELIZABETH	40.63647	-74.20058
480 FRELINGHUYSEN AVE	ESSEX	NEWARK	40.703668	-74.193082
4801 S WOOD AVE	UNION	LINDEN	40.600922	-74.209522
485 OBERLIN AVE S	OCEAN	LAKEWOOD	40.06921	-74.186585
49 INDUSTRIAL AVE	BERGEN	LITTLE FERRY	40.845693	-74.035825
49 RUTHERFORD ST	ESSEX	NEWARK	40.712446	-74.139073
5 BADER RD	MORRIS	PINE BROOK	40.868669	-74.361331
5 JOANNA CT	MIDDLESEX	EAST BRUNSWICK	40.445995	-74.403691
5 N STILES ST	UNION	LINDEN	40.6258	-74.25651
5 NICHOLAS CT	MIDDLESEX	DAYTON	40.36955	-74.47559
50 S MINISINK AVE	MIDDLESEX	PARLIN	40.458611	-74.3375
50-70 MEISTER AVE	SOMERSET	BRANCHBURG	40.601457	-74.697015
500 BARBERTOWN POINT BREEZE RD	HUNTERDON	FLEMINGTON	40.500104	-74.96628
500 DOREMUS AVE	ESSEX	NEWARK	40.715833	-74.125833
500 JERSEY AVE	MIDDLESEX	NEW BRUNSWICK	40.47998	-74.46813
500 RT 202 N	HUNTERDON	FLEMINGTON	40.51591	-74.82029
500 S EGG HARBOR RD	ATLANTIC	HAMMONTON	39.666363	-74.859163
500 SHELL RD	SALEM	CARNEYS POINT	39.693667	-75.485569
5029 INDUSTRIAL RD	MONMOUTH	FARMINGDALE	40.18965	-74.12386
517 LYONS AVE	ESSEX	IRVINGTON	40.716364	-74.225622
520 MAIN AVE	BERGEN	WALLINGTON	40.860858	-74.098491
537 CRYSTAL AVE	CUMBERLAND	VINELAND	39.497647	-75.020823
54 KELLOGG CT	MIDDLESEX	EDISON	40.536681	-74.401353
55 LA FRANCE AVE	ESSEX	BLOOMFIELD	40.77837	-74.19162
554 OLD WATERWORKS RD	MIDDLESEX	OLD BRIDGE	40.432944	-74.328669
554 WATERWORKS RD	MIDDLESEX	OLD BRIDGE	40.434727	-74.329729
5738 RT 9	BURLINGTON	NEW GRETNA	39.590258	-74.438911
59 RT 10	MORRIS	EAST HANOVER	40.806822	-74.383763
6 LITHO RD	MERCER	TRENTON	40.271645	-74.707656
60 WEBRO RD	PASSAIC	CLIFTON	40.851488	-74.156855
60-70 CENTRAL AVE	HUDSON	SOUTH KEARNY	40.720683	-74.113871
600 IND US TRIAL RD	BERGEN	CARLSTADT	40.84748	-74.09832
600 MILIK ST	MIDDLESEX	CARTERET	40.59053	-74.2479
600 N BROAD ST	WARREN	PHILLIPSBURG	40.703099	-75.197676
600 PROSPECT AVE	MIDDLESEX	PISCATAWAY	40.57723	-74.462
600 RYERSON RD	MORRIS	LINCOLN PARK	40.917226	-74.28761
61 JERSEYVILLE AVE	MONMOUTH	FREEHOLD	40.251278	-74.267417
61 RIVER DR	BERGEN	GARFIELD	40.863874	-74.104887
610 E 36TH ST	PASSAIC	PATERSON	40.902445	-74.142328
610 RAHWAY AVE	UNION	UNION	40.696594	-74.297994
616 HOLLYWOOD AVE	CAMDEN	CHERRY HILL	39.935667	-75.039722
624 SCHUYLER AVE	BERGEN	LYNDHURST	40.79907	-74.116276
65 BAEKELAND AVE	MIDDLESEX	MIDDLESEX	40.554816	-74.509146
65 EUCLID AVE	ESSEX	NEWARK	40.73501	-74.13575
650 JERNEE MILL RD	MIDDLESEX	SAYREVILLE	40.434209	-74.346606
655 FAIRTON MILLVILLE RD	CUMBERLAND	FAIRTON	39.38954	-75.15985
661 KENYON AVE	CUMBERLAND	ROSENHAYN	39.481713	-75.122464
675 BILLINGSPORT RD	GLOUCESTER	PAULSBORO	39.838004	-75.248728
7 HAVENWOOD CT	OCEAN	LAKEWOOD	40.0744	-74.23692
70 ROSENHAYN AVE	CUMBERLAND	BRIDGETON	39.4467	-75.21384
700 GOTHAM PKWY	BERGEN	CARLSTADT	40.832195	-74.065075
700 HIGH ST	WARREN	HACKETTSTOWN	40.86397	-74.82422
700 MID ATLANTIC PKWY	GLOUCESTER	THOROFARE	39.829282	-75.196396
700 PARSIPPANY RD	MORRIS	PARSIPPANY	40.846016	-74.424114
74 DIAMOND RD	UNION	SPRINGFIELD	40.683705	-74.318686
75 KENNEDY ST	BERGEN	HACKENSACK	40.867896	-74.043698
75 LONG BRANCH AVE	MONMOUTH	LONG BRANCH	40.30767	-73.98288
75 MANNINGTON MILLS RD	SALEM	SALEM	39.58102	-75.453965
75 RT 130	GLOUCESTER	SWEDESBORO	39.7914	-75.4081
755 JERSEY AVE	MIDDLESEX	NEW BRUNSWICK	40.4737	-74.47499
755 RT 202	SOMERSET	BRIDGEWATER	40.571703	-74.664815
76 PORCUPINE RD	SALEM	PEDRICKTOWN	39.763889	-75.422778
760 ROOSEVELT AVE	MIDDLESEX	CARTERET	40.587355	-74.226067
77 RIVER RD	PASSAIC	CLIFTON	40.826641	-74.137193
78 CARRANZA RD	BURLINGTON	TABERNACLE	39.86041	-74.72463
790 WASHINGTON RD	MIDDLESEX	PARLIN	40.462528	-74.326065
799 RT 206 & HILLSBOROUGH RD	SOMERSET	HILLSBOROUGH	40.483056	-74.651944
800 AIRPORT RD	OCEAN	LAKEWOOD	40.060056	-74.179417
800 BILLINGSPORT RD	GLOUCESTER	PAULSBORO	39.8401	-75.2574
800 MONTROSE AVE CN1037	MIDDLESEX	SOUTH PLAINFIELD	40.566804	-74.426021
827 MARTIN ST	UNION	RAHWAY	40.59616	-74.27639
83 GRIFFITH ST	SALEM	SALEM	39.574909	-75.469493
838 N DELSEA DR	GLOUCESTER	CLAYTON	39.666012	-75.093922
84 N HACKENSACK AVE	HUDSON	SOUTH KEARNY	40.733333	-74.1
847 N AVE	UNION	ELIZABETH	40.659183	-74.203842
85 MAIN ST	MIDDLESEX	SPOTSWOOD	40.401944	-74.377222
85 NATIONAL RD	MIDDLESEX	EDISON	40.5386	-74.38908
86 YELLOWBROOK RD	MONMOUTH	HOWELL	40.21157	-74.1906
87 LINCOLN BLVD	MIDDLESEX	MIDDLESEX	40.56237	-74.52188
9 BACKUS ST	ESSEX	NEWARK	40.71933	-74.15567
9 ROY ST	MORRIS	ROCKAWAY	40.881939	-74.532387
900 N SHORE RD	CAPE MAY	BEESLEYS POINT	39.289724	-74.633944
9000 RIVER RD	CAMDEN	DELAIR	39.986944	-75.044917
901 LEHIGH AVE	UNION	UNION	40.682472	-74.242325
901 S WADE BLVD	CUMBERLAND	MILLVILLE	39.387565	-75.017671
909 DELANCY ST	ESSEX	NEWARK	40.709032	-74.128966
91 ILLINOIS AVE	PASSAIC	PATERSON	40.896781	-74.149805
91 MICHIGAN AVE	PASSAIC	PATERSON	40.894373	-74.153897
920 KINGS HWY	GLOUCESTER	THOROFARE	39.822793	-75.17739
936 HARRISON AVE	HUDSON	KEARNY	40.748682	-74.142564
94 FANNY RD	MORRIS	BOONTON	40.895028	-74.417972
941 BALL AVE	UNION	UNION	40.689617	-74.289002
941 S SECOND ST	CAMDEN	CAMDEN	39.933611	-75.128333
95 FAIRVIEW AVE	MORRIS	LONG VALLEY	40.789969	-74.774036
959 MARKET ST	PASSAIC	PATERSON	40.902606	-74.142064
970 NEW DURHAM RD	MIDDLESEX	EDISON	40.54371	-74.40277
999 WILLOW GROVE ST	WARREN	HACKETTSTOWN	40.872414	-74.813483
BLDG 350 COASTAL ST	ESSEX	NEWARK	40.69738	-74.136476
BROAD ST & FILMORE AVE	BURLINGTON	PALMYRA	39.99791	-75.031763
BUILDING 116 FUEL FARM RD NEWARK INTERNATIONAL AIRPORT	ESSEX	ELIZABETH	40.677874	-74.188683
CHEESEQUAKE RD	MIDDLESEX	PARLIN	40.452134	-74.330899
CORNER OF PARK & BRUNSWICK AVENUES	UNION	LINDEN	40.636395	-74.220393
DELAWARE AVE & ELM ST	CAMDEN	CAMDEN	39.95227	-75.12648
DUFFIELD & VAN KEUREN AVE	HUDSON	JERSEY CITY	40.74716	-74.073039
END OF ALLOWAY CREEK NECK RD	SALEM	HANCOCKS BRIDGE	39.463028	-75.53571
FOOT OF CROWS MILL RD	MIDDLESEX	KEASBEY	40.509687	-74.312999
FOOT OF S WOOD AVE	UNION	LINDEN	40.6211	-74.23412
HACKENSACK AVE	HUDSON	KEARNY	40.7371	-74.0961
HWY 547	OCEAN	LAKEHURST	40.02971	-74.36916
KING ST & JERSEY AVE	CAMDEN	GLOUCESTER CITY	39.895466	-75.128032
MT PISGAH AVE	WARREN	OXFORD	40.817653	-75.012391
N CROSSMAN RD	MIDDLESEX	SAYREVILLE	40.479262	-74.321207
N RAILROAD & ESSEX ST	CAMDEN	GLOUCESTER CITY	39.90092	-75.1186
NEW PEACH & LUBIN LN	CUMBERLAND	VINELAND	39.493118	-75.048607
NEW PROVIDENCE RD	UNION	WATCHUNG	40.65728	-74.404047
ONE AVE L	ESSEX	NEWARK	40.717048	-74.145105
ONE SQUIBB DR	MIDDLESEX	NORTH BRUNSWICK	40.46957	-74.438488
RAILROAD AVE BAYWAY REFINER	UNION	LINDEN	40.641784	-74.220848
RT 130	SALEM	DEEPWATER	39.682362	-75.491379
RT 130 & I-295 S	GLOUCESTER	WESTVILLE	39.8718	-75.1558
RT 130 & PORCUPINE RD	SALEM	PEDRICKTOWN	39.763611	-75.423611
RT 206 & PROVINCE LINE RD	MERCER	LAWRENCEVILLE	40.321556	-74.706222
RT 22 W	SOMERSET	SOMERVILLE	40.58837	-74.636127
RT 54	ATLANTIC	FOLSOM	39.588231	-74.858651
RT 55 & 553	GLOUCESTER	PITMAN	39.754796	-75.131157
UNION AVE & DUBOIS ST	BERGEN	EAST RUTHERFORD	40.825262	-74.094385
US RT 130 & PORCUPINE RD	SALEM	PEDRICKTOWN	39.766944	-75.421361
VICTORIA TERRACE	BERGEN	RIDGEFIELD	40.83679	-74.01697
W BROAD ST & DEVLIN AVE	BURLINGTON	BURLINGTON	40.071444	-74.875889
WOOD AVE S	UNION	LINDEN	40.6225	-74.2097
\.

--
-- Data for Name: nn_data; Type: TABLE DATA; Schema: newsoap; Owner: postgres
--

COPY newsoap.nn_data (facility_id, dangerous_state, longitude, latitude) FROM stdin;
07001PLTLB267HO	N/A	40.578324	-74.257432
07001PRDSL211RA	N/A	40.59668	-74.25741
07001THPRC100ES	N/A	40.57699	-74.26059
07002BYNNN141HD	N/A	40.66494	-74.11046
07002KNRCH140E2	N/A	40.657559	-74.107129
07002NRTNS148EA	N/A	40.650443	-74.121871
07003BNKSB24FED	N/A	40.77892	-74.19392
07003CMFRN13DEW	N/A	40.82122	-74.18157
07003GNRLP55LAF	N/A	40.77837	-74.19162
07004CRMCM206RT	N/A	40.87001	-74.30189
07005DRNNC94FAN	N/A	40.895028	-74.417972
07005RFLLC353PO	N/A	40.932155	-74.4255
07006CNSTN17COM	N/A	40.87184	-74.31854
07008MCLC0760RO	N/A	40.587355	-74.226067
07008SHLND350RO	N/A	40.578374	-74.214418
07008XFRDS600MI	N/A	40.59053	-74.2479
0700WGSFLP19IND	N/A	40.86324	-74.30971
0700WLTRDD1455B	N/A	40.83925	-74.18486
0700WLTSLH21HEN	N/A	40.85554	-74.29463
0700WPPTMZ11MAD	N/A	40.87133	-74.30859
07011LMRTC16RIC	N/A	40.889432	-74.160195
07011SFSCR2ACKE	N/A	40.87918	-74.12225
07012CMSNT454AL	N/A	40.84215	-74.15692
07012SCHRCONEST	N/A	40.84483	-74.15471
07014TTVNC100KI	N/A	40.826641	-74.137193
07015SWPCT1CLIF	N/A	40.86209	-74.14279
0701WDRTCF6WEBR	N/A	40.851488	-74.156855
07026NLCLR61RIV	N/A	40.863874	-74.104887
07029KRNYS936HA	N/A	40.748682	-74.142564
07030SCSTN725JE	N/A	40.7772	-74.019043
07032KHNCH86HAC	N/A	40.733333	-74.1
07032KRNYGHACKE	N/A	40.7371	-74.0961
07032SWWST115JA	N/A	40.738726	-74.112656
07032VCKRD67CEN	N/A	40.720683	-74.113871
07032WNSCRNEWAR	N/A	40.744813	-74.08795
07033SYNRY209NM	N/A	40.68091	-74.288354
07035HSHPL600FR	N/A	40.917226	-74.28761
07036CGNTCRAILR	N/A	40.641784	-74.220848
07036CNCPHFTFSW	N/A	40.6211	-74.23412
07036CTGPT4801S	N/A	40.600922	-74.209522
07036GLFLL2600M	N/A	40.604569	-74.23465
07036LFLBR5NSTI	N/A	40.6258	-74.25651
07036LNDNGWOODA	N/A	40.6225	-74.2097
07036PRMNT1515W	N/A	40.619973	-74.263704
07036SFTYK1200S	N/A	40.614135	-74.252579
07036XXNCH1400P	N/A	40.636395	-74.220393
0703WCLYTN2PRET	N/A	40.7739	-74.12754
0703WDPNTD14PAR	N/A	40.640616	-74.21907
0703WWLDNS2MARS	N/A	40.60382	-74.23549
07047WRGRC21338	N/A	40.811223	-74.016843
07054MTMCR700PA	N/A	40.846016	-74.424114
07054WMSTN29EHA	N/A	40.848516	-74.423428
07054ZMMRT1PMER	N/A	40.851715	-74.423751
07057FRMLN52MAI	N/A	40.860858	-74.098491
07058DCRNC5BADE	N/A	40.868669	-74.361331
07059NDGCS141MT	N/A	40.63392	-74.5044
07064NTDST300MA	N/A	40.56857	-74.26317
07065DRPRN329NE	N/A	40.593631	-74.286341
07065LCTRM827MA	N/A	40.59616	-74.27639
07065MRCKC126EL	N/A	40.612743	-74.260921
07066KRNKC330CE	N/A	40.632853	-74.313037
07066PLYCH160TE	N/A	40.628279	-74.319298
07069FNWDSNEWPR	N/A	40.65728	-74.404047
07070RCHTC359VE	N/A	40.81352	-74.09967
07071PLYRT624SC	N/A	40.79907	-74.116276
07071SKCRP201PO	N/A	40.804839	-74.108591
07072CKDNN700GO	N/A	40.832195	-74.065075
07072PNTCH117MO	N/A	40.834971	-74.058442
07072PTTRS6INDU	N/A	40.84748	-74.09832
07073DBSCHUNION	N/A	40.825262	-74.094385
07073GNRLF13MAN	N/A	40.82558	-74.088563
07074CRSTF100CA	N/A	40.837222	-74.048889
07077SHLLL111ST	N/A	40.541944	-74.254722
07080HMMLC10HAR	N/A	40.56915	-74.39865
07080MNRLP1CLID	N/A	40.55125	-74.40484
07080MTZMT3900S	N/A	40.564611	-74.429638
07080TVCNC110PM	N/A	40.569118	-74.426345
07080VNGRD239ST	N/A	40.563181	-74.421928
07081BGLWC74DIA	N/A	40.683705	-74.318686
07083FRMST941BA	N/A	40.689617	-74.289002
07083LCNPW901LE	N/A	40.682472	-74.242325
07083MRCNP610RA	N/A	40.696594	-74.297994
07083NTRNT2270M	N/A	40.698071	-74.284097
07083TSSLR2389V	N/A	40.707659	-74.276547
0708WKYSTN3451S	N/A	40.56995	-74.42852
0708WVLDSX8MNTR	N/A	40.566804	-74.426021
07095LCNBL11CRA	N/A	40.595252	-74.254772
07095RSSLL14CON	N/A	40.54081	-74.27705
07101NHSRB200US	N/A	40.693625	-74.195918
07102PBLCS155RA	N/A	40.736952	-74.117676
07105BNJMN134LI	N/A	40.74001	-74.132483
07105CRDLT500DO	N/A	40.715833	-74.125833
07105CWCND185FO	N/A	40.72716	-74.13197
07105DCCHM49RUT	N/A	40.712446	-74.139073
07105DLTMR26BLA	N/A	40.735404	-74.127623
07105FDRLB9BACK	N/A	40.71933	-74.15567
07105HRCSP65EUC	N/A	40.73501	-74.13575
07105LNCHM268DO	N/A	40.723333	-74.123333
07105MNPCN27215	N/A	40.72393	-74.14087
07105NWRKT909DE	N/A	40.709032	-74.128966
07105PLYMR297FE	N/A	40.72904	-74.15005
07105TRYCHONEAV	N/A	40.717048	-74.145105
07111RCHRD517LY	N/A	40.716364	-74.225622
07114BPXPLBLDG3	N/A	40.69738	-74.136476
07114CHMFL92896	N/A	40.699553	-74.130817
07114GJCHM37037	N/A	40.72865	-74.12194
07114KPPRS480FR	N/A	40.703668	-74.193082
07114MRDCRBUILD	N/A	40.69531	-74.13368
07114NWJRS139HA	N/A	40.701944	-74.189592
07114RHSKR131MA	N/A	40.69288	-74.142643
07114SHMRCFTFPA	N/A	40.7162	-74.1706
07201GDNVTNAVED	N/A	40.677874	-74.188683
07203PMRCN209E1	N/A	40.64861	-74.2564
07203RNBND304CO	N/A	40.653892	-74.280739
07205HHSWS1478C	N/A	40.708667	-74.233079
07206CYCLC217SF	N/A	40.64451	-74.19434
07206PPTTS847NA	N/A	40.659183	-74.203842
07207KLPHR200EL	N/A	40.664574	-74.233828
07207PHLPS720SO	N/A	40.63647	-74.20058
07304DNLPR400CL	N/A	40.715504	-74.089306
07305CRLXN230CU	N/A	40.71551	-74.09405
07306HDSNGDUFFI	N/A	40.74716	-74.073039
07306NCHLS120DU	N/A	40.743354	-74.074289
07310STRNC18THS	N/A	40.733167	-74.034079
07310STRNC265CB	N/A	40.73843	-74.07994
07405BTLRP250HA	N/A	41.010969	-74.35279
07407CSTMC30PAU	N/A	40.901587	-74.110146
07407MRCLP1MARK	N/A	40.90232	-74.13179
07410FSHRS1REAG	N/A	40.9375	-74.13193
07410KRSCH2001P	N/A	40.946417	-74.130417
07410NBSCB2211R	N/A	40.946528	-74.132528
07419CCRTFRTE94	N/A	41.152263	-74.579358
07420RRWGRTHIRD	N/A	41.02925	-74.295694
07430HWMDC300CO	N/A	41.0833	-74.1537
07457FLTRC1NORT	N/A	40.98996	-74.29937
0745WTLCNN125HA	N/A	40.997694	-74.3105
07470CLFTNBURGE	N/A	40.905944	-74.259944
07470NRTNC150DE	N/A	40.912663	-74.252217
07474PSSCR45DEM	N/A	40.904749	-74.262659
07480GNRNT1865R	N/A	41.013408	-74.384034
07501LTTLF189CA	N/A	40.908937	-74.186924
07501PSSCC2836P	N/A	40.922662	-74.168197
07503CRWNR91ILL	N/A	40.896781	-74.149805
07503PRSRN91MIC	N/A	40.894373	-74.153897
07506FSKLL10THO	N/A	40.94134	-74.16261
07509CSTML932MA	N/A	40.902445	-74.142328
07513KNTC 959MA	N/A	40.902606	-74.142064
0751WDVNCD1TAFT	N/A	40.904221	-74.24583
07544KRKRC1EAST	N/A	40.936287	-74.156929
07601LCTRC75KEN	N/A	40.867896	-74.043698
07603STRNC35WFR	N/A	40.87986	-74.03753
07606MDSBT375HU	N/A	40.866421	-74.050087
07607MYRNM205MA	N/A	40.894692	-74.066612
07607STPNC100WH	N/A	40.89623	-74.06827
07607VCTRS25BRK	N/A	40.90252	-74.07021
07643SCNTF49IND	N/A	40.845693	-74.035825
07644HKMTL35IND	N/A	40.8841	-74.07374
07644SFFRN210GA	N/A	40.880695	-74.075396
07647TKSGN267UN	N/A	41.01333	-73.94141
0764WCNNGN15MER	N/A	41.047948	-74.062786
07656GNZYM1125P	N/A	40.82722	-74.01594
07657BRGNGVICTO	N/A	40.83679	-74.01697
07657BZZDR1145E	N/A	40.83668	-74.01528
07657CLRTP101RA	N/A	40.82599	-74.01389
07657KMBRM161RA	N/A	40.828407	-74.012113
07660CLLHN200IN	N/A	40.86212	-74.031536
07662LLNFN271MA	N/A	40.9022	-74.08871
07722NVLWP201HW	N/A	40.26458	-74.16291
07724LCTRN1INDU	N/A	40.27663	-74.04071
07727BLRYCPOBOX	N/A	40.22461	-74.13625
07727PPLCD5029I	N/A	40.18965	-74.12386
07728FRSTB250HA	N/A	40.242056	-74.246722
07728NSTLF61JER	N/A	40.251278	-74.267417
0772WCLYTN225TH	N/A	40.26551	-74.28819
0772WRLPHC1CMME	N/A	40.30204	-74.06855
0773WSTRNC86YEL	N/A	40.21157	-74.1906
07740WHLCK273BR	N/A	40.308425	-74.004513
0774WMNMTH75LNG	N/A	40.30767	-73.98288
07753LCTRN405ES	N/A	40.225285	-74.090606
07801HWMTCROYST	N/A	40.881939	-74.532387
07823HFFMN206RO	N/A	40.843611	-75.066389
07828GVDNF300WA	N/A	40.907034	-74.731248
07828L3CMM45CLA	N/A	40.900966	-74.72517
07840HTRNC999WI	N/A	40.872414	-74.813483
07840LSTMLESNAD	N/A	40.820611	-74.833
07840MMMRSHIGHS	N/A	40.86397	-74.82422
07840NDRXN101BI	N/A	40.87103	-74.82127
07840TDMDL36NEW	N/A	40.822515	-74.828096
07850PRDNT400NF	N/A	40.89453	-74.6764
07853FRZRNFAIRV	N/A	40.789969	-74.774036
07865BRLSC176TH	N/A	40.813361	-74.888111
07866MCWLL1948F	N/A	40.888988	-74.516768
0786WLLDCN25FRA	N/A	40.893783	-74.513901
0786WTLCNNMTPIS	N/A	40.817653	-75.012391
0787WDMNDS33DEM	N/A	41.07114	-74.66419
07882BSFCRPERSH	N/A	40.754803	-74.9731
07928NTNLM12RIV	N/A	40.72973	-74.38134
07928STTNL116SU	N/A	40.73485	-74.37765
07932PRCSN306CO	N/A	40.797222	-74.401889
07936FRTZSMERRY	N/A	40.817577	-74.343855
07936RYLLBMERRY	N/A	40.818561	-74.341494
07936SNDZP59ROU	N/A	40.806822	-74.383763
07962THMNNHANOV	N/A	40.813267	-74.475711
07977KMLNS12HOL	N/A	40.709091	-74.670599
08002MYCND616HO	N/A	39.935667	-75.039722
08012TRNGL1TRIA	N/A	39.77916	-75.0455
08014CSTMB210HI	N/A	39.77313	-75.36288
08014MNSNTROUTE	N/A	39.792583	-75.395278
08014PGCRPRTE13	N/A	39.7914	-75.4081
08016BRLNGWBROA	N/A	40.071444	-74.875889
08016CMBRLCUMBE	N/A	40.104569	-74.788863
08016FRNKLBEVER	N/A	40.068513	-74.883871
08016GLDBN1818R	N/A	40.10465	-74.82958
0801WSVSNX1HARM	N/A	39.829553	-75.075693
08023DPNTCRT130	N/A	39.682362	-75.491379
08030KCHPTKINGW	N/A	39.895466	-75.128032
08030NDCNCNRAIL	N/A	39.90092	-75.1186
08037KRRCN19212	N/A	39.588231	-74.858651
08037MRCNGRT54S	N/A	39.612532	-74.830518
08037MSSRL5SEGG	N/A	39.666363	-74.859163
08038NCLRBENDOF	N/A	39.463028	-75.53571
08051HNGSTOGDEN	N/A	39.802387	-75.184909
08052CVCSP2980R	N/A	39.959179	-74.987685
08052STNHR1PARK	N/A	39.961734	-74.992226
08056BNNLL210HA	N/A	39.813532	-75.255069
08057GRSPCBORTO	N/A	39.976785	-74.917626
08057MCRRP1255N	N/A	39.976998	-74.983059
08057MRCNB105WG	N/A	39.97525	-74.97233
08065CLLHNBROAD	N/A	39.99791	-75.031763
08065RMTKN701PU	N/A	39.996772	-75.03032
08066BMPRS167IM	N/A	39.82878	-75.20478
08066CPLYRMANTU	N/A	39.819904	-75.216447
08066DPNC 2000N	N/A	39.818448	-75.206721
08066JHNSN2001A	N/A	39.81925	-75.2045
08066MBLLC1001B	N/A	39.829664	-75.254053
08066MBLLCBILLI	N/A	39.8401	-75.2574
08066RPRDCBILLI	N/A	39.838004	-75.248728
08066SVWLC4PARA	N/A	39.840932	-75.226205
08067PDRCK143US	N/A	39.766944	-75.421361
08067THBFGUSROU	N/A	39.763889	-75.422778
08067THGNCUSRTE	N/A	39.766944	-75.421361
08067XYVNYRTE13	N/A	39.763611	-75.423611
08069CRNYS500SH	N/A	39.693667	-75.485569
08070GNSCHINDUS	N/A	39.629032	-75.533973
08071KTRNLRUTES	N/A	39.754796	-75.131157
08073NDCTT10IND	N/A	40.010321	-74.847239
08077HGNSCRIVER	N/A	40.02229	-74.989799
08077KLSTR1050T	N/A	40.022751	-74.982746
08079MNNNGMANNI	N/A	39.58102	-75.453965
08079NCHRG83GRI	N/A	39.574909	-75.469493
08085NGNRD2239H	N/A	39.781383	-75.366082
08086GRLCK700MI	N/A	39.829282	-75.196396
08086PNNWLCROWN	N/A	39.845474	-75.209486
08088CLNLC78CAR	N/A	39.86041	-74.72463
08088SFTYK123RE	N/A	39.8935	-74.74419
08093CSTLGRTES1	N/A	39.8718	-75.1558
08096GLFLL920KI	N/A	39.822793	-75.17739
08102FWWNTDELAW	N/A	39.95227	-75.12648
08103DMTRN1101S	N/A	39.931776	-75.129552
08103STTMT941SO	N/A	39.933611	-75.128333
08110CLTXC1500J	N/A	39.982667	-75.040611
08110LMNMS9000R	N/A	39.986944	-75.044917
0821WDLPHN2141R	N/A	39.59439	-74.54943
0821WRLPHC13CHE	N/A	39.423984	-74.567468
08223BLNGL900NS	N/A	39.289724	-74.633944
08224VKNGYRTE9	N/A	39.590258	-74.438911
08302LNNDS443SE	N/A	39.40778	-75.21889
08302WHTWV7RSEN	N/A	39.4467	-75.21384
08312PCKCK838ND	N/A	39.666012	-75.093922
08320SBRFPFAIRT	N/A	39.38954	-75.15985
08332DRNDGWADEB	N/A	39.387565	-75.017671
08332LCNPC1633W	N/A	39.412481	-75.03134
08332WHTNG220GS	N/A	39.407778	-75.034444
0833WCMBRL41EAS	N/A	39.3754	-74.9654
08352NTLRF661KE	N/A	39.481713	-75.122464
08360KMBLGCRYST	N/A	39.497647	-75.020823
08362VNLNDNEWPE	N/A	39.493118	-75.048607
08502LHNFNROUTE	N/A	40.483056	-74.651944
08505NWLTR312RI	N/A	40.121704	-74.713161
08505STPNCFOURT	N/A	40.134387	-74.735599
08512PLNTFHIGHT	N/A	40.28611	-74.50851
08512TWCVD32CMM	N/A	40.34439	-74.48725
08530BRNCL11KAR	N/A	40.3828	-74.91956
08530DVNCD245NM	N/A	40.374856	-74.945575
08536FRMNCPRINC	N/A	40.331944	-74.619722
08543BRSTLRTE20	N/A	40.321556	-74.706222
08611MRCRGLAMBE	N/A	40.178882	-74.733936
08619THTRN2231E	N/A	40.24035	-74.72242
08628RLLRBSULLI	N/A	40.256583	-74.814528
08638RCRRL157NL	N/A	40.24259	-74.75583
0863WRLPHC1144N	N/A	40.240904	-74.740907
08640SRMYH5417A	N/A	40.017715	-74.609706
08648MTLLT6LITH	N/A	40.271645	-74.707656
08691WBTCH108NG	N/A	40.206874	-74.625518
08701CHRCH800AI	N/A	40.060056	-74.179417
08701FLXBR1969R	N/A	40.071809	-74.161324
08701GLSSL485OB	N/A	40.06921	-74.186585
08701LKWDC123EN	N/A	40.061211	-74.167904
08701LPHSS145LE	N/A	40.07484	-74.17057
08701PRMCL1990R	N/A	40.070784	-74.163312
0870WRLPHC7HAVE	N/A	40.0744	-74.23692
08733NVLRNRTE54	N/A	40.02971	-74.36916
08759RGTHR35CLN	N/A	40.022608	-74.301552
08805PLYMR1EEAS	N/A	40.572182	-74.561398
08807BRDDC123CH	N/A	40.56634	-74.56338
08810CRYCM5NICH	N/A	40.36955	-74.47559
08810RCHMN1CHRI	N/A	40.37181	-74.49684
08816MNCND5JOAN	N/A	40.445995	-74.403691
08817CLNLW85NAT	N/A	40.5386	-74.38908
08817GRCDV34MEA	N/A	40.491583	-74.386244
08817KZCHMMEADO	N/A	40.491583	-74.386244
08817MRCNN135NA	N/A	40.538538	-74.386195
08817PCXTR18NAT	N/A	40.5353	-74.38434
08817PDBSN54KEL	N/A	40.536681	-74.401353
08818MBLCHRT27A	N/A	40.533148	-74.382098
08818MTXCR970NE	N/A	40.54371	-74.40277
08821NDSTRVALLE	N/A	40.528632	-74.646103
088223M   500RT	N/A	40.51591	-74.82029
08822MGNSM500PO	N/A	40.500104	-74.96628
08822TLNTC137RT	N/A	40.470555	-74.861944
08829CSTML3WASH	N/A	40.667022	-74.887635
08829GLSSM124WM	N/A	40.66112	-74.90248
0883WTRPRCFTFCR	N/A	40.509687	-74.312999
08846MRSLN125FA	N/A	40.560538	-74.520639
08846THBTHLINCO	N/A	40.56237	-74.52188
0884WCLYTN125US	N/A	40.521013	-74.364875
08852JHNCDNEWRO	N/A	40.384465	-74.548853
08852MHWKLSTOUT	N/A	40.380278	-74.567333
08854NNCRB1RIVE	N/A	40.554816	-74.509146
08854ZGLRC600PR	N/A	40.57723	-74.462
08857BLNDR1JAKE	N/A	40.40986	-74.32759
08857LDBRDOLDWA	N/A	40.432944	-74.328669
08857MDSNNOLDWA	N/A	40.434727	-74.329729
08859CLPNP970WA	N/A	40.462528	-74.326065
08859DPNTPCHEES	N/A	40.452134	-74.330899
08859HDMCR500CH	N/A	40.456303	-74.335961
08859HRCLSSOUTH	N/A	40.458611	-74.3375
08861NGLRT1200A	N/A	40.539677	-74.272621
08861VSMBY1190A	N/A	40.53805	-74.27078
08862WTCCR1000C	N/A	40.539003	-74.275635
08863HTCCRKINGG	N/A	40.5252	-74.319423
08865JTBKR600NO	N/A	40.703099	-75.197676
08865TLNTC183SI	N/A	40.684667	-75.186167
08869RTHDGROUTE	N/A	40.572486	-74.649095
08872CNFLD1SCRO	N/A	40.47539	-74.31903
08872NWJRSNORTH	N/A	40.479262	-74.321207
08872PHRMT65JER	N/A	40.434209	-74.346606
08873NNCRB40VER	N/A	40.480582	-74.49998
08873WMZNS39BEL	N/A	40.535292	-74.540919
08875RTRCL187DA	N/A	40.538075	-74.522885
08876DVRNCSOUTH	N/A	40.562403	-74.604058
08876FSHRS755RT	N/A	40.571703	-74.664815
08876GBSNT100AS	N/A	40.59611	-74.68181
08876PRNTN50MEI	N/A	40.601457	-74.697015
08876RMTCT130IN	N/A	40.598	-74.70943
08876RMTCT197ME	N/A	40.605745	-74.715119
08876THCNNROUTE	N/A	40.58837	-74.636127
0887WNWWRL1RAND	N/A	40.543587	-74.555658
0887WRCHML18USH	N/A	40.563159	-74.699455
08884KMBRL85MAI	N/A	40.401944	-74.377222
08884SPRRSPOBOX	N/A	40.38662	-74.371352
08888DRLNGPOBOX	N/A	40.650102	-74.75794
08901SPCTR755JE	N/A	40.4737	-74.47499
08902BRNTC1010J	N/A	40.468745	-74.478183
08902RSQBBONESQ	N/A	40.46957	-74.438488
08902SLVRL1SILV	N/A	40.4652	-74.43642
08903KZCHM500JE	N/A	40.47998	-74.46813
\.

--
-- Data for Name: owned_by; Type: TABLE DATA; Schema: newsoap; Owner: postgres
--

COPY newsoap.owned_by (owner_id, facility_id, start_date, end_date, purpose) FROM stdin;
0	088223M   500RT	\N	\N	\N
1	07114RHSKR131MA	\N	\N	\N
10	08872PHRMT65JER	\N	\N	\N
100	08817KZCHMMEADO	\N	\N	\N
101	08079MNNNGMANNI	\N	\N	\N
102	07501PSSCC2836P	\N	\N	\N
103	07407MRCLP1MARK	\N	\N	\N
104	07840MMMRSHIGHS	\N	\N	\N
105	07662LLNFN271MA	\N	\N	\N
106	07095RSSLL14CON	\N	\N	\N
107	08865TLNTC183SI	\N	\N	\N
108	07065MRCKC126EL	\N	\N	\N
109	08067THGNCUSRTE	\N	\N	\N
11	08876RMTCT197ME	\N	\N	\N
110	07206PPTTS847NA	\N	\N	\N
111	07410NBSCB2211R	\N	\N	\N
112	07077SHLLL111ST	\N	\N	\N
112	07105NWRKT909DE	\N	\N	\N
113	0700WLTRDD1455B	\N	\N	\N
114	07002NRTNS148EA	\N	\N	\N
115	08822TLNTC137RT	\N	\N	\N
116	08002MYCND616HO	\N	\N	\N
117	07002KNRCH140E2	\N	\N	\N
117	07003BNKSB24FED	\N	\N	\N
117	07003CMFRN13DEW	\N	\N	\N
117	07005DRNNC94FAN	\N	\N	\N
117	07006CNSTN17COM	\N	\N	\N
117	07008XFRDS600MI	\N	\N	\N
117	0700WGSFLP19IND	\N	\N	\N
117	0700WLTSLH21HEN	\N	\N	\N
117	07011LMRTC16RIC	\N	\N	\N
117	07012CMSNT454AL	\N	\N	\N
117	07015SWPCT1CLIF	\N	\N	\N
117	0701WDRTCF6WEBR	\N	\N	\N
117	07029KRNYS936HA	\N	\N	\N
117	07030SCSTN725JE	\N	\N	\N
117	07032VCKRD67CEN	\N	\N	\N
117	07033SYNRY209NM	\N	\N	\N
117	07035HSHPL600FR	\N	\N	\N
117	07036PRMNT1515W	\N	\N	\N
117	07054MTMCR700PA	\N	\N	\N
117	07054WMSTN29EHA	\N	\N	\N
117	07059NDGCS141MT	\N	\N	\N
117	07065LCTRM827MA	\N	\N	\N
117	07070RCHTC359VE	\N	\N	\N
117	07072CKDNN700GO	\N	\N	\N
117	07072PNTCH117MO	\N	\N	\N
117	07073DBSCHUNION	\N	\N	\N
117	07080HMMLC10HAR	\N	\N	\N
117	07081BGLWC74DIA	\N	\N	\N
117	07083FRMST941BA	\N	\N	\N
117	0708WKYSTN3451S	\N	\N	\N
117	0708WVLDSX8MNTR	\N	\N	\N
117	07105CRDLT500DO	\N	\N	\N
117	07105CWCND185FO	\N	\N	\N
117	07105FDRLB9BACK	\N	\N	\N
117	07105LNCHM268DO	\N	\N	\N
117	07105MNPCN27215	\N	\N	\N
117	07111RCHRD517LY	\N	\N	\N
117	07114CHMFL92896	\N	\N	\N
117	07114GJCHM37037	\N	\N	\N
117	07114MRDCRBUILD	\N	\N	\N
117	07114NWJRS139HA	\N	\N	\N
117	07114SHMRCFTFPA	\N	\N	\N
117	07205HHSWS1478C	\N	\N	\N
117	07305CRLXN230CU	\N	\N	\N
117	07405BTLRP250HA	\N	\N	\N
117	07419CCRTFRTE94	\N	\N	\N
117	07420RRWGRTHIRD	\N	\N	\N
117	07474PSSCR45DEM	\N	\N	\N
117	07480GNRNT1865R	\N	\N	\N
117	07501LTTLF189CA	\N	\N	\N
117	07503CRWNR91ILL	\N	\N	\N
117	07503PRSRN91MIC	\N	\N	\N
117	07506FSKLL10THO	\N	\N	\N
117	07509CSTML932MA	\N	\N	\N
117	07601LCTRC75KEN	\N	\N	\N
117	07607MYRNM205MA	\N	\N	\N
117	07607VCTRS25BRK	\N	\N	\N
117	07644HKMTL35IND	\N	\N	\N
117	07644SFFRN210GA	\N	\N	\N
117	07657BZZDR1145E	\N	\N	\N
117	07727BLRYCPOBOX	\N	\N	\N
117	0774WMNMTH75LNG	\N	\N	\N
117	07840NDRXN101BI	\N	\N	\N
117	07865BRLSC176TH	\N	\N	\N
117	0786WLLDCN25FRA	\N	\N	\N
117	0787WDMNDS33DEM	\N	\N	\N
117	07962THMNNHANOV	\N	\N	\N
117	07977KMLNS12HOL	\N	\N	\N
117	08016FRNKLBEVER	\N	\N	\N
117	0801WSVSNX1HARM	\N	\N	\N
117	08030NDCNCNRAIL	\N	\N	\N
117	08037MSSRL5SEGG	\N	\N	\N
117	08051HNGSTOGDEN	\N	\N	\N
117	08057MRCNB105WG	\N	\N	\N
117	08066BMPRS167IM	\N	\N	\N
117	08067PDRCK143US	\N	\N	\N
117	08085NGNRD2239H	\N	\N	\N
117	08102FWWNTDELAW	\N	\N	\N
117	08103STTMT941SO	\N	\N	\N
117	08110LMNMS9000R	\N	\N	\N
117	0821WDLPHN2141R	\N	\N	\N
117	08332DRNDGWADEB	\N	\N	\N
117	08352NTLRF661KE	\N	\N	\N
117	08505NWLTR312RI	\N	\N	\N
117	08512PLNTFHIGHT	\N	\N	\N
117	08530BRNCL11KAR	\N	\N	\N
117	08530DVNCD245NM	\N	\N	\N
117	08536FRMNCPRINC	\N	\N	\N
117	08638RCRRL157NL	\N	\N	\N
117	08691WBTCH108NG	\N	\N	\N
117	08701FLXBR1969R	\N	\N	\N
117	08701LPHSS145LE	\N	\N	\N
117	08810CRYCM5NICH	\N	\N	\N
117	08810RCHMN1CHRI	\N	\N	\N
117	08816MNCND5JOAN	\N	\N	\N
117	08817CLNLW85NAT	\N	\N	\N
117	08817PCXTR18NAT	\N	\N	\N
117	08821NDSTRVALLE	\N	\N	\N
117	08822MGNSM500PO	\N	\N	\N
117	08829CSTML3WASH	\N	\N	\N
117	08854ZGLRC600PR	\N	\N	\N
117	08857BLNDR1JAKE	\N	\N	\N
117	08857LDBRDOLDWA	\N	\N	\N
117	08857MDSNNOLDWA	\N	\N	\N
117	08859HDMCR500CH	\N	\N	\N
117	08861NGLRT1200A	\N	\N	\N
117	08869RTHDGROUTE	\N	\N	\N
117	08873NNCRB40VER	\N	\N	\N
117	08875RTRCL187DA	\N	\N	\N
117	08876RMTCT130IN	\N	\N	\N
117	0887WNWWRL1RAND	\N	\N	\N
117	08884SPRRSPOBOX	\N	\N	\N
117	08902BRNTC1010J	\N	\N	\N
117	08903KZCHM500JE	\N	\N	\N
118	07928NTNLM12RIV	\N	\N	\N
119	07606MDSBT375HU	\N	\N	\N
12	07080MTZMT3900S	\N	\N	\N
120	08852MHWKLSTOUT	\N	\N	\N
121	07728NSTLF61JER	\N	\N	\N
122	07306NCHLS120DU	\N	\N	\N
123	08016GLDBN1818R	\N	\N	\N
124	07105DCCHM49RUT	\N	\N	\N
125	07008SHLND350RO	\N	\N	\N
126	08332LCNPC1633W	\N	\N	\N
127	08876DVRNCSOUTH	\N	\N	\N
128	08701PRMCL1990R	\N	\N	\N
129	07936SNDZP59ROU	\N	\N	\N
13	08701GLSSL485OB	\N	\N	\N
130	08067XYVNYRTE13	\N	\N	\N
131	07513KNTC 959MA	\N	\N	\N
132	08037KRRCN19212	\N	\N	\N
133	0745WTLCNN125HA	\N	\N	\N
133	0786WTLCNNMTPIS	\N	\N	\N
133	0883WTRPRCFTFCR	\N	\N	\N
134	07032WNSCRNEWAR	\N	\N	\N
135	07203PMRCN209E1	\N	\N	\N
135	08065RMTKN701PU	\N	\N	\N
136	08066MBLLCBILLI	\N	\N	\N
137	07036CTGPT4801S	\N	\N	\N
138	07407CSTMC30PAU	\N	\N	\N
139	07036CNCPHFTFSW	\N	\N	\N
14	0764WCNNGN15MER	\N	\N	\N
140	07083MRCNP610RA	\N	\N	\N
141	07001PLTLB267HO	\N	\N	\N
142	07003GNRLP55LAF	\N	\N	\N
143	08014MNSNTROUTE	\N	\N	\N
144	08805PLYMR1EEAS	\N	\N	\N
145	07105PLYMR297FE	\N	\N	\N
146	07071PLYRT624SC	\N	\N	\N
147	0700WPPTMZ11MAD	\N	\N	\N
148	07072PTTRS6INDU	\N	\N	\N
149	07866MCWLL1948F	\N	\N	\N
149	08876GBSNT100AS	\N	\N	\N
15	08902SLVRL1SILV	\N	\N	\N
150	07001PRDSL211RA	\N	\N	\N
151	07850PRDNT400NF	\N	\N	\N
152	07102PBLCS155RA	\N	\N	\N
152	08016BRLNGWBROA	\N	\N	\N
153	07032KRNYGHACKE	\N	\N	\N
153	07036LNDNGWOODA	\N	\N	\N
153	07306HDSNGDUFFI	\N	\N	\N
153	07657BRGNGVICTO	\N	\N	\N
153	08038NCLRBENDOF	\N	\N	\N
153	08611MRCRGLAMBE	\N	\N	\N
154	0703WCLYTN2PRET	\N	\N	\N
154	0772WCLYTN225TH	\N	\N	\N
154	0772WRLPHC1CMME	\N	\N	\N
154	0821WRLPHC13CHE	\N	\N	\N
154	0863WRLPHC1144N	\N	\N	\N
154	0870WRLPHC7HAVE	\N	\N	\N
154	0884WCLYTN125US	\N	\N	\N
155	08502LHNFNROUTE	\N	\N	\N
156	0887WRCHML18USH	\N	\N	\N
157	08223BLNGL900NS	\N	\N	\N
158	08628RLLRBSULLI	\N	\N	\N
159	07470CLFTNBURGE	\N	\N	\N
16	07101NHSRB200US	\N	\N	\N
160	08873WMZNS39BEL	\N	\N	\N
161	07114KPPRS480FR	\N	\N	\N
162	08052STNHR1PARK	\N	\N	\N
163	07011SFSCR2ACKE	\N	\N	\N
164	07036SFTYK1200S	\N	\N	\N
165	07470NRTNC150DE	\N	\N	\N
165	08056BNNLL210HA	\N	\N	\N
166	08884KMBRL85MAI	\N	\N	\N
167	08070GNSCHINDUS	\N	\N	\N
168	07071SKCRP201PO	\N	\N	\N
169	08817MRCNN135NA	\N	\N	\N
17	07065DRPRN329NE	\N	\N	\N
170	08086PNNWLCROWN	\N	\N	\N
171	08901SPCTR755JE	\N	\N	\N
172	07840HTRNC999WI	\N	\N	\N
173	07607STPNC100WH	\N	\N	\N
173	08505STPNCFOURT	\N	\N	\N
174	07430HWMDC300CO	\N	\N	\N
175	07643SCNTF49IND	\N	\N	\N
176	08093CSTLGRTES1	\N	\N	\N
177	07647TKSGN267UN	\N	\N	\N
178	07753LCTRN405ES	\N	\N	\N
179	07724LCTRN1INDU	\N	\N	\N
18	07727PPLCD5029I	\N	\N	\N
180	07657CLRTP101RA	\N	\N	\N
181	07083TSSLR2389V	\N	\N	\N
182	08110CLTXC1500J	\N	\N	\N
182	08854NNCRB1RIVE	\N	\N	\N
183	07001THPRC100ES	\N	\N	\N
184	07840LSTMLESNAD	\N	\N	\N
185	07004CRMCM206RT	\N	\N	\N
186	07932PRCSN306CO	\N	\N	\N
187	07036LFLBR5NSTI	\N	\N	\N
187	08066DPNC 2000N	\N	\N	\N
188	07840TDMDL36NEW	\N	\N	\N
189	07105TRYCHONEAV	\N	\N	\N
19	07002BYNNN141HD	\N	\N	\N
190	07728FRSTB250HA	\N	\N	\N
191	08818MTXCR970NE	\N	\N	\N
192	07310STRNC18THS	\N	\N	\N
192	07310STRNC265CB	\N	\N	\N
192	07603STRNC35WFR	\N	\N	\N
192	0773WSTRNC86YEL	\N	\N	\N
193	07722NVLWP201HW	\N	\N	\N
193	08640SRMYH5417A	\N	\N	\N
193	08733NVLRNRTE54	\N	\N	\N
194	08320SBRFPFAIRT	\N	\N	\N
195	07064NTDST300MA	\N	\N	\N
196	07080VNGRD239ST	\N	\N	\N
197	08846MRSLN125FA	\N	\N	\N
198	08224VKNGYRTE9	\N	\N	\N
199	08037MRCNGRT54S	\N	\N	\N
2	07207KLPHR200EL	\N	\N	\N
20	08079NCHRG83GRI	\N	\N	\N
20	08302LNNDS443SE	\N	\N	\N
200	08861VSMBY1190A	\N	\N	\N
201	08852JHNCDNEWRO	\N	\N	\N
202	07047WRGRC21338	\N	\N	\N
202	08817GRCDV34MEA	\N	\N	\N
203	08888DRLNGPOBOX	\N	\N	\N
204	0703WWLDNS2MARS	\N	\N	\N
204	07069FNWDSNEWPR	\N	\N	\N
205	07206CYCLC217SF	\N	\N	\N
206	08302WHTWV7RSEN	\N	\N	\N
207	07054ZMMRT1PMER	\N	\N	\N
21	07928STTNL116SU	\N	\N	\N
21	08859HRCLSSOUTH	\N	\N	\N
22	07095LCNBL11CRA	\N	\N	\N
23	08865JTBKR600NO	\N	\N	\N
24	08066SVWLC4PARA	\N	\N	\N
25	08876PRNTN50MEI	\N	\N	\N
26	07882BSFCRPERSH	\N	\N	\N
27	07012SCHRCONEST	\N	\N	\N
27	08067THBFGUSROU	\N	\N	\N
28	07105BNJMN134LI	\N	\N	\N
29	08846THBTHLINCO	\N	\N	\N
3	07083LCNPW901LE	\N	\N	\N
30	07410KRSCH2001P	\N	\N	\N
31	08030KCHPTKINGW	\N	\N	\N
32	07203RNBND304CO	\N	\N	\N
33	07057FRMLN52MAI	\N	\N	\N
34	07008MCLC0760RO	\N	\N	\N
34	07114BPXPLBLDG3	\N	\N	\N
35	08807BRDDC123CH	\N	\N	\N
36	07080MNRLP1CLID	\N	\N	\N
37	08543BRSTLRTE20	\N	\N	\N
37	08902RSQBBONESQ	\N	\N	\N
38	08648MTLLT6LITH	\N	\N	\N
39	07660CLLHN200IN	\N	\N	\N
39	08065CLLHNBROAD	\N	\N	\N
4	08012TRNGL1TRIA	\N	\N	\N
40	0833WCMBRL41EAS	\N	\N	\N
41	08014PGCRPRTE13	\N	\N	\N
41	08069CRNYS500SH	\N	\N	\N
42	07457FLTRC1NORT	\N	\N	\N
43	0751WDVNCD1TAFT	\N	\N	\N
44	07936RYLLBMERRY	\N	\N	\N
44	08862WTCCR1000C	\N	\N	\N
44	08863HTCCRKINGG	\N	\N	\N
45	08701CHRCH800AI	\N	\N	\N
46	08362VNLNDNEWPE	\N	\N	\N
47	07032SWWST115JA	\N	\N	\N
48	08088SFTYK123RE	\N	\N	\N
49	08066CPLYRMANTU	\N	\N	\N
49	08066RPRDCBILLI	\N	\N	\N
5	07083NTRNT2270M	\N	\N	\N
50	08014CSTMB210HI	\N	\N	\N
51	08016CMBRLCUMBE	\N	\N	\N
52	07105DLTMR26BLA	\N	\N	\N
53	07058DCRNC5BADE	\N	\N	\N
54	07823HFFMN206RO	\N	\N	\N
55	0703WDPNTD14PAR	\N	\N	\N
55	08023DPNTCRT130	\N	\N	\N
55	08859DPNTPCHEES	\N	\N	\N
56	07036CGNTCRAILR	\N	\N	\N
57	07740WHLCK273BR	\N	\N	\N
58	07304DNLPR400CL	\N	\N	\N
59	08052CVCSP2980R	\N	\N	\N
6	07801HWMTCROYST	\N	\N	\N
60	08086GRLCK700MI	\N	\N	\N
61	08088CLNLC78CAR	\N	\N	\N
62	08701LKWDC123EN	\N	\N	\N
63	07014TTVNC100KI	\N	\N	\N
64	08066MBLLC1001B	\N	\N	\N
64	08818MBLCHRT27A	\N	\N	\N
65	08817PDBSN54KEL	\N	\N	\N
66	07410FSHRS1REAG	\N	\N	\N
66	08876FSHRS755RT	\N	\N	\N
67	07853FRZRNFAIRV	\N	\N	\N
68	07207PHLPS720SO	\N	\N	\N
69	07073GNRLF13MAN	\N	\N	\N
7	08312PCKCK838ND	\N	\N	\N
70	08859CLPNP970WA	\N	\N	\N
71	07656GNZYM1125P	\N	\N	\N
72	08332WHTNG220GS	\N	\N	\N
72	08360KMBLGCRYST	\N	\N	\N
73	07828GVDNF300WA	\N	\N	\N
73	07936FRTZSMERRY	\N	\N	\N
74	08077HGNSCRIVER	\N	\N	\N
75	08829GLSSM124WM	\N	\N	\N
76	08872NWJRSNORTH	\N	\N	\N
77	08759RGTHR35CLN	\N	\N	\N
78	07036GLFLL2600M	\N	\N	\N
78	08096GLFLL920KI	\N	\N	\N
79	07105HRCSP65EUC	\N	\N	\N
8	07201GDNVTNAVED	\N	\N	\N
80	07005RFLLC353PO	\N	\N	\N
81	07026NLCLR61RIV	\N	\N	\N
82	08512TWCVD32CMM	\N	\N	\N
83	08073NDCTT10IND	\N	\N	\N
84	07036XXNCH1400P	\N	\N	\N
85	08619THTRN2231E	\N	\N	\N
86	07074CRSTF100CA	\N	\N	\N
87	08057MCRRP1255N	\N	\N	\N
88	08876THCNNROUTE	\N	\N	\N
89	08066JHNSN2001A	\N	\N	\N
9	08077KLSTR1050T	\N	\N	\N
90	08071KTRNLRUTES	\N	\N	\N
91	07066KRNKC330CE	\N	\N	\N
92	08872CNFLD1SCRO	\N	\N	\N
93	07066PLYCH160TE	\N	\N	\N
94	07657KMBRM161RA	\N	\N	\N
95	07080TVCNC110PM	\N	\N	\N
95	07544KRKRC1EAST	\N	\N	\N
96	08103DMTRN1101S	\N	\N	\N
97	07032KHNCH86HAC	\N	\N	\N
98	07828L3CMM45CLA	\N	\N	\N
99	08057GRSPCBORTO	\N	\N	\N
\.

--
-- Data for Name: owners; Type: TABLE DATA; Schema: newsoap; Owner: postgres
--

COPY newsoap.owners (id, owner_name) FROM stdin;
0	3M CO
1	AARHUSKARLSHAMN USA
2	ACTAVIS INC.
3	ACUPOWDER INTERNATIONAL LLC
4	ACV MANUFACTURING
5	AKZO NOBEL NV
6	ALCOA INC
7	ALERIS ROLLED PRODUCTS INC.
8	ALLIED AVIATION HOLDING CO
9	ALTANA
10	ALZO INTERNATIONAL INC
11	AMERICAN AIR LIQUIDE HOLDINGS INC
12	AMES GOLDSMITH CORP
13	AMETEK
14	AMETEK INC
15	ANDERSEN CORP
16	ANHEUSER-BUSCH INBEV
17	API USA HOLDINGS INC
18	APPLICAD INC
19	ARCLIGHT ENERGY PARTNERS FUND III L.P.
20	ARDAGH HOLDINGS USA INC
21	ASHLAND INC
22	ASSOCIATED MATERIALS INC
23	AVANTOR PERFORMANCE MATERIALS
24	AXEON SPECIALTY PRODUCTS
25	AZ ELECTRONIC MATERIALS
26	BASF CORP
27	BERKSHIRE HATHAWAY
28	BERKSHIRE HATHAWAY INC
29	BERRY PLASTICS CORP
30	BIOMET INC
31	BLUEKNIGHT ENERGY PARTNERS LP
32	BODYCOTE PLC
33	BORDEN DAIRY CO
34	BP PRODUCTS N.A. INC
35	BRADDOCK METALLURGICAL
36	BRENNTAG N.A. INC
37	BRISTOL-MYERS SQUIBB CO
38	BWAY HOLDING CO
39	CALLAHAN CHEMICAL CO
40	CALPINE CORP
41	CALYPSO ENERGY HOLDINGS LLC
42	CAMFIL AB
43	CENTROME
44	CHEMTURA CORP
45	CHURCH & DWIGHT CO INC
46	CITY OF VINELAND
47	CLEAN EARTH INC
48	CLEAN HARBORS INC
49	COIM USA INC
50	CUSTOM BUILDING PRODUCTS INC
51	DEAN FOODS CO
52	DELEET MERCHANDISING CORP
53	DICAR INC
54	DSM HOLDING CO USA INC
55	E I DU PONT DE NEMOURS & CO
56	EAST COAST POWER LLC
57	EATON ELECTRIC HOLDINGS LLC
58	ELEMENTIS
59	EMERALD PERFORMANCE MATERIALS LLC
60	ENPRO INDUSTRIES INC
61	ESS GROUP INC
62	ESSENTIAL POWER LLC
63	EXELIS INC.
64	EXXON MOBIL CORP
65	FERRO CORP
66	FISHER SCIENTIFIC CO LLC
67	FRAZIER INDUSTRIAL CO
68	FREEPORT-MCMORAN INC
69	FXI INC
70	GENERAL ELECTRIC CO (GE CO)
71	GENZYME CORP
72	GERRESHEIMER GLASS INC
73	GIVAUDAN US INC
74	GKN N.A. INC
75	GLASSMAN HIGH VOLTAGE
76	GNA FINANCING INC.
77	GOLDSCHMIDT-THERMIT GROUP
78	GULF OIL LP
79	HERAEUS
80	HUBBELL INC
81	ICC INDUSTRIES
82	ILLINOIS TOOL WORKS INC
83	INDEL INC
84	INFINEUM USA L.P.
85	INGERSOLL-RAND CO
86	INOAC USA
87	JET PULVERIZER HOLDINGS INC
88	JOHNSON & JOHNSON INC
89	JOHNSON MATTHEY INC
90	K-TRON AMERICA
91	KARNAK CORP
92	KAYDON CORP
93	KERRY INC
94	KIMBER MFG INC
95	KNE HOLDINGS INC.
96	KOCH INDUSTRIES INC
97	KUEHNE CHEMICAL CO. INC.
98	L3 COMMUNICATIONS HOLDINGS CORP
99	LOCKHEED MARTIN CORP
100	LYONDELLBASELL INDUSTRIES
101	MANNINGTON MILLS INC
102	MANOPCO INC MANAGING PARTNER
103	MARCAL MANUFACTURING LLC
104	MARS INC
105	MASCO CORP
106	MAUSER CORP
107	MCWANE INC
108	MERCK & CO INC
109	MEXICHEM SPECIALTY RESINS INC
110	MICHAEL FOODS INC
111	MONDELEZ INTERNATIONAL INC.
112	MOTIVA ENTERPRISES LLC
113	MUNZING CHEMIE GMBH
114	MURALO CO INC
115	MW INDUSTRIES INC
116	MYCONE DENTAL
117	NA
118	NATIONAL MANUFACTURING CO INC
119	NATUREX SA
120	NCH CORP
121	NESTLE USA INC
122	NEW JERSEY GALVANIZING
123	NEW NGC INC
124	NEWCHEM INC
125	NEXEO SOLUTIONS HOLDINGS LLC
126	NIPRO GLASS
127	NITTA GELATIN INC
128	NITTO DENKO AMERICA INC
129	NOVARTIS US
130	OCCIDENTAL CHEMICAL HOLDING CORP
131	OKONITE CO INC
132	OLDCASTLE INC
133	OLDCASTLE MATERIALS INC
134	OWENS CORNING
135	PAMARCO INC
136	PBF ENERGY
137	PDV AMERICA INC
138	PENN COLOR INC
139	PHILLIPS 66
140	PICUT INDUSTRIES
141	PILOT CHEMICAL CORP
142	PMC INC
143	POLYMER ADDITIVES HOLDINGS INC
144	POLYMER TECHNOLOGIES INC
145	POLYONE CORP
146	POLYURETHANE CORP OF AMERICA
147	PPI-TIIME ZERO INC
148	PQ HOLDINGS INC.
149	PRECISION CASTPARTS CORP
150	PRIDE SOLVENTS & CHEMICAL CO
151	PRUDENT PUBLISHING CO
152	PSEG POWER LLC
153	PUBLIC SERVICE ENTERPRISE GROUP
154	RALPH CLAYTON & SONS
155	RB MANUFACTURING LLC
156	ROCHE HOLDINGS INC
157	ROCKLAND CAPITAL INVESTMENTS
158	ROLLER BEARING CO OF AMERICA
159	ROYAL ADHESIVES & SEALANTS LLC
160	RPM CONSUMER HOLDING CO
161	RPM INC
162	RPM PERFORMANCE COATINGS GROUP INC.
163	SAFAS CORP
164	SAFETY-KLEEN HOLDCO INC
165	SAINT-GOBAIN CORP
166	SCHWEITZER-MAUDUIT INTERNATIONAL INC
167	SIEGFRIED USA HOLDING INC.
168	SIKA CORP
169	SILGAN HOLDINGS INC
170	SOLVAY SPECIALTY POLYMERS USA LLC
171	SPECTRUM LABORATORY PRODUCTS
172	ST JUDE MEDICAL INC
173	STEPAN CO
174	STRYKER CORP
175	SUD CHEMIE/ SABIC INDUSTRIES
176	SUNOCO PARTNERS MARKETING & TERMINALS LP
177	TAKASAGO INTERNATIONAL CORP USA
178	TDK
179	TECHNOLOGY DYNAMICS INC
180	TEKNI-PLEX INC
181	TESSLER & WEISS/PREMESCO INC
182	THE DOW CHEMICAL CO
183	THE PROCTER & GAMBLE CO
184	THOMAS & BETTS CORP
185	THOMAS & SKINNER INC
186	THYSSENKRUPP STEEL N.A. INC
187	TOTAL HOLDINGS USA INC
188	TRANSISTOR DEVICES INC
189	TROY CORP
190	UCI-FRAM GROUP
191	UNITED CAPITAL CORP
192	US CONCRETE INC
193	US DEPARTMENT OF DEFENSE
194	US DEPARTMENT OF JUSTICE
195	USG CORP
196	VANGUARD HOLDINGS
197	VEOLIA ENVIRONMENTAL SERVICES
198	VIKING YACHT CO INC
199	VIRGINIA AMERICAN INDUSTRIES INC
200	VOIGT & SCHWEITZER LLC
201	VON ROLL USA INC
202	W R GRACE & CO
203	WAKEFERN FOOD CORP
204	WELDON MATERIALS INC
205	WITTE-CHASE ENVIRONMENTAL RESOURCES
206	WWF OPERATING CO
207	ZIMMER HOLDINGS INC
\.

--
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
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: newsoap; Owner: postgres
--

COPY posts (id, title, body, created, modified) FROM stdin;
11	Test	Test	2014-08-06	2014-08-06
1	test	test	2014-08-06	2014-08-06
2	Testing	Test	2014-09-04	2014-09-04
\.


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('posts_id_seq', 2, true);


--
-- Data for Name: regulates; Type: TABLE DATA; Schema: newsoap; Owner: postgres
--

COPY regulates (bill_id, cas_no) FROM stdin;
\.


--
-- Data for Name: sources; Type: TABLE DATA; Schema: newsoap; Owner: postgres
--

COPY sources (source_id, source_name, trusted_or_user) FROM stdin;
\.


--
-- Data for Name: standards; Type: TABLE DATA; Schema: newsoap; Owner: postgres
--

COPY standards (standard_no, cas_no, state_soil, federal_soil, state_water, federal_water) FROM stdin;
\.


--
-- Data for Name: uploads; Type: TABLE DATA; Schema: newsoap; Owner: postgres
--

COPY uploads (name, date) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: newsoap; Owner: postgres
--

COPY users (id, username, password, created, modified, role, facebook_id, uid) FROM stdin;
111	Duchesd1	2acf80a85ddc0cd3ffb68d8885fb0487cda32c09	2014-07-28	2014-07-28	N	N	N
112	smp	96e04f5c1e86366a0244dc578d897b0af5021c87	2014-07-28	2014-07-28	N	N	N
114	duchesd1	8ee56a3fe11b07e94a9712d2de920c980633e9d7	2014-08-06	2014-08-06	N	N	N
116	Derek Duchesne	dae985ed19d29056586538ece068c05466e71c12	2014-08-07	2014-08-07	user	684374648322536	N
117	Kpearson	0b130baa679694ea04e2ad5d3fbd6268a6ad513d	2014-08-13	2014-08-13	N	N	N
118	letsTryIt	e0734a46c0a73d5103c8300ae87ecfba57002d21	2014-09-01	2014-09-01	N	N	N
119	evansk6	dfc740891b63e1d700674ef44e4994d5b4c0c2bb	2014-09-02	2014-09-02	N	N	N
120	letstryit	e0734a46c0a73d5103c8300ae87ecfba57002d21	2014-09-02	2014-09-02	N	N	N
121	letstryit	0204adbee2c75db14fcf343b43df8ecb5fb63ab8	2014-09-02	2014-09-02	N	N	N
122	evansk6	dfc740891b63e1d700674ef44e4994d5b4c0c2bb	2014-09-02	2014-09-02	N	N	N
123	evansk6	dfc740891b63e1d700674ef44e4994d5b4c0c2bb	2014-09-02	2014-09-02	N	N	N
124	evansk6	dfc740891b63e1d700674ef44e4994d5b4c0c2bb	2014-09-02	2014-09-02	N	N	N
125	letstryit	e0734a46c0a73d5103c8300ae87ecfba57002d21	2014-09-04	2014-09-04	N	N	N
126	hola	8ae2cf1a4d3b8cb7129987f6ebbaae54d58ac22e	2014-09-04	2014-09-04	N	N	N
127	hola	7752d90e4d73ebb6d90835097b66eefd0101bee3	2014-09-04	2014-09-04	N	N	N
128	hola	8ae2cf1a4d3b8cb7129987f6ebbaae54d58ac22e	2014-09-04	2014-09-04	N	N	N
129	hola	8ae2cf1a4d3b8cb7129987f6ebbaae54d58ac22e	2014-09-04	2014-09-04	N	N	N
130	hola	8ae2cf1a4d3b8cb7129987f6ebbaae54d58ac22e	2014-09-04	2014-09-04	N	N	N
131	hola	403977e5a3c3ebef2ba30796cd59cd326ea81550	2014-09-04	2014-09-04	N	N	N
132	hola	79921993ba94fbab69586ad129b770b136ffb177	2014-09-04	2014-09-04	N	N	N
133	hola	486703c92d60682db8e3599aba7513ec4dc757d2	2014-09-04	2014-09-04	N	N	N
134	pulimoodisdope	b24c06363d81465ea526df73a42ec4e69f385e86	2014-09-04	2014-09-04	N	N	N
135	pulimoodisdope	b24c06363d81465ea526df73a42ec4e69f385e86	2014-09-04	2014-09-04	N	N	N
136	hola	8ae2cf1a4d3b8cb7129987f6ebbaae54d58ac22e	2014-09-08	2014-09-08	N	N	N
137	hola	8ae2cf1a4d3b8cb7129987f6ebbaae54d58ac22e	2014-09-08	2014-09-08	N	N	N
138	hola	8ae2cf1a4d3b8cb7129987f6ebbaae54d58ac22e	2014-09-08	2014-09-08	N	N	N
139	hola	8ae2cf1a4d3b8cb7129987f6ebbaae54d58ac22e	2014-09-08	2014-09-08	N	N	N
140	hola	8ae2cf1a4d3b8cb7129987f6ebbaae54d58ac22e	2014-09-08	2014-09-08	N	N	N
141	gouldn1	91947e507be31b13b04c747f5f67a8882a36100b	2014-09-11	2014-09-11	N	N	N
142	gouldnathan0	91947e507be31b13b04c747f5f67a8882a36100b	2014-09-11	2014-09-11	N	N	N
143	clewsa1	d974418e9a9026c820fe5bfe52e7a4a7da3c28ca	2014-09-25	2014-09-25	N	N	N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: newsoap; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Data for Name: votes_on; Type: TABLE DATA; Schema: newsoap; Owner: postgres
--

COPY votes_on (bill_id, congress_id, vote_type, date_voted_on) FROM stdin;
\.


--
-- Name: Bill_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bills
    ADD CONSTRAINT "Bill_pkey" PRIMARY KEY (bill_id);


--
-- Name: Brownfield_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY facilities
    ADD CONSTRAINT "Brownfield_pkey" PRIMARY KEY (id);


--
-- Name: Chemical_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY chemicals
    ADD CONSTRAINT "Chemical_pkey" PRIMARY KEY (id);


--
-- Name: Contains_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contains
    ADD CONSTRAINT "Contains_pkey" PRIMARY KEY (facility_id, chemical_id);


--
-- Name: Contributed_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contributed
    ADD CONSTRAINT "Contributed_pkey" PRIMARY KEY (facility_id);


--
-- Name: Location_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT "Location_pkey" PRIMARY KEY (id);


--
-- Name: NNData_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY nn_data
    ADD CONSTRAINT "NNData_pkey" PRIMARY KEY (facility_id);


--
-- Name: Owned_By_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY owned_by
    ADD CONSTRAINT "Owned_By_pkey" PRIMARY KEY (owner_id, facility_id);


--
-- Name: Owner_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY owners
    ADD CONSTRAINT "Owner_pkey" PRIMARY KEY (id);


--
-- Name: Politician_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY politicians
    ADD CONSTRAINT "Politician_pkey" PRIMARY KEY (congress_id);


--
-- Name: Regulates_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY regulates
    ADD CONSTRAINT "Regulates_pkey" PRIMARY KEY (bill_id, cas_no);


--
-- Name: Source_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sources
    ADD CONSTRAINT "Source_pkey" PRIMARY KEY (source_id);


--
-- Name: Standards_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY standards
    ADD CONSTRAINT "Standards_pkey" PRIMARY KEY (standard_no);


--
-- Name: Votes_On_pkey; Type: CONSTRAINT; Schema: newsoap; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY votes_on
    ADD CONSTRAINT "Votes_On_pkey" PRIMARY KEY (bill_id, congress_id);


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
    ADD CONSTRAINT "Brownfield_Address_fkey" FOREIGN KEY (location_id) REFERENCES locations(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Contains_Brownfield_ID_fkey; Type: FK CONSTRAINT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY contains
    ADD CONSTRAINT "Contains_Brownfield_ID_fkey" FOREIGN KEY (facility_id) REFERENCES facilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Contains_Cas_No_fkey; Type: FK CONSTRAINT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY contains
    ADD CONSTRAINT "Contains_Cas_No_fkey" FOREIGN KEY (chemical_id) REFERENCES chemicals(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Contributed_Brownfield_ID_fkey; Type: FK CONSTRAINT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY contributed
    ADD CONSTRAINT "Contributed_Brownfield_ID_fkey" FOREIGN KEY (facility_id) REFERENCES facilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Contributed_Source_ID_fkey; Type: FK CONSTRAINT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY contributed
    ADD CONSTRAINT "Contributed_Source_ID_fkey" FOREIGN KEY (source_id) REFERENCES sources(source_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: NNData_NN_ID_fkey; Type: FK CONSTRAINT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY nn_data
    ADD CONSTRAINT "NNData_NN_ID_fkey" FOREIGN KEY (facility_id) REFERENCES facilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Owned_By_Brownfield_ID_fkey; Type: FK CONSTRAINT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY owned_by
    ADD CONSTRAINT "Owned_By_Brownfield_ID_fkey" FOREIGN KEY (facility_id) REFERENCES facilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Owned_By_Owner_ID_fkey; Type: FK CONSTRAINT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY owned_by
    ADD CONSTRAINT "Owned_By_Owner_ID_fkey" FOREIGN KEY (owner_id) REFERENCES owners(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Regulates_Bill_ID_fkey; Type: FK CONSTRAINT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY regulates
    ADD CONSTRAINT "Regulates_Bill_ID_fkey" FOREIGN KEY (bill_id) REFERENCES bills(bill_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Regulates_Cas_No_fkey; Type: FK CONSTRAINT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY regulates
    ADD CONSTRAINT "Regulates_Cas_No_fkey" FOREIGN KEY (cas_no) REFERENCES chemicals(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Votes_On_Bill_ID_fkey; Type: FK CONSTRAINT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY votes_on
    ADD CONSTRAINT "Votes_On_Bill_ID_fkey" FOREIGN KEY (bill_id) REFERENCES bills(bill_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Votes_On_Congress_ID_fkey; Type: FK CONSTRAINT; Schema: newsoap; Owner: postgres
--

ALTER TABLE ONLY votes_on
    ADD CONSTRAINT "Votes_On_Congress_ID_fkey" FOREIGN KEY (congress_id) REFERENCES politicians(congress_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
