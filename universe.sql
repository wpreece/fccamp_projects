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
    name character varying(20) NOT NULL,
    ggroup_id integer,
    distance_kpc numeric,
    magnitude double precision
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: ggroup; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.ggroup (
    ggroup_id integer NOT NULL,
    name character varying(20) NOT NULL,
    constellation character varying(20),
    members integer
);


ALTER TABLE public.ggroup OWNER TO freecodecamp;

--
-- Name: ggroup_ggroup_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.ggroup_ggroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ggroup_ggroup_id_seq OWNER TO freecodecamp;

--
-- Name: ggroup_ggroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.ggroup_ggroup_id_seq OWNED BY public.ggroup.ggroup_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    planet_id integer,
    diameter_km double precision,
    year_discovered integer,
    known_life boolean
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
    name character varying(20) NOT NULL,
    star_id integer,
    known_life boolean,
    moons integer
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
    name character varying(20) NOT NULL,
    galaxy_id integer,
    type text,
    age_my text
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

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: ggroup ggroup_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ggroup ALTER COLUMN ggroup_id SET DEFAULT nextval('public.ggroup_ggroup_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1, 8.3, -5);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1, 765, 3.44);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 1, 970, 5.72);
INSERT INTO public.galaxy VALUES (4, 'LMC', 1, 49.97, 0.9);
INSERT INTO public.galaxy VALUES (5, 'NGC 87', 3, 49022.64, 14.1);
INSERT INTO public.galaxy VALUES (6, 'NGC 6027', 2, 58214.391, 14.7);


--
-- Data for Name: ggroup; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.ggroup VALUES (1, 'Local Group', NULL, 80);
INSERT INTO public.ggroup VALUES (2, 'Seyfert''s Sextet', 'Serpens', 6);
INSERT INTO public.ggroup VALUES (3, 'Robert''s Quartet', 'Phoenix', 4);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, NULL, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22.2, 1877, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12.6, 1877, false);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, 5268.2, 1610, false);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, 4820.6, 1610, false);
INSERT INTO public.moon VALUES (6, 'Io', 5, 3643.2, 1610, false);
INSERT INTO public.moon VALUES (7, 'Europa', 5, 3121.6, 1610, false);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5149.46, 1655, false);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 1527.6, 1673, false);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 1468.6, 1673, false);
INSERT INTO public.moon VALUES (11, 'Dinoe', 6, 1122.8, 1684, false);
INSERT INTO public.moon VALUES (12, 'Tethys', 6, 1062.2, 1684, false);
INSERT INTO public.moon VALUES (13, 'Titania', 7, 1576.8, 1787, false);
INSERT INTO public.moon VALUES (14, 'Oberon', 7, 1522.8, 1787, false);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, 1169.4, 1851, false);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 1157.8, 1851, false);
INSERT INTO public.moon VALUES (17, 'Triton', 8, 2705.2, 1846, false);
INSERT INTO public.moon VALUES (18, 'Proteus', 8, 420, 1989, false);
INSERT INTO public.moon VALUES (19, 'Charon', 9, 1212, 1978, false);
INSERT INTO public.moon VALUES (20, 'Styx', 9, 11, 2012, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4, false, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 4, false, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 4, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 4, false, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4, false, 95);
INSERT INTO public.planet VALUES (6, 'Saturn', 4, false, 146);
INSERT INTO public.planet VALUES (7, 'Uranus', 4, false, 28);
INSERT INTO public.planet VALUES (8, 'Neptune', 4, false, 16);
INSERT INTO public.planet VALUES (9, 'Pluto', 4, false, 5);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 5, false, 0);
INSERT INTO public.planet VALUES (11, 'Trappist-1d', 6, false, 0);
INSERT INTO public.planet VALUES (12, 'Trappist-1e', 6, false, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'AE Andromedae', 2, 'Luminous Blue Variable', NULL);
INSERT INTO public.star VALUES (2, 'R136a1', 4, 'Wolf-Rayet', '1.14');
INSERT INTO public.star VALUES (3, 'M33-013406.63', 3, 'Blue Supergiant', NULL);
INSERT INTO public.star VALUES (4, 'Sun', 1, 'Yellow Dwarf', '4600');
INSERT INTO public.star VALUES (5, 'Kepler-452', 1, 'Yellow Dwarf', '6000');
INSERT INTO public.star VALUES (6, 'Trappist-1', 1, 'Red Dwarf', '7600');


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 7, true);


--
-- Name: ggroup_ggroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.ggroup_ggroup_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 18, true);


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
-- Name: ggroup ggroup_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ggroup
    ADD CONSTRAINT ggroup_name_key UNIQUE (name);


--
-- Name: ggroup ggroup_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ggroup
    ADD CONSTRAINT ggroup_pkey PRIMARY KEY (ggroup_id);


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
-- Name: galaxy galaxy_ggroup_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_ggroup_id_fkey FOREIGN KEY (ggroup_id) REFERENCES public.ggroup(ggroup_id);


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

