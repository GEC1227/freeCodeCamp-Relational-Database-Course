--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id bigint NOT NULL,
    name character varying(100),
    age_in_gigaannum numeric NOT NULL,
    size_in_lightyears numeric,
    number_of_stars numeric,
    description text,
    year_discovered integer,
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id bigint NOT NULL,
    name character varying(100),
    age_in_gigaannum integer NOT NULL,
    size_in_miles numeric,
    description text,
    planet_id bigint,
    year_discovered integer,
    has_life boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id bigint NOT NULL,
    name character varying(100),
    age_in_gigaannum integer NOT NULL,
    size_in_miles numeric,
    number_of_moons integer,
    has_life boolean,
    description text,
    star_id bigint,
    year_discovered integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_and_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_and_moon (
    name character varying(100) NOT NULL,
    popularity integer,
    obscurity integer,
    planet_and_moon_id integer NOT NULL
);


ALTER TABLE public.planet_and_moon OWNER TO freecodecamp;

--
-- Name: planet_and_moon_planet_and_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_and_moon_planet_and_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_and_moon_planet_and_moon_id_seq OWNER TO freecodecamp;

--
-- Name: planet_and_moon_planet_and_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_and_moon_planet_and_moon_id_seq OWNED BY public.planet_and_moon.planet_and_moon_id;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id bigint NOT NULL,
    name character varying(100),
    age_in_gigaannum numeric NOT NULL,
    size_in_miles numeric,
    number_of_planets integer,
    description text,
    galaxy_id bigint,
    year_discovered integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_and_moon planet_and_moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_and_moon ALTER COLUMN planet_and_moon_id SET DEFAULT nextval('public.planet_and_moon_planet_and_moon_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 10, 220000, 1000, 'Closest galaxy to the Milky Way. Named after the wife of Perseus, a character from Greek mythology', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Black Eye Galaxy', 10, 54000, 100, 'A relatively small galaxy discovered by Edward Piggott in 1779. THe gas from the outer regions of the galaxy rotate in the opposite direction of the gas from the inner regions. This is possibly due to a merging of two galaxies more than a billion years ago', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 10, 48.5, NULL, 'A radio galaxy with a massive blackhole at its center', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Messier 81', 10, 90000, 250, 'A spiral galaxy 12 million light-years away', NULL, NULL);
INSERT INTO public.galaxy VALUES (7, 'Pinwheel Galaxy', 10, 170000, 1000, 'A face-on spiral galaxy 21 million light-years from earth', NULL, NULL);
INSERT INTO public.galaxy VALUES (1, 'Milkyway Galaxy', 13.6, 100000, 400, 'Home of our solar system. Named after the hazy band of gas and dust it illuminates', NULL, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 5, 2070, NULL, 1, NULL, false);
INSERT INTO public.moon VALUES (3, 'Callisto', 5, 4821, NULL, 6, 1610, NULL);
INSERT INTO public.moon VALUES (2, 'IO', 5, 1132, NULL, 6, 1610, NULL);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, 1635, NULL, 6, 1610, NULL);
INSERT INTO public.moon VALUES (7, 'Europa', 5, NULL, NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, NULL, NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Dione', 5, NULL, NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Enceladus', 5, NULL, NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Hyperion', 5, NULL, NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Lapetus', 5, NULL, NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Mimas', 5, NULL, NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Phoebe', 5, NULL, NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Rhea', 5, NULL, NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Tethys', 5, NULL, NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Titan', 5, NULL, NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Nereid', 5, NULL, NULL, 8, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Triton', 5, NULL, NULL, 8, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Metis', 5, NULL, NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Thebe', 5, NULL, NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Andrastea', 5, NULL, NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'Leda', 5, NULL, NULL, 6, NULL, NULL);
INSERT INTO public.moon VALUES (24, 'Ersa', 5, NULL, NULL, 6, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 5, 8000, 1, true, 'Our small home in a VERY big neighborhoood', NULL, NULL);
INSERT INTO public.planet VALUES (2, 'Mercury', 5, 3030, 0, false, 'If you''re on Mercury, today''s forecast is gonna be a hot one', NULL, 3000);
INSERT INTO public.planet VALUES (4, 'Mars', 5, 2106, 0, false, NULL, NULL, 1610);
INSERT INTO public.planet VALUES (3, 'Venus', 5, 3760, 0, false, NULL, NULL, 1581);
INSERT INTO public.planet VALUES (8, 'Neptune', 5, 15299, 14, false, NULL, NULL, 1846);
INSERT INTO public.planet VALUES (6, 'Jupiter', 5, 43411, 79, false, NULL, NULL, 1610);
INSERT INTO public.planet VALUES (5, 'Saturn', 5, 36184, 82, false, NULL, NULL, 1610);
INSERT INTO public.planet VALUES (7, 'Uranus', 5, 15759, 27, false, NULL, NULL, 1781);
INSERT INTO public.planet VALUES (9, 'Teagarden''s Star b', 8, 8000, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 5, 8000, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'TOI 700 d', 2, 8000, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'K2-72-e', 0, 8000, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: planet_and_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_and_moon VALUES ('Rhea', NULL, NULL, 1);
INSERT INTO public.planet_and_moon VALUES ('TOI 700 d', NULL, NULL, 2);
INSERT INTO public.planet_and_moon VALUES ('Amalthea', NULL, NULL, 3);
INSERT INTO public.planet_and_moon VALUES ('Thebe', NULL, NULL, 4);
INSERT INTO public.planet_and_moon VALUES ('Mercury', NULL, NULL, 5);
INSERT INTO public.planet_and_moon VALUES ('Europa', NULL, NULL, 6);
INSERT INTO public.planet_and_moon VALUES ('Dione', NULL, NULL, 7);
INSERT INTO public.planet_and_moon VALUES ('Nereid', NULL, NULL, 8);
INSERT INTO public.planet_and_moon VALUES ('Neptune', NULL, NULL, 9);
INSERT INTO public.planet_and_moon VALUES ('Mimas', NULL, NULL, 10);
INSERT INTO public.planet_and_moon VALUES ('Metis', NULL, NULL, 11);
INSERT INTO public.planet_and_moon VALUES ('Callisto', NULL, NULL, 12);
INSERT INTO public.planet_and_moon VALUES ('Enceladus', NULL, NULL, 13);
INSERT INTO public.planet_and_moon VALUES ('Titan', NULL, NULL, 14);
INSERT INTO public.planet_and_moon VALUES ('Triton', NULL, NULL, 15);
INSERT INTO public.planet_and_moon VALUES ('Venus', NULL, NULL, 16);
INSERT INTO public.planet_and_moon VALUES ('Ersa', NULL, NULL, 17);
INSERT INTO public.planet_and_moon VALUES ('Ganymede', NULL, NULL, 18);
INSERT INTO public.planet_and_moon VALUES ('Tethys', NULL, NULL, 19);
INSERT INTO public.planet_and_moon VALUES ('Lapetus', NULL, NULL, 20);
INSERT INTO public.planet_and_moon VALUES ('Hyperion', NULL, NULL, 21);
INSERT INTO public.planet_and_moon VALUES ('Andrastea', NULL, NULL, 22);
INSERT INTO public.planet_and_moon VALUES ('IO', NULL, NULL, 23);
INSERT INTO public.planet_and_moon VALUES ('Proxima Centauri b', NULL, NULL, 24);
INSERT INTO public.planet_and_moon VALUES ('Teagarden''s Star b', NULL, NULL, 25);
INSERT INTO public.planet_and_moon VALUES ('Phoebe', NULL, NULL, 26);
INSERT INTO public.planet_and_moon VALUES ('Uranus', NULL, NULL, 27);
INSERT INTO public.planet_and_moon VALUES ('Earth', 10, NULL, 28);
INSERT INTO public.planet_and_moon VALUES ('Moon', 10, NULL, 29);
INSERT INTO public.planet_and_moon VALUES ('Mars', 9, NULL, 30);
INSERT INTO public.planet_and_moon VALUES ('Jupiter', 8, NULL, 31);
INSERT INTO public.planet_and_moon VALUES ('Saturn', 8, NULL, 32);
INSERT INTO public.planet_and_moon VALUES ('K2-72-e', NULL, 10, 33);
INSERT INTO public.planet_and_moon VALUES ('Leda', NULL, 10, 34);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4.5, 432376, 8, 'A yellow dwarf star located at the center of our solar system', NULL, NULL);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 0.00010, 509000000, 0, 'The tenth brightest star in the sky', NULL, NULL);
INSERT INTO public.star VALUES (4, 'HE 0437-5439', 0.0025, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Vega', 4.553, 1.02, 1, NULL, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Mira', 6.004, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (9, 'UY Scuti', 1, 738.35, NULL, NULL, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_and_moon_planet_and_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_and_moon_planet_and_moon_id_seq', 34, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: galaxy galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_and_moon planet_and_moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_and_moon
    ADD CONSTRAINT planet_and_moon_pkey PRIMARY KEY (planet_and_moon_id);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: planet_and_moon unique_planet_and_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_and_moon
    ADD CONSTRAINT unique_planet_and_moon_id UNIQUE (planet_and_moon_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: star galaxy_reference; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_reference FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_reference; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_reference FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_reference; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_reference FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

