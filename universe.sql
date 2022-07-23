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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    meaning character varying(30),
    nasa_abbreviation character varying(4) NOT NULL,
    ancient boolean NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    diameter numeric NOT NULL,
    distance_from_earth numeric NOT NULL,
    fun_fact text
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
    name character varying(30),
    orbital_period_hours integer NOT NULL,
    radius_km integer NOT NULL,
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
    name character varying(30),
    orbital_period_years integer NOT NULL,
    planet_type character varying(30) NOT NULL,
    diameter integer,
    has_moons boolean,
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
    name character varying(30),
    description text,
    constellation character varying(30) NOT NULL,
    distance_from_earth numeric NOT NULL,
    galaxy_id integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Ursa minor', 'Lesser bear', 'UMin', true);
INSERT INTO public.constellation VALUES (2, 'Ursa major', 'Greater bear', 'UMaj', true);
INSERT INTO public.constellation VALUES (3, 'Canis minor', 'Lesser dog', 'CMin', true);
INSERT INTO public.constellation VALUES (4, 'Canis major', 'Greater dog', 'CMaj', true);
INSERT INTO public.constellation VALUES (5, 'Orion', 'Orion', 'Orio', true);
INSERT INTO public.constellation VALUES (6, 'Taurus', 'Bull', 'Taur', true);
INSERT INTO public.constellation VALUES (7, 'Lyra', 'Lyre/Harp', 'Lyra', true);
INSERT INTO public.constellation VALUES (8, 'Camelopardalis', 'Giraffe', 'Caml', true);
INSERT INTO public.constellation VALUES (9, 'Indus', 'Indian', 'Indi', false);
INSERT INTO public.constellation VALUES (10, 'Leo minor', 'Lesser lion', 'LMin', false);
INSERT INTO public.constellation VALUES (11, 'Lynx', 'Lynx', 'Lync', false);
INSERT INTO public.constellation VALUES (12, 'Phoenix', 'Phoenix', 'Phoe', false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 0, 'Our home. We live here!');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, 2500000, 'Will collide with Milky Way in 4.5 
billion years');
INSERT INTO public.galaxy VALUES (3, 'Pinwheel', 170000, 20870000, 'Looks like a pinwheel but with a 
trillion stars');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 50000, 29350000, 'Features a large dust ring');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 60000, 30000000, 'Visible through binoculars in dark
 night skies');
INSERT INTO public.galaxy VALUES (6, 'Cigar', 37000, 11500000, 'A starburst galaxy shaped like a cigar');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'the Moon', 660, 1734, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 8, 11, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 30, 6, 4);
INSERT INTO public.moon VALUES (4, 'Vanth', 228, 217, 12);
INSERT INTO public.moon VALUES (5, 'Dysnomia', 378, 350, 11);
INSERT INTO public.moon VALUES (6, 'Charon', 153, 606, 10);
INSERT INTO public.moon VALUES (7, 'Styx', 480, 25, 10);
INSERT INTO public.moon VALUES (8, 'Europa', 85, 1561, 5);
INSERT INTO public.moon VALUES (9, 'Ganymede', 172, 2634, 5);
INSERT INTO public.moon VALUES (10, 'Io', 42, 1821, 5);
INSERT INTO public.moon VALUES (11, 'Titan', 380, 2575, 6);
INSERT INTO public.moon VALUES (12, 'Enceladus', 33, 252, 6);
INSERT INTO public.moon VALUES (13, 'Mimas', 23, 196, 6);
INSERT INTO public.moon VALUES (14, 'Rhea', 108, 764, 6);
INSERT INTO public.moon VALUES (15, 'Titania', 209, 789, 7);
INSERT INTO public.moon VALUES (16, 'Oberon', 320, 761, 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', 99, 584, 7);
INSERT INTO public.moon VALUES (18, 'Triton', 141, 1353, 8);
INSERT INTO public.moon VALUES (19, 'Thalassa', 7, 41, 8);
INSERT INTO public.moon VALUES (20, 'Hippocamp', 23, 9, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, 'terrestrial', 4879, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'terrestrial', 12742, true, 2);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 'terrestrial', 6779, true, 3);
INSERT INTO public.planet VALUES (5, 'Jupiter', 12, 'gas giant', 139820, true, 4);
INSERT INTO public.planet VALUES (6, 'Saturn', 29, 'gas giant', 116460, true, 5);
INSERT INTO public.planet VALUES (7, 'Uranus', 84, 'ice giant', 50724, true, 6);
INSERT INTO public.planet VALUES (8, 'Neptune', 165, 'ice giant', 49244, true, 6);
INSERT INTO public.planet VALUES (12, 'Orcus', 245, 'dwarf', 958, true, 5);
INSERT INTO public.planet VALUES (11, 'Eris', 558, 'dwarf', 2326, true, 4);
INSERT INTO public.planet VALUES (10, 'Pluto', 248, 'dwarf', 2376, true, 3);
INSERT INTO public.planet VALUES (9, 'Ceres', 1682, 'dwarf', 946, false, 2);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'terrestrial', 12104, false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Polaris', 'Known as the North Star and used for navigation', 'Ursa Minor', 430, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Also called the Dog Star', 'Canis Major', 7, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Bright red supergiant', 'Orion', 650, 1);
INSERT INTO public.star VALUES (4, 'Rigel', '7th brightest star in night sky', 'Orion', 860, 1);
INSERT INTO public.star VALUES (5, 'Vega', 'White dwarf star', 'Lyra', 25, 1);
INSERT INTO public.star VALUES (6, 'Pleiades', 'Star cluster known as The Seven Sisters', 'Taurus', 444, 1);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 12, true);


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
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: planet fk_favorite_star_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_favorite_star_planet FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy_location; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy_location FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_orbits_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_orbits_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

