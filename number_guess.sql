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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games_info (
    info_id integer NOT NULL,
    total_guess integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.games_info OWNER TO freecodecamp;

--
-- Name: games_info_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_info_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_info_info_id_seq OWNER TO freecodecamp;

--
-- Name: games_info_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_info_info_id_seq OWNED BY public.games_info.info_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games_info info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games_info ALTER COLUMN info_id SET DEFAULT nextval('public.games_info_info_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games_info VALUES (1, 3, 1);
INSERT INTO public.games_info VALUES (2, 1, 1);
INSERT INTO public.games_info VALUES (3, 6, 1);
INSERT INTO public.games_info VALUES (4, 3, 2);
INSERT INTO public.games_info VALUES (5, 4, 3);
INSERT INTO public.games_info VALUES (6, 3, 4);
INSERT INTO public.games_info VALUES (7, 4, 5);
INSERT INTO public.games_info VALUES (8, 382, 6);
INSERT INTO public.games_info VALUES (9, 162, 6);
INSERT INTO public.games_info VALUES (10, 534, 7);
INSERT INTO public.games_info VALUES (11, 503, 7);
INSERT INTO public.games_info VALUES (12, 535, 6);
INSERT INTO public.games_info VALUES (13, 345, 6);
INSERT INTO public.games_info VALUES (14, 547, 6);
INSERT INTO public.games_info VALUES (15, 754, 8);
INSERT INTO public.games_info VALUES (16, 3, 8);
INSERT INTO public.games_info VALUES (17, 429, 9);
INSERT INTO public.games_info VALUES (18, 271, 9);
INSERT INTO public.games_info VALUES (19, 247, 8);
INSERT INTO public.games_info VALUES (20, 368, 8);
INSERT INTO public.games_info VALUES (21, 12, 8);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Ardillo');
INSERT INTO public.users VALUES (2, 'Lucy');
INSERT INTO public.users VALUES (3, 'Negra');
INSERT INTO public.users VALUES (4, '4');
INSERT INTO public.users VALUES (5, 'Agus');
INSERT INTO public.users VALUES (6, 'user_1730055185687');
INSERT INTO public.users VALUES (7, 'user_1730055185686');
INSERT INTO public.users VALUES (8, 'user_1730055297048');
INSERT INTO public.users VALUES (9, 'user_1730055297047');


--
-- Name: games_info_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_info_info_id_seq', 21, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 9, true);


--
-- Name: games_info games_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games_info
    ADD CONSTRAINT games_info_pkey PRIMARY KEY (info_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games_info games_info_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games_info
    ADD CONSTRAINT games_info_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

