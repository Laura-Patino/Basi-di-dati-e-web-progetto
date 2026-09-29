--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2020-09-24 00:15:38

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
-- TOC entry 221 (class 1259 OID 17381)
-- Name: acquisto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.acquisto (
    prodotto character(10) NOT NULL,
    numscontrino character(10) NOT NULL,
    data date NOT NULL,
    "quantità" integer,
    tessera character(10)
);


ALTER TABLE public.acquisto OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17366)
-- Name: assemblato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assemblato (
    prodottocomponente character(10) NOT NULL,
    prodottocomposto character(10) NOT NULL,
    "quantità" integer
);


ALTER TABLE public.assemblato OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17261)
-- Name: catalogo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.catalogo (
    datainizio date NOT NULL,
    datafine date NOT NULL
);


ALTER TABLE public.catalogo OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17254)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    numerotessera character(10) NOT NULL,
    cf character(16),
    datanascita date,
    nome character(20),
    cognome character(20),
    email character(30),
    puntiaccumulati integer
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17321)
-- Name: contenuto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contenuto (
    prodotto character(10) NOT NULL,
    datainizio date NOT NULL,
    datafine date NOT NULL,
    punti integer
);


ALTER TABLE public.contenuto OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 17242)
-- Name: fornitore; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fornitore (
    partitaiva character(11) NOT NULL,
    ragionesociale character(5),
    indirizzo character(20),
    email character(30),
    tel character(15),
    "modalitàpagamento" character(10)
);


ALTER TABLE public.fornitore OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 17210)
-- Name: impiegato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.impiegato (
    cf character(16) NOT NULL,
    nome character(20),
    cognome character(20),
    telefono character(10),
    email character(30),
    via character(20),
    nciv integer,
    dataassunzione date,
    mansione character(20),
    reparto character(20),
    supermercato character(20),
    livello integer
);


ALTER TABLE public.impiegato OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17351)
-- Name: of; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.of (
    ordine character(10) NOT NULL,
    prodotto character(10) NOT NULL,
    fornitore character(11) NOT NULL
);


ALTER TABLE public.of OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 17185)
-- Name: orarioordinario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orarioordinario (
    giornosettimana character(10) NOT NULL,
    apertura time without time zone,
    chiusura time without time zone
);


ALTER TABLE public.orarioordinario OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 17190)
-- Name: orariostraordinario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orariostraordinario (
    giorno integer NOT NULL,
    mese character(10) NOT NULL,
    apertura time without time zone,
    chiusura time without time zone
);


ALTER TABLE public.orariostraordinario OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17249)
-- Name: ordine; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ordine (
    codiceordine character(10) NOT NULL,
    codiceprodotto character(10) NOT NULL,
    prezzo integer,
    tempoconsegna integer
);


ALTER TABLE public.ordine OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17451)
-- Name: premio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.premio (
    nome character(20) NOT NULL,
    datainizio date NOT NULL,
    datafine date NOT NULL,
    puntirichiesti integer
);


ALTER TABLE public.premio OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17232)
-- Name: prodotto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prodotto (
    codiceinterno character(10) NOT NULL,
    reparto character(20),
    supermercato character(20),
    nome character(20),
    categoria character(20),
    prezzo integer,
    datascadenza date,
    soglia integer,
    "quantità" integer
);


ALTER TABLE public.prodotto OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 17200)
-- Name: reparto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reparto (
    nome character(20) NOT NULL,
    supermercato character(20) NOT NULL,
    cfresponsabile character(16)
);


ALTER TABLE public.reparto OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17336)
-- Name: rifornimento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rifornimento (
    prodotto character(10) NOT NULL,
    prodottof character(10) NOT NULL,
    ordine character(10) NOT NULL
);


ALTER TABLE public.rifornimento OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17276)
-- Name: so; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.so (
    indirizzo character(20) NOT NULL,
    giornosettimana character(10) NOT NULL
);


ALTER TABLE public.so OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17291)
-- Name: ss; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ss (
    indirizzo character(20) NOT NULL,
    giorno integer NOT NULL,
    mese character(10) NOT NULL
);


