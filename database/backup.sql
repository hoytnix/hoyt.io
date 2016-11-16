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

INSERT INTO alembic_version VALUES ('18248a9ed8bb');


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
INSERT INTO categories VALUES (3, 'Goals');


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categories_id_seq', 3, true);


--
-- Data for Name: pages_last_modified; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pages_last_modified VALUES ('2016-11-07 02:07:43.627083+00', '2016-11-07 06:52:19.658019+00', 28, '/admin/lastmodified/', 'ae6918ce326bbe870ac790b0fedd52ff');
INSERT INTO pages_last_modified VALUES ('2016-11-07 06:52:27.994245+00', '2016-11-07 06:52:28.014792+00', 38, '/admin/', '500c8faa0ef0b0fdceaa5917f277d5b1');
INSERT INTO pages_last_modified VALUES ('2016-11-07 02:03:42.62202+00', '2016-11-15 20:51:52.381618+00', 3, '/blog/software/youtube-dl/', '9cdb20a99075bc93be31b20fcabf6127');
INSERT INTO pages_last_modified VALUES ('2016-11-07 06:47:29.504321+00', '2016-11-15 20:52:01.559618+00', 36, '/dashboard', '5a9c162f81d90fc2a783de0e4cf3dc20');
INSERT INTO pages_last_modified VALUES ('2016-11-16 02:30:02.255206+00', '2016-11-16 02:30:02.29247+00', 39, '/admin', '2169f99378133d1fead2fcfe74085976');
INSERT INTO pages_last_modified VALUES ('2016-11-16 02:30:03.086395+00', '2016-11-16 02:30:03.111632+00', 40, '/favicon.ico', 'ca783981d8cff646eececb652f636a3b');
INSERT INTO pages_last_modified VALUES ('2016-11-16 02:31:48.770996+00', '2016-11-16 02:31:53.94589+00', 44, '/admin/category/new/', 'bfafbe6c40d5b2637e8c7b39eaf2904b');
INSERT INTO pages_last_modified VALUES ('2016-11-16 02:31:47.228933+00', '2016-11-16 02:31:54.123915+00', 43, '/admin/category/', '70c7dd791336e403019e4b2f538cc6d5');
INSERT INTO pages_last_modified VALUES ('2016-11-16 02:30:07.486386+00', '2016-11-16 02:32:49.482508+00', 42, '/admin/post/new/', '70a222b460b07d23ba1f3be75af379e7');
INSERT INTO pages_last_modified VALUES ('2016-11-16 02:30:04.977927+00', '2016-11-16 02:32:49.604903+00', 41, '/admin/post/', '5762b798e2a8380b039fc46d5d6262ff');
INSERT INTO pages_last_modified VALUES ('2016-11-07 02:01:18.405368+00', '2016-11-16 02:33:03.910315+00', 2, '/blog/', '1c30e3e064be2b5223e676c6f0f73596');
INSERT INTO pages_last_modified VALUES ('2016-11-16 02:33:05.751056+00', '2016-11-16 02:58:56.517336+00', 45, '/blog/goals/week-0:-the-beginning-and-the-end/', 'e7855910043518e7294f59ee0ba5fff5');
INSERT INTO pages_last_modified VALUES ('2016-11-16 02:59:50.833983+00', '2016-11-16 02:59:50.855555+00', 46, '/blog/goals/', '6ab6f3042b519eefe3d93c99c81a28aa');
INSERT INTO pages_last_modified VALUES ('2016-11-07 01:58:06.761576+00', '2016-11-07 06:44:59.656552+00', 1, '/', '4514299d5daf27d9d77425b0bbdeeb54');
INSERT INTO pages_last_modified VALUES ('2016-11-16 02:59:54.403699+00', '2016-11-16 03:00:45.712036+00', 47, '/blog/goals/week-0-the-beginning-and-the-end/', '2772a07d81d83ce2c77d53460d37a73c');
INSERT INTO pages_last_modified VALUES ('2016-11-07 02:06:44.192463+00', '2016-11-07 06:46:26.722535+00', 8, '/admin/lastmodified/ajax/lookup/', 'ca783981d8cff646eececb652f636a3b');
INSERT INTO pages_last_modified VALUES ('2016-11-07 02:03:58.214192+00', '2016-11-07 06:46:41.788621+00', 6, '/policy/privacy/', '1196f51f27b5f3c9d17ad6233f3cdb4e');
INSERT INTO pages_last_modified VALUES ('2016-11-07 02:03:59.912299+00', '2016-11-07 06:46:44.64305+00', 7, '/policy/terms/', '97c5494085d77f5b8a25073f81dbdc30');
INSERT INTO pages_last_modified VALUES ('2016-11-07 02:07:43.679861+00', '2016-11-07 06:46:47.322405+00', 33, '/sitemap.xml', '7fbffeda72a7af1b349ec8f04ec00f19');
INSERT INTO pages_last_modified VALUES ('2016-11-07 02:03:50.418166+00', '2016-11-07 06:47:07.469756+00', 5, '/blog/meta/lorem-ipsum/', '1befba6b387a038aa5cf699a3e70bad4');
INSERT INTO pages_last_modified VALUES ('2016-11-07 02:03:47.028899+00', '2016-11-07 06:47:09.544369+00', 4, '/blog/meta/hello-world-/', '1242b7a35e9b9eadd80f4e60b79fbbad');
INSERT INTO pages_last_modified VALUES ('2016-11-07 02:07:43.690817+00', '2016-11-07 06:47:29.536192+00', 34, '/dashboard/', '4df84af0c40e5ca8a6eb7ca861cbf5ae');
INSERT INTO pages_last_modified VALUES ('2016-11-07 06:47:43.284384+00', '2016-11-07 06:48:01.705027+00', 37, '/admin/lastmodified/action/', 'ac3aa6338f30fc5e887bed4f78980ac6');


