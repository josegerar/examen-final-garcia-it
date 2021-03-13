--
-- PostgreSQL database dump
--

-- Dumped from database version 10.15
-- Dumped by pg_dump version 10.15

-- Started on 2021-03-13 16:28:50

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

DROP DATABASE radiodifusora;
--
-- TOC entry 2988 (class 1262 OID 24585)
-- Name: radiodifusora; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE radiodifusora WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Ecuador.1252' LC_CTYPE = 'Spanish_Ecuador.1252';


ALTER DATABASE radiodifusora OWNER TO postgres;

\connect radiodifusora

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

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2991 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 228 (class 1259 OID 24777)
-- Name: canciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.canciones (
    id integer NOT NULL,
    nombre character varying(100)
);


ALTER TABLE public.canciones OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 24775)
-- Name: canciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.canciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.canciones_id_seq OWNER TO postgres;

--
-- TOC entry 2992 (class 0 OID 0)
-- Dependencies: 227
-- Name: canciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.canciones_id_seq OWNED BY public.canciones.id;


--
-- TOC entry 226 (class 1259 OID 24769)
-- Name: canciones_reproducidas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.canciones_reproducidas (
    id integer NOT NULL,
    programa_realizado_id integer,
    cancion_id integer,
    reproducciones integer
);


ALTER TABLE public.canciones_reproducidas OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24767)
-- Name: canciones_reproducidas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.canciones_reproducidas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.canciones_reproducidas_id_seq OWNER TO postgres;

--
-- TOC entry 2993 (class 0 OID 0)
-- Dependencies: 225
-- Name: canciones_reproducidas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.canciones_reproducidas_id_seq OWNED BY public.canciones_reproducidas.id;


--
-- TOC entry 224 (class 1259 OID 24742)
-- Name: contenido_programa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contenido_programa (
    id integer NOT NULL,
    programa_realizado_id integer,
    tema_tratado character varying(100),
    descripcion text,
    fuente_respaldo_id integer,
    tipo_programa_id integer
);


ALTER TABLE public.contenido_programa OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24740)
-- Name: contenido_programa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contenido_programa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contenido_programa_id_seq OWNER TO postgres;

--
-- TOC entry 2994 (class 0 OID 0)
-- Dependencies: 223
-- Name: contenido_programa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contenido_programa_id_seq OWNED BY public.contenido_programa.id;


--
-- TOC entry 205 (class 1259 OID 24626)
-- Name: emisora_canal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emisora_canal (
    id integer NOT NULL,
    nombre character varying(100),
    canal numeric(8,2)
);


ALTER TABLE public.emisora_canal OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 24624)
-- Name: emisora_canal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.emisora_canal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.emisora_canal_id_seq OWNER TO postgres;

--
-- TOC entry 2995 (class 0 OID 0)
-- Dependencies: 204
-- Name: emisora_canal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.emisora_canal_id_seq OWNED BY public.emisora_canal.id;


--
-- TOC entry 207 (class 1259 OID 24634)
-- Name: programa_radial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.programa_radial (
    id integer NOT NULL,
    nombre character varying(100),
    emisora_id integer,
    interactivo boolean DEFAULT false,
    hora_inicio time with time zone,
    hora_fin time with time zone
);


ALTER TABLE public.programa_radial OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 24632)
-- Name: programa_radial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.programa_radial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programa_radial_id_seq OWNER TO postgres;

--
-- TOC entry 2996 (class 0 OID 0)
-- Dependencies: 206
-- Name: programa_radial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.programa_radial_id_seq OWNED BY public.programa_radial.id;


--
-- TOC entry 217 (class 1259 OID 24690)
-- Name: programa_realizado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.programa_realizado (
    id integer NOT NULL,
    fecha_programa date,
    hora_inico time with time zone,
    hora_fin time with time zone,
    programa_radial_id integer
);


ALTER TABLE public.programa_realizado OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24688)
-- Name: programa_realizado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.programa_realizado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programa_realizado_id_seq OWNER TO postgres;

--
-- TOC entry 2997 (class 0 OID 0)
-- Dependencies: 216
-- Name: programa_realizado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.programa_realizado_id_seq OWNED BY public.programa_realizado.id;