ALTER TABLE public.ss OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 17195)
-- Name: stipendio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stipendio (
    livello integer NOT NULL,
    "anzianità" integer,
    stipendio integer
);


ALTER TABLE public.stipendio OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 17180)
-- Name: supermercato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supermercato (
    indirizzo character(20) NOT NULL
);


ALTER TABLE public.supermercato OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17306)
-- Name: svolge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.svolge (
    dataturno character(10) NOT NULL,
    inizioturno time without time zone NOT NULL,
    fineturno time without time zone NOT NULL,
    impiegato character(16) NOT NULL
);


ALTER TABLE public.svolge OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 17227)
-- Name: turno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.turno (
    data character(10) NOT NULL,
    inizio time without time zone NOT NULL,
    fine time without time zone NOT NULL
);


ALTER TABLE public.turno OWNER TO postgres;

--
-- TOC entry 2810 (class 2606 OID 17385)
-- Name: acquisto acquisto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acquisto
    ADD CONSTRAINT acquisto_pkey PRIMARY KEY (prodotto, numscontrino, data);


--
-- TOC entry 2808 (class 2606 OID 17370)
-- Name: assemblato assemblato_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assemblato
    ADD CONSTRAINT assemblato_pkey PRIMARY KEY (prodottocomponente, prodottocomposto);


--
-- TOC entry 2794 (class 2606 OID 17265)
-- Name: catalogo catalogo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalogo
    ADD CONSTRAINT catalogo_pkey PRIMARY KEY (datainizio, datafine);


--
-- TOC entry 2790 (class 2606 OID 17260)
-- Name: cliente cliente_cf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_cf_key UNIQUE (cf);


--
-- TOC entry 2792 (class 2606 OID 17258)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (numerotessera);


--
-- TOC entry 2802 (class 2606 OID 17325)
-- Name: contenuto contenuto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenuto
    ADD CONSTRAINT contenuto_pkey PRIMARY KEY (prodotto, datainizio, datafine);


--
-- TOC entry 2784 (class 2606 OID 17246)
-- Name: fornitore fornitore_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornitore
    ADD CONSTRAINT fornitore_pkey PRIMARY KEY (partitaiva);


--
-- TOC entry 2786 (class 2606 OID 17248)
-- Name: fornitore fornitore_tel_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornitore
    ADD CONSTRAINT fornitore_tel_key UNIQUE (tel);


--
-- TOC entry 2776 (class 2606 OID 17214)
-- Name: impiegato impiegato_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.impiegato
    ADD CONSTRAINT impiegato_pkey PRIMARY KEY (cf);


--
-- TOC entry 2778 (class 2606 OID 17216)
-- Name: impiegato impiegato_telefono_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.impiegato
    ADD CONSTRAINT impiegato_telefono_key UNIQUE (telefono);


--
-- TOC entry 2806 (class 2606 OID 17355)
-- Name: of of_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.of
    ADD CONSTRAINT of_pkey PRIMARY KEY (ordine, fornitore, prodotto);


--
-- TOC entry 2768 (class 2606 OID 17189)
-- Name: orarioordinario orarioordinario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orarioordinario
    ADD CONSTRAINT orarioordinario_pkey PRIMARY KEY (giornosettimana);


--
-- TOC entry 2770 (class 2606 OID 17194)
-- Name: orariostraordinario orariostraordinario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orariostraordinario
    ADD CONSTRAINT orariostraordinario_pkey PRIMARY KEY (giorno, mese);


--
-- TOC entry 2788 (class 2606 OID 17253)
-- Name: ordine ordine_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordine
    ADD CONSTRAINT ordine_pkey PRIMARY KEY (codiceordine, codiceprodotto);


--
-- TOC entry 2812 (class 2606 OID 17455)
-- Name: premio premio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.premio
    ADD CONSTRAINT premio_pkey PRIMARY KEY (nome, datainizio, datafine);


--
-- TOC entry 2782 (class 2606 OID 17236)
-- Name: prodotto prodotto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodotto
    ADD CONSTRAINT prodotto_pkey PRIMARY KEY (codiceinterno);


