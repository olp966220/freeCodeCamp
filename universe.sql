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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    num_stars_associated integer,
    galaxy_id integer
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
    name character varying(30) NOT NULL,
    description text,
    is_spiral boolean NOT NULL,
    has_active_nucleus boolean,
    num_stars integer,
    diameter integer
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    radius numeric(8,2),
    surface_features text,
    is_tidally_locked boolean,
    has_atmosphere boolean
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    mass numeric(10,3),
    atmosphere text,
    is_habitable boolean,
    has_moons boolean
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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature numeric(5,2),
    spectral_type text,
    is_binary boolean,
    has_planets boolean
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

INSERT INTO public.constellation VALUES (1, 'Orion', 'A prominent constellation visible in the night sky.', 10, 1);
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 'Known as the Great Bear, contains many bright stars.', 7, 1);
INSERT INTO public.constellation VALUES (3, 'Cassiopeia', 'Has a distinctive W or M shape.', 5, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, a barred spiral galaxy.', true, false, 100, 100000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The closest spiral galaxy to the Milky Way.', true, false, 1000, 220000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A smaller spiral galaxy in the Local Group.', true, false, 40, 60000);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'A radio galaxy with an active galactic nucleus.', false, true, 10, 60000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'A beautiful spiral galaxy with distinct spiral arms.', true, false, 50, 50000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'A galaxy with a prominent bulge and a dust lane.', true, false, 80, 50000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1737.40, 'Craters, Maria', true, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 11.10, 'Craters', true, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 6.20, 'Craters', true, false);
INSERT INTO public.moon VALUES (4, 'Io', 3, 1821.60, 'Volcanic activity', true, false);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 1560.80, 'Icy surface, possible subsurface ocean', true, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 2631.20, 'Icy surface, largest moon in solar system', true, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 2410.30, 'Heavily cratered, icy surface', true, false);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 2575.50, 'Lakes of liquid methane, thick nitrogen atmosphere', true, true);
INSERT INTO public.moon VALUES (9, 'Rhea', 4, 763.80, 'Craters, icy surface', true, false);
INSERT INTO public.moon VALUES (10, 'Iapetus', 4, 735.60, 'Two-toned appearance, one side bright and one side dark', true, false);
INSERT INTO public.moon VALUES (11, 'Dione', 4, 561.70, 'Craters, icy surface with fractures', true, false);
INSERT INTO public.moon VALUES (12, 'Tethys', 4, 533.00, 'Large impact crater, icy surface', true, false);
INSERT INTO public.moon VALUES (13, 'Enceladus', 4, 252.10, 'Geysers of water vapor, icy surface', true, false);
INSERT INTO public.moon VALUES (14, 'Mimas', 4, 198.20, 'Large impact crater, Herschel crater', true, false);
INSERT INTO public.moon VALUES (15, 'Hyperion', 4, 135.00, 'Irregular shape, chaotic rotation', true, false);
INSERT INTO public.moon VALUES (16, 'Phoebe', 4, 106.50, 'Dark surface, retrograde orbit', true, false);
INSERT INTO public.moon VALUES (17, 'Miranda', 5, 235.80, 'Complex terrain, large cliffs', true, false);
INSERT INTO public.moon VALUES (18, 'Ariel', 5, 578.40, 'Icy surface with valleys and craters', true, false);
INSERT INTO public.moon VALUES (19, 'Umbriel', 5, 584.70, 'Dark, heavily cratered surface', true, false);
INSERT INTO public.moon VALUES (20, 'Titania', 5, 788.40, 'Icy surface with large canyons', true, false);
INSERT INTO public.moon VALUES (21, 'Oberon', 5, 761.40, 'Icy surface with large impact basins', true, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1.000, 'Nitrogen, Oxygen, etc.', true, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 0.107, 'Carbon Dioxide, etc.', false, true);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 317.800, 'Hydrogen, Helium, etc.', false, true);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 5.683, 'Hydrogen, Helium, etc.', false, NULL);
INSERT INTO public.planet VALUES (5, 'Uranus', 1, 8.681, 'Hydrogen, Helium, Methane, etc.', false, NULL);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, 1.024, 'Hydrogen, Helium, Methane, etc.', false, NULL);
INSERT INTO public.planet VALUES (7, 'Venus', 1, 4.867, 'Carbon Dioxide, Nitrogen, etc.', false, NULL);
INSERT INTO public.planet VALUES (8, 'Mercury', 1, 3.301, 'Trace amounts of various gases', false, NULL);
INSERT INTO public.planet VALUES (9, 'Titan', 1, 1.345, 'Nitrogen, Methane, etc.', false, NULL);
INSERT INTO public.planet VALUES (10, 'Europa', 1, 4.800, 'Oxygen, etc.', false, NULL);
INSERT INTO public.planet VALUES (11, 'Ganymede', 1, 1.481, 'Oxygen, etc.', false, NULL);
INSERT INTO public.planet VALUES (12, 'Callisto', 1, 1.076, 'Carbon Dioxide, etc.', false, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5.78, 'G2V', false, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 9.94, 'A1V', true, false);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 3.50, 'M1-2Ia-ab', false, false);
INSERT INTO public.star VALUES (4, 'Rigel', 1, 11.00, 'B8Ia', false, false);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 1, 3.04, 'M5.5Ve', false, true);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 1, 5.79, 'G2V', false, true);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: constellation unique_name_constellation; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT unique_name_constellation UNIQUE (name);


--
-- Name: moon unique_name_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name_moon UNIQUE (name);


--
-- Name: planet unique_name_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name_planet UNIQUE (name);


--
-- Name: star unique_name_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name_star UNIQUE (name);


--
-- Name: constellation fk_galaxy_constellation; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT fk_galaxy_constellation FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