--
-- TOC entry 197 (class 1259 OID 24588)
-- Name: rol_staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rol_staff (
    id integer NOT NULL,
    nombre character varying(30) NOT NULL
);


ALTER TABLE public.rol_staff OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24705)
-- Name: sanciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sanciones (
    id integer NOT NULL,
    segundos integer,
    tipo_sancion_id integer NOT NULL,
    programa_realizado_id integer
);


ALTER TABLE public.sanciones OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24701)
-- Name: sanciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sanciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sanciones_id_seq OWNER TO postgres;

--
-- TOC entry 2998 (class 0 OID 0)
-- Dependencies: 218
-- Name: sanciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sanciones_id_seq OWNED BY public.sanciones.id;


--
-- TOC entry 219 (class 1259 OID 24703)
-- Name: sanciones_tipo_sancion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sanciones_tipo_sancion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sanciones_tipo_sancion_id_seq OWNER TO postgres;

--
-- TOC entry 2999 (class 0 OID 0)
-- Dependencies: 219
-- Name: sanciones_tipo_sancion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sanciones_tipo_sancion_id_seq OWNED BY public.sanciones.tipo_sancion_id;


--
-- TOC entry 199 (class 1259 OID 24596)
-- Name: spot_clasificacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spot_clasificacion (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL,
    precio numeric(8,2) NOT NULL
);


ALTER TABLE public.spot_clasificacion OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 24594)
-- Name: spot_clasificacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spot_clasificacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spot_clasificacion_id_seq OWNER TO postgres;

--
-- TOC entry 3000 (class 0 OID 0)
-- Dependencies: 198
-- Name: spot_clasificacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spot_clasificacion_id_seq OWNED BY public.spot_clasificacion.id;


--
-- TOC entry 201 (class 1259 OID 24604)
-- Name: spot_publicitario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spot_publicitario (
    id integer NOT NULL,
    id_clasificacion integer,
    cantidad_segundos integer,
    cadena_nacional boolean DEFAULT false,
    nombre character varying(100),
    descripcion text
);


ALTER TABLE public.spot_publicitario OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 24602)
-- Name: spot_publicitario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spot_publicitario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spot_publicitario_id_seq OWNER TO postgres;

--
-- TOC entry 3001 (class 0 OID 0)
-- Dependencies: 200
-- Name: spot_publicitario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spot_publicitario_id_seq OWNED BY public.spot_publicitario.id;


--
-- TOC entry 222 (class 1259 OID 24724)
-- Name: spot_repeticiones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spot_repeticiones (
    id integer NOT NULL,
    programa_realizado_id integer,
    spot_id integer,
    repeticiones integer
);


ALTER TABLE public.spot_repeticiones OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24722)
-- Name: spot_repeticiones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spot_repeticiones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spot_repeticiones_id_seq OWNER TO postgres;

--
-- TOC entry 3002 (class 0 OID 0)
-- Dependencies: 221
-- Name: spot_repeticiones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spot_repeticiones_id_seq OWNED BY public.spot_repeticiones.id;


--
-- TOC entry 203 (class 1259 OID 24618)
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    id integer NOT NULL,
    nombre character varying(100),
    rol_id integer,
    programa_id integer
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 24586)
-- Name: staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_id_seq OWNER TO postgres;

--
-- TOC entry 3003 (class 0 OID 0)
-- Dependencies: 196
-- Name: staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_id_seq OWNED BY public.rol_staff.id;


--
-- TOC entry 202 (class 1259 OID 24616)
-- Name: staff_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_id_seq1 OWNER TO postgres;

--
-- TOC entry 3004 (class 0 OID 0)
-- Dependencies: 202
-- Name: staff_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_id_seq1 OWNED BY public.staff.id;


--
-- TOC entry 209 (class 1259 OID 24658)
-- Name: tipo_fuente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_fuente (
    id integer NOT NULL,
    nombre character varying(30)
);


ALTER TABLE public.tipo_fuente OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 24656)
-- Name: tipo_fuente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_fuente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_fuente_id_seq OWNER TO postgres;

