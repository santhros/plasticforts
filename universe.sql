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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    comet_type character varying(15),
    diameter_meters numeric(15,2),
    orbital_period_days numeric(15,2),
    galaxy_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    description text NOT NULL,
    diameter_in_liteyrs integer,
    distance_in_liteyrs integer,
    quantity_of_stars integer,
    galaxy_type character varying(15),
    is_spiral boolean,
    age_million_years numeric(15,2)
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
    description text NOT NULL,
    moon_type character varying(15),
    diameter_kms numeric(10,2),
    distance_in_liteyrs integer,
    age_million_years numeric(15,2),
    has_life boolean,
    rotation_period_days numeric(7,2),
    planet_id integer NOT NULL
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
    description text NOT NULL,
    planet_type character varying(15),
    diameter_kms numeric(10,2),
    distance_in_liteyrs integer,
    age_million_years numeric(15,2),
    has_life boolean,
    has_intelligent_life boolean,
    quantity_of_moons integer,
    rotation_period_days numeric(7,2),
    star_id integer NOT NULL
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
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    star_type character varying(15),
    is_black_hole boolean,
    diameter_kms numeric(10,2),
    distance_in_liteyrs integer,
    quantity_of_planets integer,
    relative_brightness numeric(10,2),
    age_million_years numeric(15,2),
    orbital_period_days numeric(8,2) NOT NULL
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

