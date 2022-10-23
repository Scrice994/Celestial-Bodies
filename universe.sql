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
    name character varying(20) NOT NULL,
    visible_from_earth_years integer,
    diameter_in_km integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    is_spherical boolean,
    distance_from_earth_in_millions numeric(4,1),
    constellation character varying(30)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age_in_millions_of_years numeric(5,0),
    planet_id integer NOT NULL,
    dimension_in_km numeric(6,1)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age_in_millions_of_year numeric(5,0),
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_year numeric(5,0),
    dimension_in_rsun numeric(5,1)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley Comet', 78, 11);
INSERT INTO public.comet VALUES (2, 'Shoemaker Levy-9', NULL, 2);
INSERT INTO public.comet VALUES (3, 'Hyakutake', NULL, 2);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Andromeda is the closest big galaxy to the Milky Way', true, 2.5, 'Andromeda');
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'the galaxy containing the Sun and its Solar System', true, NULL, 'Sagittarius');
INSERT INTO public.galaxy VALUES (3, 'Eye of Sauron', 'Due to its resemblance to the Eye of Sauron from The Lord of the Rings', true, 52.0, 'Canes Venatici');
INSERT INTO public.galaxy VALUES (4, 'Backward Galaxy', 'it appears to rotate backwards', true, 200.0, 'Centaurus');
INSERT INTO public.galaxy VALUES (5, 'Black Eye Galaxies', 'it has a spetacular dark band of absorbing dust in front of the galaxy bright nucleus', true, 17.0, 'Coma Berenices');
INSERT INTO public.galaxy VALUES (6, 'Circinus Galaxy', 'Named after the costellation is located in', false, 13.0, 'Circinus');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 453, 3, 1737.0);
INSERT INTO public.moon VALUES (2, 'Phobos', 4503, 4, 22533.0);
INSERT INTO public.moon VALUES (3, 'Deimos', 1500, 4, 12.0);
INSERT INTO public.moon VALUES (4, 'Europa', 4500, 5, 1568.0);
INSERT INTO public.moon VALUES (5, 'Io', 4500, 5, 3643.0);
INSERT INTO public.moon VALUES (6, 'Ganimede', 4500, 5, 5268.0);
INSERT INTO public.moon VALUES (7, 'Callisto', 4500, 5, 4820.0);
INSERT INTO public.moon VALUES (8, 'Amaltea', NULL, 5, 167.0);
INSERT INTO public.moon VALUES (9, 'Titano', 4000, 6, 5149.0);
INSERT INTO public.moon VALUES (10, 'Enceldo', 1000, 6, 504.0);
INSERT INTO public.moon VALUES (11, 'Mimas', NULL, 6, 396.0);
INSERT INTO public.moon VALUES (12, 'Dione', NULL, 6, 1122.0);
INSERT INTO public.moon VALUES (13, 'Giapeto', NULL, 6, 1469.0);
INSERT INTO public.moon VALUES (14, 'Miranda', 100, 7, 471.0);
INSERT INTO public.moon VALUES (15, 'Titania', NULL, 7, 1576.0);
INSERT INTO public.moon VALUES (16, 'Oberon', NULL, 7, 1522.0);
INSERT INTO public.moon VALUES (17, 'Ariel', NULL, 7, 1157.0);
INSERT INTO public.moon VALUES (18, 'Umbriel', NULL, 7, 1169.0);
INSERT INTO public.moon VALUES (19, 'Tritone', NULL, 8, 2706.0);
INSERT INTO public.moon VALUES (20, 'Talassa', NULL, 8, 82.0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4600, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4500, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 4543, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 4603, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4603, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 4503, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 4503, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4503, false, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', NULL, false, 1);
INSERT INTO public.planet VALUES (10, 'TOY-1452 b', NULL, false, NULL);
INSERT INTO public.planet VALUES (11, 'Kepler-452 b', NULL, false, NULL);
INSERT INTO public.planet VALUES (12, 'WASP-103 b', 4, false, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4, 1.0);
INSERT INTO public.star VALUES (2, 'Alpheratz', 2, NULL, 2.1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 10, 887.0);
INSERT INTO public.star VALUES (4, 'Alpha Circini', 6, 12, 2.0);
INSERT INTO public.star VALUES (5, 'Mirach', 2, NULL, 90.0);
INSERT INTO public.star VALUES (6, 'Sirius', 1, 247, 1711.0);


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
