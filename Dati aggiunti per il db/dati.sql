--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2020-09-24 00:15:59

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
-- TOC entry 2980 (class 0 OID 17381)
-- Dependencies: 221
-- Data for Name: acquisto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.acquisto VALUES ('ABC1234567', '123456ABCD', '2020-07-10', 3, '9876543210');
INSERT INTO public.acquisto VALUES ('ABC1234570', '123456ABCD', '2020-07-10', 1, '9876543210');
INSERT INTO public.acquisto VALUES ('ABC1234572', '123456ABCE', '2020-07-15', 2, '9876543213');
INSERT INTO public.acquisto VALUES ('ABC1234567', '123456ABCF', '2020-05-12', 2, '9876543213');
INSERT INTO public.acquisto VALUES ('ABC1234573', '123456ABCF', '2020-05-12', 5, '9876543213');
INSERT INTO public.acquisto VALUES ('ABC1234582', '123456ABCG', '2020-05-12', 2, '9876543214');
INSERT INTO public.acquisto VALUES ('ABC1234567', '123456ABCH', '2020-05-12', 3, '9876543210');
INSERT INTO public.acquisto VALUES ('ABC1234568', '123456ABCI', '2020-05-12', 1, '9876543213');
INSERT INTO public.acquisto VALUES ('ABC1234579', '123456ABCL', '2020-10-10', 20, '9876543210');
INSERT INTO public.acquisto VALUES ('ABC1234579', '123456ABCM', '2020-10-20', 10, '9876543213');
INSERT INTO public.acquisto VALUES ('ABC1234569', '123456ABCN', '2020-11-30', 10, '9876543210');
INSERT INTO public.acquisto VALUES ('ABC1234569', '123456ABCO', '2020-12-10', 15, '9876543213');


--
-- TOC entry 2979 (class 0 OID 17366)
-- Dependencies: 220
-- Data for Name: assemblato; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.assemblato VALUES ('ABC1234571', 'ABC1234572', 2);
INSERT INTO public.assemblato VALUES ('ABC1234573', 'ABC1234572', 5);
INSERT INTO public.assemblato VALUES ('ABC1234579', 'ABC1234580', 1);
INSERT INTO public.assemblato VALUES ('ABC1234581', 'ABC1234580', 4);
INSERT INTO public.assemblato VALUES ('ABC1234588', 'ABC1234587', 5);
INSERT INTO public.assemblato VALUES ('ABC1234589', 'ABC1234587', 5);
INSERT INTO public.assemblato VALUES ('ABC1234590', 'ABC1234591', 3);
INSERT INTO public.assemblato VALUES ('ABC1234592', 'ABC1234591', 10);
INSERT INTO public.assemblato VALUES ('ABC1234597', 'ABC1234502', 300);
INSERT INTO public.assemblato VALUES ('ABC1234596', 'ABC1234502', 35);
INSERT INTO public.assemblato VALUES ('ABC1234598', 'ABC1234502', 10);
INSERT INTO public.assemblato VALUES ('ABC1234599', 'ABC1234502', 5);
INSERT INTO public.assemblato VALUES ('ABC1234500', 'ABC1234502', 300);
INSERT INTO public.assemblato VALUES ('ABC1234593', 'ABC1234503', 2);
INSERT INTO public.assemblato VALUES ('ABC1234501', 'ABC1234503', 2);
INSERT INTO public.assemblato VALUES ('ABC1234502', 'ABC1234503', 1);
INSERT INTO public.assemblato VALUES ('ABC1234593', 'ABC1234504', 5);
INSERT INTO public.assemblato VALUES ('ABC1234504', 'ABC1234503', 1);


--
-- TOC entry 2972 (class 0 OID 17261)
-- Dependencies: 213
-- Data for Name: catalogo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.catalogo VALUES ('2019-01-01', '2019-12-31');
INSERT INTO public.catalogo VALUES ('2020-11-01', '2020-04-30');
INSERT INTO public.catalogo VALUES ('2020-05-01', '2020-10-31');


