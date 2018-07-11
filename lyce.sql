--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2018-07-11 12:50:07 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12395)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2180 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 24859)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cliente (
    cd_cliente integer NOT NULL,
    endereco_cd_endereco integer,
    nm_razaosocial character varying(50),
    ds_email character varying(100),
    nm_fantasia character varying(50),
    cod_identificacao integer,
    tipo_cliente character varying(50),
    tp_visivel character(10)
);


ALTER TABLE cliente OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 24874)
-- Name: endereco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE endereco (
    cd_endereco integer NOT NULL,
    nm_rua character varying(40),
    nr_casa numeric(3,0),
    ds_complemento text,
    nm_bairro text,
    nm_cidade text,
    ds_cep text,
    telefone1 integer,
    telefone2 integer
);


ALTER TABLE endereco OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 24868)
-- Name: funcao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE funcao (
    cd_funcao integer NOT NULL,
    ds_funcao text,
    tp_visivel character(10)
);


ALTER TABLE funcao OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 24862)
-- Name: funcionario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE funcionario (
    cd_funcionario integer NOT NULL,
    funcao_cd_funcao integer,
    endereco_cd_endereco integer,
    nm_funcionario character varying(50),
    ds_senha text,
    nick text,
    tp_visivel character(10)
);


ALTER TABLE funcionario OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 24883)
-- Name: ordem_servico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ordem_servico (
    cd_ordem_servico integer NOT NULL,
    funcionaro_cd_funcionario integer NOT NULL,
    cliente_cd_cliente integer,
    dt_ordem_servico date,
    vl_total numeric(4,2),
    bool_fechado boolean
);


ALTER TABLE ordem_servico OWNER TO postgres;

--
-- TOC entry 2168 (class 0 OID 24859)
-- Dependencies: 181
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cliente (cd_cliente, endereco_cd_endereco, nm_razaosocial, ds_email, nm_fantasia, cod_identificacao, tipo_cliente, tp_visivel) FROM stdin;
\.


--
-- TOC entry 2171 (class 0 OID 24874)
-- Dependencies: 184
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY endereco (cd_endereco, nm_rua, nr_casa, ds_complemento, nm_bairro, nm_cidade, ds_cep, telefone1, telefone2) FROM stdin;
\.


--
-- TOC entry 2170 (class 0 OID 24868)
-- Dependencies: 183
-- Data for Name: funcao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY funcao (cd_funcao, ds_funcao, tp_visivel) FROM stdin;
\.


--
-- TOC entry 2169 (class 0 OID 24862)
-- Dependencies: 182
-- Data for Name: funcionario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY funcionario (cd_funcionario, funcao_cd_funcao, endereco_cd_endereco, nm_funcionario, ds_senha, nick, tp_visivel) FROM stdin;
\.


--
-- TOC entry 2172 (class 0 OID 24883)
-- Dependencies: 185
-- Data for Name: ordem_servico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ordem_servico (cd_ordem_servico, funcionaro_cd_funcionario, cliente_cd_cliente, dt_ordem_servico, vl_total, bool_fechado) FROM stdin;
\.


--
-- TOC entry 2038 (class 2606 OID 33051)
-- Name: pk_cliente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT pk_cliente PRIMARY KEY (cd_cliente);


--
-- TOC entry 2046 (class 2606 OID 33053)
-- Name: pk_endereco; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT pk_endereco PRIMARY KEY (cd_endereco);


--
-- TOC entry 2044 (class 2606 OID 33061)
-- Name: pk_funcao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcao
    ADD CONSTRAINT pk_funcao PRIMARY KEY (cd_funcao);


--
-- TOC entry 2042 (class 2606 OID 33063)
-- Name: pk_funcionario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT pk_funcionario PRIMARY KEY (cd_funcionario);


--
-- TOC entry 2049 (class 2606 OID 33065)
-- Name: pk_ordem_servico; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ordem_servico
    ADD CONSTRAINT pk_ordem_servico PRIMARY KEY (cd_ordem_servico, funcionaro_cd_funcionario);


--
-- TOC entry 2047 (class 1259 OID 33083)
-- Name: fki_cliente_ordemservico; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_cliente_ordemservico ON ordem_servico USING btree (cliente_cd_cliente);


--
-- TOC entry 2036 (class 1259 OID 33059)
-- Name: fki_endereco_cliente; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_endereco_cliente ON cliente USING btree (endereco_cd_endereco);


--
-- TOC entry 2039 (class 1259 OID 33077)
-- Name: fki_endereco_funcionario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_endereco_funcionario ON funcionario USING btree (endereco_cd_endereco);


--
-- TOC entry 2040 (class 1259 OID 33071)
-- Name: fki_funcao_funcionario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_funcao_funcionario ON funcionario USING btree (funcao_cd_funcao);


--
-- TOC entry 2053 (class 2606 OID 33078)
-- Name: fk_cliente_ordemservico; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ordem_servico
    ADD CONSTRAINT fk_cliente_ordemservico FOREIGN KEY (cliente_cd_cliente) REFERENCES cliente(cd_cliente);


--
-- TOC entry 2050 (class 2606 OID 33054)
-- Name: fk_endereco_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT fk_endereco_cliente FOREIGN KEY (endereco_cd_endereco) REFERENCES endereco(cd_endereco);


--
-- TOC entry 2052 (class 2606 OID 33072)
-- Name: fk_endereco_funcionario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT fk_endereco_funcionario FOREIGN KEY (endereco_cd_endereco) REFERENCES endereco(cd_endereco);


--
-- TOC entry 2051 (class 2606 OID 33066)
-- Name: fk_funcao_funcionario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT fk_funcao_funcionario FOREIGN KEY (funcao_cd_funcao) REFERENCES funcao(cd_funcao);


--
-- TOC entry 2179 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-07-11 12:50:08 BRT

--
-- PostgreSQL database dump complete
--