--
-- TOC entry 3005 (class 0 OID 0)
-- Dependencies: 208
-- Name: tipo_fuente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_fuente_id_seq OWNED BY public.tipo_fuente.id;


--
-- TOC entry 213 (class 1259 OID 24674)
-- Name: tipo_interaccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_interaccion (
    id integer NOT NULL,
    nombre character varying(50)
);


ALTER TABLE public.tipo_interaccion OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 24672)
-- Name: tipo_interaccion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_interaccion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_interaccion_id_seq OWNER TO postgres;

--
-- TOC entry 3006 (class 0 OID 0)
-- Dependencies: 212
-- Name: tipo_interaccion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_interaccion_id_seq OWNED BY public.tipo_interaccion.id;


--
-- TOC entry 211 (class 1259 OID 24666)
-- Name: tipo_programa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_programa (
    id integer NOT NULL,
    nombre character varying(50)
);


ALTER TABLE public.tipo_programa OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 24664)
-- Name: tipo_programa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_programa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_programa_id_seq OWNER TO postgres;

--
-- TOC entry 3007 (class 0 OID 0)
-- Dependencies: 210
-- Name: tipo_programa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_programa_id_seq OWNED BY public.tipo_programa.id;


--
-- TOC entry 215 (class 1259 OID 24682)
-- Name: tipo_sancion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_sancion (
    id integer NOT NULL,
    nombre character varying(50),
    valor numeric(8,2)
);


ALTER TABLE public.tipo_sancion OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24680)
-- Name: tipo_sancion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_sancion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_sancion_id_seq OWNER TO postgres;

--
-- TOC entry 3008 (class 0 OID 0)
-- Dependencies: 214
-- Name: tipo_sancion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_sancion_id_seq OWNED BY public.tipo_sancion.id;


--
-- TOC entry 2782 (class 2604 OID 24780)
-- Name: canciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.canciones ALTER COLUMN id SET DEFAULT nextval('public.canciones_id_seq'::regclass);


--
-- TOC entry 2781 (class 2604 OID 24772)
-- Name: canciones_reproducidas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.canciones_reproducidas ALTER COLUMN id SET DEFAULT nextval('public.canciones_reproducidas_id_seq'::regclass);


--
-- TOC entry 2780 (class 2604 OID 24745)
-- Name: contenido_programa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenido_programa ALTER COLUMN id SET DEFAULT nextval('public.contenido_programa_id_seq'::regclass);


--
-- TOC entry 2769 (class 2604 OID 24629)
-- Name: emisora_canal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emisora_canal ALTER COLUMN id SET DEFAULT nextval('public.emisora_canal_id_seq'::regclass);


--
-- TOC entry 2770 (class 2604 OID 24637)
-- Name: programa_radial id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programa_radial ALTER COLUMN id SET DEFAULT nextval('public.programa_radial_id_seq'::regclass);


--
-- TOC entry 2776 (class 2604 OID 24693)
-- Name: programa_realizado id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programa_realizado ALTER COLUMN id SET DEFAULT nextval('public.programa_realizado_id_seq'::regclass);


--
-- TOC entry 2764 (class 2604 OID 24591)
-- Name: rol_staff id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol_staff ALTER COLUMN id SET DEFAULT nextval('public.staff_id_seq'::regclass);


--
-- TOC entry 2777 (class 2604 OID 24708)
-- Name: sanciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sanciones ALTER COLUMN id SET DEFAULT nextval('public.sanciones_id_seq'::regclass);


--
-- TOC entry 2778 (class 2604 OID 24709)
-- Name: sanciones tipo_sancion_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sanciones ALTER COLUMN tipo_sancion_id SET DEFAULT nextval('public.sanciones_tipo_sancion_id_seq'::regclass);


--
-- TOC entry 2765 (class 2604 OID 24599)
-- Name: spot_clasificacion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spot_clasificacion ALTER COLUMN id SET DEFAULT nextval('public.spot_clasificacion_id_seq'::regclass);


--
-- TOC entry 2766 (class 2604 OID 24607)
-- Name: spot_publicitario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spot_publicitario ALTER COLUMN id SET DEFAULT nextval('public.spot_publicitario_id_seq'::regclass);