--
-- TOC entry 2774 (class 2606 OID 17204)
-- Name: reparto reparto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reparto
    ADD CONSTRAINT reparto_pkey PRIMARY KEY (nome, supermercato);


--
-- TOC entry 2804 (class 2606 OID 17340)
-- Name: rifornimento rifornimento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rifornimento
    ADD CONSTRAINT rifornimento_pkey PRIMARY KEY (prodotto, ordine, prodottof);


--
-- TOC entry 2796 (class 2606 OID 17280)
-- Name: so so_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.so
    ADD CONSTRAINT so_pkey PRIMARY KEY (indirizzo, giornosettimana);


--
-- TOC entry 2798 (class 2606 OID 17295)
-- Name: ss ss_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ss
    ADD CONSTRAINT ss_pkey PRIMARY KEY (indirizzo, giorno, mese);


--
-- TOC entry 2772 (class 2606 OID 17199)
-- Name: stipendio stipendio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stipendio
    ADD CONSTRAINT stipendio_pkey PRIMARY KEY (livello);


--
-- TOC entry 2766 (class 2606 OID 17184)
-- Name: supermercato supermercato_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supermercato
    ADD CONSTRAINT supermercato_pkey PRIMARY KEY (indirizzo);


--
-- TOC entry 2800 (class 2606 OID 17310)
-- Name: svolge svolge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.svolge
    ADD CONSTRAINT svolge_pkey PRIMARY KEY (dataturno, inizioturno, fineturno, impiegato);


--
-- TOC entry 2780 (class 2606 OID 17231)
-- Name: turno turno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turno
    ADD CONSTRAINT turno_pkey PRIMARY KEY (data, inizio, fine);


--
-- TOC entry 2832 (class 2606 OID 17386)
-- Name: acquisto acquisto_prodotto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acquisto
    ADD CONSTRAINT acquisto_prodotto_fkey FOREIGN KEY (prodotto) REFERENCES public.prodotto(codiceinterno);


--
-- TOC entry 2833 (class 2606 OID 17391)
-- Name: acquisto acquisto_tessera_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acquisto
    ADD CONSTRAINT acquisto_tessera_fkey FOREIGN KEY (tessera) REFERENCES public.cliente(numerotessera);


--
-- TOC entry 2830 (class 2606 OID 17371)
-- Name: assemblato assemblato_prodottocomponente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assemblato
    ADD CONSTRAINT assemblato_prodottocomponente_fkey FOREIGN KEY (prodottocomponente) REFERENCES public.prodotto(codiceinterno);


--
-- TOC entry 2831 (class 2606 OID 17376)
-- Name: assemblato assemblato_prodottocomposto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assemblato
    ADD CONSTRAINT assemblato_prodottocomposto_fkey FOREIGN KEY (prodottocomposto) REFERENCES public.prodotto(codiceinterno);


--
-- TOC entry 2825 (class 2606 OID 17331)
-- Name: contenuto contenuto_datainizio_datafine_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenuto
    ADD CONSTRAINT contenuto_datainizio_datafine_fkey FOREIGN KEY (datainizio, datafine) REFERENCES public.catalogo(datainizio, datafine);


--
-- TOC entry 2824 (class 2606 OID 17326)
-- Name: contenuto contenuto_prodotto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenuto
    ADD CONSTRAINT contenuto_prodotto_fkey FOREIGN KEY (prodotto) REFERENCES public.prodotto(codiceinterno);


--
-- TOC entry 2815 (class 2606 OID 17217)
-- Name: impiegato impiegato_livello_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.impiegato
    ADD CONSTRAINT impiegato_livello_fkey FOREIGN KEY (livello) REFERENCES public.stipendio(livello);


--
-- TOC entry 2816 (class 2606 OID 17222)
-- Name: impiegato impiegato_reparto_supermercato_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.impiegato
    ADD CONSTRAINT impiegato_reparto_supermercato_fkey FOREIGN KEY (reparto, supermercato) REFERENCES public.reparto(nome, supermercato) ON DELETE CASCADE;