INSERT INTO public.comet VALUES (1, 'Halley', 'The most famous of all the comets that surround the solar system', 'ROCKY', 2088.17, 31083.31, 1);
INSERT INTO public.comet VALUES (2, 'Nibiru', 'A mythological celestial body that is thought to provoke an ancient disaster on Earth', 'ROCKY', 45083.84, 113494.77, 1);
INSERT INTO public.comet VALUES (3, 'OMA-001-AF0', 'A recently discovered comet that has an irregular orbit', 'ICE', 103934.00, 301483.40, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our Galaxy, the Milky Way', 150000000, 0, 234581819, 'One Spiral', true, 7162.33);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest Galaxy to ours, the Milky Way', 181000306, 1000000, 194581891, 'Double Spiral', true, 8010.55);
INSERT INTO public.galaxy VALUES (3, 'CFD-011', 'A small galaxy similar to the Milky Way', 94808185, 460000, 194581891, 'One Spiral', true, 7950.41);
INSERT INTO public.galaxy VALUES (4, 'ABD-918', 'A distant and misterious galaxy', 194871893, 90100000, NULL, 'Cumular Galaxy', false, 12381.98);
INSERT INTO public.galaxy VALUES (5, 'KPAX-19201', 'A distant and misterious galaxy,,we received one visitor', 19487580, 90100000, NULL, 'One Spiral', true, 7344.12);
INSERT INTO public.galaxy VALUES (6, 'ROMEO-123101', 'A recently discovered galaxy', 31091118, 18080191, NULL, 'Tubular', false, 6099.18);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Our beautiful satellite', 'NO ATMOSPHERE', 2400.00, 0, 5000.00, false, 1.00, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'A small satellite that is getting apart from Mars', 'NO ATMOSPHERE', 890.00, 0, 5000.00, false, 1.19, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'A small satellite of Mars', 'NO ATMOSPHERE', 749.00, 0, 5000.00, false, 1.33, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'most volcanically active world in the solar system', 'ATMOSPHERE', 3091.00, 0, 5000.00, false, 2.91, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'is thought to have an iron core, a rocky mantle and an ocean of salty water that may be one of the best places to look for life beyond Earth in our solar system.', 'ATMOSPHERE', 5943.00, 0, 5000.00, false, 4.19, 5);
INSERT INTO public.moon VALUES (6, 'Ganimede', 'the largest moon in our solar system and the only moon with its own magnetic field.', 'ATMOSPHERE', 9310.00, 0, 5000.00, false, 1.31, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'the most heavily cratered object in our solar system.', 'ATMOSPHERE', 4014.00, 0, 5000.00, false, 0.41, 5);
INSERT INTO public.moon VALUES (8, 'Enceladus', 'scientists have determined that Enceladus has most of the chemical ingredients needed for life, and likely has hydrothermal vents spewing out hot, mineral-rich water into its ocean.', 'ATMOSPHERE', 8091.00, 0, 5000.00, false, 12.09, 6);
INSERT INTO public.moon VALUES (9, 'Titan', 'Titan is larger than the planet Mercury and is the second largest moon in our solar system.', 'ATMOSPHERE', 9288.00, 0, 5000.00, false, 4.12, 6);
INSERT INTO public.moon VALUES (10, 'Dione', 'Dione is a small moon of 349 miles (562 km) in mean radius orbiting Saturn every 2.7 days', 'NO ATMOSPHERE', 562.00, 0, 5000.00, false, 2.70, 6);
INSERT INTO public.moon VALUES (11, 'Iapetus', 'Iapetus has been called the yin and yang of the Saturn moons because its leading hemisphere has a reflectivity as dark as coal', 'NO ATMOSPHERE', 736.00, 0, 5000.00, false, 21.01, 6);
INSERT INTO public.moon VALUES (12, 'Ariel', 'All of Uranus larger moons, including Ariel, are thought to consist mostly of roughly equal amounts of water ice and silicate rock.', 'NO ATMOSPHERE', 1034.00, 0, 5000.00, false, 9.14, 7);
INSERT INTO public.moon VALUES (13, 'Belinda', 'Little is known about Belinda other than its size and orbital characteristics.', 'NO ATMOSPHERE', 218.00, 0, 5000.00, false, 103.05, 7);
INSERT INTO public.moon VALUES (14, 'Oberon', 'Oberon is heavily cratered―similar to Umbriel―especially when compared to three other moons of Uranus', 'ATMOSPHERE', 501.00, 0, 5000.00, false, 50.10, 7);
INSERT INTO public.moon VALUES (15, 'Miranda', 'Like Frankenstein s monster, Miranda looks like it was pieced together from parts that did not quite merge properly', 'NO ATMOSPHERE', 489.00, 0, 5000.00, false, 21.04, 7);
INSERT INTO public.moon VALUES (16, 'Titania', 'Titania is Uranus largest moon. Images taken by Voyager 2 revealed signs that the moon was geologically active.', 'ATMOSPHERE', 1684.00, 0, 5000.00, false, 2.19, 7);
INSERT INTO public.moon VALUES (17, 'Trito', 'Scientists think Triton is a Kuiper Belt Object captured by Neptune s gravity millions of years ago', 'NO ATMOSPHERE', 750.00, 0, 5000.00, false, 0.98, 8);
INSERT INTO public.moon VALUES (18, 'Nereid', 'Nereid is one of the outermost of Neptune s known moons and is among the largest', 'NO ATMOSPHERE', 801.00, 0, 5000.00, false, 360.00, 8);
INSERT INTO public.moon VALUES (19, 'KGYS-1001-E', 'A sattelite of K-PAX planet', 'NO ATMOSPHERE', 1973.00, 14, 5810.00, false, 1.90, 10);
INSERT INTO public.moon VALUES (20, 'ALPHA-CENTAURI-P08-S02', 'A satellite of Alpha Centauri third planet', 'ATMOSPHERE', 11031.00, 8, 4953.00, true, 1.04, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Planet Mercury, one of the smallest of the solar system', 'INNER PLANET', 5300.00, 0, 5000.00, false, false, 0, 1.45, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'The hottest planet of the Solar System', 'INNER PLANET', 9912.18, 0, 5000.00, false, false, 0, 0.94, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Our home!', 'INNER PLANET', 10031.31, 0, 5000.00, true, true, 1, 1.00, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'The red planet', 'INNER PLANET', 9450.58, 0, 5000.00, false, false, 2, 1.12, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The giant gaseous planet', 'INNER PLANET', 68120.31, 0, 5000.00, false, false, 95, 32.04, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'The planet of the beautiful rings', 'INNER PLANET', 54018.49, 0, 5000.00, false, false, 83, 29.19, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'A cold planet', 'INNER PLANET', 20189.73, 0, 5000.00, false, false, 27, 46.83, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'An even colder planet', 'INNER PLANET', 16309.52, 0, 5000.00, false, false, 14, 89.10, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Basically a big asteroid or a very small planet', 'EXOPLANET', 1747.09, 0, 4813.00, false, false, 5, 284.75, 1);
INSERT INTO public.planet VALUES (10, 'K-PAX-P01', 'The planet of our fellow visitor', 'EXOPLANET', 14019.49, 14, 5800.00, true, true, 3, 1.65, 2);
INSERT INTO public.planet VALUES (11, 'ALPHA-CENTAURI-P03', 'A suspected planet with intelligent life', 'EXOPLANET', 21038.28, 8, 4942.00, true, false, 1, 1.03, 3);
INSERT INTO public.planet VALUES (12, 'ALPHA-CENTAURI-P08', 'Another suspected planet where one of its satellites may converge to life', 'EXOPLANET', 11034.88, 8, 4951.00, true, false, 8, 12.98, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'Our Solar System Star', 'YELLOW MEDIAN', false, 1384000.00, 0, 9, 6.10, 5000.00, 365.23);
INSERT INTO public.star VALUES (2, 1, 'K-PAX 231', 'Star of our fellow visitor', 'RED BRIGHT', false, 937911.00, 19, 6, 8.33, 4938.00, 1401.17);
INSERT INTO public.star VALUES (3, 1, 'Alpha Centauri', 'Closest Star to the Earth', 'YELLOW MEDIAN', false, 1031039.00, 8, 4, 4.10, 6013.00, 480.21);
INSERT INTO public.star VALUES (4, 1, 'ROMEO-810', 'New Star discovered close to the center of the Galaxy', 'RED DWARF', false, 85098.00, 64013, 0, 1.97, 9450.00, 37.90);
INSERT INTO public.star VALUES (5, 1, 'TXS-1821', 'Star that is being absorbed by a Black Hole', 'YELLOW MEDIAN', true, 1039384.00, 25191, 0, 5.19, 7398.00, 2601.32);
INSERT INTO public.star VALUES (6, 2, 'GSD-0131', 'The first star discovered out of our gallaxy', 'GIANT RED', false, 8393813.31, 3093100, 0, 8.90, 7901.00, 4003.00);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: comet fk_galaxy_comet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT fk_galaxy_comet FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