--
-- TOC entry 2779 (class 2604 OID 24727)
-- Name: spot_repeticiones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spot_repeticiones ALTER COLUMN id SET DEFAULT nextval('public.spot_repeticiones_id_seq'::regclass);


--
-- TOC entry 2768 (class 2604 OID 24621)
-- Name: staff id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff ALTER COLUMN id SET DEFAULT nextval('public.staff_id_seq1'::regclass);


--
-- TOC entry 2772 (class 2604 OID 24661)
-- Name: tipo_fuente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_fuente ALTER COLUMN id SET DEFAULT nextval('public.tipo_fuente_id_seq'::regclass);


--
-- TOC entry 2774 (class 2604 OID 24677)
-- Name: tipo_interaccion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_interaccion ALTER COLUMN id SET DEFAULT nextval('public.tipo_interaccion_id_seq'::regclass);


--
-- TOC entry 2773 (class 2604 OID 24669)
-- Name: tipo_programa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_programa ALTER COLUMN id SET DEFAULT nextval('public.tipo_programa_id_seq'::regclass);


--
-- TOC entry 2775 (class 2604 OID 24685)
-- Name: tipo_sancion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_sancion ALTER COLUMN id SET DEFAULT nextval('public.tipo_sancion_id_seq'::regclass);


--
-- TOC entry 2982 (class 0 OID 24777)
-- Dependencies: 228
-- Data for Name: canciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.canciones (id, nombre) VALUES (1, 'La vaca lola');


--
-- TOC entry 2980 (class 0 OID 24769)
-- Dependencies: 226
-- Data for Name: canciones_reproducidas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2978 (class 0 OID 24742)
-- Dependencies: 224
-- Data for Name: contenido_programa; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2959 (class 0 OID 24626)
-- Dependencies: 205
-- Data for Name: emisora_canal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.emisora_canal (id, nombre, canal) VALUES (1, 'Radio viva', 100.10);
INSERT INTO public.emisora_canal (id, nombre, canal) VALUES (3, 'Radio maravilla', 1111.00);


--
-- TOC entry 2961 (class 0 OID 24634)
-- Dependencies: 207
-- Data for Name: programa_radial; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.programa_radial (id, nombre, emisora_id, interactivo, hora_inicio, hora_fin) VALUES (1, 'Talento musical4', 1, true, '07:00:00-05', '10:00:00-05');


--
-- TOC entry 2971 (class 0 OID 24690)
-- Dependencies: 217
-- Data for Name: programa_realizado; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.programa_realizado (id, fecha_programa, hora_inico, hora_fin, programa_radial_id) VALUES (3, '2021-03-13', '04:00:00-05', '00:00:00-05', 1);
INSERT INTO public.programa_realizado (id, fecha_programa, hora_inico, hora_fin, programa_radial_id) VALUES (2, '2021-12-22', '10:10:00-05', '10:15:00-05', 1);


--
-- TOC entry 2951 (class 0 OID 24588)
-- Dependencies: 197
-- Data for Name: rol_staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rol_staff (id, nombre) VALUES (2, 'locutor');
INSERT INTO public.rol_staff (id, nombre) VALUES (3, 'productor periodistico');
INSERT INTO public.rol_staff (id, nombre) VALUES (6, 'productor comercial');
INSERT INTO public.rol_staff (id, nombre) VALUES (7, 'produtor ejecutivo');
INSERT INTO public.rol_staff (id, nombre) VALUES (8, 'productor general');
INSERT INTO public.rol_staff (id, nombre) VALUES (10, 'coordinador de aire');
INSERT INTO public.rol_staff (id, nombre) VALUES (11, 'conductor');
INSERT INTO public.rol_staff (id, nombre) VALUES (12, 'co-conductor');
INSERT INTO public.rol_staff (id, nombre) VALUES (13, 'columnista');
INSERT INTO public.rol_staff (id, nombre) VALUES (14, 'cronista');
INSERT INTO public.rol_staff (id, nombre) VALUES (4, 'asistente de produccion');
INSERT INTO public.rol_staff (id, nombre) VALUES (5, 'productor artistico');
INSERT INTO public.rol_staff (id, nombre) VALUES (9, 'operador tecnico');


