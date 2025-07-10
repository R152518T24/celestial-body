--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    description text,
    number_of_arms integer,
    number_of_stars integer,
    age_in_millions_of_years numeric,
    distance_from_earth numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
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
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    description text,
    has_life boolean DEFAULT false NOT NULL,
    is_spherical boolean DEFAULT true,
    diameter_km integer,
    orbit_duration_days integer,
    age_in_millions_of_years numeric,
    distance_from_earth numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
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
-- Name: observation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.observation (
    observation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    target_type character varying(20) NOT NULL,
    target_id integer NOT NULL,
    successful boolean NOT NULL,
    year integer NOT NULL,
    observed_by text DEFAULT 'Unknown'::text NOT NULL
);


ALTER TABLE public.observation OWNER TO freecodecamp;

--
-- Name: observation_observation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.observation_observation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observation_observation_id_seq OWNER TO freecodecamp;

--
-- Name: observation_observation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.observation_observation_id_seq OWNED BY public.observation.observation_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(50) NOT NULL,
    description text,
    has_life boolean DEFAULT true,
    is_spherical boolean DEFAULT true,
    number_of_moons integer,
    orbital_period_days integer,
    age_in_millions_of_years numeric,
    distance_from_earth numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
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
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    type character varying(50) NOT NULL,
    description text,
    temperature integer,
    number_of_planets integer,
    age_in_millions_of_years numeric,
    distance_from_earth numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
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
-- Name: observation observation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation ALTER COLUMN observation_id SET DEFAULT nextval('public.observation_observation_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'Our home galaxy', 4, 100000000, 13600, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'Nearest major galaxy', 2, 1000000000, 10000, 2537000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'Small spiral galaxy', 2, 40000000, 12000, 3000000);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', 'Satellite galaxy of the Milky Way', 0, 30000000, 13000, 163000);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Irregular', 'Another Milky Way satellite', 0, 25000000, 13000, 200000);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', 'Interacting with another galaxy', 3, 85000000, 13000, 23000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1, 'Earth’s moon', false, true, 3474, 27, 4500, 0);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 1, 'One of Mars’ moons', false, false, 22, 0, 4500, 0.5);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 1, 'Another Mars moon', false, true, 12, 1, 4500, 0.5);
INSERT INTO public.moon VALUES (4, 'Europa', 3, 1, 'Icy moon of Jupiter', false, true, 3122, 4, 4500, 0.8);
INSERT INTO public.moon VALUES (5, 'Ganymede', 3, 1, 'Largest moon in solar system', false, true, 5268, 7, 4500, 0.8);
INSERT INTO public.moon VALUES (6, 'Callisto', 3, 1, 'Heavily cratered moon', false, true, 4820, 17, 4500, 0.8);
INSERT INTO public.moon VALUES (7, 'Titan', 12, 1, 'Moon of Saturn with atmosphere', false, true, 5150, 16, 4500, 0.9);
INSERT INTO public.moon VALUES (8, 'Enceladus', 12, 1, 'Icy geysers', false, true, 500, 1, 4500, 0.9);
INSERT INTO public.moon VALUES (9, 'Mimas', 12, 1, 'Looks like Death Star', false, true, 396, 1, 4500, 0.9);
INSERT INTO public.moon VALUES (10, 'Triton', 10, 6, 'Retrograde orbit moon', false, true, 2706, 6, 7000, 163000);
INSERT INTO public.moon VALUES (11, 'MagMoon1', 9, 6, 'Magellanic moon 1', false, true, 1230, 10, 7000, 163000);
INSERT INTO public.moon VALUES (12, 'MagMoon2', 9, 6, 'Magellanic moon 2', false, true, 900, 11, 7000, 163000);
INSERT INTO public.moon VALUES (13, 'MagMoon3', 11, 6, 'Moon of gas giant M3', false, true, 2500, 12, 7000, 163000);
INSERT INTO public.moon VALUES (14, 'AndroMoon1', 6, 4, 'Andromeda moon A1', false, true, 1500, 8, 3000, 2537000);
INSERT INTO public.moon VALUES (15, 'AndroMoon2', 6, 4, 'Andromeda moon A2', false, true, 1000, 9, 3000, 2537000);
INSERT INTO public.moon VALUES (16, 'AndroMoon3', 7, 4, 'Andromeda moon B1', false, true, 800, 4, 2800, 2537000);
INSERT INTO public.moon VALUES (17, 'ProxMoon', 5, 3, 'Theoretical moon of Proxima b', false, true, 100, 3, 4500, 42000);
INSERT INTO public.moon VALUES (18, 'AlphaMoon', 4, 2, 'Moon of Alpha Centauri Bb', false, true, 400, 5, 5000, 43000);
INSERT INTO public.moon VALUES (19, 'WhirlMoon1', 8, 5, 'Moon of Whirlpool planet', false, true, 1200, 6, 10000, 23000000);
INSERT INTO public.moon VALUES (20, 'WhirlMoon2', 8, 5, 'Another moon of Whirlpool', false, true, 1100, 7, 10000, 23000000);


