--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    email text NOT NULL,
    trans_id integer NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_number integer NOT NULL,
    trans_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_order_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_number_seq OWNER TO postgres;

--
-- Name: orders_order_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_number_seq OWNED BY public.orders.order_number;


--
-- Name: plant_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plant_orders (
    plant_id integer NOT NULL,
    order_number integer NOT NULL,
    price integer NOT NULL,
    transaction_id integer NOT NULL,
    sci_name text NOT NULL,
    trans_id integer NOT NULL
);


ALTER TABLE public.plant_orders OWNER TO postgres;

--
-- Name: plants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plants (
    plant_id integer NOT NULL,
    item_quantity integer DEFAULT 1 NOT NULL,
    care_guide text,
    common_name text,
    scientific_name text NOT NULL
);


ALTER TABLE public.plants OWNER TO postgres;

--
-- Name: plants_plant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plants_plant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plants_plant_id_seq OWNER TO postgres;

--
-- Name: plants_plant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plants_plant_id_seq OWNED BY public.plants.plant_id;


--
-- Name: transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transactions (
    trans_id integer NOT NULL,
    email text NOT NULL,
    payment_method text NOT NULL,
    order_number integer NOT NULL,
    plant_id integer NOT NULL,
    cust_email text NOT NULL
);


ALTER TABLE public.transactions OWNER TO postgres;

--
-- Name: transactions_trans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transactions_trans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions_trans_id_seq OWNER TO postgres;

--
-- Name: transactions_trans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transactions_trans_id_seq OWNED BY public.transactions.trans_id;


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: orders order_number; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_number SET DEFAULT nextval('public.orders_order_number_seq'::regclass);


--
-- Name: plants plant_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants ALTER COLUMN plant_id SET DEFAULT nextval('public.plants_plant_id_seq'::regclass);


--
-- Name: transactions trans_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions ALTER COLUMN trans_id SET DEFAULT nextval('public.transactions_trans_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, first_name, last_name, email, trans_id) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_number, trans_id) FROM stdin;
\.


--
-- Data for Name: plant_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plant_orders (plant_id, order_number, price, transaction_id, sci_name, trans_id) FROM stdin;
\.


--
-- Data for Name: plants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plants (plant_id, item_quantity, care_guide, common_name, scientific_name) FROM stdin;
1	1	Partial sun. Every 5-7 days.	Swiss Cheese Plant	Monstera deliciosa
2	3	Partial sun. Every 5-7 days.	Golden Pothos	Epipremnum aureum
3	6	Partial sun. Every 5-7 days.	Corn Plant	Dracaena fragrans
4	7	Full sun. Every 10-14 days.	Jade Plant	Crassula ovata
5	10	Full Shade. Water every 5-7 days.	Spider Plant	Chlorophytum comosum
6	12	Full Sun. Water every 10-14 days.	Snake Plant	Sansevieria trifasciata
7	2	Full Shade. Water every 14 days.	ZZ Raven Plant	Zamioculcas zamiifolia
8	4	Partial Sun. Water every 5-7 days.	Baby Rubberplant	Peperomia obtusifolia
9	6	Full sun. Water every 5-7 days.	Purple Heart	Tradescantia pallida
10	7	Full sun. Water every 10-14 days.	Copper Spoons	Kalanchoe orgyalis
11	13	Full sun. Water every 15-21 days.	Zebra Plant	Haworthia fasciata
12	2	Full sun. Water every 5-7 days.	Umbrella Palm	Cyperus alternifolius
13	8	Full sun. Water every 10-14 days.	Mother of Thousands	Kalanchoe daigremontiana
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transactions (trans_id, email, payment_method, order_number, plant_id, cust_email) FROM stdin;
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 1, false);


--
-- Name: orders_order_number_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_number_seq', 1, false);


--
-- Name: plants_plant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plants_plant_id_seq', 13, true);


--
-- Name: transactions_trans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transactions_trans_id_seq', 1, false);


--
-- Name: customers customers_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_number);


--
-- Name: plant_orders plant_purchases_order_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_orders
    ADD CONSTRAINT plant_purchases_order_number_key UNIQUE (order_number);


--
-- Name: plant_orders plant_purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_orders
    ADD CONSTRAINT plant_purchases_pkey PRIMARY KEY (plant_id, order_number);


--
-- Name: plant_orders plant_purchases_plant_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_orders
    ADD CONSTRAINT plant_purchases_plant_id_key UNIQUE (plant_id);


--
-- Name: plant_orders plant_purchases_transaction_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_orders
    ADD CONSTRAINT plant_purchases_transaction_id_key UNIQUE (transaction_id);


--
-- Name: plants plants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants
    ADD CONSTRAINT plants_pkey PRIMARY KEY (plant_id, scientific_name);


--
-- Name: plants plants_scientific_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants
    ADD CONSTRAINT plants_scientific_name_key UNIQUE (scientific_name);


--
-- Name: transactions transactions_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_email_key UNIQUE (email);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (trans_id);


--
-- Name: transactions fk_cust_email; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT fk_cust_email FOREIGN KEY (cust_email) REFERENCES public.customers(email);


--
-- Name: transactions fk_order_number; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT fk_order_number FOREIGN KEY (order_number) REFERENCES public.orders(order_number);


--
-- Name: plant_orders fk_order_number; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_orders
    ADD CONSTRAINT fk_order_number FOREIGN KEY (order_number) REFERENCES public.orders(order_number);


--
-- Name: plant_orders fk_sci_name; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_orders
    ADD CONSTRAINT fk_sci_name FOREIGN KEY (sci_name) REFERENCES public.plants(scientific_name);


--
-- Name: orders fk_trans_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_trans_id FOREIGN KEY (trans_id) REFERENCES public.transactions(trans_id);


--
-- Name: customers fk_trans_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT fk_trans_id FOREIGN KEY (trans_id) REFERENCES public.transactions(trans_id);


--
-- Name: plant_orders fk_trans_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_orders
    ADD CONSTRAINT fk_trans_id FOREIGN KEY (trans_id) REFERENCES public.transactions(trans_id);


--
-- PostgreSQL database dump complete
--

