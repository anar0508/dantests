--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.0
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: answer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.answer (
    a_id integer NOT NULL,
    a_question_id integer,
    a_text character varying(512),
    a_type integer DEFAULT 0
);


--
-- Name: answers_a_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.answers_a_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: answers_a_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.answers_a_id_seq OWNED BY public.answer.a_id;


--
-- Name: group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."group" (
    g_id integer NOT NULL,
    g_name character varying(32)
);


--
-- Name: process_p_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.process_p_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: process; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.process (
    p_id integer DEFAULT nextval('public.process_p_id_seq'::regclass) NOT NULL,
    p_user integer,
    p_date timestamp with time zone DEFAULT now(),
    p_question integer,
    p_answer integer
);


--
-- Name: question; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.question (
    q_id integer NOT NULL,
    q_number character varying(4),
    q_text character varying(2048),
    q_date_add timestamp with time zone DEFAULT now(),
    q_header character varying(256)
);


--
-- Name: questions_q_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.questions_q_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: questions_q_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.questions_q_id_seq OWNED BY public.question.q_id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.role (
    r_id integer NOT NULL,
    r_name character varying(32)
);


--
-- Name: role_r_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.role_r_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: role_r_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.role_r_id_seq OWNED BY public.role.r_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    u_id integer NOT NULL,
    u_name character varying(64),
    u_regdate timestamp without time zone DEFAULT now(),
    u_login character varying(32),
    u_passwd character varying(256),
    u_group integer,
    u_role integer DEFAULT 1
);


--
-- Name: users_u_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_u_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_u_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_u_id_seq OWNED BY public.users.u_id;


--
-- Name: answer a_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.answer ALTER COLUMN a_id SET DEFAULT nextval('public.answers_a_id_seq'::regclass);


--
-- Name: question q_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.question ALTER COLUMN q_id SET DEFAULT nextval('public.questions_q_id_seq'::regclass);


--
-- Name: role r_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role ALTER COLUMN r_id SET DEFAULT nextval('public.role_r_id_seq'::regclass);


--
-- Name: users u_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN u_id SET DEFAULT nextval('public.users_u_id_seq'::regclass);


--
-- Name: answer answers_a_id_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.answer
    ADD CONSTRAINT answers_a_id_pk PRIMARY KEY (a_id);


--
-- Name: group groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."group"
    ADD CONSTRAINT groups_pkey PRIMARY KEY (g_id);


--
-- Name: process process_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.process
    ADD CONSTRAINT process_pkey PRIMARY KEY (p_id);


--
-- Name: question questions_q_id_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT questions_q_id_pk PRIMARY KEY (q_id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (r_id);


--
-- Name: users users_u_id_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_u_id_pk PRIMARY KEY (u_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

