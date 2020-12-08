--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.4

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: archive; Type: TYPE; Schema: public; Owner: marcosh
--

CREATE TYPE public.archive AS ENUM (
    'faldone giallo',
    'faldone blu',
    'faldone rosso',
    'faldone verde',
    'raccoglitore',
    ''
);


ALTER TYPE public.archive OWNER TO marcosh;

--
-- Name: wrapper; Type: TYPE; Schema: public; Owner: marcosh
--

CREATE TYPE public.wrapper AS ENUM (
    'box',
    'paper',
    'label',
    ''
);


ALTER TYPE public.wrapper OWNER TO marcosh;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: chocolates; Type: TABLE; Schema: public; Owner: marcosh
--

CREATE TABLE public.chocolates (
    id integer NOT NULL,
    producer_id integer NOT NULL,
    description character varying(255) NOT NULL,
    cocoa_percentage integer,
    wrapper public.wrapper NOT NULL,
    quantity integer,
    double integer DEFAULT 0 NOT NULL,
    archive public.archive,
    notes character varying(255) DEFAULT NULL::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.chocolates OWNER TO marcosh;

--
-- Name: chocolates_id_seq; Type: SEQUENCE; Schema: public; Owner: marcosh
--

CREATE SEQUENCE public.chocolates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chocolates_id_seq OWNER TO marcosh;

--
-- Name: chocolates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marcosh
--

ALTER SEQUENCE public.chocolates_id_seq OWNED BY public.chocolates.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: marcosh
--

CREATE TABLE public.countries (
    code character varying(2) DEFAULT ''::character varying NOT NULL,
    name character varying(45) NOT NULL
);


ALTER TABLE public.countries OWNER TO marcosh;

--
-- Name: producers; Type: TABLE; Schema: public; Owner: marcosh
--

CREATE TABLE public.producers (
    id integer NOT NULL,
    name character varying(45) NOT NULL,
    country character varying(2) NOT NULL,
    address character varying(255) DEFAULT NULL::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.producers OWNER TO marcosh;

--
-- Name: producers_id_seq; Type: SEQUENCE; Schema: public; Owner: marcosh
--

CREATE SEQUENCE public.producers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producers_id_seq OWNER TO marcosh;

--
-- Name: producers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marcosh
--

ALTER SEQUENCE public.producers_id_seq OWNED BY public.producers.id;


--
-- Name: chocolates id; Type: DEFAULT; Schema: public; Owner: marcosh
--

ALTER TABLE ONLY public.chocolates ALTER COLUMN id SET DEFAULT nextval('public.chocolates_id_seq'::regclass);


--
-- Name: producers id; Type: DEFAULT; Schema: public; Owner: marcosh
--

ALTER TABLE ONLY public.producers ALTER COLUMN id SET DEFAULT nextval('public.producers_id_seq'::regclass);


--
-- Data for Name: chocolates; Type: TABLE DATA; Schema: public; Owner: marcosh
--

COPY public.chocolates (id, producer_id, description, cocoa_percentage, wrapper, quantity, double, archive, notes, created_at) FROM stdin;
1	6	Ghana cioccolato amaro delicato	70	box	75	0	faldone blu		2015-05-23 18:14:21
2	31	Extra fondente	88	box	75	1	faldone blu		2015-05-23 18:14:21
3	7	Extra fondente al peperoncino	75	paper	45	0	faldone giallo		2015-05-23 18:14:21
4	7	extra fondente ripiena di crema al latte e cacao con scorzete d'arancia candita	56	paper	100	0	faldone giallo		2015-05-23 18:14:21
5	32	Heildelbeer-Limone	53	paper	100	0	faldone rosso		2015-05-23 18:14:21
6	6	Ecuador cioccolato aromatico intenso	75	box	75	0	faldone blu		2015-05-23 18:14:21
7	25	Gorzka Macierzynstwo	72	box	100	0			2015-05-23 18:14:21
1258	8	Companera cioccolato bianco bacche di vaniglia	\N	paper	100	0	faldone giallo	\N	2020-10-11 14:17:56.659402
9	21	Cioccolato extra fondente con fave di cacao	80	box	100	0			2015-05-23 18:14:21
10	24	Czekolada gorzka Warszawa syrenka na starowce	90	paper	100	0	raccoglitore		2015-05-23 18:14:21
11	23	Czekolada gorzka	64	box	100	0			2015-05-23 18:14:21
12	33	Extra fondente Costa Rica	71	paper	100	0	faldone giallo		2015-05-23 18:14:21
13	14	Feine bitter	85	box	100	0	faldone verde		2015-05-23 18:14:21
14	31	Grandi Cru del cacao Ecuador (rossa)	75	box	75	0	faldone blu		2015-05-23 18:14:21
15	6	Cioccolato fondente amaro extra	88	box	75	0	faldone blu		2015-05-23 18:14:21
16	34	Fondente Natale	73	box	100	0			2015-05-23 18:14:21
17	35	Chocolate bar with chocolate truffle with brandy filling (green)	48	paper	50	0	faldone rosso		2015-05-23 18:14:21
18	6	Cioccolato fondente extra	50	paper	100	1	faldone giallo		2015-05-23 18:14:21
19	36	Crystallised ginger	65	paper	70	0	faldone rosso		2015-05-23 18:14:21
20	37	Cioccolato fondente extra Repubblica Dominicana	70	box	100	0			2015-05-23 18:14:21
21	37	Cioccolato fondente extra Ecuador	70	box	100	0			2015-05-23 18:14:21
22	38	Cioccolato fondente	50	paper	100	0	faldone giallo		2015-05-23 18:14:21
23	7	Cremino extra fondente	56	paper	170	0	faldone giallo		2015-05-23 18:14:21
24	8	Mascao 6 tavolette di cioccolato fondente extra in 4 gusti	0	box	0	0		sei tavolette incluse	2015-05-23 18:14:21
25	1	Criollo Puertomar	75	box	25	0			2015-05-23 18:14:21
26	9	cioccolata modicana Naturàl	45	box	50	0			2015-05-23 18:14:21
27	39	Dumle original	36	paper	100	0	faldone rosso		2015-05-23 18:14:21
28	29	Nero	70	box	100	1	faldone blu		2015-05-23 18:14:21
29	29	Sfoglie ripiene	70	box	78	0			2015-05-23 18:14:21
30	40	Milch extra	25	paper	100	0	faldone rosso		2015-05-23 18:14:21
31	41	Extra Bitter	81	paper	100	0	faldone giallo		2015-05-23 18:14:21
32	42	Noir - Plain	70	box	100	0			2015-05-23 18:14:21
33	23	Czekolada z lisciem miety	66	box	100	0			2015-05-23 18:14:21
34	43	Puro cioccolato fondente non concato	80	box	50	0			2015-05-23 18:14:21
35	29	Sfoglie (2012)	70	box	96	0			2015-05-23 18:14:21
36	6	Cioccolato al latte finissimo	30	paper	100	0	faldone giallo		2015-05-23 18:14:21
37	44	Blanco 30% cacao bio con limòn y pimienta rosa	30	box	100	0			2015-05-23 18:14:21
38	1	Apurimac	70	box	25	0	faldone blu		2015-05-23 18:14:21
39	16	Noir Prodigieux	90	box	100	1	faldone verde		2015-05-23 18:14:21
40	8	Mascao fondente extra	85	box	100	1	faldone blu		2015-05-23 18:14:21
41	8	Companera extra fondente con nocciole intere	60	paper	100	0	faldone giallo		2015-05-23 18:14:21
42	1	Criollo Porcelana	70	box	25	1			2015-05-23 18:14:21
43	46	Cioccolato grezzo alla pietra	70	box	55	1	faldone blu		2015-05-23 18:14:21
44	8	Bribon fondente zenzero e limone	60	paper	30	0	faldone giallo		2015-05-23 18:14:21
45	8	Masco bianco con fave di cacao	0	box	100	1	faldone blu		2015-05-23 18:14:21
46	48	Mousse Chocolat	60	box	100	0			2015-05-23 18:14:21
47	16	Cioccolato al latte con granella di cocco (2012)	30	paper	100	0	faldone rosso		2015-05-23 18:14:21
48	16	Cioccolato bianco con morbidi pezzi di cedro	0	paper	100	0	faldone rosso		2015-05-23 18:14:21
49	16	Cioccolato fondente con granella alla menta (2012)	50	paper	100	0	faldone rosso		2015-05-23 18:14:21
50	49	Cioccolato puro con zucchero di canna	65	box	50	0			2015-05-23 18:14:21
52	47	Manjari Orange	64	paper	100	0	faldone rosso		2015-05-23 18:14:21
53	1	Single origins	70	box	28	0		sei napolitains inclusi	2015-05-23 18:14:21
54	1	Sur del Lago - Venezuela	70	paper	5	0			2015-05-23 18:14:21
55	1	Sambirano - Madagascar	70	paper	5	1			2015-05-23 18:14:21
56	1	Arriba - Ecuador	70	paper	5	0			2015-05-23 18:14:21
57	1	Apurimac - Perù	70	paper	5	0			2015-05-23 18:14:21
58	1	Tenuya - Colombia	70	paper	5	0			2015-05-23 18:14:21
59	1	Rio Caribe - Venezuela	70	paper	5	0			2015-05-23 18:14:21
60	16	Noir Ecuador	75	box	100	0	faldone verde		2015-05-23 18:14:21
1259	16	Noir orange intense (Lindt difference)	48	box	100	0	faldone verde	\N	2020-10-11 14:27:04.347255
62	29	Fondente extra cacao Ecuador	50	box	75	0			2015-05-23 18:14:21
63	16	Lindor dark	41	paper	100	0	faldone rosso		2015-05-23 18:14:21
64	50	Cioccolato fondente extra Repubblica Dominicana	70	box	100	0	faldone blu		2015-05-23 18:14:21
65	54	Sudusukkuladi	70	paper	100	0	faldone rosso		2015-05-23 18:14:21
66	54	Vinasukkuladi	45	paper	100	0	faldone rosso		2015-05-23 18:14:21
67	53	Cioccolato fondente	0	paper	70	0	faldone giallo		2015-05-23 18:14:21
68	52	Cioccolato fondente	60	paper	100	1	faldone giallo		2015-05-23 18:14:21
69	51	Ingwer schokolade	70	box	100	0			2015-05-23 18:14:21
70	49	Massa di cacao	100	box	50	0			2015-05-23 18:14:21
71	50	Cioccolato fondente extra Ecuador	70	box	100	0	faldone blu		2015-05-23 18:14:21
72	55	Edelbitter schocolade	74	paper	100	0	raccoglitore		2015-05-23 18:14:21
73	56	Milk chocolate with rosted coconut	0	box	0	0		cioccolatini	2015-05-23 18:14:21
74	8	Nocciolato	31	paper	125	1	faldone giallo		2015-05-23 18:14:21
75	57	Cioccolato fondente extra	70	paper	100	0	faldone giallo		2015-05-23 18:14:21
76	58	Dark chocolate with whole almonds	45	paper	100	0	faldone rosso		2015-05-23 18:14:21
77	59	Memories from Greece bitter chocolate	50	paper	100	1	faldone rosso		2015-05-23 18:14:21
78	60	Cioccolato extra fondente con granella di cacao	80	box	100	1			2015-05-23 18:14:21
79	16	Premium fontente intenso e armonioso	72	box	100	0	faldone verde		2015-05-23 18:14:21
80	16	Creation crème brulée	30	box	150	0	faldone verde	da Luca	2015-05-23 18:14:21
81	49	Cioccolato puro	70	box	50	0			2015-05-23 18:14:21
82	1	Criollo Canoabo	70	box	25	0			2015-05-23 18:14:21
83	60	Cioccolato extra fondente arancia	70	box	100	0			2015-05-23 18:14:21
84	58	Dark chocolate with whole almonds	72	paper	100	0	faldone rosso		2015-05-23 18:14:21
85	61	Bitter chocolate	70	paper	100	0	faldone rosso		2015-05-23 18:14:21
86	47	le Noir rond et chalereux	68	paper	250	0			2015-05-23 18:14:21
87	62	Cioccolata al bombardino	0	paper	100	0	faldone giallo	da Luca	2015-05-23 18:14:21
88	52	Cioccolato extra dark	72	paper	100	1	faldone giallo		2015-05-23 18:14:21
89	63	Koybeptoypa	53	paper	200	0	faldone rosso		2015-05-23 18:14:21
90	16	Cioccolato fondente con peperoncino	49	box	100	0	faldone verde		2015-05-23 18:14:21
91	33	Extra fondente Costa Rica con fave di cacao	80	box	100	1	faldone blu		2015-05-23 18:14:21
92	29	Cioccolato gianduia incarto storico	26	paper	100	0	faldone giallo		2015-05-23 18:14:21
93	33	Fondente con zenzero	70	box	50	0	faldone blu		2015-05-23 18:14:21
94	60	Cioccolato extra fondente	75	box	100	1			2015-05-23 18:14:21
95	64	Cioccolato fondente extra	48	box	150	0		da Mariagrazia	2015-05-23 18:14:21
96	64	Cioccolato extra fondente amaro	70	box	150	0		da Mariagrazia	2015-05-23 18:14:21
97	6	Al latte cremoso	30	paper	100	0	faldone giallo		2015-05-23 18:14:21
98	16	Fondente	50	paper	100	0	faldone rosso		2015-05-23 18:14:21
99	39	Salmiakki	30	paper	100	0	faldone rosso		2015-05-23 18:14:21
100	45	Fondente	60	paper	100	0	faldone giallo		2015-05-23 18:14:21
102	31	Grandi Cru del cacao Ecuador (argento)	75	box	75	0	faldone blu		2015-05-23 18:14:21
103	65	Chocolate con leche Criollo Centenario	38	box	500	0		da Mariagrazia	2015-05-23 18:14:21
104	31	Extra fondente con mandorla e arancia	70	box	75	0	faldone blu		2015-05-23 18:14:21
105	29	Cioccolato extra fondente incarto storico	51	paper	100	0	faldone giallo		2015-05-23 18:14:21
106	66	Bitter Cikolata	60	paper	80	0	faldone rosso		2015-05-23 18:14:21
107	57	Cioccolato fondente	72	paper	100	0	faldone giallo		2015-05-23 18:14:21
108	67	Cioccolato puro extra fondente	70	paper	100	1	faldone giallo		2015-05-23 18:14:21
109	43	Composizione numero 1	79	box	50	0			2015-05-23 18:14:21
110	1	Morogoro - Tanzania	70	box	25	0	faldone blu		2015-05-23 18:14:21
111	49	Cioccolato puro	80	box	50	0			2015-05-23 18:14:21
112	68	Finissimo cioccolato fondente extra - Venezuela	85	paper	50	0	faldone giallo		2015-05-23 18:14:21
113	66	Bitter Cikolata	54	paper	80	0	faldone rosso		2015-05-23 18:14:21
114	61	Bitter sweet chocolate  with hazelnuts	43	paper	100	0	faldone rosso		2015-05-23 18:14:21
115	69	Cioccolato di Modica al peperoncino	50	box	100	0	faldone blu		2015-05-23 18:14:21
116	58	Dark chocolate	45	paper	100	1	faldone rosso		2015-05-23 18:14:21
117	52	Cioccolato finissimo al latte	32	paper	100	0	faldone giallo		2015-05-23 18:14:21
118	70	Toscano black cioccolato fondente extra	63	box	50	0	faldone blu		2015-05-23 18:14:21
119	70	Toscano black cioccolato fondente extra	66	box	50	0	faldone blu		2015-05-23 18:14:21
120	13	Gianduia	42	paper	100	0	faldone rosso		2015-05-23 18:14:21
121	13	Fondente con nocciole intere 100 years of Ritter	50	paper	100	0	faldone rosso		2015-05-23 18:14:21
122	31	Nocciolato	31	box	70	0			2015-05-23 18:14:21
123	54	Lake Mivatn	33	paper	100	0	faldone rosso		2015-05-23 18:14:21
124	29	Cioccolato extra al latte incarto storico	35	paper	100	0	faldone giallo		2015-05-23 18:14:21
125	68	Finissimo cioccolato fondente extra - Colombia	75	paper	50	0	faldone giallo		2015-05-23 18:14:21
126	14	Feine bitter kuverture	70	paper	200	0	raccoglitore		2015-05-23 18:14:21
127	16	Cioccolato bianco con frutti di bosco	0	paper	100	0	faldone rosso		2015-05-23 18:14:21
128	29	Sfoglie (2013)	70	box	96	0			2015-05-23 18:14:21
129	46	Fondente con granella di cacao	68	box	75	0			2015-05-23 18:14:21
130	68	Finissimo cioccolato fondente con cristalli di zucchero di canna	70	paper	100	0	faldone giallo		2015-05-23 18:14:21
131	70	Toscano black cioccolato fondente extra	70	box	50	0	faldone blu		2015-05-23 18:14:21
132	31	Puro cioccolato Moscato	30	box	75	0	faldone blu		2015-05-23 18:14:21
133	16	Latte (Natale 2012)	30	paper	100	0	faldone rosso		2015-05-23 18:14:21
134	6	Cioccolato fondente amaro extra	99	box	75	0	faldone blu		2015-05-23 18:14:21
135	71	Juanita all'arancia	60	box	90	0			2015-05-23 18:14:21
136	43	I nudi puro cioccolato fondente	99	paper	50	0	faldone giallo		2015-05-23 18:14:21
137	71	Pepita al tè verde	60	box	90	0			2015-05-23 18:14:21
138	16	Cioccolato fondente con granella alla menta (2013)	50	paper	100	0	faldone rosso		2015-05-23 18:14:21
139	73	Biologische chocolade extra puur	72	paper	100	1	faldone rosso		2015-05-23 18:14:21
140	74	Noir Eclats de cacao	70	box	80	0			2015-05-23 18:14:21
141	74	Chocolat au lait fourrè aux amandes	30	paper	70	0	faldone rosso		2015-05-23 18:14:21
142	74	Chocolat au lait fourrè aux noisettes entières	30	paper	65	0	faldone rosso		2015-05-23 18:14:21
143	74	Chocolat au lait fourrè au praliné	30	paper	70	0	faldone rosso		2015-05-23 18:14:21
144	74	Chocolat au lait fourrè croustillant	30	paper	70	0	faldone rosso		2015-05-23 18:14:21
145	9	Manchò cioccolata modicana con manna	85	box	50	0			2015-05-23 18:14:21
146	14	Feine bitter orange	70	paper	100	0	faldone rosso		2015-05-23 18:14:21
147	9	Cioccolato con cristalli di sale	70	paper	60	0			2015-05-23 18:14:21
148	75	Fondente extra bitter con fruttosio	75	paper	100	0	faldone giallo		2015-05-23 18:14:21
149	16	Cioccolato al latte con pezzi di cocco	30	paper	100	0	faldone rosso		2015-05-23 18:14:21
150	76	Chocolat noir belge	72	paper	70	0	faldone rosso		2015-05-23 18:14:21
151	1	Criollo Puertofino	70	box	25	0	faldone blu		2015-05-23 18:14:21
152	2	Cacao al 100%	100	box	40	0			2015-05-23 18:14:21
153	2	Extra fondente con granella di cacao	75	box	40	0			2015-05-23 18:14:21
154	2	Fondente con anice stellato	65	box	100	0			2015-05-23 18:14:21
155	3	Extra fondente	99	box	100	0			2015-05-23 18:14:21
156	4	Pasta di cacao	100	box	100	1			2015-05-23 18:14:21
157	5	Sao Tomè	80	paper	80	0	faldone giallo		2015-05-23 18:14:21
158	6	Fondente extra amaro	72	paper	100	1	faldone giallo		2015-05-23 18:14:21
159	7	Extra fondente	85	paper	100	1	faldone giallo		2015-05-23 18:14:21
160	7	Extra fondente	75	paper	800	0			2015-05-23 18:14:21
161	7	Extra fondente	75	paper	100	0	faldone giallo		2015-05-23 18:14:21
162	7	Extra fondente (2011)	75	paper	100	0	faldone giallo		2015-05-23 18:14:21
163	8	Mascao fondente extra quinoa e riso	61	box	100	0	faldone blu		2015-05-23 18:14:21
164	8	Mascao fondente extra fave di cacao	73	box	100	0	faldone blu		2015-05-23 18:14:21
165	8	Mascao fondente extra arancia	58	box	100	0	faldone blu		2015-05-23 18:14:21
166	8	Mascao fondente extra	70	box	100	0	faldone blu		2015-05-23 18:14:21
167	8	Companera extra fondente	70	paper	100	0	faldone giallo		2015-05-23 18:14:21
168	9	Manchò cioccolata modicana con manna	45	box	50	0			2015-05-23 18:14:21
169	10	Origine fondente Ghana	70	box	50	0		da Andrea Ginestra	2015-05-23 18:14:21
170	10	Origine fondente Grenade	60	box	50	0		da Andrea Ginestra	2015-05-23 18:14:21
171	11	Herbe zartbitter	74	paper	100	0	faldone rosso		2015-05-23 18:14:21
172	12	Kakao + orange	74	paper	100	0	faldone rosso		2015-05-23 18:14:21
173	13	Fondente	50	paper	100	1	faldone rosso		2015-05-23 18:14:21
174	14	Feine bitter	71	paper	100	0	faldone rosso		2015-05-23 18:14:21
175	15	Ciocolata neagra deosebita	51	paper	100	0	faldone rosso		2015-05-23 18:14:21
176	16	Noir puissant	85	box	100	1	faldone verde		2015-05-23 18:14:21
177	17	Czecholada chili	72	box	90	0			2015-05-23 18:14:21
178	17	Czecholada deserowa	58	box	90	0			2015-05-23 18:14:21
179	17	Czecholada gorzka	72	box	90	0			2015-05-23 18:14:21
180	18	Gorzka	60	box	100	0			2015-05-23 18:14:21
181	18	Gorzka klasyczna	60	paper	90	0	faldone rosso		2015-05-23 18:14:21
182	19	Cocoacara pure dark chocolate	77	box	100	0			2015-05-23 18:14:21
183	19	Cocoacara dark chocolate orange and chili	77	box	100	0			2015-05-23 18:14:21
184	19	Cocoacara dark chocolate coffea and cardamom	77	box	100	0			2015-05-23 18:14:21
185	19	Gorzka	45	paper	100	0	faldone rosso		2015-05-23 18:14:21
186	19	gorzka bakaliowa	45	paper	100	0	faldone rosso		2015-05-23 18:14:21
187	20	Czekolada gorzka	60	paper	100	0	faldone rosso		2015-05-23 18:14:21
188	21	Czekolada gorzka	46	paper	100	0	faldone rosso		2015-05-23 18:14:21
189	21	Czekolada gorzka malinowe	46	paper	100	0	faldone rosso		2015-05-23 18:14:21
190	21	Czekolada extra gorzka	65	paper	90	0	faldone rosso		2015-05-23 18:14:21
191	22	Czekolada gorzka	60	paper	80	0	faldone rosso		2015-05-23 18:14:21
192	23	Czekolada gorzka	70	paper	100	0	raccoglitore		2015-05-23 18:14:21
193	24	Danusia klasyczna deserowa czekolada nadziewana	43	paper	102	0	faldone rosso		2015-05-23 18:14:21
194	24	Gorzka krakowska	70	paper	100	0	faldone rosso		2015-05-23 18:14:21
195	24	Czekolada gorzka	90	paper	100	0	raccoglitore		2015-05-23 18:14:21
196	24	Czekolada gorzka ze skorka pomaranczy	70	paper	100	0	raccoglitore		2015-05-23 18:14:21
197	24	Czekolada gorzka Krakow barbakanem	90	paper	100	0	raccoglitore		2015-05-23 18:14:21
198	24	Czekolada gorzka Warszawa palac kultury i nauky	90	paper	100	0	raccoglitore		2015-05-23 18:14:21
199	24	Czekolada gorzka Krakow municipio	90	paper	100	0	raccoglitore		2015-05-23 18:14:21
200	24	Czekolada gorzka Warszawa plac Zamkowy	90	paper	100	0	raccoglitore		2015-05-23 18:14:21
201	24	Czekolada gorzka Krakow cappella di Sigismondo	90	paper	100	0	raccoglitore		2015-05-23 18:14:21
202	25	Czekolada gorzka 160 lat	64	paper	100	0	faldone rosso		2015-05-23 18:14:21
203	25	Czekolada gorzka	64	paper	100	0	faldone rosso		2015-05-23 18:14:21
204	25	Dark maestria	76	box	100	0			2015-05-23 18:14:21
205	25	Dark maestria with coffea and cocoa nibs	55	box	100	0			2015-05-23 18:14:21
206	25	Dark maestra with raspberry	55	box	100	0			2015-05-23 18:14:21
207	25	Dark maestra with pecan nuts	55	box	100	0			2015-05-23 18:14:21
208	25	Gorzka Krakow 1618	72	box	100	0			2015-05-23 18:14:21
209	25	Gorzka Krakow 1914	72	box	100	0			2015-05-23 18:14:21
210	25	Gorzka syrenka warszawska	72	box	100	0			2015-05-23 18:14:21
211	25	Gorzka Gdansk 1616	72	box	100	0			2015-05-23 18:14:21
212	25	Gorzka Wawel 1869	72	box	100	1			2015-05-23 18:14:21
213	25	Gorzka Fryderyk Chopin 1837	72	box	100	0			2015-05-23 18:14:21
214	25	Gorzka Krakow 1799	72	box	100	0			2015-05-23 18:14:21
215	25	Gorzka Warszawa 1770	72	box	100	0			2015-05-23 18:14:21
216	25	Gorzka dworek chopina	72	box	100	0			2015-05-23 18:14:21
217	25	Gorzka Warszawa 1656	72	box	100	0			2015-05-23 18:14:21
218	25	Gorzka Warszawa 1901	72	box	100	0			2015-05-23 18:14:21
219	25	Gorzka Wawel 1847	72	box	100	0			2015-05-23 18:14:21
220	25	Gorzka pomnik fryderyka chopina	72	box	100	0			2015-05-23 18:14:21
221	25	Czekolada mleczna z nadzieniem o smaku truskawki	31	paper	100	0	faldone rosso		2015-05-23 18:14:21
222	25	Czekolada mleczna z nadzieniem o smaku gruszki	31	paper	100	0	faldone rosso		2015-05-23 18:14:21
223	25	Czekolada mleczna z nadzieniem o smaku wisni	31	paper	100	0	faldone rosso		2015-05-23 18:14:21
1260	16	Fondente prodigioso	90	box	100	0	faldone verde	\N	2020-10-11 14:28:15.932381
225	27	Horka cokolada	86	box	100	0			2015-05-23 18:14:21
226	16	Noir intense	70	box	100	1	faldone verde	da Mariagrazia	2015-05-23 18:14:21
227	16	Noir orange intense	48	box	100	1	faldone verde	da Mariagrazia	2015-05-23 18:14:21
378	124	Dark	72	box	100	1			2015-05-23 18:14:21
228	16	Noir menthe intense	47	box	100	0	faldone verde	da Mariagrazia	2015-05-23 18:14:21
229	29	Semi di cacao	70	box	100	1	faldone blu		2015-05-23 18:14:21
1261	16	Fondente deciso	85	box	100	0	faldone verde	\N	2020-10-11 14:29:32.180385
231	30	Cioccoblocco	43	paper	230	0	faldone giallo	un po' rovinato	2015-05-23 18:14:21
232	16	Noix de coco intense	47	box	100	0	faldone verde		2015-05-23 18:14:21
233	33	Fondente con acai (100% organic)	62	box	50	0	faldone blu		2015-05-23 18:14:21
234	14	Edel bitter cranberry Ecuador	70	box	100	0	faldone verde		2015-05-23 18:14:21
235	77	Chocolade extra puur	70	paper	100	0	faldone rosso		2015-05-23 18:14:21
236	78	Tony's chocolonely	72	paper	180	0	faldone rosso		2015-05-23 18:14:21
237	9	LAeQUA senza spezie	70	box	60	0			2015-05-23 18:14:21
238	79	Pistachio crocan milk chocolate	35	box	60	0			2015-05-23 18:14:21
239	79	Hazelnut crocan milk chocolate	35	box	60	0			2015-05-23 18:14:21
240	80	Finest cacao	60	box	100	0			2015-05-23 18:14:21
241	81	Nocciole ricoperte di cioccolato fondente	61	box	90	0			2015-05-23 18:14:21
242	81	Perle di cereali caramellate al miele ricoperte di cioccolato fondente	66	box	80	0			2015-05-23 18:14:21
243	82	Ciocciolata modicana alla melagrana	50	label	100	0	faldone giallo		2015-05-23 18:14:21
244	83	Cioccolato fondente extra	60	paper	100	0	faldone giallo		2015-05-23 18:14:21
245	84	Braco Mljecna cokolada	30	paper	75	0	faldone rosso		2015-05-23 18:14:21
246	9	LAeQUA alla vaniglia	45	box	60	0			2015-05-23 18:14:21
247	68	Finissimo cioccolato fondente extra - Perù	70	paper	50	0	faldone giallo		2015-05-23 18:14:21
248	46	Fondente	74	box	75	0			2015-05-23 18:14:21
249	71	Juanita senza zucchero	60	box	90	0			2015-05-23 18:14:21
250	85	Cuba gran cru	70	box	72	0			2015-05-23 18:14:21
251	83	Cioccolato fondente extra - Repubblica Dominicana	70	box	100	0	faldone blu		2015-05-23 18:14:21
252	82	Cioccolato di Modica al gelsomino	45	box	50	0			2015-05-23 18:14:21
253	60	Cioccolato fondente	55	paper	100	0	faldone giallo		2015-05-23 18:14:21
254	8	Companera cioccolato bianco	0	paper	100	0	faldone giallo		2015-05-23 18:14:21
255	31	Extra fondente gran selezione degustazione	70	box	70	0	faldone blu		2015-05-23 18:14:21
256	7	Blend fondente extra dark chocolate	90	paper	70	0			2015-05-23 18:14:21
257	71	Cioccolato fondente extra	60	box	90	1			2015-05-23 18:14:21
258	86	Crna malina	70	paper	100	0	faldone rosso		2015-05-23 18:14:21
259	84	Seka mljecna cokolada	30	paper	75	0	faldone rosso		2015-05-23 18:14:21
260	7	Blend fondente extra dark chocolate	80	paper	70	1			2015-05-23 18:14:21
261	7	Extra fondente con Nibs	75	paper	800	0			2015-05-23 18:14:21
262	87	Venezuela Sur del Lago	75	box	50	0			2015-05-23 18:14:21
263	87	Ghana	85	box	100	0			2015-05-23 18:14:21
264	7	Blend fondente extra dark chocolate	60	paper	70	0			2015-05-23 18:14:21
265	7	Blend confezione 3 cioccolate	0	box	210	0			2015-05-23 18:14:21
266	8	Mascao latte	32	box	100	0	faldone blu		2015-05-23 18:14:21
267	50	Cioccolato fondente extra biologico	70	box	100	0	faldone blu		2015-05-23 18:14:21
268	83	Cioccolato finissimo al latte - Caffè della Colombia	32	box	100	0	faldone blu		2015-05-23 18:14:21
269	85	Grand Caraque - Isla Guadelopue	100	box	72	0			2015-05-23 18:14:21
270	85	Tanzania - Ghana - Sao Tomé	80	box	72	0			2015-05-23 18:14:21
271	88	Emilia - cioccolato fondente extra	50	paper	200	0	faldone giallo		2015-05-23 18:14:21
272	89	Squares - milk chocolate with Hazelnut Crisp filling	0	paper	14	0	faldone rosso	da Michela	2015-05-23 18:14:21
273	89	Squares - coockies and creme	0	paper	14	0	faldone rosso	da Michela	2015-05-23 18:14:21
274	89	Squares - dark chocolate with caramel filling	0	paper	14	0	faldone rosso	da Michela	2015-05-23 18:14:21
275	90	Cioccolato modicano al caffè	50	box	100	0		da Stefania e Diego	2015-05-23 18:14:21
276	91	Cranberry - limited edition	52	box	125	0			2015-05-23 18:14:21
277	91	Cranberry - limited edition	52	paper	25	1			2015-05-23 18:14:21
278	87	Fondente con avena	70	box	80	0			2015-05-23 18:14:21
279	92	Cioccolato fondente e nocciole	60	paper	100	0	faldone giallo		2015-05-23 18:14:21
280	89	Squares - dark chocolate with truffle filling	0	paper	14	0	faldone rosso	da Michela	2015-05-23 18:14:21
281	83	Cioccolato fondente extra dark	70	paper	100	1	faldone giallo		2015-05-23 18:14:21
282	6	Cioccolato fondente extra	50	paper	200	0	faldone giallo		2015-05-23 18:14:21
283	54	Rjomasukkuladi	33	paper	20	0	faldone rosso		2015-05-23 18:14:21
284	87	Cioccolato fondente	70	label	100	0	faldone giallo		2015-05-23 18:14:21
285	16	Orange & Pistache	31	box	97	0	faldone verde	da zia Gabri	2015-05-23 18:14:21
286	91	Mousse au chocolat Orange	85	box	188	0			2015-05-23 18:14:21
287	91	Mousse au chocolat Orange	85	paper	38	1			2015-05-23 18:14:21
288	16	Nougatcreme Haselnuss Mandel	0	box	100	0	faldone verde		2015-05-23 18:14:21
289	50	Cioccolato fondente extra	50	paper	100	0	faldone giallo		2015-05-23 18:14:21
290	54	Vulcano eruptionin Fimmvorduhals	33	paper	100	0	faldone rosso		2015-05-23 18:14:21
291	94	No. 1 mit feinstem kakao aus Ecuador	72	box	100	0			2015-05-23 18:14:21
292	95	Cioccolato extra amaro	75	paper	100	1	faldone giallo		2015-05-23 18:14:21
293	81	miscela fondente 80%	80	label	100	0	faldone giallo		2015-05-23 18:14:21
294	96	Tavoletta artigianale extrafondente al 87%	87	paper	100	0	faldone giallo		2015-05-23 18:14:21
295	97	Noir 75% cacao	75	box	100	0			2015-05-23 18:14:21
296	98	Suha smokva & prosek	70	box	50	0			2015-05-23 18:14:21
297	99	elite chocolate 75% cocoa	75	paper	100	0	faldone rosso		2015-05-23 18:14:21
298	64	Cioccolato fondente extra con nocciole	45	box	150	0		da Mariagrazia	2015-05-23 18:14:21
299	100	Confiserie Chocolade - Marc de Champagne Truffel	35	box	100	0		da Mariagrazia	2015-05-23 18:14:21
300	96	Tavoletta artigianale extrabitter al 98%	98	paper	100	0	faldone giallo		2015-05-23 18:14:21
301	81	Monovarietà Cumarebo	70	label	100	0	faldone giallo		2015-05-23 18:14:21
302	31	Gran selezione degustazione Ghana	70	box	75	0	faldone blu		2015-05-23 18:14:21
303	92	Gran cru Piura Pachiza Perù	70	box	100	0			2015-05-23 18:14:21
304	87	Lime e Zenzero	70	box	50	1			2015-05-23 18:14:21
305	87	Mirtillo e Lampone	70	box	50	1			2015-05-23 18:14:21
306	101	Cioccolato fondente con cannella	75	box	50	0	faldone blu		2015-05-23 18:14:21
307	89	Peppermint bark	0	box	85	0	faldone verde		2015-05-23 18:14:21
308	102	Nocciolato	30	box	100	0			2015-05-23 18:14:21
310	41	Extra Bitter 2013	81	paper	100	0	faldone giallo		2015-05-23 18:14:21
311	103	Walnuts & honey	30	box	100	0			2015-05-23 18:14:21
312	104	Chocolat noir tradition	72	box	100	0			2015-05-23 18:14:21
313	105	Chocolate noir aux eclats de cacao	76	box	100	0			2015-05-23 18:14:21
314	106	Chocolate preto (1930-1940, reeditada 2012)	70	paper	100	0	faldone rosso		2015-05-23 18:14:21
315	107	Chocolate de mi pueblo	70	paper	125	0	faldone rosso		2015-05-23 18:14:21
316	84	Seka i Braco Mlijecna cokolada s ljesnjacima	30	paper	75	0	faldone rosso		2015-05-23 18:14:21
317	108	Intenso cacao criollo e trinitario	73	box	80	0	faldone blu		2015-05-23 18:14:21
318	87	Fondente sale delle hawaii	70	box	50	0			2015-05-23 18:14:21
320	16	Lindor extra fondente	60	paper	100	0	faldone rosso		2015-05-23 18:14:21
321	92	Gran cru Las Palmas Santo Domingo	75	box	100	0			2015-05-23 18:14:21
322	13	Halbbitter	50	paper	100	0	faldone rosso		2015-05-23 18:14:21
323	109	Puro cioccolato extra fondente	52	paper	200	0	faldone giallo		2015-05-23 18:14:21
324	83	Cioccolato fondente extra - Ecuador	70	box	100	1	faldone blu		2015-05-23 18:14:21
325	98	Lavanda	70	box	50	0			2015-05-23 18:14:21
326	70	Porcelana	70	box	50	0	faldone blu		2015-05-23 18:14:21
327	110	Cioccolato fondente extra amaro	60	box	100	0			2015-05-23 18:14:21
328	110	Cioccolato fondente al vin brulè	55	box	100	0			2015-05-23 18:14:21
329	1	Criollo Javablond	70	box	25	0			2015-05-23 18:14:21
330	71	Pepita cioccolato bianco al mirtillo	35	box	90	0			2015-05-23 18:14:21
331	111	Noir Premium	72	box	100	0			2015-05-23 18:14:21
333	16	Fondente nocciole	45	paper	100	0	faldone rosso		2015-05-23 18:14:21
334	16	Latte nocciole	30	paper	100	0	faldone rosso		2015-05-23 18:14:21
335	112	Villa Gracinda, Sao Tomè	67	box	70	0	faldone verde		2015-05-23 18:14:21
336	113	Bolivia selvaggio 60h concaggio	68	paper	50	0	faldone giallo		2015-05-23 18:14:21
337	87	Santo Domingo	85	box	80	0			2015-05-23 18:14:21
338	114	Ivory coast & ecuadorian plain chocolate	85	box	100	0		da Sarah	2015-05-23 18:14:21
339	115	Gran cacao	90	box	100	0	faldone blu		2015-05-23 18:14:21
340	87	Sale delle Hawaii (2014)	70	box	50	0			2015-05-23 18:14:21
341	116	The Shops at Darlington: Dark, rich and velvety	56	box	100	0		da Sarah	2015-05-23 18:14:21
342	1	Criollo Chuao	70	box	25	0			2015-05-23 18:14:21
343	115	LatteNero	70	box	100	0	faldone blu		2015-05-23 18:14:21
344	89	Vanilla dream - white chocolate with vanilla beans	0	paper	11	0	faldone rosso	da Michela	2015-05-23 18:14:21
345	16	Eiscafé	0	box	100	0	faldone verde	da Giulia	2015-05-23 18:14:21
346	31	Cioccolato bianco con champagne e ribes nero	0	box	75	0	faldone blu	da Alice	2015-05-23 18:14:21
347	111	Noir Premium	78	box	100	0			2015-05-23 18:14:21
348	111	Noir Premium	85	box	100	0			2015-05-23 18:14:21
349	98	Malinovo Ulje	70	box	50	0			2015-05-23 18:14:21
350	87	sud americano Porcellana	85	box	80	0			2015-05-23 18:14:21
351	7	Biologico 3 cioccolate	0	box	210	0			2015-05-23 18:14:21
352	7	Sali del mediterraneo 3 cioccolate	0	box	210	0			2015-05-23 18:14:21
353	8	Mascao fondente extra menta	61	box	100	0	faldone blu		2015-05-23 18:14:21
354	16	Aprikose-Mandel	0	box	100	0	faldone verde	da Giulia	2015-05-23 18:14:21
355	117	Noblesse	55	box	100	0			2015-05-23 18:14:21
356	16	Mousse au chocolat Feinherb	35	box	140	0	raccoglitore	da Giulia	2015-05-23 18:14:21
357	112	Grand noir	85	paper	30	0	faldone rosso		2015-05-23 18:14:21
358	1	Criollo Guasare	70	box	25	0			2015-05-23 18:14:21
359	118	Ecuador degustazione	72	box	70	0			2015-05-23 18:14:21
360	87	Cioccolato fondente e mirtillo rosso	72	box	80	0			2015-05-23 18:14:21
361	87	Nocciola delle langhe	50	box	50	0			2015-05-23 18:14:21
362	98	Dalmatinski Rogac	70	box	50	0			2015-05-23 18:14:21
363	113	Criollo peruano	100	paper	50	0	faldone giallo		2015-05-23 18:14:21
364	31	Gianduia gran selezione degustazione	31	box	75	0	faldone blu	da Alice	2015-05-23 18:14:21
365	7	Cacao fino aromatico Criollo Blanco e nacional Amendolado	70	paper	70	0			2015-05-23 18:14:21
366	16	Cioccolato fondente con granella alla menta (2014)	50	paper	100	0	faldone rosso		2015-05-23 18:14:21
367	16	Cioccolato al latte con granella di cocco (2014)	30	paper	100	0	faldone rosso		2015-05-23 18:14:21
368	16	Cioccolato bianco con biscotti al cacao, nocciole e wafer (2014)	0	paper	100	0	faldone rosso		2015-05-23 18:14:21
369	46	Cioccolato grezzo alla pietra all'arancia	70	box	55	0	faldone blu		2015-05-23 18:14:21
370	115	Gran cacao Perù Apurimac	70	box	100	0	faldone blu		2015-05-23 18:14:21
1262	16	Framboise noisette	70	box	100	0	faldone verde	\N	2020-10-11 14:30:36.914281
372	120	Cioccolato fondente extra	72	paper	100	1	faldone giallo		2015-05-23 18:14:21
373	121	Mork chokolade	70	box	100	0		da Francesco	2015-05-23 18:14:21
374	87	Cioccolato con more delle dolomiti	70	box	60	0			2015-05-23 18:14:21
375	16	Fraise intense	47	box	100	0	faldone verde		2015-05-23 18:14:21
376	122	Fondente - Anice	72	box	50	0			2015-05-23 18:14:21
377	123	Edel bitter	70	box	0	0			2015-05-23 18:14:21
319	13	Knusperflakes mit knutsprigen Cornflakes	30	paper	100	0	faldone rosso		2015-05-23 18:14:21
379	125	Noir Degustation Republique Dominicaine	80	box	100	0			2015-05-23 18:14:21
380	126	Fondant Sao Thome	70	box	100	0			2015-05-23 18:14:21
381	127	Patè	90	paper	100	0	faldone giallo		2015-05-23 18:14:21
382	128	Cioccolato fondente	52	paper	100	0	faldone giallo		2015-05-23 18:14:21
383	74	Noir profond	85	box	80	0			2015-05-23 18:14:21
384	70	Chuao	70	box	50	0	faldone blu		2015-05-23 18:14:21
385	129	Extra bitter blend 75%	75	box	110	0		da Andrea e Mariagrazia	2015-05-23 18:14:21
386	130	Finest Dark chocolate	70	box	125	0			2015-05-23 18:14:21
387	130	Finest Dark Chocolate	70	paper	25	1			2015-05-23 18:14:21
388	7	Cioccolato extra fondente alla lavanda, con fiori di sale e arancia	60	paper	70	0			2015-05-23 18:14:21
389	115	LatteNero	62	box	100	0	faldone blu		2015-05-23 18:14:21
390	112	Noir infini	99	paper	30	0	faldone rosso		2015-05-23 18:14:21
391	131	Luxury dark chocolate solid bar	52	box	90	0		da fabrizio e samanta	2015-05-23 18:14:21
392	74	Noir menthe - citron vert	70	box	80	0			2015-05-23 18:14:21
393	160	Piacere fondente extra cacao	45	paper	100	0	faldone giallo		2015-05-23 18:14:21
394	134	Noir intense	70	box	100	0			2015-05-23 18:14:21
395	135	Milk chocolate with fruit & nuts	29	paper	300	0			2015-05-23 18:14:21
396	8	Blocco di cioccolato	60	paper	200	0	faldone giallo		2015-05-23 18:14:21
397	16	Extra fondente 2015	72	paper	100	0	faldone rosso		2015-05-23 18:14:21
398	136	Dark chocolate	70	paper	100	0	faldone rosso		2015-05-23 18:14:21
399	137	Mork belisk chokolade	55	box	85	0			2015-05-23 18:14:21
400	127	Acacia	65	paper	120	0	faldone giallo		2015-05-23 18:14:21
401	29	Nero fondente extra	70	box	100	1	faldone blu		2015-05-23 18:14:21
402	29	Nero semi di cacao	70	box	100	0	faldone blu		2015-05-23 18:14:21
403	7	Cacao fino aromatico Criollo Blanco e nacional Amendolado	100	paper	70	0			2015-05-23 18:14:21
404	138	Dark-noir	0	paper	87	0	faldone giallo		2015-05-23 18:14:21
405	131	Luxury dark chocolate truffle bar	52	box	90	0			2015-05-23 18:14:21
406	139	Irish dark chocolate bar	60	box	100	0			2015-05-23 18:14:21
407	14	Edel bitter chili Ecuador	70	box	100	0	faldone verde	da Francesco	2015-05-23 18:14:21
408	7	Nibs di fave tostate di cacao Criollo Blanco e Nacional Amendolado	70	paper	70	0			2015-05-23 18:14:21
409	140	Cioccolato fondente ripieno al cocco	60	paper	25	0	faldone giallo		2015-05-23 18:14:21
410	31	Extra fondente (2014)	88	box	75	0	faldone blu	da Alice	2015-05-23 18:14:21
411	87	Tavolozza fondente 70%	70	box	220	0			2015-05-23 18:14:21
412	141	Panama	80	paper	85	0	faldone rosso		2015-05-23 18:14:21
413	142	Goldenberries	60	box	50	0			2015-05-23 18:14:21
414	140	Cioccolato al latte con nocciole	39	paper	35	0	faldone giallo		2015-05-23 18:14:21
415	140	Fondente ripieno alla nocciola e cereali	60	paper	25	0	faldone giallo		2015-05-23 18:14:21
416	140	Cioccolato fondente 72%	72	paper	35	0	faldone giallo		2015-05-23 18:14:21
417	140	Cioccolato bianco ai mirtilli	0	paper	35	0	faldone giallo		2015-05-23 18:14:21
418	124	Dark	85	box	100	0			2015-05-23 18:14:21
419	31	Cioccolato extra fondente con cristalli alla menta	70	box	75	0	faldone blu	da Alice	2015-05-23 18:14:21
420	7	Cioccolato extra fondente aromatico, con fior di sale e nibs	80	paper	70	0			2015-05-23 18:14:21
421	16	Lime intense	47	box	100	0	faldone verde		2015-05-23 18:14:21
422	25	Czekolada gorzka (2014)	64	paper	100	0	faldone rosso		2015-05-23 18:14:21
423	8	Bribon fondente zenzero e limone (2014)	60	paper	30	0	faldone giallo		2015-05-23 18:14:21
424	140	Cioccolato al latte ripieno al latte e cereali	32	paper	25	0	faldone giallo		2015-05-23 18:14:21
425	9	A ccioccolata al mascobado	45	paper	60	0			2015-05-23 18:14:21
426	140	Cioccolato al latte e caramel	39	paper	35	0	faldone giallo		2015-05-23 18:14:21
427	143	Vietnam	80	paper	45	0	faldone rosso		2015-05-23 18:14:21
428	14	Vollmilch mandel	33	box	100	0	faldone verde		2015-05-23 18:14:21
429	144	Chocolat noir grand cru n°2	90	box	100	0			2015-05-23 18:14:21
430	145	cioccolato al latte con Bombardino	30	paper	100	0	faldone giallo	da genitori Cecilia	2015-05-23 18:14:21
431	29	Tablò fondente	45	paper	80	0	faldone giallo		2015-05-23 18:14:21
432	29	Tablò fondente	46	paper	80	0	faldone giallo		2015-05-23 18:14:21
433	146	Dark chocolate trio of Madagascan peppers	70	box	75	0	faldone verde		2015-05-23 18:14:21
434	70	Blanco de criollo novembre 2012	70	box	50	0	faldone blu		2015-05-23 18:14:21
435	71	Juanita fondente extra	60	box	90	0			2015-05-23 18:14:21
436	6	Cioccolato al latte finissimo (solo con puro cacao)	30	paper	100	0	faldone giallo		2015-05-23 18:14:21
437	1	Il blend	70	box	25	0	faldone blu		2015-05-23 18:14:21
438	147	Chocolate sin szucares anadidos	54	paper	85	0	faldone rosso		2015-05-23 18:14:21
439	29	Cioccolato fondente nocciole, mandorle e mirtilli	54	paper	195	0	raccoglitore		2015-05-23 18:14:21
440	148	Ba Ria so-co-laden	76	paper	100	0	faldone rosso		2015-05-23 18:14:21
441	46	Cioccolato fondente senza zuccheri	64	box	75	0			2015-05-23 18:14:21
442	50	cioccolato fondente extra	50	paper	200	0	faldone giallo		2015-05-23 18:14:21
443	41	Extra Bitter	73	paper	100	0	faldone giallo		2015-05-23 18:14:21
444	149	cioccolato fondente extra amaro	70	box	100	0			2015-05-23 18:14:21
445	16	Dark chocolate cookie	47	box	100	0	faldone verde		2015-05-23 18:14:21
446	34	Fondente macchiato	73	box	100	0			2015-05-23 18:14:21
447	146	Dark bar	100	box	100	0	faldone verde		2015-05-23 18:14:21
448	150	Extra dark chocolate chilli and lime	72	paper	85	0	faldone rosso		2015-05-23 18:14:21
449	7	Cuor di cacao	56	paper	100	0	faldone giallo		2015-05-23 18:14:21
450	16	Duetto cioccolato fondente con biscotto al cacao	45	paper	120	0	faldone rosso		2015-05-23 18:14:21
451	151	Fondente	0	paper	0	0	faldone giallo		2015-05-23 18:14:21
452	152	Cioccolato al latte con nocciole intere	30	paper	100	0	faldone rosso	da Steve	2015-05-23 18:14:21
453	13	Fondente extra (novità)	73	paper	100	1	faldone rosso		2015-05-23 18:14:21
454	16	Noir intense (scadenza dorata, 2014)	70	box	100	1	faldone verde		2015-05-23 18:14:21
455	69	Cioccolato di modica alla vaniglia	50	box	100	0	faldone blu		2015-05-23 18:14:21
456	14	Feine bitter Panama	92	box	80	0	faldone verde		2015-05-23 18:14:21
457	153	Emergency cioccolato fondente	60	box	100	0			2015-05-23 18:14:21
458	154	Limited edition - Alto Piura - Perou	85	box	80	0			2015-05-23 18:14:21
459	7	Cioccolato latte al mandarino, con fior di sale e pepe	32	paper	70	0			2015-05-23 18:14:21
460	155	Noir Ecuador	77	box	100	0		da Steve	2015-05-23 18:14:21
461	156	Grenade	60	box	25	0			2015-05-23 18:14:21
462	6	Ghana cioccolato amaro delicato 2015	70	box	75	0	faldone blu		2015-05-23 18:14:21
463	83	Cioccolato bianco biologico vaniglia del Madagascar	0	box	100	0	faldone blu		2015-05-23 18:14:21
464	83	Cioccolato fondente extra - Repubblica Dominicana 2015	70	box	100	0	faldone blu		2015-05-23 18:14:21
465	1	Il 100%	100	box	25	1	faldone blu		2015-05-23 18:14:21
466	157	Almond milk	40	box	45	0			2015-05-23 18:14:21
467	49	Cioccolato puro	90	box	50	0			2015-05-23 18:14:21
468	158	#50 Dark chocolate / Tonka beans / Lemon	40	box	75	0			2015-05-23 18:14:21
469	159	Puro cioccolato extra fondente - Cuba	70	paper	100	0	faldone giallo		2015-05-23 18:14:21
470	159	Puro cioccolato extra fondente con cardamomo	60	paper	100	0	faldone giallo		2015-05-23 18:14:21
471	7	You're sweet like chocolate	56	paper	45	0	faldone giallo		2015-05-23 18:14:21
472	99	bitter chocolate	58	paper	100	0	faldone rosso		2015-05-23 18:14:21
473	160	con nocciole	30	paper	100	0	faldone giallo		2015-05-23 18:14:21
474	160	Milka & Oreo	12	paper	100	0	faldone giallo		2015-05-23 18:14:21
1263	16	Fondente con mandorle tostate (10€ in buoni)	45	paper	100	0	faldone verde	\N	2020-10-11 14:34:36.61488
477	159	Puro cioccolato extra fondente con zenzero	60	paper	100	0	faldone giallo		2015-05-23 18:14:21
478	161	cioccolato fondente con stevia	70	paper	100	0	faldone giallo		2015-05-23 18:14:21
479	7	Cioccolato extra fondente	80	paper	45	0	faldone giallo		2015-05-23 18:14:21
480	6	Fondente extra amaro (solo con puro cacao, 2015) 	72	paper	100	1	faldone giallo		2015-05-23 18:14:21
481	1	Cioccolato fondente extra Arriba	50	box	50	0			2015-05-23 18:14:21
482	13	Fondente con nocciole intere	50	paper	100	1	faldone rosso		2015-05-23 18:14:21
483	7	Fondente extra dark chocolate nibs	75	paper	800	0	\N	\N	2015-06-21 14:44:38
484	7	Blend confezione 3 cioccolate 2016	0	box	210	0	\N	\N	2015-06-21 14:50:43
485	7	Blend fondente extra dark chocolate 2016	60	paper	70	0		\N	2015-06-21 14:50:43
486	7	Blend fondente extra dark chocolate 2016	90	paper	70	0	\N	\N	2015-06-21 14:50:43
487	68	Finissimo cioccolato fondente extra Blend -Perù	70	paper	50	0			2015-06-21 14:59:27
488	68	Finissimo cioccolato fondente extra Blend - Colombia	75	paper	50	0			2015-06-21 14:59:27
489	68	Finissimo cioccolato fondente extra Blend - Venezuela	85	paper	50	0		\N	2015-06-21 14:59:27
490	68	Le rotte del cacao	0	box	150	0		\N	2015-06-21 14:59:27
491	47	Blond Dulcey	32	box	70	0			2015-06-21 15:08:08
492	47	Lait Tanariva Madagascar	33	box	70	0			2015-06-21 15:08:08
493	47	Lait Jivara	40	box	70	0			2015-06-21 15:08:08
494	47	Noir Alpaco Ecuador	66	box	70	0			2015-06-21 15:08:08
495	47	Noir Tainori Dominican Republic	64	box	70	0			2015-06-21 15:08:08
496	47	Noir Caraibe	66	box	70	0			2015-06-21 15:08:08
498	47	Collection Grands Crus	0	box	560	0		\N	2015-06-21 15:08:08
499	16	Mousse au chocolat Weiss	36	box	140	0	raccoglitore	\N	2015-06-21 15:11:46
500	50	cioccolato fondente extra biologico 2015	70	box	100	0	faldone blu	\N	2015-06-21 15:14:03
501	50	cioccolato fondente di Modica	60	box	75	0	faldone blu	\N	2015-06-21 15:15:56
502	49	Cioccolato puro con scorza d'arancia	65	box	50	0		da Steve	2015-06-21 15:18:51
503	49	Cioccolato cannella	50	paper	100	0	faldone giallo	da Steve	2015-06-21 15:18:51
504	49	Cioccolato vaniglia	50	paper	100	1	faldone giallo	da Steve	2015-06-21 15:18:51
505	162	Chocolat fondant Sao Thomé	70	box	85	0		\N	2015-06-21 15:22:43
506	144	Chocolat collection 2	85	box	100	0	faldone verde	\N	2015-06-21 15:24:12
507	126	Sambirano Madagascar	72	box	80	0		\N	2015-06-21 15:25:18
508	164	Chocolate soft com nibs de cacau	73	paper	50	0	faldone rosso	\N	2015-06-21 15:32:39
509	160	con tenero cuore al cacao	8	paper	100	0	faldone giallo		2015-06-21 15:34:42
510	165	Fondente noir	72	paper	100	1	faldone giallo		2015-06-21 15:38:51
511	165	Fondente	50	paper	100	0	faldone giallo	\N	2015-06-21 15:38:51
512	165	Cioccolato fondente biologico equosolidale Repubblica Dominicana	70	paper	100	0	faldone giallo		2015-06-21 15:44:47
513	166	Chuao Venezuela	75	paper	100	0	faldone rosso		2015-06-21 15:48:09
514	50	Fondente extra con nocciole intere (2015)	54	paper	130	0	faldone giallo		2015-06-21 15:50:36
515	167	Fondente lampone grand cru Venezuela	66	paper	50	0	faldone giallo		2015-06-21 15:57:03
516	167	Fondenete limone di Sorrento grand cru Venezuela	66	paper	50	0	faldone giallo		2016-02-14 15:42:47
517	167	Fondente grand cru Venezuela	72	paper	50	0	faldone giallo		2015-06-21 15:57:03
518	168	Dark	96	paper	100	0	faldone rosso		2015-06-21 15:59:16
519	8	Cioccolato finissimo al latte	34	paper	20	0	faldone giallo		2015-06-21 16:01:04
520	16	Fondente con pezzi di cocco	50	paper	100	0	faldone rosso	\N	2015-08-09 16:19:27
521	16	Latte con toffee e liquirizia	30	paper	100	0	faldone rosso	\N	2015-08-09 16:21:58
522	169	Cioccolato fondente	60	paper	85	1	faldone giallo	\N	2015-08-09 16:24:50
523	169	Cioccolato fondente	70	paper	85	1	faldone giallo	\N	2015-08-09 16:24:50
524	7	I love you more than i love chocolate	56	paper	45	0	faldone giallo	\N	2015-08-09 16:27:20
525	170	Chocolate negro	70	paper	100	0	faldone rosso	\N	2015-08-09 16:30:12
526	171	Chocolate Negro com Pimentas	57	paper	200	0	faldone rosso	\N	2015-08-09 16:34:34
527	172	Chocolate negro vinho do porto	70	paper	200	0	faldone rosso	\N	2015-08-09 16:37:26
530	104	Chocolat noir au cafè	72	box	100	0		\N	2015-08-09 16:47:42
531	33	Extra fondente Costa Rica (biologico equosolidale)	71	box	100	0	faldone blu	\N	2015-08-09 16:49:58
532	33	Extra fondente Costa Rica (2015)	71	box	100	1	faldone blu	\N	2015-08-09 16:51:51
533	31	Cioccolato con Barbaresco	30	box	75	0	faldone blu	\N	2015-08-09 16:52:50
534	69	Cioccolato di Modica alla Vaniglia (2015)	50	box	100	1	faldone blu	\N	2015-08-09 16:59:36
535	173	Chocolate preto	72	box	200	0		\N	2015-08-09 17:01:29
536	16	Latte con 3 cereali e lamponi	30	paper	100	0	faldone rosso	\N	2015-08-09 17:08:25
537	13	keks + nuss	30	paper	250	0	raccoglitore	dal Whites	2015-10-10 14:27:05
538	13	Noccio biscotto	30	paper	100	1	faldone rosso	\N	2015-10-10 14:28:42
539	166	Noir	100	paper	100	0	faldone rosso	\N	2015-10-10 14:49:51
540	160	Sweet winter	30	paper	100	0	faldone giallo	\N	2015-10-10 14:53:08
541	6	Novibloc - cioccolato fondente extra	50	paper	150	1	faldone giallo	\N	2015-10-10 15:00:43
542	2	Extra fondente	70	box	100	0		\N	2015-10-11 14:23:15
543	69	Cioccolato di Modica al pistacchio	50	box	100	1	faldone blu	\N	2015-10-11 14:32:06
544	175	Lacrì blend Madagascar	76	box	100	0		\N	2015-10-11 14:34:51
545	176	Cioccolato alla cannella 2015	55	box	100	0	faldone blu	\N	2015-10-11 14:36:31
546	177	Ecuador puro Criollo grand cru	75	box	50	0		\N	2015-10-11 14:38:19
547	178	Noir Uganda	80	box	100	0		\N	2015-10-11 14:41:49
548	179	Repubblica Dominicana	70	box	100	0		\N	2015-10-11 14:44:25
549	179	Perù	70	box	100	0		\N	2015-10-11 14:44:25
550	33	Fondente con acai (2015)	62	box	50	0	faldone blu	da Francesco De Marchi	2015-10-11 14:46:44
551	180	Dark chocolate	72	box	100	0		\N	2015-10-11 14:49:06
552	6	Ecuador cioccolato aromatico intenso (2015)	75	box	75	0	faldone blu	\N	2015-10-11 14:52:29
553	6	Extra fondente con scorzette di arancia e mandorle	70	box	75	1	faldone blu	\N	2015-10-11 14:53:19
555	181	Cioccolato puro fondente finissimo	52	paper	100	0	faldone giallo	\N	2015-11-22 17:23:09
556	50	Cioccolato fondente extra	72	paper	100	0	faldone giallo		2015-11-22 17:25:23
557	150	Extra dark chocolate pumpkin seeds and hemp oil	72	paper	85	0	faldone rosso	\N	2015-11-22 17:26:59
558	6	Cioccolato al latte finissimo con nocciole	30	paper	100	1	faldone giallo	da Francesco De Marchi	2015-11-22 17:32:03
559	6	Cioccolato fondente extra con nocciole	50	paper	100	1	faldone giallo	da Francesco de Marchi	2015-11-22 17:32:03
560	182	Chocolate negro ecologico Filipinas	71	paper	125	0	raccoglitore	da Steve	2015-11-22 17:34:46
561	109	Cioccolato extra fondente	55	paper	200	0	faldone giallo	da Steve	2015-11-22 17:40:13
562	183	Cioccolato extrafondente	75	paper	200	0	faldone giallo	da Whites	2015-11-22 17:42:07
563	160	Bubbly latte	30	paper	90	0	faldone giallo	\N	2015-11-22 17:48:12
564	160	Cioccolato al latte & Cracker TUC	30	paper	87	0	faldone giallo	\N	2015-11-22 17:48:12
565	160	Cioccolato al latte e biscotti ORO	30	paper	87	0	faldone giallo	\N	2015-11-22 17:48:12
566	13	Cioccolato al latte extra con biscotto al burro e crema fine al cacao	29	paper	100	0	faldone rosso	\N	2015-11-22 17:53:14
567	31	Cioccolato bianco con estratto naturale di rosa	0	box	75	0	faldone blu	\N	2015-11-22 17:59:13
568	31	Cioccolato extra fondente con scorza di limone e cristalli al ginger	70	box	75	0	faldone blu	\N	2015-11-22 17:59:13
569	16	Noir puissant (2015)	85	box	100	1	faldone verde		2015-11-22 18:04:51
570	8	Cioccolato fondente extra Cru di Cacao Arriba Ecuador	70	box	50	0		\N	2015-11-22 18:08:40
571	184	Dark chocolate with cherries	68	box	85	0		\N	2015-11-22 18:12:39
572	4	Fondente extra	73	box	73	0		\N	2015-11-22 18:14:21
573	108	Blend extra fondente	85	box	80	0	faldone blu	\N	2015-11-22 18:15:56
574	185	Cioccolato senza zucchero	60	box	100	0		da Steve	2015-11-22 18:26:02
575	185	Cioccolato caffè	50	box	100	0		da Steve	2015-11-22 18:26:02
576	185	Cioccolato menta	50	box	100	0		da Steve	2015-11-22 18:26:02
577	186	Cioccolato di Modica Liquirizia	50	box	100	1	faldone blu	da Steve	2015-11-22 18:30:03
578	69	Cioccolato di Modica alla Cannella	50	box	100	0	faldone blu	da Steve	2015-11-22 18:53:50
579	50	Cioccolato fondente di Modica al peperoncino	50	box	75	0	faldone blu	da Steve	2015-11-22 18:57:08
580	187	Noir fleur de sel	70	box	70	0	\N	\N	2016-01-01 16:10:35
581	31	Cioccolato extra fondente con cristalli alla menta (2015)	70	box	75	0	faldone blu	\N	2016-01-01 16:16:46
582	31	Cioccolato bianco con foglie di menta piperita del Piemonte	0	box	75	0	faldone blu	\N	2016-01-01 16:18:25
583	6	Cioccolato extra fondente con scorzette di limone e cristalli allo zenzero	70	box	75	1	faldone blu	\N	2016-01-01 16:20:29
584	115	Gran boquet Peperoncino	73	box	100	0	faldone blu	\N	2016-01-01 16:22:27
585	188	Cioccolato extra fondente Chocolate meets webdesign	50	box	50	1	faldone blu	\N	2016-01-01 16:34:20
586	188	Cioccolato finissimo al latte Chocolate meets webdesign	30	box	50	0	faldone blu	\N	2016-01-01 16:34:20
587	186	Cioccolato di Modica Cocco	50	box	100	0	faldone blu	da Steve	2016-01-01 16:35:38
588	189	Xocolata Ghana	70	box	70	0		\N	2016-01-01 16:42:21
589	14	Feine bitter with coconut blossom nectar Panama (new)	75	box	80	0	faldone verde	\N	2016-01-01 16:46:54
590	108	Speziali caffè e cardamomo	62	box	80	0	faldone blu		2016-01-01 16:48:17
591	70	Toscano cioccolato Gianduja	32	box	50	0	faldone blu	da Steano Valle	2016-01-01 16:49:47
592	70	Toscano cioccolato bianco	29	box	50	0	faldone blu	da Francesco De Marchi	2016-01-01 16:49:47
593	14	Feine bitter orange 2015	70	paper	100	0	faldone rosso		2016-01-01 16:55:52
594	190	Chocolate negro	70	paper	300	0	raccoglitore	\N	2016-01-01 16:58:23
595	191	Weisse schokolade mit mohn und Limonenol	30	paper	50	0	faldone rosso	da Flavio	2016-01-01 17:04:53
596	192	Chocolate	70	paper	75	0	faldone rosso	\N	2016-01-01 17:07:29
597	160	con nocciole 2015	30	paper	100	0	faldone giallo	\N	2016-01-01 17:11:42
598	160	Riso soffiato	30	paper	100	0	faldone giallo	\N	2016-01-01 17:11:42
599	32	Schocolade handgeschopft Kurbis	60	paper	100	0	faldone rosso	\N	2016-02-20 16:48:15
600	78	Tiny Tony	48	paper	5	0	faldone rosso	\N	2016-02-20 17:15:50
601	14	Dunkle nougat	36	paper	100	0	faldone rosso	\N	2016-02-21 10:10:10
602	193	Chocolate puro Ghana costa de marfil	85	paper	125	0	faldone rosso	\N	2016-02-21 10:13:12
603	194	Chocolate familiar a la taza	30	paper	200	0	raccoglitore	\N	2016-02-21 10:15:38
604	16	Lindor extra fondente	60	paper	38	0	faldone rosso	\N	2016-02-21 10:18:31
605	13	Yogurt	0	paper	17	1	faldone rosso	\N	2016-02-21 10:23:20
606	13	Latte	35	paper	17	1	faldone rosso	\N	2016-02-21 10:23:20
607	13	Marzapane	0	paper	17	0	faldone rosso	\N	2016-02-21 10:23:20
608	13	Biscotto	0	paper	17	0	faldone rosso	\N	2016-02-21 10:23:20
609	13	Cornflakes	30	paper	17	0	faldone rosso	\N	2016-02-21 10:23:20
610	68	Cioccolato fondente extra	75	paper	100	0	faldone giallo	\N	2016-02-21 10:26:42
611	195	Cioccolata modicana peperoncino	50	paper	100	1	faldone giallo	\N	2016-02-21 10:29:30
612	70	9	75	box	50	0	faldone blu	\N	2016-02-21 10:38:20
613	31	Puro cioccolato moscato (2016)	30	box	75	0	faldone blu	\N	2016-02-21 10:43:14
614	196	Dark chocolate Costa Rica	71	box	100	0	faldone verde	\N	2016-02-21 16:18:35
615	196	Dark chocolate Peru	64	box	100	0	faldone verde	\N	2016-02-21 16:18:35
616	197	Madagascar cacao grand cru Sambirano	85	box	100	0	faldone verde	\N	2016-02-21 16:39:43
617	14	Vollmilch ganznuss	32	box	100	0	faldone verde	\N	2016-02-21 16:41:51
1264	16	Fondente con nocciole intere (10€ in buoni)	45	paper	100	0	faldone verde	\N	2020-10-11 14:34:36.61488
619	198	Grenade	60	box	100	0	faldone verde	\N	2016-02-21 16:58:52
620	186	Cioccolato di Modica Canapa	60	box	60	0	faldone blu	da Steve	2016-02-21 17:07:51
621	199	Trinitario Criollo	99	box	100	0	faldone blu	\N	2016-02-21 17:14:57
622	1	Cioccolato al latte d'asina	45	box	25	0	faldone blu	\N	2016-02-21 17:16:27
623	101	Dark chocolate aloe and blackcurrant	70	box	50	0	faldone blu	\N	2016-02-21 17:18:22
624	200	Cacao Rio de Oro	75	box	100	0	\N	da Whites	2016-04-03 16:05:57
625	201	La cioccolata del re fondente	54	paper	100	0	faldone giallo		2016-04-03 16:09:49
626	202	Cioccolato crudo biologico con zucchero ai fiori di cocco	73	paper	30	0	faldone giallo	\N	2016-04-03 16:13:14
627	143	Bresil	72	paper	45	0	faldone rosso	\N	2016-04-03 16:15:38
628	13	Nocciole	30	paper	17	0	faldone rosso	\N	2016-04-03 16:18:16
629	14	Rice choc	40	paper	100	0	faldone rosso	\N	2016-04-03 16:20:04
630	1	Morogoro - Tanzania (fine cacao)	70	box	50	0	faldone blu		2016-04-03 16:26:26
631	197	Haiti cacao gran cru Haitien	72	box	100	0	faldone verde	\N	2016-04-03 16:31:46
632	1	Sur del Lago - Venezuela	70	box	50	0	faldone blu	\N	2016-05-28 14:28:13
633	68	Sfoglia nera fondente extra	70	box	100	0	faldone blu	\N	2016-05-28 14:29:39
634	101	Cioccolato al latte miele e propoli	34	box	50	0	faldone blu	\N	2016-05-28 14:32:49
635	176	Cioccolato alla cannella 2016	55	box	60	0	faldone blu	\N	2016-05-28 14:41:11
636	176	Cioccolato al peperoncino	55	box	60	0	faldone blu	\N	2016-05-28 14:41:11
637	108	Speziali anice	40	box	80	0	faldone blu	\N	2016-05-28 14:45:37
638	14	Feine bitter Panama	99	box	80	0	faldone verde	\N	2016-05-28 14:48:52
639	16	Noir puissant (2016)	85	box	100	0	faldone verde	\N	2016-05-28 14:54:01
640	203	Panama feinbitter	80	box	100	0	faldone verde	\N	2016-05-28 14:59:02
641	50	Fondente extra con nocciole intere (2016)	54	paper	130	0	faldone giallo	\N	2016-05-28 15:04:15
642	169	Cioccolato fondente (2016, kosher)	60	paper	85	1	faldone giallo	\N	2016-05-28 15:09:10
643	7	Cuor di cacao	75	paper	45	0	faldone giallo	\N	2016-05-28 15:15:08
644	7	Cuor di cacao	85	paper	45	0	faldone giallo	\N	2016-05-28 15:15:08
645	202	Cioccolato crudo biologico con reishi, pinoli siberiani e zucchero da fiori di cocco	71	paper	30	0	faldone giallo	\N	2016-05-28 15:21:33
646	202	Energy fruitbites con baobab	33	paper	18	0	faldone giallo	\N	2016-05-28 15:21:33
647	204	Extra dark	82	paper	85	0	faldone rosso	dal tozzy	2016-05-28 15:24:27
648	205	Dark chocolate	70	paper	100	0	faldone rosso	\N	2016-05-28 15:28:33
649	16	Extra fondente (2016)	72	paper	100	0	faldone rosso	\N	2016-05-28 15:30:54
650	208	Dairy Milk Fruit & nut	26	paper	200	0	raccoglitore	da whites	2016-05-28 15:36:06
651	209	Barra de chocolate con pasas de uva	0	paper	100	0	faldone rosso	\N	2016-05-28 15:38:38
652	7	Extra fondente biologico	70	paper	45	0	faldone giallo	\N	2016-09-04 13:56:11
653	210	Cioccolato fondente con bacche di goji bio	71		90	0	faldone giallo	\N	2016-09-04 13:56:59
654	202	Energy fruitbites con goji	22	paper	18	0	faldone giallo	\N	2016-09-04 13:59:33
655	202	Energy fruitbites con spirulina	22	paper	18	0	faldone giallo	\N	2016-09-04 13:59:33
656	211	Schokolade carino kardamom	38	paper	100	0	faldone rosso	\N	2016-09-04 14:09:05
657	16	Fondente con nocciole intere	45	paper	100	0	faldone rosso	\N	2016-09-04 14:12:08
658	182	Chocolate negro ecologico Congo	82	paper	125	0	raccoglitore	\N	2016-09-04 14:25:01
659	182	Chocolate negro ecologico Perù	77	paper	125	0	raccoglitore	\N	2016-09-04 14:25:01
660	143	Madagascar	65	paper	45	0	faldone rosso	\N	2016-09-04 14:27:00
661	212	Chocolate puro	80	paper	125	0	faldone rosso	\N	2016-09-04 14:29:52
662	13	Kakao-mousse	40	paper	100	0	faldone rosso	\N	2016-09-04 14:33:04
663	13	Blackberry cream	30	paper	100	0	faldone rosso	\N	2016-09-04 14:35:02
664	13	Marzapane	0	paper	100	0	faldone rosso	\N	2016-09-04 14:35:02
665	13	Buttermilk lemon	0	paper	100	0	faldone rosso	\N	2016-09-04 14:35:02
666	213	Tre Colonias Arriba Ecuador	72	paper	100	0	faldone rosso	\N	2016-09-04 14:48:23
667	8	Mascao fondente extra arancia (2012)	58	box	100	0	faldone blu	\N	2016-09-04 15:19:05
668	70	Madagascar	70	box	50	0	faldone blu	\N	2016-09-04 15:20:52
669	70	Trinidad	70	box	50	0	faldone blu	\N	2016-09-04 15:20:52
670	70	Jamaica	70	box	50	0	faldone blu	\N	2016-09-04 15:20:52
671	70	Grenada	70	box	50	0	faldone blu	\N	2016-09-04 15:20:52
672	102	Gianduia nero	35	box	100	0	faldone blu	\N	2016-09-04 15:24:57
673	60	Cioccolato gianduia fondente	0	box	100	0	faldone blu	\N	2016-09-04 15:25:55
674	214	Spéculoos	72	box	80	0	raccoglitore	\N	2016-09-04 15:37:31
675	215	Yuzu du Japon	75	box	50	0	faldone verde	\N	2016-09-04 15:37:31
676	215	Cumin vert d'Alnif - Maroc	50	box	50	0	faldone verde	\N	2016-09-04 15:37:31
677	216	Sauerkirsch-koriander gefullt	35	box	100	0	faldone verde	\N	2016-09-04 15:38:18
678	154	Limited edition - Tien Giang - Vietnam	75	box	80	0	faldone verde	\N	2016-09-04 15:46:41
679	154	Limited edition - Tabasco - Mexique	78	box	80	0	faldone verde	\N	2016-09-04 15:46:41
680	144	Chocolat collection 3	72	box	100	0	faldone verde	\N	2016-09-04 15:48:12
681	217	Absinthe	56	box	100	0	faldone verde	\N	2016-09-04 15:50:23
682	47	El Pedregal 2015	64	box	70	0	faldone verde	\N	2016-09-04 15:54:52
683	218	Chocolate with amaranth	0	box	50	0	faldone verde	\N	2016-09-04 15:58:09
684	218	Chocolate con quinua	0	box	100	0	faldone verde	\N	2016-09-04 15:58:09
685	202	Energy fruitbites con reishi	22	paper	18	0	faldone giallo	\N	2016-12-09 10:05:01
686	29	Tablò fondente extra	46	paper	80	1	faldone giallo	\N	2016-12-09 10:07:30
687	29	Tablò fondente extra	70	paper	80	0	faldone giallo	\N	2016-12-09 10:07:30
688	8	Companera cioccolato finissimo al latte	34	paper	100	0	faldone giallo	\N	2016-12-09 10:10:47
689	6	Cioccolato fondente extra con nocciole intere	50	paper	100	0	faldone giallo	\N	2016-12-09 10:16:21
690	165	Fondente blocco	50	paper	500	0	faldone giallo	\N	2016-12-09 10:20:06
691	165	Nocciolato fondente	50	paper	200	0	raccoglitore		2016-12-09 10:20:06
692	219	Cioccolato fondente all'arancia	70	paper	100	0	faldone giallo		2016-12-09 10:25:09
693	219	Cioccolato fondente al limone con pepe	70	paper	100	0	faldone giallo	\N	2016-12-09 10:25:09
694	6	Cioccolato fondente amaro extra (2016)	88	box	75	1	faldone blu	\N	2016-12-09 10:41:08
695	83	Cioccolato fondente extra - Repubblica Dominicana 2016	70	box	100	1	faldone blu	\N	2016-12-09 10:49:00
696	220	Cioccolato extra fondente	85	box	80	0	faldone blu	\N	2016-12-09 10:53:43
697	220	Cioccolato extra fondente con fave di cacao	85	box	80	0	faldone blu	\N	2016-12-09 10:53:43
698	8	Mascao fondente extra quinoa e riso (logo bio, 2013)	61	box	100	0	faldone blu	\N	2016-12-09 11:12:13
699	8	Mascao fondente extra fave di cacao (2013)	73	box	100	0	faldone blu	\N	2016-12-09 11:12:13
700	8	Mascao fondente extra fave di cacao (2016)	70	box	100	0	faldone blu	\N	2016-12-09 11:12:13
701	8	Mascao fondente extra (2013)	70	box	100	1	faldone blu	\N	2016-12-09 11:12:13
702	8	Mascao fondente extra arancia (2015)	58	box	100	0	faldone blu	\N	2016-12-09 11:12:13
703	8	Mascao fondente extra melograno	60	box	80	1	faldone blu	\N	2016-12-09 11:12:13
704	8	Mascao cocco	54	box	80	1	faldone blu	\N	2016-12-09 11:12:13
705	221	Fondente	86	box	100	1	raccoglitore	\N	2016-12-09 11:21:10
706	29	Nero fondente extra	85	box	100	1	faldone blu	\N	2016-12-09 11:26:32
707	8	Mascao fondente extra (2016, fascia orizzontale)	70	box	100	1	faldone blu	\N	2016-12-09 12:32:25
708	35	Dark chocolate chopped hazelnuts	56	paper	90	0	faldone rosso	\N	2016-12-09 14:02:14
709	222	Negro extrafino e intenso	80	paper	125	0	faldone rosso	\N	2016-12-09 14:05:14
710	13	Krokante tortilla chips	30	paper	100	0	faldone rosso	\N	2016-12-09 14:08:01
711	35	Dark chocolate	56	paper	90	0	faldone rosso	\N	2016-12-09 14:09:52
712	15	Abmopebkuu	71	paper	85	0	faldone rosso	\N	2016-12-09 14:14:25
713	84	Bogatstvo cokolade i voca	30	paper	100	0	faldone rosso	\N	2016-12-09 14:15:47
714	160	Bunte kakaolinsen	30	paper	100	0	faldone giallo	\N	2016-12-09 14:17:49
715	223	Chocolate extrafino negro	72	box	100	0	faldone verde	\N	2016-12-09 14:25:41
716	144	Chocolat collection 1	64	box	100	0	faldone verde	\N	2016-12-09 14:34:53
717	224		55	box	80	0	faldone verde	\N	2016-12-09 14:38:47
718	14	Dunkle Vollmilch with coconut blossom nectar Panama	50	box	80	0	faldone verde	\N	2016-12-09 14:43:56
719	8	Cioccolato al latte Cru di Cacao Arriba Ecuador	15	box	50	0		\N	2016-12-09 14:49:36
720	115	LatteNero	51	box	100	0	faldone blu	\N	2016-12-09 16:57:47
721	85	Scatoletta da cioccolatino	0	box	0	0		\N	2016-12-09 17:11:16
723	85	Gran cru Madagascar	64	box	100	0	faldone blu	\N	2016-12-09 17:11:16
724	1	Single origins (2016)	70	box	28	0		\N	2016-12-09 17:16:53
725	1	Morogoro - Tanzania	70	box	5	0		\N	2016-12-09 17:16:53
726	1	Cioccolato al latte di capra	45	box	25	0	faldone blu	\N	2016-12-09 17:18:05
727	13	Mini bunter mix	0	box	150	0	faldone verde	\N	2016-12-09 17:39:23
728	225	Deep	85	box	100	0	faldone verde	\N	2016-12-09 17:46:15
729	226	Coco Phoria Extra cocoa butter	80		100	0	faldone verde	\N	2016-12-09 17:53:09
730	227	Chocolate artesanal	70	box	50	0	faldone verde	\N	2016-12-09 17:57:07
731	228	Aussie milk	45	box	100	0	faldone verde	\N	2016-12-09 18:01:26
732	229	Papua New Guinea	70		100	0		\N	2016-12-09 18:04:11
733	169	Cioccolato fondente (2016)	70	paper	85	0	faldone giallo	\N	2016-12-31 14:02:19
734	219	Cioccolato fondente allo zenzero	70	paper	100	0	faldone giallo	\N	2016-12-31 14:03:42
735	219	Cioccolato al latte con pane croccante di segale	50	paper	100	0	faldone giallo	\N	2016-12-31 14:03:42
736	46	Extra fondente	74	box	75	0		\N	2016-12-31 14:07:05
737	46	Cioccolato grezzo alla pietra (2016)	70	box	55	0	faldone blu	\N	2016-12-31 14:09:36
738	85	Blend Africa	85	box	100	0	faldone blu	\N	2016-12-31 14:19:43
739	101	Cioccolato bianco puro	33	box	50	0	faldone blu	\N	2016-12-31 14:31:18
740	31	Extra fondente (2016)	88	box	75	0	faldone blu	\N	2016-12-31 14:39:16
1265	16	Chocolate noir	49	paper	300	0	\N	\N	2020-10-11 14:36:42.500454
743	16	Lindor extra fondente (2016, cocoa symbol)	60	paper	100	0	faldone rosso	\N	2016-12-31 14:59:38
744	230	Chocolate artesano	75	paper	200	0	faldone rosso	\N	2016-12-31 15:01:37
745	224		64	box	25	0	faldone verde	\N	2016-12-31 15:05:39
746	8	Companera extra fondente (2016 - foglia bio)	70	paper	100	0	faldone giallo	\N	2017-01-28 14:26:45
747	201	La cioccolata del re peperoncino	54	paper	100	0	faldone giallo	\N	2017-01-28 14:29:17
722	85	Gran cru Venezuela	72	box	100	1	faldone blu	\N	2016-12-09 17:11:16
742	13	Nocciole intere (special nuts)	30	paper	100	1	faldone rosso	\N	2016-12-31 14:55:14
748	231	Pasta pura de cacao	100	paper	400	0	raccoglitore	\N	2017-01-28 14:35:30
749	14	Pfefferminz	68	paper	100	0	faldone rosso	\N	2017-01-28 14:38:29
750	232	Zlahtna temna cokolada	70	paper	70	0	faldone rosso	\N	2017-01-28 14:42:31
751	166	Chuao Venezuela (valori nutritivi sul retro)	75	paper	100	0	faldone rosso	\N	2017-01-28 15:52:55
752	232	Zlahtna temna cokolada Mistica	75	box	100	0	faldone verde	\N	2017-01-28 16:01:30
753	233	Chocolate con leche, almendras, naranja y pasas	0	box	100	0	faldone verde	\N	2017-01-28 16:04:38
754	35	Chocolate bar with chocolate truffle with cognac filling (red)	43	paper	43	0	faldone rosso	\N	2017-02-04 16:20:53
755	35	Chocolate bar with caramel filling (orange)	43	paper	40	0	faldone rosso	\N	2017-02-04 16:20:53
756	195	Cioccolato di Modica Cannella	50	box	70	0		\N	2017-02-04 16:23:48
757	195	Cioccolato di Modica Ecuadorian raw	70	box	70	0		\N	2017-02-04 16:23:48
758	41	Papuasia	36	box	50	0	faldone blu	\N	2017-02-04 16:26:28
759	41	Santo Domingo	70	box	50	0	faldone blu	\N	2017-02-04 16:26:28
760	41	Cuba	70	box	50	0	faldone blu	\N	2017-02-04 16:26:28
761	221	Fondente con granella di cacao	74	box	100	1	raccoglitore	\N	2017-02-04 16:29:52
762	101	Cioccolato extra fondente con pepe rosa	70	box	50	0	faldone blu	\N	2017-02-04 16:34:19
763	101	Massa di cacao	100	box	50	0	faldone blu	\N	2017-02-04 16:34:19
764	49	Massa di cacao Cento%	100	box	50	0	faldone blu	\N	2017-02-04 16:36:59
765	49	Cioccolato Novanta%	90	box	50	0	faldone blu	\N	2017-02-04 16:36:59
766	234	Fondente + Cardamomo	70	box	130	0	raccoglitore	\N	2017-02-04 16:39:35
767	235	Euforia: Cioccolato fondente, sale rosa dell'Himalaya, semi di canapa e grué di cacao	65	box	50	0	raccoglitore	\N	2017-02-04 16:45:42
768	235	Bella: Cioccolato fondente, olio di lino, semi di uva e tè verde	65	box	50	1	raccoglitore	\N	2017-02-04 16:45:42
769	235	Relazione: Cioccolato fondente con foglie di tè earl grey	63	box	50	0	raccoglitore	\N	2017-02-04 16:45:42
770	235	Mediterraneo: Cioccolato fondente, mandorle, pistacchi, uvetta, arancia e limone	65	box	50	0	raccoglitore	\N	2017-02-04 16:45:42
771	235	Benessere: Cioccolato fondente con mirtillo rosso	65	box	50	0	raccoglitore	\N	2017-02-04 16:45:42
772	202	Energy fruitbar con baobab e scaglie di cioccolato	15	paper	35	0	faldone giallo	\N	2017-03-04 14:36:01
773	16	Lindor milch	0	paper	100	0	faldone rosso	\N	2017-03-04 14:47:14
774	16	Lindor dunkel	0	paper	100	0	faldone rosso	\N	2017-03-04 14:47:14
775	16	Lindor weiss	0	paper	100	0	faldone rosso	\N	2017-03-04 14:47:14
776	13	Gianduia	0	paper	17	0	faldone rosso	\N	2017-03-04 14:50:40
777	35	Chayka milk chocolate	28	paper	90	0	faldone rosso	\N	2017-03-04 15:09:51
778	35	Alionka milk chocolate	22	paper	90	0	faldone rosso	\N	2017-03-04 15:09:51
780	35	Coconut nougat milk chocolate	34	paper	90	0	faldone rosso	\N	2017-03-04 15:09:51
781	35	Blueberry nougat milk chocolate	34	paper	90	1	faldone rosso	\N	2017-03-04 15:09:51
782	8	Mascao fondente extra menta (2016, striscia verde)	61	box	100	0	faldone blu	\N	2017-03-04 15:23:24
783	49	Cioccolato alla cannella	45	box	100	0	faldone blu	\N	2017-03-04 15:28:56
785	234	Fondente + Mandorle	70	box	130	0	raccoglitore	\N	2017-03-04 15:54:31
786	234	Fondente + Fave di cacao	70	box	130	0	raccoglitore	\N	2017-03-04 15:54:31
787	41	Messico	40	box	50	0	faldone blu	\N	2017-03-04 16:03:58
788	41	Ecuador	70	box	50	0	faldone blu	\N	2017-03-04 16:03:58
789	41	Africa	75	box	50	0	faldone blu	\N	2017-03-04 16:03:58
790	41	Tingo Maria	65	box	50	0	faldone blu	\N	2017-03-04 16:03:58
791	41	Ecuador	70	box	80	0	faldone blu	\N	2017-03-04 16:03:58
792	236	Fondente extra Perù	70	box	100	0	faldone blu	\N	2017-03-04 16:06:34
793	236	Fondente extra Ecuador	75	box	100	1	faldone blu	\N	2017-03-04 16:06:34
794	15	Decepm peach	31	box	90	0	faldone verde	\N	2017-03-04 16:11:51
795	15	Decepm strawberry	31	box	90	0	faldone verde	\N	2017-03-04 16:11:51
796	35	Slivk-lenivki milk chocolate with milk-cream filling	34	box	100	0	faldone verde	\N	2017-03-04 16:14:12
797	227	Chocolate artesanal Kiwicha	55	box	50	0	faldone verde	\N	2017-03-04 16:15:54
798	202	Energy fruitbar con spirulina e burro di cacao	10	paper	25	0	faldone giallo	\N	2017-04-22 15:02:05
799	6	Cioccolato fondente extra (solo con puro cacao)	50	paper	100	1	faldone giallo	\N	2017-04-22 15:07:02
800	8	Mascao fondente extra quinoa e riso (fascia orizzontale, 2017)	61	box	100	1	faldone blu	\N	2017-04-22 15:11:55
801	70	Blanco de criollo novembre 2012 (kosher, 2017)	70	box	50	0	faldone blu	\N	2017-04-22 15:20:00
802	70	Chuao (kosher, 2017)	70	box	50	1	faldone blu	\N	2017-04-22 15:22:21
803	186	Cioccolato di Modica al Marsala	50	box	100	0	faldone blu	\N	2017-04-22 15:28:37
804	41	Crue de Cacao	65	box	50	0	faldone blu	\N	2017-04-22 15:30:42
805	41	Tingo Maria	65	box	80	0	faldone blu	\N	2017-04-22 15:33:11
806	41	Africa	75	box	80	0	faldone blu	\N	2017-04-22 15:33:11
807	41	Santo Domingo	70	box	80	0	faldone blu	\N	2017-04-22 15:33:11
808	41	Cuba	70	box	80	0	faldone blu	\N	2017-04-22 15:33:11
809	200	Cacao Rio de Oro	100	box	100	0	\N	\N	2017-04-22 15:36:28
810	235	Passione: Cioccolato fondente, maca, peperoncino e cola	65	box	50	0	raccoglitore	\N	2017-04-22 15:40:45
811	235	Oriente: Cioccolato fondente, curcuma e curry, sale rosa dell'Himalaya	65	box	50	0	raccoglitore	\N	2017-04-22 15:40:45
812	237	Chocolate pasta pura sin azucar	0	paper	100	0	faldone rosso	\N	2017-04-23 13:58:13
813	238	Colombie	70	paper	75	0	faldone rosso	\N	2017-04-23 14:01:11
814	160	Daim	30	paper	100	0	faldone giallo	\N	2017-04-23 14:03:58
815	14	Feine bitter (vegan, one world, 2017)	71	paper	100	0	faldone rosso	\N	2017-04-23 14:06:22
816	239	Passionsfrucht Karamell Thymian	60	paper	70	0	faldone rosso	\N	2017-04-23 14:10:49
817	89	Sea salt soiree	0	box	100	0	faldone verde	\N	2017-04-23 14:16:29
818	14	Edel bitter Ecuador	70	box	100	0	faldone verde	\N	2017-04-23 14:19:04
819	16	Noir orange intense (scadenza dorata, 2017)	48	box	100	1	faldone verde	\N	2017-04-23 14:31:22
779	35	Vanilla nougat milk chocolate	34	paper	90	1	faldone rosso	\N	2017-03-04 15:09:51
820	85	Ecuador	100	box	100	0	faldone blu	\N	2017-05-28 14:27:17
821	33	Fondente extra con zenzero	70	box	50	0	faldone blu	\N	2017-05-28 14:34:11
822	8	Mascao fondente extra arancia (fascia orizzontale)	58	box	100	1	faldone blu	\N	2017-05-28 14:47:35
823	8	Mascao fondente extra fave di cacao (fascia orizzontale)	70	box	100	1	faldone blu	\N	2017-05-28 14:47:35
824	6	Ecuador cioccolato aromatico intenso (riquadro valori nutrizionali)	75	box	75	1	faldone blu	\N	2017-05-28 14:50:46
825	41	Crue de Cacao	65	box	80	0	faldone blu	\N	2017-05-28 14:56:01
826	7	Venezuela (ricco)	85	paper	70	1	faldone giallo	\N	2017-05-28 15:18:28
827	6	Nocciolato fondente	50	paper	230	0	faldone giallo	\N	2017-05-28 15:25:46
828	240	Viel Gluck fur dich	37	paper	30	0	faldone rosso	\N	2017-05-28 15:30:40
829	74	Chocolat blanc fourrè aux pistaches fraiches	45	paper	65	0	faldone rosso	\N	2017-05-28 15:33:39
830	16	Fondente con nocciole intere (Nocciola Piemonte IGP, novità)	45	paper	100	0	faldone rosso	\N	2017-05-28 15:50:12
831	84	Mikado Brusnica	72	box	100	0	faldone verde	\N	2017-05-28 15:52:54
832	7	Perù (delicato)	85	paper	70	0	faldone giallo	\N	2017-07-29 14:28:14
833	234	Latte + Cocco	33	box	130	0	raccoglitore	\N	2017-07-29 14:30:58
834	6	Ghana cioccolato amaro delicato (retro con arancia e limone)	70	box	75	1	faldone blu	\N	2017-07-29 14:39:31
836	6	Extra fondente con lamponi e granella di mandorle	70	box	75	1	faldone blu	\N	2017-07-29 14:43:04
838	13	Johannisbeer streusel	0	paper	100	0	faldone rosso	\N	2017-07-29 14:50:56
839	241	Noir	70	paper	100	0	faldone rosso	\N	2017-07-29 14:54:16
840	25	Pierrot mleczna nadziewana z orzeskami	29	paper	100	0	faldone rosso	\N	2017-07-29 14:56:33
841	242	Chocolate Bitter con Pasas	0	paper	50	0	faldone rosso	\N	2017-07-29 15:00:11
843	16	Fondente con scorze di limone e mandorle	50	paper	100	0	faldone rosso	\N	2017-07-29 15:04:10
844	243	Chocolat noir doux	71	label	0	0	faldone verde	\N	2017-07-29 15:07:44
845	244	Noir	99	label	65	0	faldone verde	\N	2017-07-29 15:13:48
846	244	Madagascar	50	label	65	0	faldone verde	\N	2017-07-29 15:13:48
847	244	Saint Domingue	63	label	65	0	faldone verde	\N	2017-07-29 15:13:48
848	244	Noir	85	label	65	0	faldone verde	\N	2017-07-29 15:13:48
849	244	Equateur	65	label	65	0	faldone verde	\N	2017-07-29 15:13:48
850	246	Swiss chocolate	72	box	125	0	faldone verde	\N	2017-07-29 15:19:30
851	247	Choklad Mork	70	box	100	0	faldone verde	\N	2017-07-29 15:22:46
852	16	Fondente nocciola	47	box	100	0	faldone verde	\N	2017-07-29 15:24:45
853	165	Cioccolato fondente biologico (fascia rossa)	70	paper	100	0	faldone giallo	\N	2017-10-28 14:35:34
854	6	Extra fondente con scorzette di arancia e mandorle (retro con caffè))	70	box	75	1	faldone blu	\N	2017-10-28 14:49:39
855	70	9 (indirizzo lungo)	75	box	50	0	faldone blu	\N	2017-10-28 14:52:35
856	50	Cioccolato fondente extra biologico (vivi verde)	70	box	100	0	faldone blu	\N	2017-10-28 15:06:06
857	50	Cioccolato fondente extra biologico (vivi verde)	70	box	100	0	faldone blu	\N	2017-10-28 15:11:23
858	234	Latte + Liquirizia	33	box	130	0	raccoglitore	\N	2017-10-28 15:12:58
859	115	Gran cacao	100	box	100	0	faldone blu	\N	2017-10-28 15:20:17
860	248	Cioccolato di Modica - sale di Trapani	50	box	60	0	faldone blu	\N	2017-10-28 15:25:48
861	186	Cioccolato di Modica al caffè	50	box	25	0	faldone blu	\N	2017-10-28 15:27:17
862	186	Cioccolato di Modica Caffè	50	box	100	0	faldone blu	\N	2017-10-28 15:27:17
863	249	Cioccolato di Modica Fico d'India	55	box	50	0	faldone blu	\N	2017-10-28 15:31:04
864	13	Pompelmo rosa	0	paper	100	0	faldone rosso	\N	2017-10-28 15:35:35
865	250	Criollo extra	71	paper	100	0	faldone rosso	\N	2017-10-28 15:37:52
866	13	Fondente extra	73	paper	100	0	faldone rosso	\N	2017-10-28 15:40:04
867	16	Fondente con pezzi di cocco (edizione limitata)	50	paper	100	0	faldone rosso	\N	2017-10-28 15:44:41
868	80	Keks	27	paper	80	0	faldone rosso	\N	2017-10-28 15:48:29
869	234	Fondente + Caffè	70	box	130	0	raccoglitore	\N	2017-12-08 14:55:36
870	251	Djakarta criollo-trinitario	75	paper	100	0	faldone rosso	\N	2017-12-08 15:19:35
871	213	Manjari Imperial Madagascar	72	paper	100	0	faldone rosso	\N	2017-12-08 15:21:15
872	16	Noir corsè	78	box	100	0	faldone verde	\N	2017-12-08 15:26:27
873	16	Noir intense (farming program)	70	box	100	1	faldone verde	\N	2017-12-08 15:27:47
874	16	Le fondenti - il superiore	72	box	100	0	faldone verde	\N	2017-12-08 15:46:06
875	232	Zlahtna temna cokolada Mistica classic	75	box	100	0	faldone verde	\N	2017-12-08 15:51:22
876	232	Zlahtna temna cokolada Mistica arancini	70	box	100	0	faldone verde	\N	2017-12-08 15:51:22
877	190	Chocolate negro	70	box	125	0	faldone verde	\N	2017-12-08 16:00:15
878	244	Bresil	61	box	65	0	faldone verde	\N	2017-12-08 16:02:31
879	244	Madagascar	63	box	65	0	faldone verde	\N	2017-12-08 16:02:31
880	252	dark with cocosa nibs	50	box	90	0	faldone verde	\N	2017-12-08 16:07:18
881	253	Orinoco noir	60	box	75	0	faldone verde	\N	2017-12-08 16:10:04
882	254	Raw chocolate Criollo - Pangoa	75	box	100	0	faldone verde	\N	2017-12-08 16:15:20
883	112	Plantation Los Anconès	67	box	70	0	faldone verde	\N	2017-12-08 16:21:38
884	255	Holunder Blute und beere	65	box	70	0	faldone verde	\N	2017-12-08 16:23:17
885	45	Latte	30	paper	35	0	faldone giallo	\N	2017-12-08 16:29:41
886	45	Latte con cereale croccante	30	paper	35	0	faldone giallo	\N	2017-12-08 16:29:41
887	45	Latte	30	paper	100	0	faldone giallo	\N	2017-12-08 16:29:41
888	45	Cereali	30	paper	100	0	faldone giallo	\N	2017-12-08 16:29:41
889	256	Fondente con Pistacchi	53	label	100	0	faldone giallo	\N	2017-12-08 16:33:45
890	256	Fondente con Mandorle	53	label	100	0	faldone giallo	\N	2017-12-08 16:33:45
891	167	Fondente	80	paper	50	0	faldone giallo	\N	2017-12-08 16:35:43
892	7	Ecuador (intenso)	100	paper	70	0	faldone giallo	\N	2017-12-08 16:37:39
893	186	Cioccolato di Modica Anice Stellato	50	box	100	0	faldone blu	\N	2017-12-09 15:50:17
835	6	Cioccolato fondente amaro extra (arancia e limone, non caffè)	88	box	75	0	faldone blu	\N	2017-07-29 14:39:31
837	239	Paranussnougat + Urwaldpfeffer	60	paper	70	0	faldone rosso	\N	2017-07-29 14:48:28
894	186	Cioccolato di Modica Agrumi di Sicilia	50	box	100	1	faldone blu	\N	2017-12-09 15:50:17
896	186	Cioccolato di Modica alla cannella	50	box	25	0	faldone blu	\N	2017-12-09 15:50:17
897	257	Madagascar	71	box	100	1	faldone blu		2017-12-09 15:52:06
898	257	Ecuador	71	box	100	1	faldone blu	\N	2017-12-09 15:52:06
899	258	Tarocco bianco di nocciole, cioccolato bianco e mandorle	25	box	200	0		\N	2018-02-17 15:30:36
900	248	Cioccolato di Modica - zenzero e limone	50	box	60	0	faldone blu	\N	2018-02-17 15:34:28
901	1	Sur del Lago - Venezuela (Senza glutine)	70	box	50	0	faldone blu	\N	2018-02-17 15:40:53
902	1	Morogoro - Tanzania	70	box	50	0	faldone blu	\N	2018-02-17 15:40:53
903	234	Bianco + Mirtilli rossi	0	box	130	0	raccoglitore	\N	2018-02-17 15:42:52
904	33	Extra fondente con fave di cacao	80	box	100	0	faldone blu	\N	2018-02-17 15:47:00
906	259	Cioccolato fondente con canditi di arancia	50	box	100	0	faldone blu	\N	2018-02-17 16:00:57
907	257	Repubblica Dominicana	85	box	100	0	faldone blu	\N	2018-02-17 16:04:48
908	29	Nero fondente extra (fave selezionate)	70	box	100	1	faldone blu	\N	2018-02-17 16:09:04
909	216	Granatapfel Gefullt	70	box	100	0	faldone verde	\N	2018-02-17 16:29:54
910	146	Dark chocolate	80	box	65	0	faldone verde	\N	2018-02-17 16:34:47
911	260	Extra dark chocolate	74	box	100	0	faldone verde	\N	2018-02-17 16:37:10
912	261	Devilidhly Dark Chocolate	54	box	100	0	faldone verde	\N	2018-02-18 09:40:24
913	261	Chocolate Beer Bar in Dark Chocolate	54	box	100	0	faldone verde	\N	2018-02-18 09:40:24
914	262	Tequila	0	box	200	0	raccoglitore	\N	2018-02-18 09:50:43
915	262	Coffee	0	box	200	0	raccoglitore	\N	2018-02-18 09:50:43
916	14	Vollmilch mandel (logo bio in alto)	33	box	100	0	faldone verde	\N	2018-02-18 09:52:55
917	14	Feine bitter with coconut blossom nectar Panama	75	box	80	0	faldone verde	\N	2018-02-18 09:54:27
918	263	Fin Carrè - mandorle intere	25	box	200	0	faldone verde	\N	2018-02-18 09:58:47
919	263	Fin Carrè - nocciole intere	25	box	200	0	faldone verde	\N	2018-02-18 09:58:47
920	256	Fondente	70	label	100	0	faldone giallo	\N	2018-02-18 10:56:28
921	256	Fondente con Nocciole	53	label	100	0	faldone giallo	\N	2018-02-18 10:56:28
922	159	Cioccolato extra fondente con arancia	61	paper	100	0	faldone giallo	\N	2018-02-18 10:58:04
923	161	cioccolato fondente dolcificato con stevia	86	paper	90	0	faldone giallo	\N	2018-02-18 11:02:16
924	161	cioccolato bianco con riso soffiato	0	paper	100	0	faldone giallo	\N	2018-02-18 11:02:16
925	161	cioccolato fondente con nocciola tonda gentile tribolata	70	paper	120	0	faldone giallo	\N	2018-02-18 11:02:16
926	167	Fondente pepe Szechuan	66	paper	50	0	faldone giallo	\N	2018-02-18 11:03:53
927	82	Cioccolata di Modica classica	50	label	100	0	faldone giallo	\N	2018-02-18 11:05:21
929	6	Nocciolato fondente	50	paper	130	1	faldone giallo	\N	2018-02-18 11:12:35
930	6	Nocciolato bianco	0	paper	130	1	faldone giallo	\N	2018-02-18 11:13:35
931	6	Bianco	0	paper	100	1	faldone giallo	\N	2018-02-18 11:14:36
932	6	Nocciolato	31	paper	230	1	faldone giallo	\N	2018-02-18 11:14:36
933	8	Mascao zenzero e limone	60	paper	100	0	faldone giallo	\N	2018-02-18 11:17:04
934	265	Donald Trump 45th president	0	paper	260	0	faldone rosso	\N	2018-02-18 11:20:24
935	266	Coconut almond	80	paper	70	0	faldone rosso	\N	2018-02-18 11:23:03
936	78	Tiny Tony (blu, crazy about chocolate)	0	paper	0	1	faldone rosso	\N	2018-02-18 11:25:54
937	78	Tiny Tony (red, crazy about chocolate)	0	paper	0	1	faldone rosso	\N	2018-02-18 11:25:54
938	16	Fondente con nocciole intere (Nocciola Piemonte IGP)	45	paper	100	1	faldone rosso	\N	2018-02-18 11:31:12
940	6	Gianduja	31	paper	100	0	faldone giallo	\N	2018-04-03 13:32:58
941	268	Cioccolato al latte (Monte CIvetta)	30	paper	75	0	faldone giallo	\N	2018-04-03 13:35:09
943	167	Fondente zenzero e lime	55	paper	50	0	faldone giallo	\N	2018-04-03 13:39:45
944	269	Cioccolato al Gelsomino	50	box	80	0	faldone blu	\N	2018-04-03 14:08:09
945	49	Cioccolato alla noce moscata	65	box	50	0	faldone blu	\N	2018-04-03 14:12:43
946	49	Cioccolato alla maggiorana	65	box	50	0	faldone blu	\N	2018-04-03 14:12:43
947	49	Cioccolato al cardamomo	65	box	50	0	faldone blu	\N	2018-04-03 14:12:43
948	49	Cioccolato Madagascar	65	box	50	0	faldone blu	\N	2018-04-03 14:12:43
949	49	Bean to Bar Nativo Blanco	70	box	45	0	faldone blu	\N	2018-04-03 14:12:43
950	235	Mediterraneo: Cioccolato fondente, mandorle, pistacchi, uvetta, arancia e limone (strisce colorate)	65	box	50	0	raccoglitore	\N	2018-04-03 14:19:16
951	221	Fondente con limone e pepe rosa	62	box	100	0	raccoglitore	\N	2018-04-03 14:26:32
952	221	Fondente con pera e cannella	62	box	100	1	raccoglitore	\N	2018-04-03 14:26:32
953	16	Extra fondente (differenziata)	72	paper	100	1	faldone rosso	\N	2018-04-03 14:47:35
954	270	Jamaica Bachelor's Hall estate	75	paper	70	0	faldone rosso	\N	2018-04-03 14:50:49
955	32	Preiselbeere	60	paper	100	0	faldone rosso	\N	2018-04-03 14:52:43
956	182	Chocolate ecologico negro Republica Dominicana	72	paper	100	0	raccoglitore	\N	2018-04-03 15:11:37
957	78	Tony's chocolonely	70	paper	180	0	faldone rosso	\N	2018-04-03 15:23:03
958	78	Tony's chocolonely amandel zeezout	51	paper	180	0	faldone rosso	\N	2018-04-03 15:23:03
959	271	Chocolate peruano ancestral Coca	80	box	90	0	faldone verde	\N	2018-04-03 15:25:03
960	272	Grand Chocolat Garam Masala	37	box	100	0	faldone verde	\N	2018-04-03 15:28:06
961	232	Mlecna cokolada	30	box	100	0	faldone verde	\N	2018-04-03 15:29:53
962	16	Noir Prodigieux (cocoa symbol)	90	box	100	0	faldone verde	\N	2018-04-03 15:33:07
963	273	Piura Porcelana	75	box	70	0	faldone verde	\N	2018-04-03 15:37:27
964	146	Dark chocolate	72	box	75	0	faldone verde	\N	2018-04-03 15:39:23
905	8	Mascao zenzero e limone	60	box	100	1	faldone blu	\N	2018-02-17 15:53:01
928	29	Tablò bianco vaniglia naturale	80	paper	80	1	faldone giallo	\N	2018-02-18 11:08:34
939	16	Fondente scorze di arancia e mandorle (novità)	50	paper	100	1	faldone rosso	\N	2018-02-18 11:31:12
895	186	Cioccolato di Modica fondente Ecuador	70	box	100	0	faldone blu	\N	2017-12-09 15:50:17
942	29	Gran Blocco	70	paper	150	1	faldone giallo	\N	2018-04-03 13:36:53
967	14	Feine bitter (the art of chocolate)	71	paper	100	0	faldone rosso	\N	2018-06-02 14:53:50
968	274	Organic fine dark chocolate	70	paper	85	0	faldone rosso	\N	2018-06-02 14:58:54
969	275	Confina dunkle schokolade	44	paper	100	0	faldone rosso	\N	2018-06-02 15:01:52
970	276	Solid chocolate single origin Dominican Republic	80	paper	64	0	faldone rosso	\N	2018-06-02 15:05:06
971	277	Costa d'Avorio	70	box	70	0	\N	\N	2018-06-02 15:08:45
972	175	Lacrì blend Venezuela	76	box	100	0	faldone blu	\N	2018-06-02 15:13:12
973	269	Cioccolato al bergamotto	50	box	80	0	faldone blu	\N	2018-06-02 15:15:06
974	186	Cioccolato di Modica al sale di Trapani	50	box	25	0	faldone blu	\N	2018-06-02 15:17:59
975	6	Cioccolato fondente amato extra	99	box	75	0	faldone blu	\N	2018-06-02 15:23:26
976	6	Extra fondente con cristalli alla menta	70	box	75	0	faldone blu	\N	2018-06-02 15:24:53
977	29	Gran Blocco	50	paper	500	0	faldone giallo	\N	2018-06-02 15:31:50
978	6	Nocciolato bianco (può contenere tracce di mandorle)	0	paper	130	0	faldone giallo	\N	2018-06-02 15:36:34
979	278	Fondente origine unica Cuba	70	paper	80	0	faldone giallo	\N	2018-06-02 15:39:24
980	279	Cioccolato extra fondente	72	paper	100	0	faldone giallo	\N	2018-06-02 15:42:46
981	161	cioccolato fondente monorigine Perù	70	paper	100	0	faldone giallo	\N	2018-06-02 15:43:52
982	49	Cioccolato vaniglia (english description)	50	paper	100	0	faldone giallo	\N	2018-06-02 15:45:48
983	49	Cioccolato cannella (english description)	50	paper	100	0	faldone giallo	\N	2018-06-02 15:46:33
984	160	Cioccolato al latte & biscotti Oro Saiwa	30	paper	87	0	faldone giallo	\N	2018-10-10 19:57:55.1572
985	160	Milka & TUC	30	paper	87	0	faldone giallo	\N	2018-10-10 19:57:55.1572
986	160	Milka & Chips Ahoy	\N	paper	100	0	faldone giallo	\N	2018-10-10 19:57:55.1572
987	83	Cioccolato fondente extra (no tagliando di controllo)	60	paper	100	0	faldone giallo	\N	2018-10-10 20:12:41.8329
988	83	Cioccolato fondente extra dark	72	paper	100	0	faldone giallo	\N	2018-10-10 20:26:28.472734
989	161	cioccolato fondente monorigine Sao Tomè	71	paper	100	0	faldone giallo	\N	2018-10-10 20:30:48.152324
990	278	Dark milk	45	paper	80	0	faldone giallo	\N	2018-10-10 20:32:28.464872
991	179	Cioccolato fondente	50	paper	100	0	faldone giallo	\N	2018-10-10 20:34:12.412354
992	109	Caramel dorè	\N	paper	80	0	faldone giallo	\N	2018-10-10 20:36:51.628591
993	280	Cioccolato fondente extra con estratti naturali di arancia	50	paper	100	0	faldone giallo	\N	2018-10-14 19:42:03.471733
994	221	Latte finissimo con scorza di arancia	49	box	100	0	raccoglitore	\N	2018-10-14 19:53:14.780655
995	6	Ghana cioccolato amaro delicato (con due righe)	70	box	75	1	faldone blu	\N	2018-10-14 19:58:04.357567
996	6	Cioccolato fondente amaro extra (con due righe)	88	box	75	0	faldone blu	\N	2018-10-14 20:00:55.60735
997	6	Extra fondente con lamponi e granella di mandorle (con due righe)	70	box	75	0	faldone blu	\N	2018-10-14 20:05:45.728896
998	6	Extra fondente con granella di caffè 100% arabica	70	box	75	1	faldone blu	\N	2018-10-14 20:11:50.944258
1000	9	Sheherazade cioccolato BIO con sesamo	48	box	60	0	\N	\N	2018-10-14 20:20:02.380311
999	9	Granato cioccolato BIO al pepe rosa e riso soffiato	50	box	60	0	\N	\N	2018-10-14 20:18:30.529915
1001	281	Ciocoolato modicano mint	50	box	100	0	\N	\N	2018-10-14 20:26:38.917502
1002	179	Cioccolato extra fondente	90	box	100	1	faldone blu	\N	2018-10-14 20:29:25.530294
1003	179	Cioccolto Svizzero extra fondente	85	box	100	0	faldone blu	\N	2018-10-14 20:30:10.249854
1004	29	Sfoglie arancia	51	box	96	0	\N	\N	2018-10-14 20:35:37.082405
1005	282	Cioccolato fondente ottenuto direttamente dalla fava di cacao criollo del perù	88	box	45	0	faldone blu	\N	2018-10-14 20:41:41.705446
784	220	Cioccolato extra fondente con zenzero	85	box	80	1	faldone blu	\N	2017-03-04 15:30:42
1006	33	100% cacao	100	box	50	0	faldone blu	\N	2018-10-14 20:47:24.746552
1007	283	Gorilla bar Virunga (Congo)	68	paper	90	0	faldone rosso	\N	2018-10-20 15:22:48.963589
1008	284	India	65	paper	70	0	faldone rosso	\N	2018-10-20 15:27:02.665896
1009	32	Waldbeeren	35	paper	100	0	faldone rosso	\N	2018-10-20 15:29:39.845009
1010	35	Dark chocolate with orange peel and cookies	56	paper	90	0	faldone rosso	\N	2018-10-20 15:31:28.082378
1011	285	Ucayali Perù	70	paper	55	0	faldone rosso	\N	2018-10-20 15:34:18.844042
842	16	Fondente con mandorle tostate	45	paper	100	1	faldone rosso	\N	2017-07-29 15:04:10
965	16	Fondente (differenziata)	50	paper	100	1	faldone rosso	\N	2018-06-02 14:48:04
1012	16	Dark chocolate with sea salt and whole almonds	49	paper	300	0	\N	\N	2018-10-20 15:41:20.981799
1013	24	Czecolada Gorzka Opowiesci Krakusa (Na kogucie na ksiezyc)	70	paper	100	0	raccoglitore	\N	2018-10-20 15:47:39.213606
1014	24	Czecolada Gorzka Opowiesci Krakusa (Wstrzymal slonce. Ruszyl ziemie)	90	paper	100	0	raccoglitore	\N	2018-10-20 15:47:39.213606
1015	24	Gorzka extra	90	paper	100	0	faldone rosso	\N	2018-10-20 15:50:43.265342
1016	24	Czekolada Gorzka klasyczna	70	paper	100	0	faldone rosso	\N	2018-10-20 15:50:43.265342
1017	24	Czekolada gorzka	70	paper	100	0	faldone rosso	\N	2018-10-20 15:50:43.265342
1018	251	Madagascar criollo	75	paper	100	0	faldone rosso	\N	2018-10-20 15:52:59.446024
1019	286	Ben tre	65	paper	100	0	faldone rosso	\N	2018-10-20 15:55:20.483215
1020	287	Czekolada gorzka z orzechami laskiwymi y kawalkami pomaranczy	70	box	100	0	faldone verde	\N	2018-10-20 16:35:33.460811
1021	288	Ecuador Gran Cru	70	box	50	0	faldone verde	\N	2018-10-20 16:38:11.509458
1022	25	Czekolada Gorzka Meksyk	66	box	50	0	faldone verde	\N	2018-10-20 16:40:01.800263
1023	289	Czekolada Gorzka z platkami pomaranczowymi	70	box	100	0	faldone verde	\N	2018-10-20 16:44:53.033998
1024	289	Czekolada Gorzka	90	box	100	0	faldone verde	\N	2018-10-20 16:44:53.033998
1025	290	Vietnam	73	box	100	0	faldone verde	\N	2018-10-20 16:48:26.831639
1026	291	N°4 Perou	65	box	80	0	faldone verde	\N	2018-10-20 16:53:07.143105
1027	292	Jamaique Marvia	63	box	70	0	faldone verde	\N	2018-10-20 16:55:23.055705
1028	104	Chocolat noir	75	box	100	0	faldone verde	\N	2018-10-20 16:57:29.357546
1029	15	Exclusive sea salt & caramel	51	box	100	0	faldone verde	\N	2018-10-20 17:01:52.618614
618	16	Framboise intense (nouveau)	47	box	100	0	faldone verde	\N	2016-02-21 16:55:57
1030	224	 	75	box	25	0	faldone verde	\N	2018-10-20 17:04:35.5161
1031	16	Framboise intense	47	box	100	0	faldone verde	\N	2018-10-20 17:08:29.9406
1037	299	Finca la Rioja	70	box	50	0	faldone verde	\N	2018-10-20 17:30:44.18514
1038	300	Light roast chocolate	64	box	50	0	faldone verde	\N	2018-10-20 17:33:51.511347
1039	301	Single origin Chuncho - Perù	70	box	70	0	faldone verde	\N	2018-10-20 17:37:02.97549
1040	6	Nocciolato fondente (senza glutine)	50	paper	130	1	faldone giallo	\N	2018-12-27 10:41:07.641795
1041	46	Cioccolato grezzo alla pietra allo zenzero	70	box	55	0	faldone blu	\N	2018-12-27 10:45:32.040273
1042	49	Cioccolato vaniglia	50	box	100	0	faldone blu	\N	2018-12-27 10:48:36.164537
1043	6	Cioccolato extra fondente delicato	70	box	75	1	faldone blu	\N	2018-12-27 10:55:36.225065
1044	6	Extra fondente con scorzette di arancia e mandorle (9 cioccolate su due file)	70	box	75	1	faldone blu	\N	2018-12-27 10:55:36.225065
1118	239	Brazil dark	72	box	70	0	faldone verde	\N	2019-06-15 14:53:58.821803
1045	6	Extra fondente con scorzette di limone e cristalli allo zenzero	70	box	75	0	faldone blu	\N	2018-12-27 10:55:36.225065
1046	1	Trinario	70	box	75	0	faldone blu	\N	2018-12-27 11:00:22.74865
1047	29	Nero fondente extra (contorno rosso)	70	box	85	1	faldone blu	\N	2018-12-27 11:05:20.257362
1048	29	Nero pistacchio croccante	48	box	85	0	faldone blu	\N	2018-12-27 11:05:20.257362
1049	31	Extra fondente (riquadro valori notrizionali)	70	box	75	0	faldone blu	\N	2018-12-27 11:11:04.010648
1050	31	Ecuador (fascia orizzontale)	75	box	75	0	faldone blu	\N	2018-12-27 11:11:04.010648
1051	302	Maya mountain, Belize, 2016 harvest	70	paper	56	0	faldone rosso	\N	2018-12-27 11:16:49.162987
1052	303	Mork India	68	box	53	0	faldone verde	\N	2018-12-27 11:20:56.690811
1053	304	Nibirus organic cacao with nibs	75	box	80	0	faldone verde	\N	2018-12-27 11:25:24.73766
1054	305	Dark Chocolate blueberry almond with acai flavour	\N	box	90	0	faldone verde	\N	2018-12-27 11:30:01.148213
1055	306	Fahrenheit 264 Perù - Piura Blanco	82	box	50	0	faldone verde	\N	2018-12-27 11:32:51.406257
1056	261	Solid milk chocolate	34	box	100	0	faldone verde	\N	2018-12-27 11:34:59.491121
1057	307	Chocolate artesanal pecanas	70	box	100	0	faldone verde	\N	2018-12-27 11:38:04.953113
1058	308	Extra dark chocolate	85	box	100	0	faldone verde	\N	2018-12-27 11:40:52.779321
1059	309	Karaliskas	70	box	100	0	faldone verde	\N	2018-12-27 11:46:04.281623
1060	310	Tume sokolaad bean to bar Costa Rica	70	paper	55	0	faldone rosso	\N	2018-12-27 11:48:31.864079
1061	311	Vietnam Lam dong	78	box	60	0	faldone blu	\N	2019-02-16 15:01:52.23388
1062	6	Extra fondente con mirtilli neri e granella di mandorle	70	box	75	0	faldone blu	\N	2019-02-16 15:08:01.156866
1063	7	Cuor di cacao	85	box	100	0	faldone blu	\N	2019-02-16 15:31:53.5618
1064	7	Crema caffè	60	box	100	0	faldone blu	\N	2019-02-16 15:31:53.5618
1065	7	Cuor di cacao	75	box	100	0	faldone blu	\N	2019-02-16 15:31:53.5618
1066	7	Crema cuor di cacao	75	box	100	0	faldone blu	\N	2019-02-16 15:31:53.5618
1067	7	Nougatine	56	box	100	0	faldone blu	\N	2019-02-16 15:31:53.5618
1074	312	Sumatra, Sedayu	70	box	50	0	\N	\N	2019-02-16 16:00:21.818859
966	266	Mexican-style stone ground chocolate (cinnamon)	50	paper	77	0	faldone rosso	\N	2018-06-02 14:51:33
1083	100	Confiserie Chocolade - Mandel-Sahnenougat mit spekulatius	35	box	100	0	\N	\N	2019-02-16 16:30:34.744209
371	119	Cioccolato al latte Cacao del Perù	36	paper	100	0	faldone giallo	da michela	2015-05-23 18:14:21
741	13	Fondente con nocciole intere (special nuts, notivà)	50	paper	100	0	faldone rosso	\N	2016-12-31 14:55:14
1084	35	Coconut nougat (shiny blue)	34	paper	90	0	faldone rosso	\N	2019-02-16 16:44:10.347017
1085	35	Hazelnut nougat	34	paper	90	0	faldone verde	\N	2019-02-16 16:44:10.347017
1086	73	Melk Everyday Happiness	36	paper	100	0	faldone rosso	\N	2019-02-16 16:53:09.873402
1087	316	Dark chocolate Fruits and Nuts	55	paper	80	0	faldone rosso	\N	2019-02-16 17:00:30.595995
1088	318	Akesson Estate madagascar	70	paper	70	0	faldone rosso	\N	2019-02-16 17:05:08.601538
1089	16	Fondente scorze di arancia e mandorle 	50	paper	100	1	faldone rosso	\N	2019-02-16 17:11:37.913293
1091	9	A ccioccolata BIO con mandorla (cooperativa sociale)	45	label	60	0	faldone giallo	\N	2019-04-26 09:43:50.908714
1032	294	Kablon Filipino trinitario	70	box	56	0	faldone verde	\N	2018-10-20 17:12:42.152931
1033	295	Madagascar Ambanja	70	box	80	0	faldone verde	\N	2018-10-20 17:16:20.084257
1034	14	Feine bitter Panama (brown)	92	box	100	0	faldone verde	\N	2018-10-20 17:18:42.736772
1035	297	Temna cokolada	72	box	120	0	faldone verde	\N	2018-10-20 17:22:20.911064
1036	298	Taiwan #5 nibs chocolate	62	box	45	0	faldone verde	\N	2018-10-20 17:26:10.440862
1068	7	Cuor di cacao (Anniversary 140)	60	box	70	0	faldone blu	\N	2019-02-16 15:31:53.5618
1069	160	Piacere fondente extra cacao (100% alpine milk)	45	paper	100	0	faldone giallo	\N	2019-02-16 15:38:15.421873
1070	29	Tablò fondente extra (senza glutine)	70	paper	80	1	faldone giallo	\N	2019-02-16 15:46:02.268953
1071	29	Tablò morbido gianduia	30	paper	80	0	faldone giallo	\N	2019-02-16 15:46:02.268953
1072	29	Tablò fondente con nocciole intere	46	paper	130	0	faldone giallo	\N	2019-02-16 15:47:49.830626
1073	29	Tablò latte cremoso	29	paper	80	0	faldone giallo	\N	2019-02-16 15:47:49.830626
1075	313	Barba	70	box	25	0	faldone verde	\N	2019-02-16 16:07:18.524319
1076	313	Medagla	70	box	25	0	faldone verde	\N	2019-02-16 16:07:18.524319
1077	314	Dark	74	box	60	0	faldone verde	\N	2019-02-16 16:11:01.309824
1078	315	Piura	70	box	70	0	faldone verde	\N	2019-02-16 16:16:54.093892
1079	16	Noir absolu	99	box	50	0	faldone verde	\N	2019-02-16 16:23:35.076837
1080	16	Fondente avvolgente	78	box	100	0	faldone verde	\N	2019-02-16 16:23:35.076837
1081	224	 	70	box	165	0	faldone verde	\N	2019-02-16 16:26:39.875753
1082	35	 	34	box	50	0	faldone verde	\N	2019-02-16 16:28:38.888452
1090	9	A ccioccolata BIO con cristalli di sale marino	70	label	60	0	faldone giallo	\N	2019-04-26 09:43:50.908714
1093	8	Mascao caramello e sale	35	box	100	0	faldone blu	\N	2019-04-26 09:55:27.95407
1094	320	Giovinezza: cioccolato biologico lavorato a freddo con bacche di Acai, rosa canina, arancia rossa, acini d'uva e tè verde	62	box	50	0	faldone blu	\N	2019-04-26 09:59:11.045423
1095	277	Sao Tomè Rio Lima	78	box	50	0	\N	\N	2019-04-26 10:00:05.406332
1096	7	Montezuma Nibs	75	box	800	0	\N	\N	2019-04-26 10:01:57.78008
1097	321	Perù tingo Maria	70	paper	75	0	faldone rosso	\N	2019-04-26 10:09:51.997961
1098	322	Dark Chocolate The philippines	71	paper	70	0	faldone rosso	\N	2019-04-26 10:10:59.263324
1099	251	Djakarta criollo-trinatario (nutritional values)	75	paper	100	0	faldone rosso	\N	2019-04-26 10:15:30.244085
1100	274	Domaine Mava	85	paper	85	0	faldone rosso	\N	2019-04-26 10:17:36.978763
1101	166	Madagascar	75	paper	100	0	faldone rosso	\N	2019-04-26 10:25:39.15647
1102	323	Gran cru de Rianila	70	paper	45	0	faldone rosso	\N	2019-04-26 10:30:22.694471
1103	324	Black n'burnt barley	\N	box	60	0	faldone verde	\N	2019-04-26 13:08:23.965638
1104	290	Venezuela cumin & bergamote	72	box	170	0	faldone verde	\N	2019-04-26 13:31:52.340733
1105	325	Perseverance estate	85	box	80	0	faldone verde	\N	2019-04-26 13:35:41.977349
1106	326	Bonanca 14 varietal	75	box	50	0	faldone verde	\N	2019-04-26 13:38:58.078262
1107	327	Nicaragua Juno	70	box	60	0	faldone verde	\N	2019-04-26 13:42:00.762371
1108	328	Vanua milk, Fiji	55	box	65	0	faldone verde	\N	2019-04-26 13:47:22.932684
1109	98	Dominican	75	box	50	0	\N	\N	2019-04-26 13:54:38.564675
1110	329	Mexico soconusco	75	box	60	0	faldone verde	\N	2019-04-26 13:58:02.559428
1111	330	Cioccolato fondente	60	paper	100	0	faldone giallo	\N	2019-06-15 14:13:01.216641
1112	151	Cioccolato fondente	65	box	100	0	faldone blu	\N	2019-06-15 14:27:02.878075
1113	8	Mascao fondente extra quinoa e riso (senza glutine)	61	box	100	1	faldone blu	\N	2019-06-15 14:31:23.336905
1115	320	Salute: cioccolato lavorato a freddo con polline d'api, melograno e acerola	67	box	50	0	faldone blu	\N	2019-06-15 14:35:37.040875
1116	331	Bundibugyo, Uganda	70	paper	65	0	faldone rosso	\N	2019-06-15 14:38:38.759433
1117	266	Mexican-style stone ground chocolate (Guajillo chili)	50	paper	77	0	faldone rosso	\N	2019-06-15 14:41:29.176678
1119	332	Tiramisu	\N	box	100	0	faldone verde	\N	2019-06-15 15:03:01.768811
1120	333	Milk chocolate with kefir	50	box	57	0	faldone verde	\N	2019-06-15 15:07:41.967071
1121	334	Madagascar Bejofo estate	100	box	60	0	faldone verde	\N	2019-06-15 15:19:58.977287
1122	335	Lakuna	70	box	70	0	faldone verde	\N	2019-06-15 15:24:58.642184
1123	336	Chocolate da amazonia brasileira	70	box	80	0	raccoglitore	\N	2019-06-15 15:31:24.596622
1124	337	Acul du nord Haiti	70	box	53	0	faldone verde	\N	2019-06-15 15:35:31.794295
1125	16	Noir intense (ingredienti in fr, en, it, de, nl)	70	box	100	0	faldone verde	\N	2019-06-15 15:41:06.401972
1126	338	Brésil	55	box	100	0	faldone verde	\N	2019-06-15 15:53:51.75149
1127	339	Picant chocolate with cardamom	70	box	100	0	faldone verde	\N	2019-06-15 16:03:34.023
1128	340	Choncho	70	box	50	0	faldone verde	\N	2019-06-15 16:08:07.012941
1129	341	Madagascar, Sambirano dark	74	box	60	0	faldone verde	\N	2019-06-15 16:10:26.216763
1130	342	Jaén	72	box	80	0	faldone verde	\N	2019-06-15 16:13:33.947718
1131	343	classico fondente e zenzero	60	paper	100	0	faldone giallo	\N	2019-07-02 12:31:05.297879
1132	344	Camel milk chocolate	36	paper	70	0	faldone rosso	\N	2019-07-02 12:33:49.918818
1133	220	Cioccolato extra fondente	85	box	80	0	faldone blu	\N	2019-07-02 12:36:20.973291
1134	70	Acero 95	95	box	50	0	faldone blu	\N	2019-07-02 12:38:11.977011
1135	345	Sri Lanka, Matale, 2015 harvest	70	box	50	0	faldone verde	\N	2019-07-02 12:42:29.829688
1136	346	Junin, Perù	70	box	70	0	faldone verde	\N	2019-07-02 12:44:20.780824
1137	347	Prague Sweet Reminiscence	33	box	160	0	faldone verde	\N	2019-07-02 12:47:22.405523
1138	9	A ccioccolata BIO con mandorla	45	label	60	0	faldone giallo	\N	2020-02-06 07:47:38.412998
1139	119	Cioccolato fondente senza zucchero	60	paper	100	0	faldone giallo	\N	2020-02-06 07:50:36.523806
1140	119	Cioccolato fondente biologico	71	paper	100	0	faldone giallo	\N	2020-02-06 07:50:36.523806
1141	8	Bribon fondente nocciole	60	paper	30	0	faldone giallo	\N	2020-02-06 07:54:46.287345
1114	8	Mascao caffè arabica	61	box	100	1	faldone blu	\N	2019-06-15 14:32:14.792353
1092	268	Sambàna cioccolato grezzo	70	paper	75	0	faldone giallo	\N	2019-04-26 09:48:46.791079
1142	8	Bribon fondente zenzero e limone (snza glutine)	60	paper	30	0	faldone giallo	\N	2020-02-06 07:57:29.896443
1144	29	Tablò fondente noci e lamponi	46	paper	120	0	faldone giallo	\N	2020-02-06 08:09:04.230766
1145	8	Mascao fondente extra	70	paper	100	0	faldone giallo	\N	2020-03-02 07:21:07.844077
1146	320	Bellezza: cioccolato biologico lavorato a freddo con semi di chia, semi di lino, semi di canapa, carota e mirtillo	68	box	50	0	faldone blu	\N	2020-03-02 07:42:32.981894
1147	320	Rossella arancia rossa	60	box	50	0	faldone blu	\N	2020-03-02 07:42:32.981894
1148	177	Caffè anice stellato	60	box	50	0	faldone blu	\N	2020-03-02 07:45:43.887306
1149	186	Cioccolato di Modica tradizionale	50	box	100	0	faldone blu	\N	2020-03-02 07:49:05.900105
1150	49	Cioccolato Ottanta%	80	box	50	0	faldone blu	\N	2020-03-02 07:53:00.927674
1151	311	Tanzania Kokoa kamili	72	box	60	0	faldone blu	\N	2020-03-02 08:02:59.697378
1152	348	Cioccolato di Modica agli agrumi	55	box	75	0	faldone blu	\N	2020-03-02 08:05:16.886938
1153	8	Mascao fondente extra fave di cacao (latte, nocciole, mandorle)	70	box	100	1	faldone blu	\N	2020-03-03 07:14:31.347039
1154	8	Mascao fondente extra (latte, nocciole, mandorle)	70	box	100	1	faldone blu	\N	2020-03-03 07:16:24.738039
1155	8	Mascao fondente extra melograno (senza glutine)	60	box	80	0	faldone blu	\N	2020-03-03 07:20:00.169388
1158	1	Trinitario Tanzania	70	box	50	0	faldone blu	\N	2020-03-03 07:28:58.380794
1159	1	Trinitario Venezuela	70	box	50	0	faldone blu	\N	2020-03-03 07:28:58.380794
1160	1	Trinitario Madagascar	70	box	50	0	faldone blu	\N	2020-03-03 07:28:58.380794
1161	349	Tono ed energia con Ginseng e Niacina	72	box	80	0	faldone blu	\N	2020-03-03 07:37:09.118287
1162	6	Extra fondente con mirtilli neri e granella di mandorle (senza glutine in basso)	70	box	75	0	faldone blu	\N	2020-03-03 07:42:38.483424
1163	6	Extra fondente vigoroso	88	box	75	0	faldone blu	\N	2020-03-03 07:42:38.483424
1164	151	Fondente alla cannella	65	box	100	0	faldone blu	\N	2020-03-03 07:44:03.004557
1165	29	Raw taste Repubblica Dominicana	75	box	95	0	faldone blu	\N	2020-03-03 07:46:34.037125
1166	101	Cioccolato fondente con nocciole caramellate	68	box	50	0	faldone blu	\N	2020-03-03 07:49:28.925962
1167	221	Cioccolato fondente Uganda	70	box	100	0	faldone blu	\N	2020-03-03 07:50:54.433636
1168	7	Venezuela	100	box	70	0	faldone blu	\N	2020-03-03 07:53:32.736998
1169	7	Ecuador	70	box	70	0	faldone blu	\N	2020-03-03 07:53:32.736998
1170	13	Knusperflakes	30	paper	100	0	faldone rosso	\N	2020-03-05 07:42:34.04247
1171	13	Fondente con nocciole intere	50	paper	100	0	faldone rosso	\N	2020-03-05 07:42:34.04247
1173	13	Cacao selection L'arometico dal Nicaragua	61	paper	100	0	faldone rosso	\N	2020-03-05 07:42:34.04247
1174	350	Feine Bitter Schokolade	70	paper	100	0	faldone rosso	\N	2020-03-05 07:46:18.128083
1175	350	Raw chocolate kakaonibs & meersalz	82	paper	65	0	faldone rosso	\N	2020-03-05 07:46:18.128083
1176	351	Colombie Sua noir	70	paper	100	0	faldone rosso	\N	2020-03-05 07:48:45.082771
1177	286	Lam Dong	48	paper	100	0	faldone rosso	\N	2020-03-05 07:51:17.495318
1178	286	Lam Dong	70	paper	100	0	faldone rosso	\N	2020-03-05 07:51:17.495318
1179	171	Livros & Chocolate - Chocolate negro con Caramel Explosivo	51	paper	100	0	faldone rosso	\N	2020-03-05 07:56:43.836534
1180	352	Chocolate negro Sierra Nevada (Colombia)	70	paper	70	0	faldone rosso	\N	2020-03-11 07:31:55.522352
1181	353	Dark chocolate Ben Tre	70	paper	80	0	faldone rosso	\N	2020-03-11 07:37:52.840589
1182	354	Chocolat noir extra	75	paper	75	0	faldone rosso	\N	2020-03-11 07:41:26.441949
1183	355	Dark chocolate Beniano Bolivia	78	paper	60	0	faldone rosso	\N	2020-03-11 07:46:00.636957
1184	356	Zorzal Cacao	70	paper	50	0	faldone rosso	\N	2020-03-11 07:49:13.635441
1185	357	Tableta de chocolate semiamargo	40	box	80	0	faldone verde	\N	2020-03-19 07:25:25.103985
1186	239	Nicaragua dark	70	box	70	0	faldone verde	\N	2020-03-19 07:27:47.026487
1187	304	Organic cacao	75	box	80	0	faldone verde	\N	2020-03-19 07:29:53.609175
1188	300	Medium roast	70	box	50	0	faldone verde	\N	2020-03-19 07:31:35.415076
1189	358	Tupi	70	box	100	0	faldone verde	\N	2020-03-19 07:34:55.714354
1190	306	Mexico Soconusco Criollo	76	box	50	0	faldone verde	\N	2020-03-19 07:36:53.454361
8	26	Ecuador edelcacao	70	box	125	0	raccoglitore		2015-05-23 18:14:21
61	26	Amazonas edelcacao	60	box	125	0	raccoglitore		2015-05-23 18:14:21
224	26	Ecuador Orange	70	box	125	0	raccoglitore	da Samanta	2015-05-23 18:14:21
230	26	Arriba superieur	81	box	125	0	raccoglitore		2015-05-23 18:14:21
475	26	Arriba superieur 2015	81	box	125	0	raccoglitore		2015-05-23 18:14:21
476	26	D'amazonie	60	box	125	0	raccoglitore		2015-05-23 18:14:21
1191	26	Chili	56	box	125	0	raccoglitore	\N	2020-03-19 08:01:10.332289
1192	26	Cacao nibs	56	box	125	0	raccoglitore	\N	2020-03-19 08:01:10.332289
1193	14	Edel Bitter Ingwer Curcuma	89	box	80	0	faldone verde	\N	2020-03-19 08:03:48.408829
1194	98	Bolivia wild	66	box	45	0	\N	\N	2020-03-21 14:30:36.672397
1195	324	Dark nibs + raspberry	58	box	60	0	faldone verde	\N	2020-03-21 14:32:06.499826
1196	333	V'Vaya Nicaragua	70	box	57	0	faldone verde	\N	2020-03-21 14:47:49.848924
1197	299	Emiliano	70	box	50	0	faldone verde	\N	2020-03-21 14:52:11.847392
1198	273	Zoque	88	box	70	0	faldone verde	\N	2020-03-21 14:53:54.521425
1199	315	Cusco	80	box	70	0	faldone verde	\N	2020-03-21 14:55:34.167352
1200	288	Chuno	70	box	50	0	faldone verde	\N	2020-03-21 14:57:24.061931
1201	359	Tanzania	75	box	50	0	faldone verde	\N	2020-03-21 15:01:33.481982
1202	360	Amelonado	75	box	75	0	faldone verde	\N	2020-03-21 15:09:51.526554
1203	361	La Esmeralda Rep. Dominicana	74	box	100	0	raccoglitore	\N	2020-03-21 15:14:58.209203
1204	361	10 Tamarindos Madagascar	65	box	100	0	raccoglitore	\N	2020-03-21 15:14:58.209203
1205	331	Wasatch	70	paper	65	0	faldone rosso	\N	2020-04-16 07:33:07.676247
1206	362	Bean to bar Colombia	77	paper	80	0	faldone rosso	\N	2020-04-16 07:36:16.595213
1207	171	Sao Tome	100	paper	100	0	faldone rosso	\N	2020-04-16 07:38:56.019289
1208	283	Gorilla bar Congo	92	paper	85	0	faldone rosso	\N	2020-04-16 07:41:42.277016
1210	352	Dark chocolate Chivité Guatemale	75	paper	70	0	faldone rosso	\N	2020-04-16 08:15:06.828995
1211	16	Fondente classico (10€ in buoni)	50	paper	100	0	faldone rosso	\N	2020-04-16 08:25:55.723237
1212	16	Extra fondente (10€ in buoni)	72	paper	100	0	faldone rosso	\N	2020-04-16 08:25:55.723237
1213	302	Camino verde, Ecuador	100	paper	56	0	faldone rosso	\N	2020-04-16 09:07:45.898559
1214	363	Idduki India	70	box	50	0	faldone verde	\N	2020-04-16 09:11:22.939975
1172	13	Cacao selection L'Intenso dal Perù	74	paper	100	1	faldone rosso	\N	2020-03-05 07:42:34.04247
1143	8	Companera cioccolato extra fondente (prodotto a Orsenigo)	70	paper	100	1	faldone giallo	\N	2020-02-06 08:04:28.043304
1215	365	Millot farm, Sambirano valley, Madagascar	80	box	70	0	faldone verde	\N	2020-04-16 12:13:06.40914
1216	16	Limone con un tocco di zenzero	47	box	100	0	faldone verde	\N	2020-04-16 12:14:52.997121
1217	366	Solomon islands Guadalcanal	69	box	65	0	\N	\N	2020-04-16 12:17:19.659058
1218	294	Gran Chililique	70	box	56	0	faldone verde	\N	2020-04-16 12:19:23.077739
1219	367	Reserva Zorzal	72	box	64	0	faldone verde	\N	2020-04-16 12:22:42.49551
1220	341	Colombia, Tumaco dark	85	box	60	0	faldone verde	\N	2020-04-16 12:26:53.73588
1221	368	Choroni	70	box	60	0	\N	\N	2020-04-16 12:33:39.125453
1222	369	Cioccolato extra fondente	51	box	500	0	\N	\N	2020-04-16 12:36:22.738919
1223	9	A ccioccolata BIO mascobado	48	label	60	0	faldone giallo	\N	2020-04-16 12:38:16.312204
1225	29	Raw taste Ecuador	70	box	95	0	faldone blu	\N	2020-04-16 12:46:26.613738
1209	14	Feine bitter (100% eco pack)	71	paper	100	1	faldone rosso	\N	2020-04-16 08:11:56.431236
1224	8	Companera cioccolato al latte	34	paper	100	1	faldone giallo	\N	2020-04-16 12:40:30.002348
1227	8	Mascao al latte nocciole intere	34	box	100	0	faldone blu	\N	2020-05-30 14:09:54.022926
1228	277	Lago di Como	70	box	70	0	\N	\N	2020-05-30 14:13:17.424585
1229	370	Chocolate con Leche	\N	paper	60	0	faldone rosso	\N	2020-05-30 14:16:46.765333
1230	238	Colombie (cacao rare)	75	paper	75	0	faldone rosso	\N	2020-05-30 14:19:58.746639
1231	13	Fondente (intenso e pregiato)	50	paper	100	0	faldone rosso	\N	2020-05-30 14:22:14.775827
1232	327	Philippine south Cotabato	70	paper	60	0	faldone rosso	\N	2020-05-30 14:25:10.702784
1233	371	Philippines	75	box	60	0	faldone verde	\N	2020-05-30 14:29:29.975068
1234	372	Madagascar	70	box	85	0	faldone verde	\N	2020-05-30 14:34:27.667473
1235	16	Fondente intenso	70	box	100	0	faldone verde	\N	2020-05-30 14:37:56.615832
1236	373	Chocolate con leche y almendras	\N	box	100	0	faldone verde	\N	2020-10-03 15:06:34.927009
1237	374	Kilombero	72	box	60	0	faldone verde	\N	2020-10-03 15:10:44.43836
1238	300	Esmeraldas	66	box	50	0	faldone verde	\N	2020-10-03 15:12:36.003151
1239	375	Latschenkiefer pino mugo	61	box	50	0	faldone blu	\N	2020-10-03 15:15:40.642381
1240	306	Brazil Coopoam-trinitario	73	box	50	0	faldone verde	\N	2020-10-03 15:17:59.593144
1241	341	Maranon, Canyon dark	76	box	60	0	faldone verde	\N	2020-10-03 15:19:33.752407
1242	376	Tenaru	67	box	75	0	faldone verde	\N	2020-10-03 15:22:17.777548
1243	377	Pak Eddy, Indonesia	70	box	50	0	faldone verde	\N	2020-10-03 15:25:36.330604
1244	134	Noir extra	70	box	100	0	faldone verde	\N	2020-10-03 15:28:12.99459
1245	378	Vietnam	73	box	100	0	faldone verde	\N	2020-10-03 15:34:12.036594
1246	288	Porcelana	70	box	50	0	faldone verde	\N	2020-10-03 15:36:33.207812
1247	251	République Dominicaine	75	paper	100	0	faldone rosso	\N	2020-10-10 15:08:15.413509
1248	270	David Natei's cocoa farm, Tenaru, Guadalcanal Island	72	paper	70	0	faldone rosso	\N	2020-10-10 15:11:42.767309
1249	32	Birne-Schoko	53	paper	100	0	faldone rosso	\N	2020-10-10 15:13:54.063911
1250	32	Schwarzer-Holunder-Lavandel	53	paper	100	0	faldone rosso	\N	2020-10-10 15:13:54.063911
1251	32	Edelbitter	73	paper	100	0	faldone rosso	\N	2020-10-10 15:13:54.063911
1252	351	Dabaiba, Panama	63	paper	100	0	faldone rosso	\N	2020-10-10 15:24:10.479174
1253	276	Ghana	70	paper	64	0	faldone rosso	\N	2020-10-10 15:26:02.652481
1254	379	Pasta pura de cacao	\N	paper	300	0	faldone rosso	\N	2020-10-10 15:34:53.483645
1255	268	Monorigine Ecuador	74	paper	100	0	faldone giallo	\N	2020-10-11 13:57:03.02929
1256	268	Monorigine Dominicana	75	paper	100	1	faldone giallo	\N	2020-10-11 13:57:03.02929
1257	380	Cioccolato fondente extra dark	75	paper	100	0	faldone giallo	\N	2020-10-11 14:00:26.396775
1266	239	Uganda dark vegan	70	box	70	0	faldone verde	\N	2020-12-08 15:06:16.422556
1267	306	Chuao Venezuela trinitario	75	box	50	0	faldone verde	\N	2020-12-08 15:22:26.41783
1271	345	Uganda, Semuliki forest, 2018 harvest	72	box	50	0	faldone verde	\N	2020-12-08 15:52:12.396521
51	47	Chocolat noir Abinao	85	box	70	0	faldone verde		2015-05-23 18:14:21
101	47	Chocolat noir Caraibe	66	box	70	0	faldone verde		2015-05-23 18:14:21
309	47	Noir Abinao 2013	85	box	70	0	faldone verde		2015-05-23 18:14:21
332	47	Noir Manjari Madagascar	64	box	70	1	faldone verde		2015-05-23 18:14:21
497	47	Noir Guanaja	70	box	70	1	faldone verde		2015-06-21 15:08:08
528	47	El Pedregal 2014	64	box	70	0	faldone verde	\N	2015-08-09 16:43:27
529	47	Gran Couva 2014	64	box	70	0	faldone verde	\N	2015-08-09 16:44:15
554	47	Ampamakia millésime 2014	64	box	70	0	faldone verde	\N	2015-10-11 14:55:39
1272	381	Zamora, Amazonia	72	paper	85	0	faldone rosso	\N	2020-12-08 15:59:49.524832
1273	16	Extra fondente (senza glutine)	72	paper	100	0	faldone verde	\N	2020-12-08 16:07:32.173628
1274	8	Companera cioccolato fondente	70	paper	100	0	faldone giallo	\N	2020-12-08 16:14:57.272216
1226	8	Mascao fondente extra arancia (senza glutine)	58	box	100	1	faldone blu	\N	2020-05-30 14:05:01.179284
1156	8	Masco cocco (senza glutine)	54	box	80	1	faldone blu	\N	2020-03-03 07:23:19.42395
1275	8	Mascao fondente extra menta	61	box	100	0	faldone blu	\N	2020-12-08 16:23:49.143337
1157	8	Mascao fondente extra nocciole intere	60	box	100	1	faldone blu	\N	2020-03-03 07:24:43.585525
1276	8	Mascao fondente curcuma e pepe	60	box	100	0	faldone blu	\N	2020-12-08 16:26:24.646143
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: marcosh
--

COPY public.countries (code, name) FROM stdin;
at	Austria
au	Australia
be	Belgio
bo	Bolivia
ch	Svizzera
de	Germania
dk	Danimarca
ec	Ecuador
es	Spagna
fi	Finlandia
fr	Francia
gb	Inghilterra
gr	Grecia
hr	Croazia
ie	Irlanda
is	Islanda
it	Italia
ma	Marocco
mg	Madagascar
mx	Messico
nl	Olanda
pe	Perù
pl	Polonia
pt	Portogallo
ro	Romania
rs	Serbia
ru	Russia
se	Svezia
si	Slovenia
sk	Slovacchia
st	Sao Tomé e Principe
th	Thailandia
tr	Turchia
ua	Ucraina
us	USA
ve	Venezuela
vn	Vietnam
ae	Emirati Arabi Uniti
tw	Taiwan
no	Norvegia
br	Brasile
ca	Canada
lt	Lituania
ee	Estonia
id	Indonesia
gd	Grenada
nz	New Zeland
vc	Saint Vincent and the Grenadines
cz	Czech Republic
ar	Argentina
ph	Filippine
sg	Singapore
\.


--
-- Data for Name: producers; Type: TABLE DATA; Schema: public; Owner: marcosh
--

COPY public.producers (id, name, country, address, created_at) FROM stdin;
1	Domori	it	Via Pinerolo 72/74 - 10060 NONE (TO)	2015-05-23 20:27:55
2	Augusta Perusia	it	Via Pinturicchio, 2; 06121 Perugia (Pg)	2015-05-23 20:27:55
3	Vetusta Nursia	it	Viale della Stazione n. 41-43; Norcia (PG) 06046	2015-05-23 20:27:55
4	Vannucci	it	Voc. Caselle, 286/I - 06059 Pantalla (PG)	2015-05-23 20:27:56
5	Sensus	it	Via Giovanni Pascoli, 5; 31027 Spresiano TV	2015-05-23 20:27:56
6	Novi	it	Strada Serravalle, 73 - Novi Ligure	2015-05-23 20:27:56
7	Venchi	it	Via Cuneo, 45; 12040 Castelletto Stura (CN)	2015-05-23 20:27:56
8	Altromercato	it	viale Francia 1/C; 37135 Verona (VR)	2015-05-23 20:27:56
9	Quetzal	it	C/so Mazzini, 42 97015 Modica (Rg)	2015-05-23 20:27:56
10	Mazzari	it	Via dell'Ippodromo, 62  35129 Padova	2015-05-23 20:27:56
11	Schneekoppe	de	Müllerstr. 13 a; 21244 Buchholz / Nordheide	2015-05-23 20:27:56
12	Frankonia	de	Daimlerstr. 9; 97209 Veitshöchheim	2015-05-23 20:27:56
13	Ritter	de	Alfred-Ritter-Str. 25; D-71111 Waldenbuch	2015-05-23 20:27:56
14	Vivani	de	Diebrocker Str. 17; D-32051 Herford	2015-05-23 20:27:56
15	Svitoch	ua	pr Shevchenka 10, Lviv	2015-05-23 20:27:56
16	Lindt	ch	Seestrasse 204; 8802 Kilchberg	2015-05-23 20:27:56
17	Blikle	pl	ul. Nowy Świat 35; 00-029 Warszawa	2015-05-23 20:27:56
18	Goplana	pl	ul. Zdrojowa, 1; 62-860 Opatowek	2015-05-23 20:27:56
19	Terravita	pl	ul. Szarych Szeregów 23; 60-462 Poznan	2015-05-23 20:27:56
20	Carrefour	pl	ul. Targowa 72; 03-734 Warszawa	2015-05-23 20:27:56
21	Alpen Gold	pl	ul. Poznanska 50; 62-080 Tarnowo Podgorne	2015-05-23 20:27:56
22	Union Chocolate	pl	Al. Racławickie 6; 99-320 Zychlin	2015-05-23 20:27:56
23	Krakowski Kredens	pl	ul. Pilotow 6; 30-964 Krakow	2015-05-23 20:27:57
24	Wawel	pl	ul. Władysława Warneńczyka 14; 30-520 Krakow	2015-05-23 20:27:57
25	Wedel	pl	ul. Zamoyskiego 28/30; 03-801 Warszawa	2015-05-23 20:27:57
26	J.D.Gross	de	Stiftsbergstr. 1; D-74167 Neckarsulm	2015-05-23 20:27:57
27	Sladka Vasen	sk	Racianska 44; 832 42 Bratislava	2015-05-23 20:27:57
29	Perugina	it	v.le Richard 5; 20143 Milano	2015-05-23 20:27:57
30	Nestlè Italia	it	v.le Richard 5; 20143 Milano	2015-05-23 20:27:57
31	Baratti e Milano	it	via Don Orione, 119/c; 12042 Bra (CN)	2015-05-23 20:27:57
32	Pichler	at	Kirchgasse 6, A-9920 Sillian	2015-05-23 20:27:57
33	Alcenero	it	via Idice, 299; 40050 Monterenzio (BO)	2015-05-23 20:27:57
34	Bovetti	fr	24120 Terrasson Lavilledieu	2015-05-23 20:27:57
35	Roshen	ua	26/9 Electricov St., 04176 Kiev, Ukraine	2015-05-23 20:27:57
36	Rococo	gb	5 Motcomb St, Belgravia, London SW1X 8JU	2015-05-23 20:27:57
37	Consilia	it	Piazza Meda 3, Milano	2015-05-23 20:27:57
38	Mondo Dolce	it	via Lazio, 95; 20090 Buccignasco (MI)	2015-05-23 20:27:57
39	Fazer	fi	P.O. Box 110, 00101 Helsinki	2015-05-23 20:27:57
40	Frey	ch	CH-5033 Buchs/Aargau	2015-05-23 20:27:57
41	Maglio	it	via V. Zara, 2 - Zona PIP - 73024 Maglie (LE)	2015-05-23 20:27:57
42	Favarger	ch	1290 - Versoix - Geneva	2015-05-23 20:27:57
43	Rizzati	it	via Ginestra 196; 44100 Cocomaro (FE)	2015-05-23 20:27:57
44	ChocoLate Orgàniko	es	Juan de Huarte de San Juan, 1; Nave-F 16 Alcalà de Henares	2015-05-23 20:27:58
45	Witor's	it	26010 Corte dè Frati, Cremona	2015-05-23 20:27:58
46	Leone	it	via Italia, 46; 10093 Collegno (TO)	2015-05-23 20:27:58
47	Valrhona	fr	26600 Tain l'Hermitage	2015-05-23 20:27:58
48	Camille Bloch	ch	2608 Courtelary	2015-05-23 20:27:58
49	Bonajuto	it	Corso Umberto I, 159 - 97015 Modica (RG)	2015-05-23 20:27:58
50	Coop	it	ICAM: via dei Pescatori, 53; Lecco (LC)	2015-05-23 20:27:58
51	Leysieffer	de	49076 Osnabruck	2015-05-23 20:27:58
52	Billa	it	Strada 7 Palazzo T3; Rozzano (MI)	2015-05-23 20:27:58
53	Oxicoa	it	via Meucci 11; Druento (TO)	2015-05-23 20:27:58
54	Noi Sirius	is	Hesthalsi 2-4; IS-110 Reykjavik	2015-05-23 20:27:58
55	Bellarom	de	David-Hansemann-Stasse 1-25; D-52531 Ubach-Palenberg	2015-05-23 20:27:58
56	Pence	th	49/17 Moo 4 Soi kingkaew 30, Kingkaew road; 10540 Samutprakarn	2015-05-23 20:27:58
57	ICAM	it	via pescatori 53; 23900 Lecco	2015-05-23 20:27:58
58	Ion	gr	El. Venizelou 69, Neo Faliro; 18547 Peireas	2015-05-23 20:27:58
59	Oscar	gr	19300 Aspropyrgos, Athens	2015-05-23 20:27:58
60	Caffarel	it	via Gianavello, 41; 10062 Luserna San giovanni (TO)	2015-05-23 20:27:58
61	Pavlidis	gr	Arystoteleoys 19-21; 14451 Metamorpos	2015-05-23 20:27:58
62	Linea dolomiti	it	via Mazzini 3, Limana Belluno	2015-05-23 20:27:59
63	Nestlè Grecia	gr	Patroklou str. 4; 15125 Paradissos Maroussi	2015-05-23 20:27:59
64	Trappisti	it	via Costa Rotonda, 2; Frattocchie, Roma	2015-05-23 20:27:59
65	El Rey	ve	Carrera A-2, Parcecelas A-23 y A-24, Barquismento, Edo. Lara	2015-05-23 20:27:59
66	Ulker	tr	Maltepe Mah. Davutsapa Cad. No: 10 34015; Zeytinburnu-Istanbul	2015-05-23 20:27:59
67	La Suissa	it	via Serravalle, 99; Arquata Scrivia (AL)	2015-05-23 20:27:59
68	Majani	it	via Brodolini, 16; Crespellano (BO)	2015-05-23 20:27:59
69	Sinergie	it	via Ticino, 10; 20090 Opera (MI)	2015-05-23 20:27:59
70	Amedei	it	via San Gervasio, 29; 56025 La Rotta - Pontedera (PI)	2015-05-23 20:27:59
71	Libero mondo	it	via Vittorio Emanuele, 282; 12042 Bra (CN)	2015-05-23 20:28:01
72	Trumpf	de	Senefelderstraße 44; ‎51469 Bergisch Gladbach	2015-05-23 20:28:01
73	Albert Heijn B.V.	nl	Provincialeweg 11; 1506 MA ZAANDAM	2015-05-23 20:28:01
74	Galler	be	39, Rue de la Station; 4051 Chaudfontaine	2015-05-23 20:28:02
75	Caprano	it	via Bertodano 6/a ; 13900 Biella	2015-05-23 20:28:02
76	Le Pain Quotidien	be	rue des Colonies 11; B-1000 Brussels	2015-05-23 20:28:02
77	Fair trade original	nl	Postbus 115; 4100 AC Culemborg	2015-05-23 20:28:02
78	Tony's chocolonely	nl	Polonceaukade 12; 1014 DA Amsterdam	2015-05-23 20:28:02
79	Koska	tr	Tozkoparan Mahallesi Metro Sokat 45; Gungoren INSTANBUL	2015-05-23 20:28:02
80	Kras	hr	Ravnice 48; 10000 Zagreb	2015-05-23 20:28:02
81	Giraudi	it	via Giraudi 498; 15073 Micarella, Castellazzo Bormida (AL)	2015-05-23 20:28:02
82	Casa don Pino Puglisi	it	Largo XI Febbraio, 15; 97015 Modica (RG)	2015-05-23 20:28:02
83	Despar	it	Casalecchio di Reno (BO)	2015-05-23 20:28:02
84	Zvecevo	hr	Prehrambena industrija d.d. Pozega, Kralja Zvonimira 1	2015-05-23 20:28:02
85	Giulio Vacilotto	it	via G. Pascoli 7; 31027 Lovadina (TV)	2015-05-23 20:28:03
86	Bambi	rs	Bulevar Mihaila Pupina 115g; Beograd, Serbia	2015-05-23 20:28:03
87	Mirco Della Vecchia	it	via Sass muss, 6; Sospirolo, Belluno	2015-05-23 20:28:03
88	Zaini	it	via Carlo Imbonati, 59; Milano	2015-05-23 20:28:03
89	Ghirardelli	us	San Leandro, CA, 94578	2015-05-23 20:28:03
90	Prodotti tipici iblei	it	via Calanchi Frigintini, 40/B; 97015 Frigintini - Modica (RG)	2015-05-23 20:28:03
91	Moser Roth	de	Waldstr. 27; 13403 Berlin	2015-05-23 20:28:03
92	Cuorenero	it	Monteroduni (IS)	2015-05-23 20:28:03
94	Sarotti	de	D-12277 Berlin	2015-05-23 20:28:03
95	Giordano	it	Leinì (TO)	2015-05-23 20:28:03
96	Dolce & amaro	it		2015-05-23 20:28:03
97	Choceur	at	Hofer KG, A-4642 Sattledt, Gewerbestr. 20	2015-05-23 20:28:03
98	Nadalina	hr	LUXOR d.o.o. Put Majdana b.b. 21210 Solin	2015-05-23 20:28:03
99	Babaevsky	ru		2015-05-23 20:28:03
100	Reber	de	83435 Bad Reichenhall	2015-05-23 20:28:03
101	Stainer	it	Novoleto, Pontremoli (MS)	2015-05-23 20:28:03
102	Pernigotti	it	viale della Rimembranza, 100; 15067 Novi Ligure (AL)	2015-05-23 20:28:03
103	Heidi	ro	Pantelimon, B-dul 87, Jud. Ilfov, Romania	2015-05-23 20:28:03
104	La cure gourmande	fr	5 rue Montgolfier, 34110 Frontignan	2015-05-23 20:28:03
105	Aiguebelle	ma	174, Route Ouled Ziane, Casablanca	2015-05-23 20:28:04
106	Regina	pt	Iperial 4480 Azurara, Vila do Conde	2015-05-23 20:28:04
107	El Beato	es	Traversia Francisco Tello 5; 42300 El burgo de Osma, Soria	2015-05-23 20:28:04
108	Gardini	it	via E. Benini, 38; 47121 Forlì (FC)	2015-05-23 20:28:04
109	Pasticceria antico castello	it	via dell'industria, 5/A; 44043, Mirabello (FE)	2015-05-23 20:28:04
110	Dolomites	it	Via Puez, 1A; 39048 Selva Val Gardena (BZ)	2015-05-23 20:28:04
111	Atlante	it	via 2 giugno 1946, 8; 40033 Casalecchio di Reno (BO)	2015-05-23 20:28:04
112	Michel Cluizel	fr	Routes de conches; 27240 Damville	2015-05-23 20:28:04
113	XocoArt	it	via Marchesi, 10; Parma	2015-05-23 20:28:04
114	Tesco	gb	Cheshunt EN8 9SL	2015-05-23 20:28:04
115	Slitti	it	Via Franscesca sud, 1268; Monsummano Terme (PT)	2015-05-23 20:28:04
116	Kernow Chocolate	gb	St. Eval, Wadebridge; Cornwall PL27 7UE	2015-05-23 20:28:04
117	Schmerling's	ch	Spindelstrasse 2; 8041 Zürich	2015-05-23 20:28:04
118	Colle	it	Piazza Fiume, 2; 13900 Biella	2015-05-23 20:28:04
119	Ottochocolates	it	via B. Castello 17/R; 16121 Genova	2015-05-23 20:28:04
120	Vale	it	via C.Colombo, 51; 20090 Trezzano s/N (MI)	2015-05-23 20:28:04
121	Toms Ekstra	dk	Toms Allé 1; DK-2750 Ballerup	2015-05-23 20:28:04
122	BruCo	it	via Don Battistoni, 11; 60035 Jesi (An)	2015-05-23 20:28:04
123	Bjoernsted	de	Diebrocker Str. 17; D-32051 Herford	2015-05-23 20:28:05
124	Belgian	be	Geelseweg 72; 2pt0 Olen	2015-05-23 20:28:05
125	Cora	be	Zl 4° ru; B-6040 Jumet	2015-05-23 20:28:05
126	Planet chocolate	be	 Rue du Lombard 24 - 1000 Bruxelles	2015-05-23 20:28:05
127	VizioVirtù	it	San Polo 2898-a; 30125 Venezia	2015-05-23 20:28:05
128	Rivoli	it	Cirras; 09096 Santa Giusta (OR)	2015-05-23 20:28:05
129	Guido Gobino	it	via Cagliari 15/B; 10153 Torino	2015-05-23 20:28:05
130	Moser Roth IE	ie	po box 26, Atherstone, Warwickshire CV9 2SH	2015-05-23 20:28:05
131	Guinness	ie	Navan IDA Business Park, Johnstone, Navan, Co. Meath	2015-05-23 20:28:05
134	Cote d'or	be	Stationsstraat 100; 2800 Mechelen	2015-05-23 20:28:05
135	Nestlè	ch	Vevey	2015-05-23 20:28:05
136	Butlers	ie	51Grafton Street; Dubiln 2	2015-05-23 20:28:05
137	Isis	dk	Aarhus	2015-05-23 20:28:05
138	Loacker	it	I-39054 Unterinn; Auna di sotto (BZ)	2015-05-23 20:28:05
139	Kate Kearney's	ie	Fonthill Road, Dublin 22	2015-05-23 20:28:05
140	Sperlari	it	via Milano 16; Cremona	2015-05-23 20:28:05
141	The chocolate line	be	Simon Stevinplein 19 - 8000 Brugge	2015-05-23 20:28:05
142	Pacari	ec	Julio Zaldumbide N24-676 y Miravalle; Quito	2015-05-23 20:28:05
143	Fredric Blondeel	be	Basteenkaai 36 - 1000 Brussel	2015-05-23 20:28:05
144	Wittamer	be	Place du Grand Sablon, 2 - 1000 Bruxelles	2015-05-23 20:28:05
145	Cioccolateria Dolomiti	it	Via dell'Artigianato, 20; Belluno	2015-05-23 20:28:06
146	Menakao	mg	BP 4101 Ambohidratrimo Antananarivo 101	2015-05-23 20:28:06
147	Simon Coll	es	Sant Pere, 37; 08770 Sant Sadurnì d'Anoia, Barcelona	2015-05-23 20:28:06
148	Marou	vn	Saigon	2015-05-23 20:28:06
149	EquoLink	it	Via Masaccio 21; Reggio nell'Emilia (RE)	2015-05-23 20:28:06
150	Seed and Bean	gb	8-12 Woodhouse road, London N12 ORG	2015-05-23 20:28:06
151	Gay Odin	it	Via Vetriera, 12; Napoli	2015-05-23 20:28:06
152	Alprose	ch	CH-6987 Caslano-Lugano	2015-05-23 20:28:06
153	Altraqualità	it	via Toscanini, 11; Ferrara	2015-05-23 20:28:06
154	Pierre Marcolini	be	Place du Grand Sablon - 1000 Bruxelles	2015-05-23 20:28:06
155	Stella	ch	via alle Gerre 28, 6512 Giubiasco	2015-05-23 20:28:06
156	Darcis	be	Crapaurue 123, Verviers	2015-05-23 20:28:06
157	Artisan du chocolat	gb	The Long Barrow, Orbital Park, Ashford Kent TN240GP.	2015-05-23 20:28:06
158	B by B	be	Sint Amandstraat 39, 8000 Brugge	2015-05-23 20:28:06
159	Adelia Di Fant	it	via Garibaldi 26; san Daniele del Friuli	2015-05-23 20:28:06
160	Milka	it	via Nizzoli, 3; Milano (MI)	2015-05-23 20:28:06
161	Cioccolateria Veneziana	it	Via Chiesanuova 91, 30027; San Donà di Piave (VE)	2015-05-23 20:28:06
162	Bruyerre	be	Rue FL Bruyerre, 34; B-6041 Gosselies	2015-06-21 15:21:50
164	Claudio Corallo	st	S.A.S. Lda.	2015-06-21 15:31:28
165	Conad	it	via Michelino 59; Bologna	2015-06-21 15:37:24
166	Bonnat	fr	8 cours Sénozan; BP 48; 38502 Voiron	2015-06-21 15:47:29
167	T'a	it	via Monte Grappa 4; Cerro Maggiore (MI)	2015-06-21 15:54:48
168	Chocopolis	be	Rue du Marché aux Herbes 81, 1000 Bruxelles	2015-06-21 15:58:44
169	Go*do	it	via Pescatori 53; 23900 Lecco	2015-08-09 16:23:49
170	Continente	pt	Apartado 60111, 2701-997 Amadora	2015-08-09 16:29:17
172	Casa Grande	pt	Rua S. Joao, 4760-721 Ribeirao	2015-08-09 16:36:45
173	Pingo doce	pt	Rua Actor Antonio Silva, 7; 1649-033 Lisboa	2015-08-09 17:00:53
175	Guido Castagna	it	via Torino, 54; 10094 Giaveno (TO)	2015-10-11 14:34:12
176	Il modicano	it	via Mercè, 69; 97015 Modica (RG)	2015-10-11 14:35:47
177	Bodrato	it	str. del Turchino, 41; 15067 Novi Ligure (AL)	2015-10-11 14:37:39
178	Delhaize group	be	Rue Osseghemstraat 53; B-1080 Brussels	2015-10-11 14:41:19
179	Dolciando	it	via Campalto, 3/D; 37036 San Martino B.A. (VR)	2015-10-11 14:43:08
180	Cémoi	fr	avenue Julien Pachot CS00002; 66968 Perpignan Cedex 9	2015-10-11 14:48:11
181	Cioccolato croci	it	via P.CLotilde 6/a; Torino	2015-11-22 17:21:25
182	Blanxart	es	Tambor del Bruc, 13-17; 08970 Sant Joan Despì, Barcelona	2015-11-22 17:33:54
183	Borgodoro	it	via Collegno, 49; Alignano (TO)	2015-11-22 17:41:29
184	Green Dream	be	Noorwegenstraat 19; 9940 Evergem	2015-11-22 18:11:55
185	Ciokarrua	it	via sacro cuore 64/e; 97015 Modica (RG)	2015-11-22 18:23:53
186	Antica Dolceria Rizza	it	via Sacro Cuore 64; Modica (RG)	2015-11-22 18:29:23
187	Les chocolates di Pauline	fr	Z.A. La Grande Chevasse; 85260 St Sulpice Le Verdon	2016-01-01 16:09:15
188	Nutal SRL	it	Via Cave Rosse 11/a; 12073 Ceva (CN)	2016-01-01 16:32:59
189	Chocolate Amatller	es	Sant Pere, 37; 08770 Sant Sadurnì d'Anoia, Barcelona	2016-01-01 16:41:35
190	Chocolates valor	es	Pianista Conzalo Soriano, 13; 03570 Villajoyosa, Alicante	2016-01-01 16:57:45
191	Alnatura	de	Darmstadter strasse, 63; D-64404 Bickenbach	2016-01-01 17:03:39
192	Tirma	es	Avda de Escaleritas, 104; 35011 Las Palmas de G.C.	2016-01-01 17:06:59
193	El artesano	es	CV 800 Poligono El Espartal s/n C.P. 03100 Jijona (Alicante)	2016-02-21 10:12:18
194	La candelaria	es	C/ El Timple 15, Pol. Industrial Las Almenas, 38430 Icod de los Vinos	2016-02-21 10:14:43
195	Donna Elvira	it	via Risorgimento 32, Modica (RG)	2016-02-21 10:28:37
196	Cachet	be	Grijpenlaan 11, 3300 Tienen, Belgium	2016-02-21 16:15:51
197	Ethiquable	be	Rue Chaudin 237, B-5300 Andenne	2016-02-21 16:38:58
198	Chocolat factory	es	Francesc Vila s/n Nave 8; 08173 Sant Cugat del Vallés, Barcelona	2016-02-21 16:58:15
199	Roccati	it	via Clavature 17/a; 40124 Bologna	2016-02-21 17:14:22
200	Peyrano	it	Corso Monalieri, 47; 10133 Torino	2016-04-03 16:04:33
201	MIV Cioccolaterie	it	via A. Merloni, 20; 60010 Ostra (AN)	2016-04-03 16:08:30
202	Vivoo	it	Via del commercio, 16; 37066 Sommacampagna	2016-04-03 16:12:21
203	Naturata	de	D-71672 Marbach DE-OKO-007	2016-05-28 14:58:20
204	Scharffen Berger	us	Robinson, Illinois 62454	2016-05-28 15:23:46
205	Green & black	us	East Hanover, NJ 07936	2016-05-28 15:26:47
208	Cadbury	au	323 Canterbury road; Ringwood Victoria 3134	2016-05-28 15:34:49
209	El ceibo	bo	Av. Juan Pablo II No. 2560; El Alto, La Paz	2016-05-28 15:37:47
210	Fior di Loto	it	Prima Strada 1/A - 10043 Orbassano (TO)	2016-09-04 13:56:03
211	Eza	at	Wenger strasse 5, A-5203 Kostendorf	2016-09-04 14:08:12
212	Monasterio de San Pedro de Cardena	es		2016-09-04 14:28:39
213	Braun	at		2016-09-04 14:47:34
214	NewTree	be	\N	2016-09-04 15:30:11
215	Laurent Gerbaud	be	Rue Ravenstein 2D; B1000 Bruxelles	2016-09-04 15:33:52
216	Berger	at	Schokoladenweg 1; A-5090 Lofer	2016-09-04 15:37:20
217	Orset	ch	7 place de la Fusterie; CH-1211 Geneve 3	2016-09-04 15:49:39
218	Para ti	bo	Calle Monteagudo - Zona Garcilazo - Sucre	2016-09-04 15:55:55
219	Walde	it	Pass. Brignoles 2, I-39031 Brunico (BZ)	2016-12-09 10:23:00
220	Ecor	it	via L. De Besi 20/C, Verona (VR)	2016-12-09 10:52:36
221	Vanini	it	Via Caio Plinio 5/7 – Orsenigo (CO)	2016-12-09 11:20:32
222	Subiza	es	C/. Amaya , 30; 31004 Pamplona	2016-12-09 14:04:32
223	Hacendado	es	Sanchis Mira, S.A. Pol. Ind. Segorb, s/n Jijona (Alicante)	2016-12-09 14:24:36
224	Lviv handmande chocolate	ua	\N	2016-12-09 14:37:59
225	Los Tesoros de Machipicchu	pe	Av. Prolongacion Vilcanota S/N Calca - Cusco	2016-12-09 17:45:23
226	Arriba Gold	us	420 East 102nd St 3C; New York, NY 10029	2016-12-09 17:51:51
227	La Nusta	pe	Urb. Huancaro, Cl. Profesionales Mza. C Lote I	2016-12-09 17:56:11
228	Daintree Estates	au	51 Pringle Street, Mossman QLD 4873, Australia	2016-12-09 18:00:45
229	Patrick Roger	fr	32, rue de Coudrais 92330 Sceaux	2016-12-09 18:03:30
230	Casa Angel	es	C/La Carrera, 7 Santillana del Mar	2016-12-31 15:00:57
231	America	pe	Av. Huayruropata 1724, Cusco	2017-01-28 14:34:42
232	Gorenjka	si	Smartinska c. 154, 1529 Ljubljana	2017-01-28 14:41:48
233	Nestle Peru	pe	Av. Los Castillos cdra. 3, Urb. Ind. Santa Rosa, Ate	2017-01-28 16:03:32
234	Dolci Saperi	it	via Panceri 3 - 20037 Paderno D. (MI)	2017-02-04 16:38:45
235	Vestri	it	via Romana 161 B/C; 52100 Arezzo	2017-02-04 16:41:49
236	Pam e Panorama	it	via del commercio, 27 - 30038 Spinea (VE)	2017-03-04 16:05:20
237	Sol Del Cusco	pe	Av. San Luis 890 - Lima	2017-04-23 13:57:04
238	Chapon	fr	rue de Valengelier, 2 - 77500 Chelles	2017-04-23 14:00:24
239	Zotter	at	Bergl, 56, A-8333 Riegersburg	2017-04-23 14:09:25
240	Die Spiegelburg	de	Hafenweg 30, 48155 Munster	2017-05-28 15:29:50
241	Dardenne	fr	D125 - Salles et Pratviel - 31 110 Luchon	2017-07-29 14:53:34
242	Chocolates di Perugia	pe	Avenida La Paz, 2350 San Miguel, Lima	2017-07-29 14:59:16
243	Clos de l'Arcke	fr	41320 Langon	2017-07-29 15:05:06
244	Un dimanche à Paris	fr	4-6-8, Cour du Commerce Saint Andrè, Odéon, Paris	2017-07-29 15:11:07
246	Marks & Spencer	gb	PO Box 3339 Chester CH99 9QS	2017-07-29 15:18:20
247	Ikea	se	Almhultsgatan 2, SE-215 86 Malmo	2017-07-29 15:22:09
248	motycafè	it	corso Umberto I, 137; Modica	2017-10-28 15:21:50
249	Ciokcafè	it	corso Umberto I, 110; 97015 Modica (RG)	2017-10-28 15:30:17
250	Xocolat	at	Servitengasse 5, 1090 Wien	2017-10-28 15:37:06
251	Francois Pralus	fr	34, rue Général Giraud; 42300 ROANNE	2017-12-08 15:18:22
252	Magnum	gb	KCL, Units 1 & 2 Oxborough Lane, Fakenham, Norfolk, NR21 8AF	2017-12-08 16:06:23
253	La maison du chocolat	fr	41, rue Paul Lescop 92000 Nanterre	2017-12-08 16:09:00
254	Saldac	fr	14 chemin des Blaches du levant 26200 Montélimar	2017-12-08 16:14:25
255	Martin Mayer	at	Zwisl 1, 4714 Meggenhofen	2017-12-08 16:22:30
256	Moroso	it	Piazza Aquileia, 27, Zompicchia di Codroipo	2017-12-08 16:32:43
257	Carrefour	it	Via Caldera, 21 - 20153 Milano	2017-12-09 15:51:13
258	B.langhe	it	str. Basse 7/c - 12051 Alba	2018-02-17 15:29:27
259	Motta	it	via Verdi, 31 - 37060 Castel d'Azzano (VR)	2018-02-17 16:00:01
260	Ricar	nl	Lusernestraat 39, Nieuw-Vennep	2018-02-17 16:36:37
261	Wickedly Welsh	gb	Withybush Industrial Park, Withybush road - Haverfordwest, Pembrokeshire, SA62 4BS	2018-02-18 09:38:59
262	Maria Teportlan	mx	Chablekal CP 97305 Merida Yucatan	2018-02-18 09:47:37
263	Lidl	de	Stiftsbergstr. 1, D-74167 Neckarslum	2018-02-18 09:57:41
265	Astor chocolate	us	Lakewood, NJ 08701	2018-02-18 11:19:13
266	Taza	us	561 Windsor Street - Somerville , MA 02143	2018-02-18 11:22:27
267	Verkade	nl	Antwoordnummer 1310, 1500 WC Zaandam	2018-02-18 11:27:19
268	Beppiani	it	via Madonna del Piave, 24, Lentiai (BL)	2018-04-03 13:34:13
269	Caffè dell'arte	it	\N	2018-04-03 14:07:29
270	Pump Street	gb	Orford, Suffolk, UK	2018-04-03 14:49:29
271	Cusco ancestral	pe	Urb. La florida H-3 Wanchaq - Cusco	2018-04-03 15:24:03
272	Gepa	de	Weg 1, 42327 Wuppertal	2018-04-03 15:27:20
273	Original beans	nl	Mauritskade 64, 1092AD Amsterdam	2018-04-03 15:35:45
274	Chocolat Madagascar	mg	S.A, B.P 6211, 101 Antananarivo	2018-06-02 14:58:06
275	Stollwerck	de	Am Stammgleis 9, 22844 Norderstedt	2018-06-02 15:00:50
276	Ethereal	us	113 South Benton Street, Woodstock, IL 60098	2018-06-02 15:04:01
277	Amaro	it	piazza Risorgimento, 1 Carate (MB)	2018-06-02 15:08:05
278	Barbero	it	via Brofferio, 84	2018-06-02 15:38:39
279	Iper	it	via Ponchielli, 7 - 20129 Milano	2018-06-02 15:41:00
280	Ghiott cioccolato	it	via Sangallo, 21 - 50028 Tavernelle Val di Pesa (FI)	2018-10-14 19:40:43.766122
281	Pasticceria Chantilly	it	Corso Umberto I, 76 - 97015 Modica (RG)	2018-10-14 20:25:45.623384
282	Prana	it	Fraz. Morano M. - 06023 Gualdo Tadino (PG)	2018-10-14 20:40:25.498063
283	Chocolate makers	nl	zesde vogelstraat 54 - 1022 XE, Amsterdam	2018-10-20 15:21:45.185779
284	Mirzam	ae	Dubai	2018-10-20 15:26:19.378536
285	Goodnow Farms chocolate	us	80 Goodnow Road - Sudbury, MA 01776	2018-10-20 15:33:31.386149
286	Eritaj chocolat	fr	67000 Strasbourg	2018-10-20 15:54:18.599459
287	Piotr i Pawel	pl	ul. Druskienicka 12 - 60-476 Poznan	2018-10-20 16:31:55.588646
288	manufaktura Czekolady	pl	Goscinowa 116, 05-092 Lomianki	2018-10-20 16:37:27.519709
289	Biedronka	pl	ul. Zniwna 5, 62-025 Kostrzyn	2018-10-20 16:43:15.969343
290	Joel Durand	fr	3, boulevard Victor-Hugo - 13210 SaintRemy de Provence	2018-10-20 16:47:44.636484
291	Jeff de Bruges	fr	12 avenue Joseph Paxton, 77164 Ferrieres-en-Brie	2018-10-20 16:52:18.204304
292	Le petit duc	fr	7, Boulevard Victor Hugo - 13210 Saint Remy de Provence	2018-10-20 16:54:44.180682
294	Solkiki	gb	Pinnacle, North St., TA12 6DH	2018-10-20 17:10:34.688004
295	Chocolate Tree	gb	5A Knox Place, Haddington, Scotland EH41 4DY	2018-10-20 17:15:35.694362
297	Berryshka	si	Sentvid pri Sticni 152	2018-10-20 17:21:17.686106
298	Fu Wan	tw	No. 100, Dapeng Rd., Donggang Township, Pingtung Country 928	2018-10-20 17:25:03.053563
299	Mucho chocolate	mx	Milan 45, col. Juarez, CDMX	2018-10-20 17:29:45.759687
300	Conexion	ec	Quito	2018-10-20 17:33:03.815776
301	Shattel	pe	Mz. B Lote 4 Guayabo, Pachacamac, Lima	2018-10-20 17:36:06.490062
302	Dandelion	us	740 Valencia st, San Francisco; California 94110	2018-12-27 11:15:43.368973
303	Fjak	no	\N	2018-12-27 11:20:09.914101
304	Amma	br	Rua Dr. Altino Teixeira, 1260, Salvador BA Bahia 41233	2018-12-27 11:24:26.092842
305	Brookside	ca	Mississauga, Ontario, L4W 0B1	2018-12-27 11:28:39.077241
306	Georgia Ramon	de	Koenigswinterer Strasse 624, 53227 Bonn/Oberkassel	2018-12-27 11:31:53.614702
307	El portal de Cusco	pe	\N	2018-12-27 11:37:06.735422
308	President's choice	ca	Toronto M4T 2S8	2018-12-27 11:40:16.537458
309	Karuna	lt	Taikos pr 88, LT-51182 Kaunas	2018-12-27 11:44:54.609591
310	Choco Koo	ee	Telliskivi 33, 10611 Tallin	2018-12-27 11:47:36.311265
311	Rukét	it	via Statale, 12 - Sant'Agostino (FE)	2019-02-16 15:00:26.471298
312	Krakakoa	id	Bandar Lampung	2019-02-16 15:59:17.013941
313	Friis Holm	dk	Ndr. Ryevej 80, DK-4060 Kirke Såby 	2019-02-16 16:06:00.156119
314	Belmont	gd	Belmont Estate, St. Patrick	2019-02-16 16:10:11.725982
315	Maranà	pe	Calle las Magnolias 207, Barranco, Lima	2019-02-16 16:16:00.65209
316	Millenium	ua	49010, Dnipro, Str. Marie Curie 5	2019-02-16 16:59:11.706825
318	Hogarth	nz	10F Kotua place, Nelson	2019-02-16 17:03:47.943889
320	Sabadì	it	via Sorda Sampieri, 262; 97015 Modica (RG)	2019-04-26 09:57:00.597763
321	Ara chocolat	fr	54 Rue de Dunkerque;  75009 Paris	2019-04-26 10:06:24.966716
322	Dormouse Chocolates	gb	2 Atherton St. Manchester, M3 3GS	2019-04-26 10:09:41.701918
323	JK Fine chocolates	gb	\N	2019-04-26 10:29:28.579013
324	Omnom	is	Holmaslod 4, 101 Reykjavik	2019-04-26 13:07:20.176317
325	Islands chocolate	vc	Kingstown, P.O BOX 1774	2019-04-26 13:34:53.84045
326	Mestico chocolates	br	R. Baluarte, 528 - Itaim Bibi, São Paulo - SP, 04549-012	2019-04-26 13:38:14.912851
327	Duffy's	gb	Unit 2E, Humberston Business Park, Wilton Road Estate, Cleethorpes, DN36 4BJ	2019-04-26 13:41:22.702912
328	Soma chocolatemaker	ca	32 Tank House Lane, Toronto (Ontario) M5A 3C4	2019-04-26 13:46:42.178828
329	Ritual chocolate	us	1105 Iron horse drive, Park City, UT 84060	2019-04-26 13:56:35.394286
330	Crai	it	Via F.lli Cervi, Segrate (MI)	2019-06-15 14:11:47.827949
331	Solstice chocolate	us	Salt Lake City, UT 84123	2019-06-15 14:37:43.677862
332	Lubimov	ua	49010 Dnipropetrovsk city, Mary Curie street, 5	2019-06-15 15:01:51.527998
333	Naive	lt	Mulate UAB (Zietelos 3)	2019-06-15 15:06:51.872835
334	Akesson's	gb	15b Blenheim Crescent - Notting Hill - London W11 2EE	2019-06-15 15:19:09.812521
335	Cacaosuyo	pe	calle Robert Fulton n° 145, Ate. Lima	2019-06-15 15:24:12.133226
336	Luisa Abram	br	Rua Joaquim dos Reis, 311-CEP: 04727-150- Sao Paolo-SP	2019-06-15 15:28:45.568408
337	Tosier	gb	Ipswich, Suffolk IP1 2PP	2019-06-15 15:34:42.574457
338	Puyricard	fr	avenue Georges de Fabry - 13540 Puyricard	2019-06-15 15:53:01.28814
339	Shoud'e	ua	Yaseneva str. Kharkiv, 61066	2019-06-15 16:02:36.217129
340	Qantu	ca	2000, Rue Notre-Dame Est, Montreal QC	2019-06-15 16:07:31.485588
341	Fruition	us	3091 route 28, Shokan, NY 12481	2019-06-15 16:09:45.415535
342	Innato	pe	av. Circunvalaciòn dal club Golf Los Incas, n° 154 Of. 504 Santiago de Surco Lima 33	2019-06-15 16:12:55.813797
343	Solocacao	it	via Broletto 1/A, 42121, Reggio Emilia	2019-07-02 12:30:17.166959
344	Al nassma	ae	PO Box 117584, Dubai	2019-07-02 12:32:33.54765
345	Svenska kakaobolaget	se	Tranesvägen 37, 27392 Skåne-Tranås	2019-07-02 12:41:31.138451
346	Cocama	pe	Sector 2 group 21 mza, P. Lote 20, Lima 15831	2019-07-02 12:43:43.865256
347	Bohemian Chocolate Paradise	cz	Praha	2019-07-02 12:46:32.045142
348	Peluso	it	C.le Trecasucce, 41 - 97015 Modica	2020-03-02 08:04:32.307845
349	L'Angelica	it	via Maggiore Piovesana, 111; Conegliano (TV)	2020-03-03 07:36:18.832343
350	Rossmann	de	Isernhagener Str. 16, DE-30938 Burgwedel	2020-03-05 07:44:51.294707
351	Morin	fr	640 Chemin du Plan; 26290 Donzère	2020-03-05 07:47:57.663258
353	Belvie	vn	D11/3A Quach Dieu, Vinh Loc A Ward, Binh Chanh District, Ho Chi Minh City	2020-03-11 07:36:55.807406
354	Robert Chocolatier	mg	Antananarivo	2020-03-11 07:40:02.538411
355	Oialla	dk	Dyrehaven 7, 2930 Klampenborg	2020-03-11 07:45:03.282176
356	Raaka	us	64 Seabring Street Brooklyn, NY 11231	2020-03-11 07:48:14.930937
357	Havanna chocolates	ar	Brandesen 3251 Mar Del Plata, Buenos Aires	2020-03-19 07:24:26.646802
358	Auro chocolate	ph	Block 2F Lot 3, Phase I Filinvest Technology Park, Calamba City, Laguna	2020-03-19 07:34:21.31814
359	Jordis	cz	Spitalska 149/7, Hradec Kralove	2020-03-21 15:00:48.779791
360	Diogo Vaz	st	\N	2020-03-21 15:08:50.997887
361	Pancracio	es	Calle José del Toro, 2, 11001 Cádiz	2020-03-21 15:13:01.238468
362	Taucherli	ch	Ueberlandstrasse 18, 8015 Zurich	2020-04-16 07:35:38.809347
171	Chocolataria Equador	pt	R. da Misericórdia 72, Lisboa, Portugal	2015-08-09 16:33:56
352	Utopick	es	Matias Perellò 14, 46005 Valencia	2020-03-11 07:25:07.621113
363	Standout chocolate	se	Farasvagen 45, 42837 Kallered	2020-04-16 09:10:22.4042
365	Chocolarder	gb	Falmouth, TR3 7JW	2020-04-16 09:15:04.699422
366	Firetree	gb	3 Holkham road, Peterbrough, PE2 6TE	2020-04-16 12:16:38.384765
367	Chequessett	us	8 Highland road, P.O. Box 250, North Truro, MA 02652	2020-04-16 12:21:19.179553
368	Franceschi	ve	Edif. Paisa PB Local 11 Urb. Bello Monte, Caracas, Distrito Capital 1050	2020-04-16 12:33:01.472978
369	Alberti	it	piazza Colonna, Benevento	2020-04-16 12:35:41.100148
370	Patagonian life	ar	Charcas 2737 Piso 4 Depto D, Ciudad di Buenos Aires	2020-05-30 14:15:46.213867
371	Land	gb	14 Teensdale Yard, Bethnal Green, London E2 6QE	2020-05-30 14:28:19.32193
372	Boho	us	296C Nonotuck St., Florence, MA 01062	2020-05-30 14:33:52.376785
373	La Oma de Ushuaia	ar	San Martin 499 - (9410). Ushuaia. Pcia. de Tierra del Fuego / Patagonia	2020-10-03 15:05:20.567423
374	Desbarres	ca	Uxbridge, ON Canada L9p 1b9	2020-10-03 15:08:14.925731
375	Oberholler	it	4 zona artigianale I-39058 Sarentino (BZ)	2020-10-03 15:14:48.37308
376	Metiisto	au	3/19 Croft Crescent; Toowoomba, QLD 4350	2020-10-03 15:21:32.77579
377	Fossa	sg	2 Mandai Link #02-04A, Singapore 728664	2020-10-03 15:25:00.489622
378	Lucifer	si	Šaleška cesta 19a, 3320 Velenje	2020-10-03 15:33:38.453751
379	la continental	pe	Tda. Av. Apurìmac 436 Cusco	2020-10-10 15:33:56.918648
380	Cadoro	it	Via T. Abbate, 65 Quarto D'Altino (VE)	2020-10-11 13:59:46.373542
381	Askinosie	us	514 E. Commercial St., Springfield, MO 65803	2020-12-08 15:58:10.302532
\.


--
-- Name: chocolates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marcosh
--

SELECT pg_catalog.setval('public.chocolates_id_seq', 1276, true);


--
-- Name: producers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marcosh
--

SELECT pg_catalog.setval('public.producers_id_seq', 381, true);


--
-- Name: chocolates chocolates_pkey; Type: CONSTRAINT; Schema: public; Owner: marcosh
--

ALTER TABLE ONLY public.chocolates
    ADD CONSTRAINT chocolates_pkey PRIMARY KEY (id);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: marcosh
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (code);


--
-- Name: producers producers_pkey; Type: CONSTRAINT; Schema: public; Owner: marcosh
--

ALTER TABLE ONLY public.producers
    ADD CONSTRAINT producers_pkey PRIMARY KEY (id);


--
-- Name: chocolates fk_chocolates_1; Type: FK CONSTRAINT; Schema: public; Owner: marcosh
--

ALTER TABLE ONLY public.chocolates
    ADD CONSTRAINT fk_chocolates_1 FOREIGN KEY (producer_id) REFERENCES public.producers(id);


--
-- Name: producers fk_producers_1; Type: FK CONSTRAINT; Schema: public; Owner: marcosh
--

ALTER TABLE ONLY public.producers
    ADD CONSTRAINT fk_producers_1 FOREIGN KEY (country) REFERENCES public.countries(code);


--
-- PostgreSQL database dump complete
--