--
-- TOC entry 2974 (class 0 OID 24705)
-- Dependencies: 220
-- Data for Name: sanciones; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2953 (class 0 OID 24596)
-- Dependencies: 199
-- Data for Name: spot_clasificacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.spot_clasificacion (id, nombre, precio) VALUES (1, 'hora top', 60.00);
INSERT INTO public.spot_clasificacion (id, nombre, precio) VALUES (2, 'hora medium', 55.00);
INSERT INTO public.spot_clasificacion (id, nombre, precio) VALUES (3, 'hora light', 45.00);
INSERT INTO public.spot_clasificacion (id, nombre, precio) VALUES (4, 'hora hueso', 25.00);
INSERT INTO public.spot_clasificacion (id, nombre, precio) VALUES (5, 'cuña', 15.00);


--
-- TOC entry 2955 (class 0 OID 24604)
-- Dependencies: 201
-- Data for Name: spot_publicitario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.spot_publicitario (id, id_clasificacion, cantidad_segundos, cadena_nacional, nombre, descripcion) VALUES (1, 1, 30, true, 'Cadena nacional', NULL);


--
-- TOC entry 2976 (class 0 OID 24724)
-- Dependencies: 222
-- Data for Name: spot_repeticiones; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.spot_repeticiones (id, programa_realizado_id, spot_id, repeticiones) VALUES (3, 2, 1, 4);
INSERT INTO public.spot_repeticiones (id, programa_realizado_id, spot_id, repeticiones) VALUES (4, 3, 1, 2);


--
-- TOC entry 2957 (class 0 OID 24618)
-- Dependencies: 203
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.staff (id, nombre, rol_id, programa_id) VALUES (3, ' Martha Julia ', 3, 1);
INSERT INTO public.staff (id, nombre, rol_id, programa_id) VALUES (2, 'Juanito Perez Rangifo', 2, 1);


--
-- TOC entry 2963 (class 0 OID 24658)
-- Dependencies: 209
-- Data for Name: tipo_fuente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_fuente (id, nombre) VALUES (1, 'periodico digital');
INSERT INTO public.tipo_fuente (id, nombre) VALUES (2, 'revista');
INSERT INTO public.tipo_fuente (id, nombre) VALUES (3, 'canal de TV');
INSERT INTO public.tipo_fuente (id, nombre) VALUES (4, 'radio');
INSERT INTO public.tipo_fuente (id, nombre) VALUES (5, 'investigacion propia');


--
-- TOC entry 2967 (class 0 OID 24674)
-- Dependencies: 213
-- Data for Name: tipo_interaccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_interaccion (id, nombre) VALUES (1, 'llamadas al aire');
INSERT INTO public.tipo_interaccion (id, nombre) VALUES (2, 'mensajes por WhatsApp');


--
-- TOC entry 2965 (class 0 OID 24666)
-- Dependencies: 211
-- Data for Name: tipo_programa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_programa (id, nombre) VALUES (1, 'programas musicales');
INSERT INTO public.tipo_programa (id, nombre) VALUES (2, 'programas de noticias');
INSERT INTO public.tipo_programa (id, nombre) VALUES (3, 'programas de concursos');
INSERT INTO public.tipo_programa (id, nombre) VALUES (4, 'programas de humor');


--
-- TOC entry 2969 (class 0 OID 24682)
-- Dependencies: 215
-- Data for Name: tipo_sancion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_sancion (id, nombre, valor) VALUES (1, 'retraso', 0.25);
INSERT INTO public.tipo_sancion (id, nombre, valor) VALUES (2, 'alargue', 0.30);
INSERT INTO public.tipo_sancion (id, nombre, valor) VALUES (3, 'falta', 20.00);


--
-- TOC entry 3009 (class 0 OID 0)
-- Dependencies: 227
-- Name: canciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.canciones_id_seq', 2, true);


--
-- TOC entry 3010 (class 0 OID 0)
-- Dependencies: 225
-- Name: canciones_reproducidas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.canciones_reproducidas_id_seq', 1, false);


--
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 223
-- Name: contenido_programa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contenido_programa_id_seq', 1, false);