--
-- Name: pages_last_modified_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pages_last_modified_id_seq', 47, true);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO posts VALUES ('2016-10-29 10:39:10.875079+00', '2016-10-29 10:39:16.978281+00', 2, 1, 'Lorem ipsum', false, true, 3, '833b3b3cd89111201c8afbc3313efd45630d41a438f53a63dff1ddeece02c24889bd9f23208760bb0d7e6dacf6ec400991923ecdd9d215dbf9a4aee8047097cc');
INSERT INTO posts VALUES ('2016-10-29 10:38:45.584668+00', '2016-11-01 16:56:48.845386+00', 1, 1, 'Hello world!', false, true, 2, '4bcec55d8bd4fbd16b9be02bf00922194a1526479c42c8b58a316a785d892bddad9b4ad128927c8265f6c5f057448ab031f2f27a724ecdd37004d297cc08e5b0');
INSERT INTO posts VALUES ('2016-10-29 10:42:27.850815+00', '2016-11-07 00:26:05.344948+00', 3, 2, 'youtube-dl', true, true, 5, '06ef748d271b4c6419073d70724b04a9a909a227fb5b07192709b8c7afa4dba6f4389b85749360d56a37dea35ddfef1baa702dffd5ea0e8cc6861800ae0580d5');
INSERT INTO posts VALUES ('2016-11-16 02:32:49.433321+00', '2016-11-16 03:00:45.669882+00', 4, 3, 'Week 0: The Beginning and The End', true, true, 2, '89a036848565c5c2f2bae56b930ce5ab1122b26a071806ab2ef7861346865dba2bc545c4584a88cb9908df2fbff7906ce376720c94ee9abb0b92a19cd3c4cb0a');


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('posts_id_seq', 4, true);


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tag VALUES (1, 'Linux');
INSERT INTO tag VALUES (2, 'Weblog');
INSERT INTO tag VALUES (3, 'Desktop');


--
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tag_id_seq', 6, true);


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

