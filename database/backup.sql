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
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO alembic_version VALUES ('9583cbd0377a');


--
-- Data for Name: attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO attributes VALUES (1, '/', 'meta_description', 'My eponymously titled website.');
INSERT INTO attributes VALUES (2, '/blog/', 'title', 'Blog');
INSERT INTO attributes VALUES (3, '/policy/privacy/', 'title', 'Privacy Policy');
INSERT INTO attributes VALUES (4, '/policy/terms/', 'title', 'Terms of Service');
INSERT INTO attributes VALUES (6, '/', 'og_title', 'Hoyt.IO');
INSERT INTO attributes VALUES (7, '/', 'og_image', 'images/banners/linux.png');


--
-- Name: attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('attributes_id_seq', 7, true);


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

INSERT INTO posts VALUES ('2016-10-29 10:39:10.875079+00', '2016-10-29 10:39:16.978281+00', 2, 1, 'Lorem ipsum', false, true, 3, '833b3b3cd89111201c8afbc3313efd45630d41a438f53a63dff1ddeece02c24889bd9f23208760bb0d7e6dacf6ec400991923ecdd9d215dbf9a4aee8047097cc');
INSERT INTO posts VALUES ('2016-10-29 10:38:45.584668+00', '2016-11-01 16:56:48.845386+00', 1, 1, 'Hello world!', false, true, 2, '4bcec55d8bd4fbd16b9be02bf00922194a1526479c42c8b58a316a785d892bddad9b4ad128927c8265f6c5f057448ab031f2f27a724ecdd37004d297cc08e5b0');
INSERT INTO posts VALUES ('2016-10-29 10:42:27.850815+00', '2016-11-01 17:14:30.669473+00', 3, 2, 'youtube-dl', true, true, 5, '06ef748d271b4c6419073d70724b04a9a909a227fb5b07192709b8c7afa4dba6f4389b85749360d56a37dea35ddfef1baa702dffd5ea0e8cc6861800ae0580d5');


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('posts_id_seq', 3, true);


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tag VALUES (1, 'Linux');
INSERT INTO tag VALUES (2, 'Weblog');
INSERT INTO tag VALUES (3, 'Desktop');


--
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tag_id_seq', 3, true);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tags VALUES (3, NULL);
INSERT INTO tags VALUES (1, NULL);
INSERT INTO tags VALUES (2, 2);
INSERT INTO tags VALUES (1, 2);
INSERT INTO tags VALUES (3, 1);
INSERT INTO tags VALUES (3, 3);


--
-- PostgreSQL database dump complete
--

