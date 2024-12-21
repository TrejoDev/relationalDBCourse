
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
-- Name: constellacion; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellacion (
    constellacion_id integer NOT NULL,
    name character varying(100) NOT NULL,
    descripcion text,
    hemisferio character varying(10)
);


ALTER TABLE public.constellacion OWNER TO freecodecamp;

--
-- Name: constellacion_constelacion_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellacion_constelacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellacion_constelacion_id_seq OWNER TO freecodecamp;

--
-- Name: constellacion_constelacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellacion_constelacion_id_seq OWNED BY public.constellacion.constellacion_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    age_in_billions_years integer,
    size_in_light_years numeric
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
    diameter_km numeric,
    mass_kg numeric,
    discovery_year integer,
    has_atmosphere boolean,
    number_of_known_moons integer,
    description text,
    planet_id integer
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
    orbital_period_years numeric,
    distance_from_star_au numeric,
    mass_kg numeric,
    diameter_km numeric,
    gravity_m_s2 numeric,
    atmosphere_composition text,
    number_of_moons integer,
    habitable boolean,
    description text,
    star_id integer
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
    galaxy_id integer,
    spectral_type character varying(10),
    luminosity numeric,
    mass_solar_masses numeric,
    radius_solar_radii numeric,
    age_billions_years numeric,
    description text
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
-- Name: constellacion constellacion_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellacion ALTER COLUMN constellacion_id SET DEFAULT nextval('public.constellacion_constelacion_id_seq'::regclass);


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
-- Data for Name: constellacion; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellacion VALUES (1, 'Osa Mayor', 'Una de las constelaciones más conocidas del hemisferio norte', 'Norte');
INSERT INTO public.constellacion VALUES (2, 'Orión', 'Constelación visible desde ambos hemisferios, famosa por su cinturón', 'Sur');
INSERT INTO public.constellacion VALUES (3, 'Andrómeda', 'Una de las constelaciones más grandes, visible en ambos hemisferios', 'Ambos');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Our nearest large galactic neighbor', 10, 220000);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Our home galaxy', 14, 100000);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'A lenticular galaxy with a prominent dust lane', 13, 50000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'A grand-design spiral galaxy', 11, 60000);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'The third-largest galaxy in the Local Group', 10, 60000);
INSERT INTO public.galaxy VALUES (6, 'Magellanic Clouds', 'Two irregular dwarf galaxies orbiting the Milky Way', 13, 15000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (39, 'Luna', 3474, 73420000000000000000000, -2000, false, 0, 'Earth''s only natural satellite', 13);
INSERT INTO public.moon VALUES (41, 'Phobos', 22, 10600000000000000, 1877, false, 0, 'One of Mars'' two moons', 16);
INSERT INTO public.moon VALUES (42, 'Deimos', 12, 1480000000000000, 1877, false, 0, 'Otra luna de Marte', 16);
INSERT INTO public.moon VALUES (43, 'Europa', 3122, 48000000000000000000000, 1610, false, 0, 'Una de las lunas galileanas de Júpiter', 17);
INSERT INTO public.moon VALUES (44, 'Ganymede', 5262, 148000000000000000000000, 1610, false, 0, 'La luna más grande de Júpiter', 17);
INSERT INTO public.moon VALUES (45, 'Callisto', 4821, 108000000000000000000000, 1610, false, 0, 'Una luna con muchos cráteres de Júpiter', 17);
INSERT INTO public.moon VALUES (46, 'Io', 3643, 89300000000000000000000, 1610, false, 0, 'Luna volcánicamente activa de Júpiter', 17);
INSERT INTO public.moon VALUES (47, 'Titan', 5150, 135000000000000000000000, 1655, true, 0, 'La luna más grande de Saturno con atmósfera', 18);
INSERT INTO public.moon VALUES (48, 'Enceladus', 504, 108000000000000000000, 1789, true, 0, 'Luna helada de Saturno con géiseres', 18);
INSERT INTO public.moon VALUES (49, 'Mimas', 396, 38000000000000000000, 1789, false, 0, 'Luna de Saturno con el cráter Herschel', 18);
INSERT INTO public.moon VALUES (50, 'Dione', 1123, 1090000000000000000000, 1684, false, 0, 'Luna de Saturno con hielo', 18);
INSERT INTO public.moon VALUES (51, 'Iapetus', 1469, 1810000000000000000000, 1671, false, 0, 'Luna de Saturno con dos tonos', 18);
INSERT INTO public.moon VALUES (52, 'Miranda', 472, 65900000000000000000, 1948, false, 0, 'Luna de Urano con superficie compleja', 19);
INSERT INTO public.moon VALUES (53, 'Titania', 1577, 3530000000000000000000, 1787, false, 0, 'La luna más grande de Urano', 19);
INSERT INTO public.moon VALUES (54, 'Oberon', 1523, 3010000000000000000000, 1787, false, 0, 'Luna exterior de Urano', 19);
INSERT INTO public.moon VALUES (55, 'Triton', 2707, 21400000000000000000000, 1846, true, 0, 'Luna de Neptuno con órbita retrógrada', 20);
INSERT INTO public.moon VALUES (56, 'Charon', 1212, 1520000000000000000000, 1978, false, 0, 'La luna más grande de Plutón', 21);
INSERT INTO public.moon VALUES (57, 'Nix', 48, 40000000000000000, 2005, false, 0, 'Pequeña luna de Plutón', 21);
INSERT INTO public.moon VALUES (58, 'Hydra', 43, 30000000000000000, 2005, false, 0, 'Pequeña luna de Plutón', 21);
INSERT INTO public.moon VALUES (59, 'Kerberos', 12, 13000000000000000, 2011, false, 0, 'Pequeña luna de Plutón', 21);
INSERT INTO public.moon VALUES (60, 'Styx', 10, 3000000000000000, 2012, false, 0, 'Pequeña luna de Plutón', 21);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Mercury', 0.24, 0.39, 330000000000000000000000, 4879, 3.7, 'Thin atmosphere of hydrogen, helium, and oxygen', 0, false, 'Closest planet to the Sun', 1);
INSERT INTO public.planet VALUES (14, 'Venus', 0.62, 0.72, 4870000000000000000000000, 12104, 8.87, 'Dense carbon dioxide atmosphere', 0, false, 'Hottest planet in the solar system', 1);
INSERT INTO public.planet VALUES (15, 'Earth', 1.00, 1.00, 5970000000000000000000000, 12742, 9.81, 'Nitrogen and oxygen', 1, true, 'Our home planet', 1);
INSERT INTO public.planet VALUES (16, 'Mars', 1.88, 1.52, 642000000000000000000000, 6779, 3.71, 'Thin carbon dioxide atmosphere', 2, false, 'The Red Planet', 1);
INSERT INTO public.planet VALUES (17, 'Jupiter', 11.86, 5.20, 1900000000000000000000000000, 139820, 24.79, 'Hydrogen and helium', 79, false, 'The largest planet in the solar system', 1);
INSERT INTO public.planet VALUES (18, 'Saturn', 29.46, 9.58, 568000000000000000000000000, 116460, 10.44, 'Hydrogen and helium', 82, false, 'The planet with the most prominent rings', 1);
INSERT INTO public.planet VALUES (19, 'Uranus', 84.01, 19.20, 86800000000000000000000000, 50724, 8.69, 'Hydrogen, helium, and methane', 27, false, 'An ice giant', 1);
INSERT INTO public.planet VALUES (20, 'Neptune', 164.8, 30.07, 102000000000000000000000000, 49244, 11.15, 'Hydrogen, helium, and methane', 14, false, 'The farthest known planet from the Sun', 1);
INSERT INTO public.planet VALUES (21, 'Proxima Centauri b', 0.03, 0.05, 1300000000000000000000000, 1.14, 1.07, 'Unknown', 0, false, 'Exoplanet orbiting the closest star to the Sun', 4);
INSERT INTO public.planet VALUES (22, 'Kepler-186f', 130, 0.4, 3770000000000000000000000, 1.11, 0.9, 'Unknown', 0, true, 'Exoplanet in the habitable zone of its star', 5);
INSERT INTO public.planet VALUES (23, 'TRAPPIST-1d', 4, 0.03, 4020000000000000000000000, 0.77, 0.8, 'Unknown', 0, true, 'Exoplanet in the TRAPPIST-1 system', 6);
INSERT INTO public.planet VALUES (24, 'Gliese 581c', 0.03, 0.07, 5000000000000000000000000, 1.50, 1.27, 'Unknown', 0, true, 'Exoplanet in the habitable zone of its star', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 2, 'G2V', 1.0, 1.0, 1.0, 4.6, 'Our star');
INSERT INTO public.star VALUES (2, 'Sirius', 2, 'A1V', 25, 2.1, 1.7, 250, 'The brightest star in the night sky');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'M2Iab', 120000, 20, 1000, 8.8, 'A red supergiant star');
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 'M5.5Ve', 0.0015, 0.12, 0.15, 4.85, 'The closest star to the Sun');
INSERT INTO public.star VALUES (5, 'Vega', 1, 'A0Va', 57, 2.1, 2.36, 455, 'A bright star in the constellation Lyra');
INSERT INTO public.star VALUES (6, 'Rigel', 1, 'B8Ia', 120000, 18, 78, 8, 'A blue-white supergiant star');


--
-- Name: constellacion_constelacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellacion_constelacion_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 60, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellacion constellacion_nombre_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellacion
    ADD CONSTRAINT constellacion_nombre_key UNIQUE (name);


--
-- Name: constellacion constellacion_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellacion
    ADD CONSTRAINT constellacion_pkey PRIMARY KEY (constellacion_id);


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

