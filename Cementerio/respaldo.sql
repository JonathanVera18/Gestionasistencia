--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- Name: listar_atributos(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.listar_atributos(entidad text) RETURNS TABLE(column_name text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT column_name 
    FROM information_schema.columns 
    WHERE table_name = entidad;
END; $$;


ALTER FUNCTION public.listar_atributos(entidad text) OWNER TO postgres;

--
-- Name: listar_entidades(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.listar_entidades() RETURNS TABLE(table_name text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT table_name 
    FROM information_schema.tables 
    WHERE table_schema = 'public';
END; $$;


ALTER FUNCTION public.listar_entidades() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: canton; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.canton (
    id_can integer NOT NULL,
    name_can text NOT NULL
);


ALTER TABLE public.canton OWNER TO postgres;

--
-- Name: causa_muerte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.causa_muerte (
    id_cau_mue integer NOT NULL,
    name_cau_mue text NOT NULL
);


ALTER TABLE public.causa_muerte OWNER TO postgres;

--
-- Name: certificado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.certificado (
    id_certi integer NOT NULL,
    id_tram integer NOT NULL
);


ALTER TABLE public.certificado OWNER TO postgres;

--
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id_clien integer NOT NULL,
    id_ubi integer NOT NULL,
    ci_clien character varying(10) NOT NULL,
    name_clien text NOT NULL,
    lname_clien text NOT NULL,
    fch_naci_clien date NOT NULL,
    tel1_clien character varying(10) NOT NULL,
    tel2_clien character varying(10) NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- Name: difunto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.difunto (
    id_difu integer NOT NULL,
    id_cau_mue integer NOT NULL,
    name_difu text NOT NULL,
    lastn_difu text NOT NULL,
    fch_naci_difu date NOT NULL,
    fch_muerte_difu date NOT NULL,
    code_acta_difu character varying(5) NOT NULL
);


ALTER TABLE public.difunto OWNER TO postgres;

--
-- Name: estado_estructura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estado_estructura (
    id_est_estruc integer NOT NULL,
    name_est_estruc text NOT NULL
);


ALTER TABLE public.estado_estructura OWNER TO postgres;

--
-- Name: estructura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estructura (
    id_estruc integer NOT NULL,
    id_lugar_estruc integer NOT NULL,
    id_tipo_estruc integer NOT NULL,
    id_est_estruc integer NOT NULL,
    cruces boolean NOT NULL
);


ALTER TABLE public.estructura OWNER TO postgres;

--
-- Name: factura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factura (
    id_factura integer NOT NULL,
    fecha date NOT NULL,
    cliente text NOT NULL,
    total numeric NOT NULL
);


ALTER TABLE public.factura OWNER TO postgres;

--
-- Name: factura_id_factura_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.factura_id_factura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.factura_id_factura_seq OWNER TO postgres;

--
-- Name: factura_id_factura_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.factura_id_factura_seq OWNED BY public.factura.id_factura;


--
-- Name: lugar_estructura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lugar_estructura (
    id_lugar_estruc integer NOT NULL,
    name_zona text NOT NULL,
    name_manza text NOT NULL
);


ALTER TABLE public.lugar_estructura OWNER TO postgres;

--
-- Name: pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pago (
    id_pago integer NOT NULL,
    id_tipo_pago integer NOT NULL,
    id_tram integer NOT NULL,
    cant_pago numeric(6,0) NOT NULL,
    fch_pago date NOT NULL
);


ALTER TABLE public.pago OWNER TO postgres;

--
-- Name: personal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal (
    id_per integer NOT NULL,
    id_tipo_per integer NOT NULL,
    ci_per character varying(10) NOT NULL,
    name_per text NOT NULL,
    lname_per text NOT NULL,
    fch_naci_per date NOT NULL,
    tel1_per character varying(10) NOT NULL,
    tel2_per character varying(10) NOT NULL
);


ALTER TABLE public.personal OWNER TO postgres;

--
-- Name: provincia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provincia (
    id_pro integer NOT NULL,
    name_pro text NOT NULL
);


ALTER TABLE public.provincia OWNER TO postgres;

--
-- Name: reporte_incidente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reporte_incidente (
    id_inci integer NOT NULL,
    id_tipo_inci integer NOT NULL,
    id_per integer NOT NULL,
    fch_rep_inc date NOT NULL
);


ALTER TABLE public.reporte_incidente OWNER TO postgres;

--
-- Name: tipo_estructura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_estructura (
    id_tipo_estruc integer NOT NULL,
    name_tipo_estruc text NOT NULL
);


ALTER TABLE public.tipo_estructura OWNER TO postgres;

--
-- Name: tipo_incidente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_incidente (
    id_tipo_inci integer NOT NULL,
    name_tipo_inci character varying(30) NOT NULL
);


ALTER TABLE public.tipo_incidente OWNER TO postgres;

--
-- Name: tipo_pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_pago (
    id_tipo_pago integer NOT NULL,
    name_tipo_pago text NOT NULL
);


ALTER TABLE public.tipo_pago OWNER TO postgres;

--
-- Name: tipo_personal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_personal (
    id_tipo_per integer NOT NULL,
    name_tipo_per text NOT NULL
);


ALTER TABLE public.tipo_personal OWNER TO postgres;

--
-- Name: tipo_tramite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_tramite (
    id_tipo_tram integer NOT NULL,
    name_tipo_tram text NOT NULL
);


ALTER TABLE public.tipo_tramite OWNER TO postgres;

--
-- Name: tramite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tramite (
    id_tram integer NOT NULL,
    id_tipo_tram integer NOT NULL,
    id_clien integer NOT NULL,
    id_difu integer NOT NULL,
    id_estruc integer NOT NULL,
    id_per integer NOT NULL,
    fch_tram date NOT NULL,
    fch_cumpli_tram date NOT NULL,
    sms_tram text NOT NULL
);


ALTER TABLE public.tramite OWNER TO postgres;

--
-- Name: ubicacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ubicacion (
    id_ubi integer NOT NULL,
    id_pro integer NOT NULL,
    id_can integer NOT NULL
);


ALTER TABLE public.ubicacion OWNER TO postgres;

--
-- Name: factura id_factura; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura ALTER COLUMN id_factura SET DEFAULT nextval('public.factura_id_factura_seq'::regclass);


--
-- Data for Name: canton; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.canton (id_can, name_can) FROM stdin;
1	Quito
\.


--
-- Data for Name: causa_muerte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.causa_muerte (id_cau_mue, name_cau_mue) FROM stdin;
\.


--
-- Data for Name: certificado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.certificado (id_certi, id_tram) FROM stdin;
\.


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (id_clien, id_ubi, ci_clien, name_clien, lname_clien, fch_naci_clien, tel1_clien, tel2_clien) FROM stdin;
\.


--
-- Data for Name: difunto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.difunto (id_difu, id_cau_mue, name_difu, lastn_difu, fch_naci_difu, fch_muerte_difu, code_acta_difu) FROM stdin;
\.


--
-- Data for Name: estado_estructura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estado_estructura (id_est_estruc, name_est_estruc) FROM stdin;
\.


--
-- Data for Name: estructura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estructura (id_estruc, id_lugar_estruc, id_tipo_estruc, id_est_estruc, cruces) FROM stdin;
\.


--
-- Data for Name: factura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.factura (id_factura, fecha, cliente, total) FROM stdin;
\.


--
-- Data for Name: lugar_estructura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lugar_estructura (id_lugar_estruc, name_zona, name_manza) FROM stdin;
\.


--
-- Data for Name: pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pago (id_pago, id_tipo_pago, id_tram, cant_pago, fch_pago) FROM stdin;
\.


--
-- Data for Name: personal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal (id_per, id_tipo_per, ci_per, name_per, lname_per, fch_naci_per, tel1_per, tel2_per) FROM stdin;
\.


--
-- Data for Name: provincia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.provincia (id_pro, name_pro) FROM stdin;
\.


--
-- Data for Name: reporte_incidente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reporte_incidente (id_inci, id_tipo_inci, id_per, fch_rep_inc) FROM stdin;
\.


--
-- Data for Name: tipo_estructura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_estructura (id_tipo_estruc, name_tipo_estruc) FROM stdin;
\.


--
-- Data for Name: tipo_incidente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_incidente (id_tipo_inci, name_tipo_inci) FROM stdin;
\.


--
-- Data for Name: tipo_pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_pago (id_tipo_pago, name_tipo_pago) FROM stdin;
\.


--
-- Data for Name: tipo_personal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_personal (id_tipo_per, name_tipo_per) FROM stdin;
\.


--
-- Data for Name: tipo_tramite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_tramite (id_tipo_tram, name_tipo_tram) FROM stdin;
\.


--
-- Data for Name: tramite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tramite (id_tram, id_tipo_tram, id_clien, id_difu, id_estruc, id_per, fch_tram, fch_cumpli_tram, sms_tram) FROM stdin;
\.


--
-- Data for Name: ubicacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ubicacion (id_ubi, id_pro, id_can) FROM stdin;
\.


--
-- Name: factura_id_factura_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.factura_id_factura_seq', 1, false);


--
-- Name: factura factura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (id_factura);


--
-- Name: canton pk_canton; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.canton
    ADD CONSTRAINT pk_canton PRIMARY KEY (id_can);


--
-- Name: causa_muerte pk_causa_muerte; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.causa_muerte
    ADD CONSTRAINT pk_causa_muerte PRIMARY KEY (id_cau_mue);


--
-- Name: certificado pk_certificado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificado
    ADD CONSTRAINT pk_certificado PRIMARY KEY (id_certi);


--
-- Name: cliente pk_cliente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT pk_cliente PRIMARY KEY (id_clien);


--
-- Name: difunto pk_difunto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.difunto
    ADD CONSTRAINT pk_difunto PRIMARY KEY (id_difu);


--
-- Name: estado_estructura pk_estado_estructura; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_estructura
    ADD CONSTRAINT pk_estado_estructura PRIMARY KEY (id_est_estruc);


--
-- Name: estructura pk_estructura; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estructura
    ADD CONSTRAINT pk_estructura PRIMARY KEY (id_estruc);


--
-- Name: lugar_estructura pk_lugar_estructura; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lugar_estructura
    ADD CONSTRAINT pk_lugar_estructura PRIMARY KEY (id_lugar_estruc);


--
-- Name: pago pk_pago; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pk_pago PRIMARY KEY (id_pago);


--
-- Name: personal pk_personal; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal
    ADD CONSTRAINT pk_personal PRIMARY KEY (id_per);


--
-- Name: provincia pk_provincia; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provincia
    ADD CONSTRAINT pk_provincia PRIMARY KEY (id_pro);


--
-- Name: reporte_incidente pk_reporte_incidente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporte_incidente
    ADD CONSTRAINT pk_reporte_incidente PRIMARY KEY (id_inci);


--
-- Name: tipo_estructura pk_tipo_estructura; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_estructura
    ADD CONSTRAINT pk_tipo_estructura PRIMARY KEY (id_tipo_estruc);


--
-- Name: tipo_incidente pk_tipo_incidente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_incidente
    ADD CONSTRAINT pk_tipo_incidente PRIMARY KEY (id_tipo_inci);


--
-- Name: tipo_pago pk_tipo_pago; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_pago
    ADD CONSTRAINT pk_tipo_pago PRIMARY KEY (id_tipo_pago);


--
-- Name: tipo_personal pk_tipo_personal; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_personal
    ADD CONSTRAINT pk_tipo_personal PRIMARY KEY (id_tipo_per);


--
-- Name: tipo_tramite pk_tipo_tramite; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_tramite
    ADD CONSTRAINT pk_tipo_tramite PRIMARY KEY (id_tipo_tram);


--
-- Name: tramite pk_tramite; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tramite
    ADD CONSTRAINT pk_tramite PRIMARY KEY (id_tram);


--
-- Name: ubicacion pk_ubicacion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ubicacion
    ADD CONSTRAINT pk_ubicacion PRIMARY KEY (id_ubi);


--
-- Name: certificado fk_certific_tramite_c_tramite; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificado
    ADD CONSTRAINT fk_certific_tramite_c_tramite FOREIGN KEY (id_tram) REFERENCES public.tramite(id_tram) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: cliente fk_cliente_ubicacion_ubicacio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fk_cliente_ubicacion_ubicacio FOREIGN KEY (id_ubi) REFERENCES public.ubicacion(id_ubi) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: difunto fk_difunto_causamuer_causa_mu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.difunto
    ADD CONSTRAINT fk_difunto_causamuer_causa_mu FOREIGN KEY (id_cau_mue) REFERENCES public.causa_muerte(id_cau_mue) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: estructura fk_estructu_estadoest_estado_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estructura
    ADD CONSTRAINT fk_estructu_estadoest_estado_e FOREIGN KEY (id_est_estruc) REFERENCES public.estado_estructura(id_est_estruc) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: estructura fk_estructu_lugarestr_lugar_es; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estructura
    ADD CONSTRAINT fk_estructu_lugarestr_lugar_es FOREIGN KEY (id_lugar_estruc) REFERENCES public.lugar_estructura(id_lugar_estruc) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: estructura fk_estructu_tipoestru_tipo_est; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estructura
    ADD CONSTRAINT fk_estructu_tipoestru_tipo_est FOREIGN KEY (id_tipo_estruc) REFERENCES public.tipo_estructura(id_tipo_estruc) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: pago fk_pago_tipopago__tipo_pag; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT fk_pago_tipopago__tipo_pag FOREIGN KEY (id_tipo_pago) REFERENCES public.tipo_pago(id_tipo_pago) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: pago fk_pago_tramite_p_tramite; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT fk_pago_tramite_p_tramite FOREIGN KEY (id_tram) REFERENCES public.tramite(id_tram) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: personal fk_personal_tipoperso_tipo_per; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal
    ADD CONSTRAINT fk_personal_tipoperso_tipo_per FOREIGN KEY (id_tipo_per) REFERENCES public.tipo_personal(id_tipo_per) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: reporte_incidente fk_reporte__personal__personal; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporte_incidente
    ADD CONSTRAINT fk_reporte__personal__personal FOREIGN KEY (id_per) REFERENCES public.personal(id_per) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: reporte_incidente fk_reporte__tipoincid_tipo_inc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporte_incidente
    ADD CONSTRAINT fk_reporte__tipoincid_tipo_inc FOREIGN KEY (id_tipo_inci) REFERENCES public.tipo_incidente(id_tipo_inci) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: tramite fk_tramite_cliente_t_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tramite
    ADD CONSTRAINT fk_tramite_cliente_t_cliente FOREIGN KEY (id_clien) REFERENCES public.cliente(id_clien) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: tramite fk_tramite_difunto_t_difunto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tramite
    ADD CONSTRAINT fk_tramite_difunto_t_difunto FOREIGN KEY (id_difu) REFERENCES public.difunto(id_difu) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: tramite fk_tramite_estructur_estructu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tramite
    ADD CONSTRAINT fk_tramite_estructur_estructu FOREIGN KEY (id_estruc) REFERENCES public.estructura(id_estruc) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: tramite fk_tramite_personal__personal; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tramite
    ADD CONSTRAINT fk_tramite_personal__personal FOREIGN KEY (id_per) REFERENCES public.personal(id_per) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: tramite fk_tramite_tipotrami_tipo_tra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tramite
    ADD CONSTRAINT fk_tramite_tipotrami_tipo_tra FOREIGN KEY (id_tipo_tram) REFERENCES public.tipo_tramite(id_tipo_tram) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: ubicacion fk_ubicacio_canton_ub_canton; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ubicacion
    ADD CONSTRAINT fk_ubicacio_canton_ub_canton FOREIGN KEY (id_can) REFERENCES public.canton(id_can) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: ubicacion fk_ubicacio_provincia_provinci; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ubicacion
    ADD CONSTRAINT fk_ubicacio_provincia_provinci FOREIGN KEY (id_pro) REFERENCES public.provincia(id_pro) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

