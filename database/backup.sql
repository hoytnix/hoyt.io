--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO categories VALUES (1, 'Meta');
INSERT INTO categories VALUES (2, 'Software');


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categories_id_seq', 2, true);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO posts VALUES ('2016-10-29 10:38:45.584668+00', '2016-10-29 10:38:51.035568+00', 1, 1, 'Hello world!', false, true, 2, '61aa5de5e91b35b5774bb7843c47dc50df84124142f41d8da46b157f8790ef11ee4265a2b52d6a9c13de259d48c7c3d80e24f487b17524a129f1c20ffbacf4a1');
INSERT INTO posts VALUES ('2016-10-29 10:39:10.875079+00', '2016-10-29 10:39:16.978281+00', 2, 1, 'Lorem ipsum', false, true, 3, '833b3b3cd89111201c8afbc3313efd45630d41a438f53a63dff1ddeece02c24889bd9f23208760bb0d7e6dacf6ec400991923ecdd9d215dbf9a4aee8047097cc');
INSERT INTO posts VALUES ('2016-10-29 10:42:27.850815+00', '2016-10-29 10:42:30.267796+00', 3, 2, 'youtube-dl', true, true, 5, '06ef748d271b4c6419073d70724b04a9a909a227fb5b07192709b8c7afa4dba6f4389b85749360d56a37dea35ddfef1baa702dffd5ea0e8cc6861800ae0580d5');


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('posts_id_seq', 3, true);


--
-- PostgreSQL database dump complete
--