--
-- Data for Name: observation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.observation VALUES (5, 'Apollo 11', 'moon', 1, true, 1969, 'NASA');
INSERT INTO public.observation VALUES (6, 'Voyager 1 Flyby', 'planet', 3, true, 1979, 'NASA');
INSERT INTO public.observation VALUES (7, 'Hubble Deep Field', 'galaxy', 1, true, 1995, 'NASA / ESA');
INSERT INTO public.observation VALUES (8, 'James Webb Survey', 'galaxy', 2, true, 2022, 'NASA / ESA / CSA');
INSERT INTO public.observation VALUES (9, 'New Horizons Pluto', 'planet', 12, true, 2015, 'NASA');
INSERT INTO public.observation VALUES (10, 'Kepler Planet Hunt', 'star', 4, true, 2009, 'NASA');
INSERT INTO public.observation VALUES (11, 'Cassini-Huygens', 'planet', 12, true, 2004, 'NASA / ESA / ASI');
INSERT INTO public.observation VALUES (12, 'Luna 2 Impact', 'moon', 1, true, 1959, 'Soviet Union');
INSERT INTO public.observation VALUES (13, 'Gaia Survey', 'star', 2, true, 2013, 'ESA');
INSERT INTO public.observation VALUES (14, 'Galileo Probe', 'planet', 3, true, 1995, 'NASA');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', 'Our home planet', true, true, 1, 365, 4500, 0);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', 'Red planet', false, true, 2, 687, 4500, 0.5);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 'Gas Giant', 'Largest planet', false, true, 79, 4333, 4500, 0.8);
INSERT INTO public.planet VALUES (4, 'Alpha Centauri Bb', 2, 'Terrestrial', 'Exoplanet near Alpha Centauri', false, true, 0, 3, 5000, 43000);
INSERT INTO public.planet VALUES (5, 'Proxima b', 3, 'Terrestrial', 'Closest exoplanet', false, true, 0, 11, 4500, 42000);
INSERT INTO public.planet VALUES (6, 'Andromeda Planet A', 4, 'Gas Giant', 'Large planet in Andromeda', false, true, 4, 600, 3000, 2537000);
INSERT INTO public.planet VALUES (7, 'Andromeda Planet B', 4, 'Terrestrial', 'Second planet', false, true, 2, 300, 2800, 2537000);
INSERT INTO public.planet VALUES (8, 'Whirlpool Planet Q', 5, 'Gas Giant', 'Lonely giant in Whirlpool', false, true, 5, 900, 10000, 23000000);
INSERT INTO public.planet VALUES (9, 'Magellanic Planet M1', 6, 'Ice Giant', 'Distant cold planet', false, true, 3, 1000, 7000, 163000);
INSERT INTO public.planet VALUES (10, 'Magellanic Planet M2', 6, 'Terrestrial', 'Habitable candidate', false, true, 1, 365, 7000, 163000);
INSERT INTO public.planet VALUES (11, 'Magellanic Planet M3', 6, 'Gas Giant', 'Third planet of the system', false, true, 10, 800, 7000, 163000);
INSERT INTO public.planet VALUES (12, 'Saturn', 1, 'Gas Giant', 'Ringed giant', false, true, 83, 10759, 4500, 0.9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type Main Sequence', 'Our solar system’s star', 5778, 8, 4600, 0);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 'G-type', 'Closest solar-type star', 5790, 2, 5000, 43000);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 'Red Dwarf', 'Closest known star', 3042, 1, 4500, 42000);
INSERT INTO public.star VALUES (4, 'Andromeda Star A', 2, 'Blue Giant', 'Bright star in Andromeda', 15000, 4, 2000, 2537000);
INSERT INTO public.star VALUES (5, 'Whirlpool Star X', 6, 'White Dwarf', 'Old star in Whirlpool Galaxy', 8000, 1, 10000, 23000000);
INSERT INTO public.star VALUES (6, 'Magellanic Star Y', 4, 'Red Giant', 'Bright giant in LMC', 3000, 3, 7000, 163000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: observation_observation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.observation_observation_id_seq', 14, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_planet_id_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_name_key UNIQUE (planet_id, name);


--
-- Name: observation observation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT observation_name_key UNIQUE (name);


--
-- Name: observation observation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT observation_pkey PRIMARY KEY (observation_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