--
-- TOC entry 3012 (class 0 OID 0)
-- Dependencies: 204
-- Name: emisora_canal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.emisora_canal_id_seq', 3, true);


--
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 206
-- Name: programa_radial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programa_radial_id_seq', 2, true);


--
-- TOC entry 3014 (class 0 OID 0)
-- Dependencies: 216
-- Name: programa_realizado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programa_realizado_id_seq', 4, true);


--
-- TOC entry 3015 (class 0 OID 0)
-- Dependencies: 218
-- Name: sanciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sanciones_id_seq', 1, false);


--
-- TOC entry 3016 (class 0 OID 0)
-- Dependencies: 219
-- Name: sanciones_tipo_sancion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sanciones_tipo_sancion_id_seq', 1, false);


--
-- TOC entry 3017 (class 0 OID 0)
-- Dependencies: 198
-- Name: spot_clasificacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spot_clasificacion_id_seq', 5, true);


--
-- TOC entry 3018 (class 0 OID 0)
-- Dependencies: 200
-- Name: spot_publicitario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spot_publicitario_id_seq', 1, true);


--
-- TOC entry 3019 (class 0 OID 0)
-- Dependencies: 221
-- Name: spot_repeticiones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spot_repeticiones_id_seq', 4, true);


--
-- TOC entry 3020 (class 0 OID 0)
-- Dependencies: 196
-- Name: staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_id_seq', 14, true);


--
-- TOC entry 3021 (class 0 OID 0)
-- Dependencies: 202
-- Name: staff_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_id_seq1', 3, true);


--
-- TOC entry 3022 (class 0 OID 0)
-- Dependencies: 208
-- Name: tipo_fuente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_fuente_id_seq', 5, true);


--
-- TOC entry 3023 (class 0 OID 0)
-- Dependencies: 212
-- Name: tipo_interaccion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_interaccion_id_seq', 2, true);


--
-- TOC entry 3024 (class 0 OID 0)
-- Dependencies: 210
-- Name: tipo_programa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_programa_id_seq', 4, true);


--
-- TOC entry 3025 (class 0 OID 0)
-- Dependencies: 214
-- Name: tipo_sancion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_sancion_id_seq', 3, true);


--
-- TOC entry 2814 (class 2606 OID 24782)
-- Name: canciones canciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.canciones
    ADD CONSTRAINT canciones_pkey PRIMARY KEY (id);


--
-- TOC entry 2812 (class 2606 OID 24774)
-- Name: canciones_reproducidas canciones_reproducidas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.canciones_reproducidas
    ADD CONSTRAINT canciones_reproducidas_pkey PRIMARY KEY (id);


--
-- TOC entry 2810 (class 2606 OID 24750)
-- Name: contenido_programa contenido_programa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenido_programa
    ADD CONSTRAINT contenido_programa_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 24631)
-- Name: emisora_canal emisora_canal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emisora_canal
    ADD CONSTRAINT emisora_canal_pkey PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 24640)
-- Name: programa_radial programa_radial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programa_radial
    ADD CONSTRAINT programa_radial_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 24695)
-- Name: programa_realizado programa_realizado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programa_realizado
    ADD CONSTRAINT programa_realizado_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 24711)
-- Name: sanciones sanciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sanciones
    ADD CONSTRAINT sanciones_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 24601)
-- Name: spot_clasificacion spot_clasificacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spot_clasificacion
    ADD CONSTRAINT spot_clasificacion_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 24609)
-- Name: spot_publicitario spot_publicitario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spot_publicitario
    ADD CONSTRAINT spot_publicitario_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 24729)
-- Name: spot_repeticiones spot_repeticiones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spot_repeticiones
    ADD CONSTRAINT spot_repeticiones_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 24593)
-- Name: rol_staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol_staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 24623)
-- Name: staff staff_pkey1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey1 PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 24663)
-- Name: tipo_fuente tipo_fuente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_fuente
    ADD CONSTRAINT tipo_fuente_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 24679)
-- Name: tipo_interaccion tipo_interaccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_interaccion
    ADD CONSTRAINT tipo_interaccion_pkey PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 24671)
-- Name: tipo_programa tipo_programa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_programa
    ADD CONSTRAINT tipo_programa_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 24687)