--
-- TOC entry 2828 (class 2606 OID 17356)
-- Name: of of_fornitore_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.of
    ADD CONSTRAINT of_fornitore_fkey FOREIGN KEY (fornitore) REFERENCES public.fornitore(partitaiva);


--
-- TOC entry 2829 (class 2606 OID 17361)
-- Name: of of_ordine_prodotto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.of
    ADD CONSTRAINT of_ordine_prodotto_fkey FOREIGN KEY (ordine, prodotto) REFERENCES public.ordine(codiceordine, codiceprodotto);


--
-- TOC entry 2834 (class 2606 OID 17456)
-- Name: premio premio_datainizio_datafine_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.premio
    ADD CONSTRAINT premio_datainizio_datafine_fkey FOREIGN KEY (datainizio, datafine) REFERENCES public.catalogo(datainizio, datafine);


--
-- TOC entry 2817 (class 2606 OID 17237)
-- Name: prodotto prodotto_reparto_supermercato_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodotto
    ADD CONSTRAINT prodotto_reparto_supermercato_fkey FOREIGN KEY (reparto, supermercato) REFERENCES public.reparto(nome, supermercato);


--
-- TOC entry 2814 (class 2606 OID 17396)
-- Name: reparto reparto_cfresponsabile_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reparto
    ADD CONSTRAINT reparto_cfresponsabile_fkey FOREIGN KEY (cfresponsabile) REFERENCES public.impiegato(cf) NOT VALID;


--
-- TOC entry 2813 (class 2606 OID 17205)
-- Name: reparto reparto_supermercato_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reparto
    ADD CONSTRAINT reparto_supermercato_fkey FOREIGN KEY (supermercato) REFERENCES public.supermercato(indirizzo);


--
-- TOC entry 2826 (class 2606 OID 17341)
-- Name: rifornimento rifornimento_prodotto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rifornimento
    ADD CONSTRAINT rifornimento_prodotto_fkey FOREIGN KEY (prodotto) REFERENCES public.prodotto(codiceinterno);


--
-- TOC entry 2827 (class 2606 OID 17346)
-- Name: rifornimento rifornimento_prodottof_ordine_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rifornimento
    ADD CONSTRAINT rifornimento_prodottof_ordine_fkey FOREIGN KEY (prodottof, ordine) REFERENCES public.ordine(codiceprodotto, codiceordine);


--
-- TOC entry 2819 (class 2606 OID 17286)
-- Name: so so_giornosettimana_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.so
    ADD CONSTRAINT so_giornosettimana_fkey FOREIGN KEY (giornosettimana) REFERENCES public.orarioordinario(giornosettimana);


--
-- TOC entry 2818 (class 2606 OID 17281)
-- Name: so so_indirizzo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.so
    ADD CONSTRAINT so_indirizzo_fkey FOREIGN KEY (indirizzo) REFERENCES public.supermercato(indirizzo);


--
-- TOC entry 2821 (class 2606 OID 17301)
-- Name: ss ss_giorno_mese_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ss
    ADD CONSTRAINT ss_giorno_mese_fkey FOREIGN KEY (giorno, mese) REFERENCES public.orariostraordinario(giorno, mese);


--
-- TOC entry 2820 (class 2606 OID 17296)
-- Name: ss ss_indirizzo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ss
    ADD CONSTRAINT ss_indirizzo_fkey FOREIGN KEY (indirizzo) REFERENCES public.supermercato(indirizzo);


--
-- TOC entry 2823 (class 2606 OID 17316)
-- Name: svolge svolge_dataturno_inizioturno_fineturno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.svolge
    ADD CONSTRAINT svolge_dataturno_inizioturno_fineturno_fkey FOREIGN KEY (dataturno, inizioturno, fineturno) REFERENCES public.turno(data, inizio, fine);


--
-- TOC entry 2822 (class 2606 OID 17311)
-- Name: svolge svolge_impiegato_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.svolge
    ADD CONSTRAINT svolge_impiegato_fkey FOREIGN KEY (impiegato) REFERENCES public.impiegato(cf);


-- Completed on 2020-09-24 00:15:39

--
-- PostgreSQL database dump complete
--

