--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    speed integer NOT NULL,
    perihelion_year integer NOT NULL,
    is_periodic boolean NOT NULL,
    is_visible_from_earth boolean NOT NULL,
    tail_length numeric(10,2)
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type text NOT NULL,
    age_in_millions integer NOT NULL,
    number_of_stars integer NOT NULL,
    has_life boolean NOT NULL,
    is_active_nucleus boolean NOT NULL,
    size_numeric numeric(10,2)
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
    diameter integer NOT NULL,
    crater_count integer NOT NULL,
    is_spherical boolean NOT NULL,
    has_atmosphere boolean NOT NULL,
    composition text
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    population integer NOT NULL,
    orbital_position integer NOT NULL,
    has_water boolean NOT NULL,
    is_habitable boolean NOT NULL,
    radius numeric(10,2)
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
    temperature integer NOT NULL,
    luminosity_class integer NOT NULL,
    is_active boolean NOT NULL,
    is_main_sequence boolean NOT NULL,
    mass numeric(10,2)
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 70000, 1986, true, true, 24000.50);
INSERT INTO public.comet VALUES (2, 'Encke', 60000, 2013, true, false, 15000.20);
INSERT INTO public.comet VALUES (3, 'Hyakutake', 80000, 1996, false, true, 50000.00);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 200000000, true, true, 100000.50);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 14000, 300000000, false, false, 120000.75);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12000, 40000000, false, false, 60000.10);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 10000, 150000000, false, true, 76000.40);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 13000, 80000000, false, false, 50000.00);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 11000, 250000000, false, true, 90000.90);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, 1000, true, false, 'Rock');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, 300, false, false, 'Rock');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, 150, false, false, 'Rock');
INSERT INTO public.moon VALUES (4, 'Aphrodite', 3, 1000, 200, true, true, 'Sulfur');
INSERT INTO public.moon VALUES (5, 'Hermes', 4, 500, 80, true, false, 'Iron');
INSERT INTO public.moon VALUES (6, 'Prox-1', 5, 3000, 400, true, true, 'Ice');
INSERT INTO public.moon VALUES (7, 'Prox-2', 5, 1500, 250, true, false, 'Rock');
INSERT INTO public.moon VALUES (8, 'Sirius-M1', 6, 2000, 300, true, false, 'Rock');
INSERT INTO public.moon VALUES (9, 'Sirius-M2', 6, 1800, 280, true, false, 'Ice');
INSERT INTO public.moon VALUES (10, 'Betel-M1', 7, 2500, 350, true, false, 'Gas');
INSERT INTO public.moon VALUES (11, 'Betel-M2', 7, 2300, 320, true, false, 'Rock');
INSERT INTO public.moon VALUES (12, 'Betel-M3', 8, 2100, 310, true, false, 'Ice');
INSERT INTO public.moon VALUES (13, 'Rigel-M1', 9, 3000, 500, true, false, 'Rock');
INSERT INTO public.moon VALUES (14, 'Rigel-M2', 9, 2800, 450, true, false, 'Ice');
INSERT INTO public.moon VALUES (15, 'Rigel-M3', 10, 2600, 430, true, false, 'Rock');
INSERT INTO public.moon VALUES (16, 'Vega-M1', 11, 1500, 200, true, false, 'Ice');
INSERT INTO public.moon VALUES (17, 'Vega-M2', 11, 1400, 190, true, false, 'Rock');
INSERT INTO public.moon VALUES (18, 'Altair-M1', 12, 1200, 160, true, false, 'Rock');
INSERT INTO public.moon VALUES (19, 'Altair-M2', 12, 1100, 140, true, false, 'Ice');
INSERT INTO public.moon VALUES (20, 'Altair-M3', 12, 900, 120, false, false, 'Rock');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 8000, 3, true, true, 6371.00);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 0, 4, false, false, 3389.50);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 0, 2, false, false, 6051.80);
INSERT INTO public.planet VALUES (4, 'Mercury', 1, 0, 1, false, false, 2439.70);
INSERT INTO public.planet VALUES (5, 'Proxima b', 2, 0, 1, true, false, 7000.00);
INSERT INTO public.planet VALUES (6, 'Sirius c', 2, 0, 2, false, false, 5000.00);
INSERT INTO public.planet VALUES (7, 'Betel-1', 3, 0, 1, false, false, 9000.00);
INSERT INTO public.planet VALUES (8, 'Betel-2', 3, 0, 2, false, false, 8500.00);
INSERT INTO public.planet VALUES (9, 'Rigel-1', 4, 0, 1, true, false, 10000.00);
INSERT INTO public.planet VALUES (10, 'Rigel-2', 4, 0, 2, false, false, 9500.00);
INSERT INTO public.planet VALUES (11, 'Vega-1', 5, 0, 1, true, false, 7000.00);
INSERT INTO public.planet VALUES (12, 'Altair-1', 6, 0, 1, true, false, 6000.00);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5500, 5, true, true, 1.00);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 9940, 3, true, true, 2.10);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 3500, 1, false, false, 20.00);
INSERT INTO public.star VALUES (4, 'Rigel', 2, 11000, 1, true, true, 18.00);
INSERT INTO public.star VALUES (5, 'Vega', 2, 9600, 4, true, true, 2.20);
INSERT INTO public.star VALUES (6, 'Altair', 3, 7550, 5, true, true, 1.80);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


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