-- Name: tipo_sancion tipo_sancion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_sancion
    ADD CONSTRAINT tipo_sancion_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 24783)
-- Name: canciones_reproducidas canciones_reproducidas_cancion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.canciones_reproducidas
    ADD CONSTRAINT canciones_reproducidas_cancion_id_fkey FOREIGN KEY (cancion_id) REFERENCES public.canciones(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2828 (class 2606 OID 24788)
-- Name: canciones_reproducidas canciones_reproducidas_programa_realizado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.canciones_reproducidas
    ADD CONSTRAINT canciones_reproducidas_programa_realizado_id_fkey FOREIGN KEY (programa_realizado_id) REFERENCES public.programa_realizado(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2825 (class 2606 OID 24757)
-- Name: contenido_programa contenido_programa_fuente_respaldo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenido_programa
    ADD CONSTRAINT contenido_programa_fuente_respaldo_id_fkey FOREIGN KEY (fuente_respaldo_id) REFERENCES public.tipo_fuente(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2824 (class 2606 OID 24752)
-- Name: contenido_programa contenido_programa_programa_realizado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenido_programa
    ADD CONSTRAINT contenido_programa_programa_realizado_id_fkey FOREIGN KEY (programa_realizado_id) REFERENCES public.programa_realizado(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2826 (class 2606 OID 24762)
-- Name: contenido_programa contenido_programa_tipo_programa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenido_programa
    ADD CONSTRAINT contenido_programa_tipo_programa_id_fkey FOREIGN KEY (tipo_programa_id) REFERENCES public.tipo_programa(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2818 (class 2606 OID 24641)
-- Name: programa_radial programa_radial_emisora_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programa_radial
    ADD CONSTRAINT programa_radial_emisora_id_fkey FOREIGN KEY (emisora_id) REFERENCES public.emisora_canal(id) NOT VALID;


--
-- TOC entry 2819 (class 2606 OID 24696)
-- Name: programa_realizado programa_realizado_programa_radial_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programa_realizado
    ADD CONSTRAINT programa_realizado_programa_radial_id_fkey FOREIGN KEY (programa_radial_id) REFERENCES public.programa_radial(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2821 (class 2606 OID 24717)
-- Name: sanciones sanciones_programa_realizado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sanciones
    ADD CONSTRAINT sanciones_programa_realizado_id_fkey FOREIGN KEY (programa_realizado_id) REFERENCES public.programa_realizado(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2820 (class 2606 OID 24712)
-- Name: sanciones sanciones_tipo_sancion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sanciones
    ADD CONSTRAINT sanciones_tipo_sancion_id_fkey FOREIGN KEY (tipo_sancion_id) REFERENCES public.tipo_sancion(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2815 (class 2606 OID 24610)
-- Name: spot_publicitario spot_publicitario_id_clasificacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spot_publicitario
    ADD CONSTRAINT spot_publicitario_id_clasificacion_fkey FOREIGN KEY (id_clasificacion) REFERENCES public.spot_clasificacion(id) NOT VALID;


--
-- TOC entry 2823 (class 2606 OID 24735)
-- Name: spot_repeticiones spot_repeticiones_programa_realizado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spot_repeticiones
    ADD CONSTRAINT spot_repeticiones_programa_realizado_id_fkey FOREIGN KEY (programa_realizado_id) REFERENCES public.programa_realizado(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2822 (class 2606 OID 24730)
-- Name: spot_repeticiones spot_repeticiones_spot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spot_repeticiones
    ADD CONSTRAINT spot_repeticiones_spot_id_fkey FOREIGN KEY (spot_id) REFERENCES public.spot_publicitario(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2817 (class 2606 OID 24651)
-- Name: staff staff_programa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_programa_id_fkey FOREIGN KEY (programa_id) REFERENCES public.programa_radial(id) NOT VALID;


--
-- TOC entry 2816 (class 2606 OID 24646)
-- Name: staff staff_rol_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_rol_id_fkey FOREIGN KEY (rol_id) REFERENCES public.rol_staff(id) NOT VALID;


--
-- TOC entry 2990 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2021-03-13 16:28:53

--
-- PostgreSQL database dump complete
--

