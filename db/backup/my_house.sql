--
-- PostgreSQL database dump
--

-- Dumped from database version 14.17 (Homebrew)
-- Dumped by pg_dump version 14.17 (Homebrew)

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: bills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bills (
    id bigint NOT NULL,
    electricity_quantity integer DEFAULT 0 NOT NULL,
    water_quantity integer DEFAULT 0 NOT NULL,
    electricity_cost integer DEFAULT 0 NOT NULL,
    water_cost integer DEFAULT 0 NOT NULL,
    surcharge_fee integer DEFAULT 1 NOT NULL,
    total_amount integer DEFAULT 0 NOT NULL,
    meter_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.bills OWNER TO postgres;

--
-- Name: bills_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bills_id_seq OWNER TO postgres;

--
-- Name: bills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bills_id_seq OWNED BY public.bills.id;


--
-- Name: general_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.general_settings (
    id bigint NOT NULL,
    rent integer DEFAULT 0 NOT NULL,
    electricity_price integer DEFAULT 0 NOT NULL,
    water_price integer DEFAULT 0 NOT NULL,
    surcharge integer DEFAULT 0 NOT NULL,
    room_name character varying,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.general_settings OWNER TO postgres;

--
-- Name: general_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.general_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.general_settings_id_seq OWNER TO postgres;

--
-- Name: general_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.general_settings_id_seq OWNED BY public.general_settings.id;


--
-- Name: meters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.meters (
    id bigint NOT NULL,
    month_used date NOT NULL,
    electricity_index integer DEFAULT 0 NOT NULL,
    water_index integer DEFAULT 0 NOT NULL,
    amount_of_members integer DEFAULT 1 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.meters OWNER TO postgres;

--
-- Name: meters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.meters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meters_id_seq OWNER TO postgres;

--
-- Name: meters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.meters_id_seq OWNED BY public.meters.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: bills id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bills ALTER COLUMN id SET DEFAULT nextval('public.bills_id_seq'::regclass);


--
-- Name: general_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.general_settings ALTER COLUMN id SET DEFAULT nextval('public.general_settings_id_seq'::regclass);


--
-- Name: meters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meters ALTER COLUMN id SET DEFAULT nextval('public.meters_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2024-01-30 14:25:04.614072	2024-01-30 14:25:04.614072
\.


--
-- Data for Name: bills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bills (id, electricity_quantity, water_quantity, electricity_cost, water_cost, surcharge_fee, total_amount, meter_id, created_at, updated_at) FROM stdin;
1	82	4	311600	120000	100000	5631600	2	2024-01-30 14:33:18.954256	2024-01-30 14:33:18.954256
2	88	6	334400	180000	100000	5714400	3	2024-01-30 14:35:59.739199	2024-01-30 14:35:59.739199
3	242	14	919600	420000	200000	6639600	4	2024-01-30 14:38:28.587525	2024-01-30 14:38:28.587525
4	262	12	995600	360000	200000	6655600	5	2024-02-04 12:51:33.042247	2024-02-04 12:51:33.042247
5	99	7	376200	210000	300000	5986200	6	2024-03-06 00:47:00.742047	2024-03-06 00:47:00.742047
6	164	14	623200	420000	300000	6443200	7	2024-04-05 02:49:37.046381	2024-04-05 02:49:37.046381
7	184	14	699200	420000	300000	6519200	8	2024-05-06 12:29:12.655277	2024-05-06 12:29:12.655277
8	324	17	1231200	510000	300000	7141200	9	2024-06-05 01:33:53.227054	2024-06-05 01:33:53.227054
9	383	17	1455400	510000	300000	7365400	10	2024-07-06 03:44:27.599962	2024-07-06 03:44:27.599962
10	317	16	1204600	480000	300000	7084600	11	2024-08-05 06:39:01.218402	2024-08-05 06:39:01.218402
11	304	13	1155200	390000	300000	6945200	12	2024-09-05 03:45:47.86314	2024-09-05 03:45:47.86314
12	217	14	824600	420000	300000	6844600	13	2024-10-07 02:28:16.171076	2024-10-07 02:28:16.171076
13	183	17	695400	510000	300000	6805400	14	2024-11-05 13:17:17.009804	2024-11-05 13:17:17.009804
14	172	17	653600	510000	300000	6763600	15	2024-12-08 13:16:00.367518	2024-12-08 13:16:00.367518
15	140	14	532000	420000	200000	6452000	16	2025-01-05 09:40:24.67478	2025-01-05 09:40:24.67478
16	107	9	406600	270000	200000	6176600	17	2025-02-05 02:21:48.581636	2025-02-05 02:21:48.581636
17	244	12	927200	360000	200000	6787200	18	2025-03-08 13:32:08.665053	2025-03-08 13:32:08.665053
18	136	13	516800	390000	200000	6406800	19	2025-04-08 13:54:18.004315	2025-04-08 13:54:18.004315
\.


--
-- Data for Name: general_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.general_settings (id, rent, electricity_price, water_price, surcharge, room_name, description, created_at, updated_at) FROM stdin;
2	5100000	3800	30000	100000	\N	\N	2025-04-12 04:41:15.278451	2025-04-12 04:41:15.278451
1	5300000	3800	30000	100000	602	Số nhà 54, nghách 56, ngõ 376, đường Bưởi, phường Vĩnh Phúc, quận Ba Đình, Hà Nội	2024-01-30 14:25:05.019425	2025-04-13 13:59:22.099942
\.


--
-- Data for Name: meters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.meters (id, month_used, electricity_index, water_index, amount_of_members, created_at, updated_at) FROM stdin;
1	2023-10-01	7011	498	1	2024-01-30 14:30:57.001113	2024-01-30 14:30:57.001113
2	2023-11-01	7093	502	1	2024-01-30 14:31:31.994246	2024-01-30 14:31:31.994246
3	2023-12-01	7181	508	1	2024-01-30 14:35:41.120959	2024-01-30 14:35:41.120959
4	2024-01-01	7423	522	2	2024-01-30 14:37:27.395509	2024-01-30 14:37:27.395509
5	2024-02-01	7685	534	2	2024-02-04 12:49:44.602957	2024-02-04 12:49:44.602957
6	2024-03-01	7784	541	3	2024-03-06 00:39:51.679832	2024-03-06 00:39:51.679832
7	2024-04-01	7948	555	3	2024-04-05 02:49:02.968199	2024-04-05 02:49:02.968199
8	2024-05-01	8132	569	3	2024-05-06 12:28:36.954553	2024-05-06 12:28:36.954553
9	2024-06-01	8456	586	3	2024-06-05 01:32:19.795598	2024-06-05 01:32:19.795598
10	2024-07-01	8839	603	3	2024-07-06 03:43:44.178199	2024-07-06 03:43:44.178199
11	2024-08-01	9156	619	3	2024-08-05 06:37:30.420073	2024-08-05 06:37:30.420073
12	2024-09-01	9460	632	3	2024-09-05 03:45:30.42163	2024-09-05 03:45:30.42163
13	2024-10-01	9677	646	3	2024-10-07 02:24:50.168285	2024-10-07 02:24:50.168285
14	2024-11-01	9860	663	3	2024-11-05 13:16:20.713741	2024-11-05 13:16:20.713741
15	2024-12-01	10032	680	3	2024-12-08 13:15:11.776311	2024-12-08 13:15:11.776311
16	2025-01-01	10172	694	2	2025-01-05 09:40:10.651069	2025-01-05 09:40:10.651069
17	2025-02-01	10279	703	2	2025-02-05 02:20:08.415973	2025-02-05 02:20:08.415973
18	2025-03-01	10523	715	2	2025-03-08 13:31:53.507845	2025-03-08 13:31:53.507845
19	2025-04-01	10659	728	2	2025-04-08 13:50:16.169144	2025-04-08 13:54:05.917142
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20240118154323
20240119144516
20240120141950
20240123143632
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at) FROM stdin;
1	chukimthang94@gmail.com	$2a$12$NUDCgKFWNmrHXaEhhftzU.OupZGEqnuc4Y1cPHHI9o2Zb98y.JZDa	\N	\N	\N	2024-01-30 14:25:05.005634	2024-01-30 14:25:05.005634
\.


--
-- Name: bills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bills_id_seq', 18, true);


--
-- Name: general_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.general_settings_id_seq', 2, true);


--
-- Name: meters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.meters_id_seq', 19, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: bills bills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bills
    ADD CONSTRAINT bills_pkey PRIMARY KEY (id);


--
-- Name: general_settings general_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.general_settings
    ADD CONSTRAINT general_settings_pkey PRIMARY KEY (id);


--
-- Name: meters meters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meters
    ADD CONSTRAINT meters_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_bills_on_meter_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_bills_on_meter_id ON public.bills USING btree (meter_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- PostgreSQL database dump complete
--