--
-- TOC entry 2971 (class 0 OID 17254)
-- Dependencies: 212
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cliente VALUES ('nullo     ', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.cliente VALUES ('9876543210', 'ABCDEH1234567890', '1997-02-12', 'Marco               ', 'Bruni               ', 'marco.bruni@gmail.com         ', 25);
INSERT INTO public.cliente VALUES ('9876543211', 'ABCDEH1234567891', '1998-10-16', 'Alessia             ', 'Licata              ', 'alessia.licata@gmail.com      ', 100);
INSERT INTO public.cliente VALUES ('9876543212', 'ABCDEH1234567892', '1980-01-05', 'Mattia              ', 'Fiocchi             ', 'mattia.fiocchi@gmail.com      ', 95);
INSERT INTO public.cliente VALUES ('9876543213', 'ABCDEH1234567893', '2000-11-23', 'Andrea              ', 'Verdi               ', 'andrea.verdi@gmail.com        ', 0);
INSERT INTO public.cliente VALUES ('9876543214', 'ABCDEH1234567894', '1995-06-29', 'Federico            ', 'Rossi               ', 'federico.rossi@gmail.com      ', 90);


--
-- TOC entry 2976 (class 0 OID 17321)
-- Dependencies: 217
-- Data for Name: contenuto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.contenuto VALUES ('ABC1234571', '2019-01-01', '2019-12-31', 20);
INSERT INTO public.contenuto VALUES ('ABC1234570', '2019-01-01', '2019-12-31', 5);
INSERT INTO public.contenuto VALUES ('ABC1234575', '2020-11-01', '2020-04-30', 25);
INSERT INTO public.contenuto VALUES ('ABC1234580', '2020-11-01', '2020-04-30', 15);
INSERT INTO public.contenuto VALUES ('ABC1234587', '2020-05-01', '2020-10-31', 7);
INSERT INTO public.contenuto VALUES ('ABC1234590', '2020-05-01', '2020-10-31', 9);


--
-- TOC entry 2969 (class 0 OID 17242)
-- Dependencies: 210
-- Data for Name: fornitore; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fornitore VALUES ('IVA12345678', 'S.p.a', 'Via Venezian 2      ', 'fornitore1@gmail.com          ', '3776702222     ', 'bancomat  ');
INSERT INTO public.fornitore VALUES ('IVA12345679', 'S.r.l', 'Via Pericle 10      ', 'fornitore2@gmail.com          ', '3776713333     ', 'bancomat  ');


--
-- TOC entry 2966 (class 0 OID 17210)
-- Dependencies: 207
-- Data for Name: impiegato; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.impiegato VALUES ('ABCDEF1234567890', 'Mario               ', 'Rossi               ', '1234567890', 'mario.rossi@gmail.com         ', 'via Celoria         ', 18, '2000-10-10', 'responsabile        ', 'cancelleria         ', 'Via Losanna 20      ', 3);
INSERT INTO public.impiegato VALUES ('ABCDEF1234567891', 'Fabiola             ', 'Bertolaja           ', '1234567891', 'fabiola.bertolaja@gmail.com   ', 'via Celoria         ', 20, '2010-11-29', 'responsabile        ', 'frutta_e_verdura    ', 'Via Piave 38        ', 2);
INSERT INTO public.impiegato VALUES ('ABCDEF1234567892', 'Laura               ', 'Patino              ', '1234567892', 'laura.patino@gmail.com        ', 'via Venezian        ', 1, '2011-10-16', 'responsabile        ', 'frutta_e_verdura    ', 'Via Monte Rosa 1    ', 1);
INSERT INTO public.impiegato VALUES ('ABCDEF1234567893', 'Giovanni            ', 'Bianchi             ', '1234567893', 'giovanni.bianchi@gmail.com    ', 'via Celoria         ', 18, '2012-07-20', 'responsabile        ', 'macelleria          ', 'Via Losanna 20      ', 1);
INSERT INTO public.impiegato VALUES ('ABCDEF1234567894', 'Luca                ', 'Verdi               ', '1234567894', 'luca.verdi@gmail.com          ', 'via Peroni          ', 10, '2002-02-01', 'responsabile        ', 'macelleria          ', 'Via Piave 38        ', 2);
INSERT INTO public.impiegato VALUES ('ABCDEF1234567895', 'Marco               ', 'Torri               ', '1234567895', 'marco.torri@gmail.com         ', 'via Mac Mahon       ', 5, '2008-10-29', 'responsabile        ', 'frutta_e_verdura    ', 'Via Losanna 20      ', 2);
INSERT INTO public.impiegato VALUES ('ABCDEF1234567896', 'Maria               ', 'Quadro              ', '1234567896', 'maria.quadro@gmail.com        ', 'viale Certosa       ', 20, '2012-07-27', 'responsabile        ', 'macelleria          ', 'Via Monte Rosa 1    ', 1);
INSERT INTO public.impiegato VALUES ('ABCDEF1234567897', 'Anna                ', 'Russo               ', '1234567897', 'anna.russo@gmail.com          ', 'via Maratta         ', 1, '2005-03-12', 'responsabile        ', 'cancelleria         ', 'Via Piave 38        ', 2);
INSERT INTO public.impiegato VALUES ('ABCDEF1234567898', 'Giacomo             ', 'Gialli              ', '1234567898', 'giacomo.gialli@gmail.com      ', 'via Govone          ', 15, '2010-03-06', 'responsabile        ', 'cancelleria         ', 'Via Monte Rosa 1    ', 2);
INSERT INTO public.impiegato VALUES ('ABCDEG1234567891', 'Francesca           ', 'Milano              ', '1234567899', 'francesca.milano@gmail.com    ', 'via Galli           ', 3, '1999-01-01', 'bancone             ', 'macelleria          ', 'Via Losanna 20      ', 3);
INSERT INTO public.impiegato VALUES ('ABCDEG1234567892', 'Emanuele            ', 'Conti               ', '2234567890', 'emanuele.conti@gmail.com      ', 'via Aosta           ', 2, '2000-06-16', 'scaffalista         ', 'cancelleria         ', 'Via Piave 38        ', 3);
INSERT INTO public.impiegato VALUES ('ABCDEG1234567893', 'Michele             ', 'Giorno              ', '2234567891', 'michele.giorno@gmail.com      ', 'viale Testi         ', 10, '2005-05-23', 'scaffalista         ', 'frutta_e_verdura    ', 'Via Monte Rosa 1    ', 2);
INSERT INTO public.impiegato VALUES ('ABCDEG1234567800', 'Luca                ', 'Chiari              ', '3776708263', 'luca.chiari@gmail.com         ', 'Viale Testi         ', 3, '2020-06-10', 'scaffalista         ', 'frutta_e_verdura    ', 'Via Losanna 20      ', 3);
INSERT INTO public.impiegato VALUES ('ABCDEG1234567894', 'Alessandra          ', 'Patino              ', '3776702866', 'alessandra.patino@gmail.com   ', 'Via Maratta         ', 10, '2020-07-07', NULL, 'cancelleria         ', 'Via Monte Rosa 1    ', 1);
INSERT INTO public.impiegato VALUES ('ABCDEH1234567890', 'Simona              ', 'Moretti             ', '3275689842', 'simona.moretti@gmail.com      ', 'Via Grigna          ', 7, '2020-07-24', 'scaffalista         ', 'frutta_e_verdura    ', 'Via Monte Rosa 1    ', 1);
INSERT INTO public.impiegato VALUES ('ABCDEH1234567895', 'Gabriele            ', 'Ferrari             ', '3334567890', 'gabriele.ferrari@gmail.com    ', 'via Celoria         ', 25, '2002-10-10', 'responsabile        ', 'alimentari          ', 'Via Monte Rosa 1    ', 2);
INSERT INTO public.impiegato VALUES ('ABCDEH1234567896', 'Giada               ', 'Vitale              ', '3334577890', 'giada.vitale@gmail.com        ', 'via Aosta           ', 30, '2012-12-10', 'responsabile        ', 'bevande             ', 'Via Monte Rosa 1    ', 1);
INSERT INTO public.impiegato VALUES ('ABCDEH1234567897', 'Leonardo            ', 'Molinari            ', '3334567990', 'leonardo.molinari@gmail.com   ', 'via Arimondi        ', 5, '1998-06-25', 'responsabile        ', 'panetteria          ', 'Via Monte Rosa 1    ', 3);
INSERT INTO public.impiegato VALUES ('ABCDEH1234567898', 'Silvia              ', 'Villa               ', '3234567890', 'silvia.villa@gmail.com        ', 'via Larga           ', 3, '2005-02-02', 'responsabile        ', 'latticini           ', 'Via Monte Rosa 1    ', 2);
INSERT INTO public.impiegato VALUES ('ABCDEG1234567855', 'Solange             ', 'Ricapa              ', '3776712245', 'solange.ricapa@gmail.com      ', 'Via Galvani         ', 11, '2007-02-08', 'scaffalista         ', 'panetteria          ', 'Via Losanna 20      ', 2);
INSERT INTO public.impiegato VALUES ('ABCDEG1234567888', 'Malisha             ', 'Kithmini            ', '3779913324', 'malisha.kithmini@gmail.com    ', 'Via Rho             ', 1, '2020-01-01', 'scaffalista         ', 'panetteria          ', 'Via Losanna 20      ', 1);
INSERT INTO public.impiegato VALUES ('ABCDEG1234567700', 'Francesco           ', 'Sughero             ', '3773319552', 'francesco.sughero@gmail.com   ', 'Via Galli           ', 20, '2020-05-09', 'scaffalista         ', 'latticini           ', 'Via Losanna 20      ', 1);


--
-- TOC entry 2978 (class 0 OID 17351)
-- Dependencies: 219
-- Data for Name: of; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.of VALUES ('ASD12     ', '12345ABCDE', 'IVA12345678');
INSERT INTO public.of VALUES ('ASD12     ', '12346ABCDE', 'IVA12345678');
INSERT INTO public.of VALUES ('ABC98     ', '12345ABCDE', 'IVA12345679');
INSERT INTO public.of VALUES ('ABC98     ', '12347ABCDE', 'IVA12345679');
INSERT INTO public.of VALUES ('RAI22     ', '12348ABCDE', 'IVA12345679');
INSERT INTO public.of VALUES ('ACD29     ', '12349ABCDE', 'IVA12345678');
INSERT INTO public.of VALUES ('ACD29     ', '12340ABCDE', 'IVA12345678');


--
-- TOC entry 2962 (class 0 OID 17185)
-- Dependencies: 203
-- Data for Name: orarioordinario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orarioordinario VALUES ('lunedì    ', '08:00:00', '19:00:00');
INSERT INTO public.orarioordinario VALUES ('martedì   ', '08:00:00', '19:00:00');
INSERT INTO public.orarioordinario VALUES ('mercoledì ', '08:00:00', '19:00:00');
INSERT INTO public.orarioordinario VALUES ('giovedì   ', '08:00:00', '19:00:00');
INSERT INTO public.orarioordinario VALUES ('venerdì   ', '08:00:00', '19:00:00');
INSERT INTO public.orarioordinario VALUES ('sabato    ', '09:00:00', '21:00:00');
INSERT INTO public.orarioordinario VALUES ('domenica  ', '09:00:00', '16:00:00');


--
-- TOC entry 2963 (class 0 OID 17190)
-- Dependencies: 204
-- Data for Name: orariostraordinario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orariostraordinario VALUES (25, 'dicembre  ', '09:00:00', '16:00:00');
INSERT INTO public.orariostraordinario VALUES (15, 'agosto    ', '09:00:00', '12:00:00');
INSERT INTO public.orariostraordinario VALUES (24, 'dicembre  ', '10:00:00', '16:00:00');


--
-- TOC entry 2970 (class 0 OID 17249)
-- Dependencies: 211
-- Data for Name: ordine; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ordine VALUES ('ASD12     ', '12345ABCDE', 7, 60);
INSERT INTO public.ordine VALUES ('ASD12     ', '12346ABCDE', 10, 60);
INSERT INTO public.ordine VALUES ('ABC98     ', '12345ABCDE', 4, 40);
INSERT INTO public.ordine VALUES ('ABC98     ', '12347ABCDE', 10, 40);
INSERT INTO public.ordine VALUES ('RAI22     ', '12348ABCDE', 9, 60);
INSERT INTO public.ordine VALUES ('ACD29     ', '12349ABCDE', 10, 60);
INSERT INTO public.ordine VALUES ('ACD29     ', '12340ABCDE', 5, 60);


--
-- TOC entry 2981 (class 0 OID 17451)
-- Dependencies: 222
-- Data for Name: premio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.premio VALUES ('frullatore          ', '2019-01-01', '2019-12-31', 5000);
INSERT INTO public.premio VALUES ('lampada             ', '2019-01-01', '2019-12-31', 8000);
INSERT INTO public.premio VALUES ('macchina_caffè      ', '2020-11-01', '2020-04-30', 3700);
INSERT INTO public.premio VALUES ('padella             ', '2020-11-01', '2020-04-30', 800);
INSERT INTO public.premio VALUES ('set_bicchieri       ', '2020-05-01', '2020-10-31', 500);
INSERT INTO public.premio VALUES ('aspirapolvere       ', '2020-05-01', '2020-10-31', 8000);


--
-- TOC entry 2968 (class 0 OID 17232)
-- Dependencies: 209
-- Data for Name: prodotto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.prodotto VALUES ('ABC1234567', 'macelleria          ', 'Via Losanna 20      ', 'agnello             ', 'carne               ', 10, '2020-09-30', 10, 30);
INSERT INTO public.prodotto VALUES ('ABC1234568', 'macelleria          ', 'Via Losanna 20      ', 'prosciutto          ', 'salumi              ', 8, '2021-09-14', 10, 15);
INSERT INTO public.prodotto VALUES ('ABC1234569', 'cancelleria         ', 'Via Losanna 20      ', 'penna_rossa         ', 'penna               ', 1, NULL, 30, 50);
INSERT INTO public.prodotto VALUES ('ABC1234570', 'cancelleria         ', 'Via Losanna 20      ', 'penna_blu           ', 'penna               ', 1, NULL, 30, 40);
INSERT INTO public.prodotto VALUES ('ABC1234571', 'frutta_e_verdura    ', 'Via Losanna 20      ', 'mela                ', 'frutta              ', 2, '2020-11-20', 40, 60);
INSERT INTO public.prodotto VALUES ('ABC1234572', 'frutta_e_verdura    ', 'Via Losanna 20      ', 'macedonia           ', 'frutta              ', 5, '2020-08-15', 20, 22);
INSERT INTO public.prodotto VALUES ('ABC1234573', 'frutta_e_verdura    ', 'Via Losanna 20      ', 'fragola             ', 'frutta              ', 3, '2021-09-23', 20, 30);
INSERT INTO public.prodotto VALUES ('ABC1234574', 'frutta_e_verdura    ', 'Via Losanna 20      ', 'pomodoro            ', 'verdura             ', 2, '2020-10-10', 30, 55);
INSERT INTO public.prodotto VALUES ('ABC1234575', 'macelleria          ', 'Via Piave 38        ', 'agnello             ', 'carne               ', 10, '2020-09-30', 10, 30);
INSERT INTO public.prodotto VALUES ('ABC1234576', 'macelleria          ', 'Via Piave 38        ', 'prosciutto          ', 'salumi              ', 8, '2021-09-14', 10, 15);
INSERT INTO public.prodotto VALUES ('ABC1234577', 'cancelleria         ', 'Via Piave 38        ', 'penna_rossa         ', 'penna               ', 1, NULL, 30, 50);
INSERT INTO public.prodotto VALUES ('ABC1234578', 'cancelleria         ', 'Via Piave 38        ', 'penna_blu           ', 'penna               ', 1, NULL, 30, 40);
INSERT INTO public.prodotto VALUES ('ABC1234579', 'frutta_e_verdura    ', 'Via Piave 38        ', 'pera                ', 'frutta              ', 2, '2020-11-20', 40, 60);
INSERT INTO public.prodotto VALUES ('ABC1234580', 'frutta_e_verdura    ', 'Via Piave 38        ', 'macedonia           ', 'frutta              ', 5, '2020-08-15', 20, 22);
INSERT INTO public.prodotto VALUES ('ABC1234581', 'frutta_e_verdura    ', 'Via Piave 38        ', 'fragola             ', 'frutta              ', 3, '2021-09-23', 20, 35);
INSERT INTO public.prodotto VALUES ('ABC1234582', 'frutta_e_verdura    ', 'Via Piave 38        ', 'pomodoro            ', 'verdura             ', 2, '2020-10-10', 30, 75);
INSERT INTO public.prodotto VALUES ('ABC1234583', 'macelleria          ', 'Via Monte Rosa 1    ', 'pollo               ', 'carne               ', 12, '2020-12-30', 15, 30);
INSERT INTO public.prodotto VALUES ('ABC1234584', 'macelleria          ', 'Via Monte Rosa 1    ', 'prosciutto          ', 'salumi              ', 8, '2021-09-24', 10, 12);
INSERT INTO public.prodotto VALUES ('ABC1234585', 'cancelleria         ', 'Via Monte Rosa 1    ', 'penna_rossa         ', 'penna               ', 1, NULL, 30, 43);
INSERT INTO public.prodotto VALUES ('ABC1234586', 'cancelleria         ', 'Via Monte Rosa 1    ', 'penna_nera          ', 'penna               ', 1, NULL, 30, 55);
INSERT INTO public.prodotto VALUES ('ABC1234587', 'cancelleria         ', 'Via Monte Rosa 1    ', 'matite_colorate     ', 'matita              ', 6, NULL, 10, 25);
INSERT INTO public.prodotto VALUES ('ABC1234588', 'cancelleria         ', 'Via Monte Rosa 1    ', 'matita_rossa        ', 'matita              ', 1, NULL, 20, 35);
INSERT INTO public.prodotto VALUES ('ABC1234589', 'cancelleria         ', 'Via Monte Rosa 1    ', 'matita_blu          ', 'matita              ', 1, NULL, 20, 30);
INSERT INTO public.prodotto VALUES ('ABC1234590', 'frutta_e_verdura    ', 'Via Monte Rosa 1    ', 'banana              ', 'frutta              ', 2, '2020-01-12', 30, 50);
INSERT INTO public.prodotto VALUES ('ABC1234591', 'frutta_e_verdura    ', 'Via Monte Rosa 1    ', 'macedonia           ', 'frutta              ', 5, '2020-08-15', 20, 22);
INSERT INTO public.prodotto VALUES ('ABC1234592', 'frutta_e_verdura    ', 'Via Monte Rosa 1    ', 'fragola             ', 'frutta              ', 3, '2021-09-23', 20, 35);
INSERT INTO public.prodotto VALUES ('ABC1234593', 'frutta_e_verdura    ', 'Via Monte Rosa 1    ', 'pomodoro            ', 'verdura             ', 2, '2020-10-10', 30, 55);
INSERT INTO public.prodotto VALUES ('ABC1234596', 'alimentari          ', 'Via Monte Rosa 1    ', 'olio                ', 'olio                ', 5, '2020-09-30', 10, 35);
INSERT INTO public.prodotto VALUES ('ABC1234597', 'alimentari          ', 'Via Monte Rosa 1    ', 'farina              ', 'farina              ', 4, '2021-07-15', 15, 50);
INSERT INTO public.prodotto VALUES ('ABC1234598', 'alimentari          ', 'Via Monte Rosa 1    ', 'sale                ', 'sale                ', 4, '2021-06-15', 15, 50);
INSERT INTO public.prodotto VALUES ('ABC1234599', 'alimentari          ', 'Via Monte Rosa 1    ', 'lievito             ', 'lievito             ', 6, '2021-04-05', 10, 30);
INSERT INTO public.prodotto VALUES ('ABC1234500', 'bevande             ', 'Via Monte Rosa 1    ', 'acqua               ', 'acqua               ', 2, '2022-04-10', 20, 60);
INSERT INTO public.prodotto VALUES ('ABC1234501', 'latticini           ', 'Via Monte Rosa 1    ', 'mozzarella          ', 'formaggio           ', 4, '2020-10-10', 15, 30);
INSERT INTO public.prodotto VALUES ('ABC1234502', 'panetteria          ', 'Via Monte Rosa 1    ', 'pasta_della_pizza   ', 'pizza               ', 3, '2020-09-07', 10, 25);
INSERT INTO public.prodotto VALUES ('ABC1234503', 'panetteria          ', 'Via Monte Rosa 1    ', 'pizza               ', 'pizza               ', 7, '2020-08-25', 10, 20);
INSERT INTO public.prodotto VALUES ('ABC1234504', 'alimentari          ', 'Via Monte Rosa 1    ', 'polpa_di_pomodoro   ', 'sugo                ', 3, '2020-09-25', 10, 20);


--
-- TOC entry 2965 (class 0 OID 17200)
-- Dependencies: 206
-- Data for Name: reparto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reparto VALUES ('latticini           ', 'Via Losanna 20      ', NULL);
INSERT INTO public.reparto VALUES ('macelleria          ', 'Via Piave 38        ', 'ABCDEF1234567894');
INSERT INTO public.reparto VALUES ('frutta_e_verdura    ', 'Via Piave 38        ', 'ABCDEF1234567891');
INSERT INTO public.reparto VALUES ('cancelleria         ', 'Via Piave 38        ', 'ABCDEF1234567897');
INSERT INTO public.reparto VALUES ('macelleria          ', 'Via Losanna 20      ', 'ABCDEF1234567893');
INSERT INTO public.reparto VALUES ('frutta_e_verdura    ', 'Via Losanna 20      ', 'ABCDEF1234567895');
INSERT INTO public.reparto VALUES ('cancelleria         ', 'Via Losanna 20      ', 'ABCDEF1234567890');
INSERT INTO public.reparto VALUES ('macelleria          ', 'Via Monte Rosa 1    ', 'ABCDEF1234567896');
INSERT INTO public.reparto VALUES ('frutta_e_verdura    ', 'Via Monte Rosa 1    ', 'ABCDEF1234567892');
INSERT INTO public.reparto VALUES ('cancelleria         ', 'Via Monte Rosa 1    ', 'ABCDEF1234567898');
INSERT INTO public.reparto VALUES ('alimentari          ', 'Via Monte Rosa 1    ', 'ABCDEH1234567895');
INSERT INTO public.reparto VALUES ('bevande             ', 'Via Monte Rosa 1    ', 'ABCDEH1234567896');
INSERT INTO public.reparto VALUES ('panetteria          ', 'Via Monte Rosa 1    ', 'ABCDEH1234567897');
INSERT INTO public.reparto VALUES ('latticini           ', 'Via Monte Rosa 1    ', 'ABCDEH1234567898');
INSERT INTO public.reparto VALUES ('panetteria          ', 'Via Losanna 20      ', 'ABCDEG1234567855');


--
-- TOC entry 2977 (class 0 OID 17336)
-- Dependencies: 218
-- Data for Name: rifornimento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rifornimento VALUES ('ABC1234567', '12345ABCDE', 'ASD12     ');
INSERT INTO public.rifornimento VALUES ('ABC1234568', '12346ABCDE', 'ASD12     ');
INSERT INTO public.rifornimento VALUES ('ABC1234577', '12345ABCDE', 'ABC98     ');
INSERT INTO public.rifornimento VALUES ('ABC1234575', '12347ABCDE', 'ABC98     ');
INSERT INTO public.rifornimento VALUES ('ABC1234583', '12348ABCDE', 'RAI22     ');
INSERT INTO public.rifornimento VALUES ('ABC1234579', '12349ABCDE', 'ACD29     ');
INSERT INTO public.rifornimento VALUES ('ABC1234569', '12340ABCDE', 'ACD29     ');


--
-- TOC entry 2973 (class 0 OID 17276)
-- Dependencies: 214
-- Data for Name: so; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.so VALUES ('Via Losanna 20      ', 'lunedì    ');
INSERT INTO public.so VALUES ('Via Losanna 20      ', 'martedì   ');
INSERT INTO public.so VALUES ('Via Losanna 20      ', 'mercoledì ');
INSERT INTO public.so VALUES ('Via Losanna 20      ', 'giovedì   ');
INSERT INTO public.so VALUES ('Via Losanna 20      ', 'venerdì   ');
INSERT INTO public.so VALUES ('Via Losanna 20      ', 'sabato    ');
INSERT INTO public.so VALUES ('Via Losanna 20      ', 'domenica  ');
INSERT INTO public.so VALUES ('Via Piave 38        ', 'lunedì    ');
INSERT INTO public.so VALUES ('Via Piave 38        ', 'martedì   ');
INSERT INTO public.so VALUES ('Via Piave 38        ', 'mercoledì ');
INSERT INTO public.so VALUES ('Via Piave 38        ', 'giovedì   ');
INSERT INTO public.so VALUES ('Via Piave 38        ', 'venerdì   ');
INSERT INTO public.so VALUES ('Via Piave 38        ', 'sabato    ');
INSERT INTO public.so VALUES ('Via Piave 38        ', 'domenica  ');
INSERT INTO public.so VALUES ('Via Monte Rosa 1    ', 'lunedì    ');
INSERT INTO public.so VALUES ('Via Monte Rosa 1    ', 'martedì   ');
INSERT INTO public.so VALUES ('Via Monte Rosa 1    ', 'mercoledì ');
INSERT INTO public.so VALUES ('Via Monte Rosa 1    ', 'giovedì   ');
INSERT INTO public.so VALUES ('Via Monte Rosa 1    ', 'venerdì   ');
INSERT INTO public.so VALUES ('Via Monte Rosa 1    ', 'sabato    ');
INSERT INTO public.so VALUES ('Via Monte Rosa 1    ', 'domenica  ');


--
-- TOC entry 2974 (class 0 OID 17291)
-- Dependencies: 215
-- Data for Name: ss; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ss VALUES ('Via Losanna 20      ', 25, 'dicembre  ');
INSERT INTO public.ss VALUES ('Via Losanna 20      ', 15, 'agosto    ');
INSERT INTO public.ss VALUES ('Via Piave 38        ', 25, 'dicembre  ');
INSERT INTO public.ss VALUES ('Via Piave 38        ', 24, 'dicembre  ');
INSERT INTO public.ss VALUES ('Via Monte Rosa 1    ', 25, 'dicembre  ');
INSERT INTO public.ss VALUES ('Via Monte Rosa 1    ', 24, 'dicembre  ');
INSERT INTO public.ss VALUES ('Via Monte Rosa 1    ', 15, 'agosto    ');


--
-- TOC entry 2964 (class 0 OID 17195)
-- Dependencies: 205
-- Data for Name: stipendio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.stipendio VALUES (1, 0, 700);
INSERT INTO public.stipendio VALUES (2, 10, 800);
INSERT INTO public.stipendio VALUES (3, 20, 900);


--
-- TOC entry 2961 (class 0 OID 17180)
-- Dependencies: 202
-- Data for Name: supermercato; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.supermercato VALUES ('Via Losanna 20      ');
INSERT INTO public.supermercato VALUES ('Via Piave 38        ');
INSERT INTO public.supermercato VALUES ('Via Monte Rosa 1    ');


--
-- TOC entry 2975 (class 0 OID 17306)
-- Dependencies: 216
-- Data for Name: svolge; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.svolge VALUES ('lunedì    ', '08:00:00', '19:00:00', 'ABCDEF1234567890');
INSERT INTO public.svolge VALUES ('sabato    ', '09:00:00', '13:00:00', 'ABCDEF1234567890');
INSERT INTO public.svolge VALUES ('martedì   ', '08:00:00', '19:00:00', 'ABCDEF1234567891');
INSERT INTO public.svolge VALUES ('mercoledì ', '08:00:00', '19:00:00', 'ABCDEF1234567892');
INSERT INTO public.svolge VALUES ('sabato    ', '13:00:00', '21:00:00', 'ABCDEF1234567892');
INSERT INTO public.svolge VALUES ('domenica  ', '09:00:00', '12:00:00', 'ABCDEF1234567893');
INSERT INTO public.svolge VALUES ('giovedì   ', '08:00:00', '19:00:00', 'ABCDEF1234567894');
INSERT INTO public.svolge VALUES ('venerdì   ', '08:00:00', '19:00:00', 'ABCDEF1234567895');
INSERT INTO public.svolge VALUES ('domenica  ', '12:00:00', '16:00:00', 'ABCDEF1234567895');
INSERT INTO public.svolge VALUES ('venerdì   ', '08:00:00', '19:00:00', 'ABCDEF1234567896');
INSERT INTO public.svolge VALUES ('venerdì   ', '08:00:00', '19:00:00', 'ABCDEF1234567897');
INSERT INTO public.svolge VALUES ('sabato    ', '13:00:00', '21:00:00', 'ABCDEF1234567898');
INSERT INTO public.svolge VALUES ('lunedì    ', '08:00:00', '19:00:00', 'ABCDEG1234567891');
INSERT INTO public.svolge VALUES ('mercoledì ', '08:00:00', '19:00:00', 'ABCDEG1234567892');
INSERT INTO public.svolge VALUES ('domenica  ', '09:00:00', '12:00:00', 'ABCDEG1234567893');
INSERT INTO public.svolge VALUES ('lunedì    ', '08:00:00', '19:00:00', 'ABCDEH1234567895');
INSERT INTO public.svolge VALUES ('martedì   ', '08:00:00', '19:00:00', 'ABCDEH1234567896');
INSERT INTO public.svolge VALUES ('mercoledì ', '08:00:00', '19:00:00', 'ABCDEH1234567897');
INSERT INTO public.svolge VALUES ('giovedì   ', '08:00:00', '19:00:00', 'ABCDEH1234567898');


--
-- TOC entry 2967 (class 0 OID 17227)
-- Dependencies: 208
-- Data for Name: turno; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.turno VALUES ('lunedì    ', '08:00:00', '19:00:00');
INSERT INTO public.turno VALUES ('martedì   ', '08:00:00', '19:00:00');
INSERT INTO public.turno VALUES ('mercoledì ', '08:00:00', '19:00:00');
INSERT INTO public.turno VALUES ('giovedì   ', '08:00:00', '19:00:00');
INSERT INTO public.turno VALUES ('venerdì   ', '08:00:00', '19:00:00');
INSERT INTO public.turno VALUES ('sabato    ', '09:00:00', '13:00:00');
INSERT INTO public.turno VALUES ('sabato    ', '13:00:00', '21:00:00');
INSERT INTO public.turno VALUES ('domenica  ', '09:00:00', '12:00:00');
INSERT INTO public.turno VALUES ('domenica  ', '12:00:00', '16:00:00');


-- Completed on 2020-09-24 00:16:00

--
-- PostgreSQL database dump complete
--

