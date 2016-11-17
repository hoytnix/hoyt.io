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

INSERT INTO pages_last_modified VALUES ('2016-11-16 03:07:47.433121+00', '2016-11-16 03:07:47.438676+00', 55, '/admin/post/delete/', '82a25870711acaa9fe373f2252f79475');
INSERT INTO pages_last_modified VALUES ('2016-11-07 06:52:27.994245+00', '2016-11-07 06:52:28.014792+00', 38, '/admin/', '500c8faa0ef0b0fdceaa5917f277d5b1');
INSERT INTO pages_last_modified VALUES ('2016-11-16 03:07:47.452766+00', '2016-11-16 03:07:47.460807+00', 56, '/admin/post/action/', '82a25870711acaa9fe373f2252f79475');
INSERT INTO pages_last_modified VALUES ('2016-11-07 06:47:29.504321+00', '2016-11-15 20:52:01.559618+00', 36, '/dashboard', '5a9c162f81d90fc2a783de0e4cf3dc20');
INSERT INTO pages_last_modified VALUES ('2016-11-16 02:30:02.255206+00', '2016-11-16 02:30:02.29247+00', 39, '/admin', '2169f99378133d1fead2fcfe74085976');
INSERT INTO pages_last_modified VALUES ('2016-11-16 02:30:03.086395+00', '2016-11-16 02:30:03.111632+00', 40, '/favicon.ico', 'ca783981d8cff646eececb652f636a3b');
INSERT INTO pages_last_modified VALUES ('2016-11-16 03:07:47.476387+00', '2016-11-16 03:07:47.483+00', 57, '/admin/tag/delete/', '82a25870711acaa9fe373f2252f79475');
INSERT INTO pages_last_modified VALUES ('2016-11-16 03:07:47.496252+00', '2016-11-16 03:07:47.505068+00', 58, '/admin/tag/action/', '82a25870711acaa9fe373f2252f79475');
INSERT INTO pages_last_modified VALUES ('2016-11-16 02:59:50.833983+00', '2016-11-17 18:32:49.381809+00', 46, '/blog/goals/', '0df41df6fc2599be0191da4e84d5d4ca');
INSERT INTO pages_last_modified VALUES ('2016-11-16 02:31:48.770996+00', '2016-11-16 02:31:53.94589+00', 44, '/admin/category/new/', 'bfafbe6c40d5b2637e8c7b39eaf2904b');
INSERT INTO pages_last_modified VALUES ('2016-11-16 02:30:07.486386+00', '2016-11-16 02:32:49.482508+00', 42, '/admin/post/new/', '70a222b460b07d23ba1f3be75af379e7');
INSERT INTO pages_last_modified VALUES ('2016-11-16 03:07:47.676185+00', '2016-11-16 03:07:47.704619+00', 60, '/blog/tag/linux/', '735d440245725ea4a06e31375872688a');
INSERT INTO pages_last_modified VALUES ('2016-11-16 02:33:05.751056+00', '2016-11-16 02:58:56.517336+00', 45, '/blog/goals/week-0:-the-beginning-and-the-end/', 'e7855910043518e7294f59ee0ba5fff5');
INSERT INTO pages_last_modified VALUES ('2016-11-16 02:30:04.977927+00', '2016-11-17 18:43:29.734919+00', 41, '/admin/post/', '5b058c9ac8175b0a102f096c0a2d8624');
INSERT INTO pages_last_modified VALUES ('2016-11-07 02:03:58.214192+00', '2016-11-16 03:07:03.061727+00', 6, '/policy/privacy/', 'f916d42ce17f596043a1cf29133208a4');
INSERT INTO pages_last_modified VALUES ('2016-11-16 03:07:47.87401+00', '2016-11-16 03:07:47.892982+00', 62, '/blog/meta/', '38938f94e64dc8ab5d9d39012a9e2177');
INSERT INTO pages_last_modified VALUES ('2016-11-07 02:03:59.912299+00', '2016-11-16 03:07:03.127215+00', 7, '/policy/terms/', 'c7ca4feebc8a223d00acc3b644e4b58c');
INSERT INTO pages_last_modified VALUES ('2016-11-07 02:06:44.192463+00', '2016-11-07 06:46:26.722535+00', 8, '/admin/lastmodified/ajax/lookup/', 'ca783981d8cff646eececb652f636a3b');
INSERT INTO pages_last_modified VALUES ('2016-11-16 03:07:47.954723+00', '2016-11-16 03:07:47.992691+00', 63, '/blog/tag/weblog/', '6068b226192b9dbb0344d6e9982cdb84');
INSERT INTO pages_last_modified VALUES ('2016-11-07 02:03:50.418166+00', '2016-11-16 03:07:48.136775+00', 5, '/blog/meta/lorem-ipsum/', '95436b17b85ffe1ca3d86c68e76a8c72');
INSERT INTO pages_last_modified VALUES ('2016-11-07 02:01:18.405368+00', '2016-11-17 19:55:39.402383+00', 2, '/blog/', '8db8be8f9a1aa252638085b8b06770eb');
INSERT INTO pages_last_modified VALUES ('2016-11-16 03:07:03.451756+00', '2016-11-16 03:07:03.457855+00', 48, '/admin/attribute/', '0d294daa26b984c3453612de96326d10');
INSERT INTO pages_last_modified VALUES ('2016-11-16 02:31:47.228933+00', '2016-11-16 03:07:03.516024+00', 43, '/admin/category/', 'c798e158215349ae42f7f7513d4f0983');
INSERT INTO pages_last_modified VALUES ('2016-11-16 03:07:03.615467+00', '2016-11-16 03:07:03.624239+00', 49, '/admin/tag/', 'cb2342e1217925611ca01703e87c152f');
INSERT INTO pages_last_modified VALUES ('2016-11-07 02:07:43.690817+00', '2016-11-16 03:07:03.750571+00', 34, '/dashboard/', 'aaf42a084839d05b69ddd6674c1a7c3f');
INSERT INTO pages_last_modified VALUES ('2016-11-16 03:08:00.717456+00', '2016-11-16 03:08:00.745415+00', 64, '/blog', '80e3b756ec050944f996090f80bb3b21');
INSERT INTO pages_last_modified VALUES ('2016-11-16 03:07:03.912021+00', '2016-11-16 03:07:03.945018+00', 50, '/admin/lastmodified/delete/', '82a25870711acaa9fe373f2252f79475');
INSERT INTO pages_last_modified VALUES ('2016-11-07 06:47:43.284384+00', '2016-11-16 03:07:47.322492+00', 37, '/admin/lastmodified/action/', '82a25870711acaa9fe373f2252f79475');
INSERT INTO pages_last_modified VALUES ('2016-11-16 03:07:47.333819+00', '2016-11-16 03:07:47.350546+00', 51, '/admin/attribute/delete/', '82a25870711acaa9fe373f2252f79475');
INSERT INTO pages_last_modified VALUES ('2016-11-16 03:07:47.364358+00', '2016-11-16 03:07:47.372171+00', 52, '/admin/attribute/action/', '82a25870711acaa9fe373f2252f79475');
INSERT INTO pages_last_modified VALUES ('2016-11-16 03:07:47.387891+00', '2016-11-16 03:07:47.394338+00', 53, '/admin/category/delete/', '82a25870711acaa9fe373f2252f79475');
INSERT INTO pages_last_modified VALUES ('2016-11-16 03:07:47.407605+00', '2016-11-16 03:07:47.416527+00', 54, '/admin/category/action/', '82a25870711acaa9fe373f2252f79475');
INSERT INTO pages_last_modified VALUES ('2016-11-07 01:58:06.761576+00', '2016-11-17 19:30:15.91516+00', 1, '/', '4e801377a2593fcc42a0ab11da715375');
INSERT INTO pages_last_modified VALUES ('2016-11-07 02:07:43.679861+00', '2016-11-17 19:31:33.918472+00', 33, '/sitemap.xml', '4bbf25f211be35534e474e113ddd96e0');
INSERT INTO pages_last_modified VALUES ('2016-11-16 02:59:54.403699+00', '2016-11-17 19:31:44.071433+00', 47, '/blog/goals/week-0-the-beginning-and-the-end/', '891bfff595550c4b5fbf4d79e7f7d025');
INSERT INTO pages_last_modified VALUES ('2016-11-07 02:03:42.62202+00', '2016-11-17 19:32:33.35448+00', 3, '/blog/software/youtube-dl/', '87a239486426c60254b8f9524b9353cd');
INSERT INTO pages_last_modified VALUES ('2016-11-07 02:03:47.028899+00', '2016-11-16 03:16:14.60964+00', 4, '/blog/meta/hello-world-/', '929354fd5ae630ca2e8661b7a80ba55e');
INSERT INTO pages_last_modified VALUES ('2016-11-16 03:07:47.605444+00', '2016-11-17 19:32:44.384388+00', 59, '/blog/software/', 'f51a2c2d7d3d6df39476f33420bb2b2a');
INSERT INTO pages_last_modified VALUES ('2016-11-07 02:07:43.627083+00', '2016-11-17 18:21:11.633781+00', 28, '/admin/lastmodified/', 'b59b3df332728cd1bb791648673061e7');
INSERT INTO pages_last_modified VALUES ('2016-11-16 03:07:47.744866+00', '2016-11-17 18:30:42.245707+00', 61, '/blog/tag/desktop/', '3c2a5f676d78ea1a58ee48c35593c4b1');
INSERT INTO pages_last_modified VALUES ('2016-11-17 18:32:11.468096+00', '2016-11-17 18:32:11.482998+00', 65, '/blog/tag/', 'ca783981d8cff646eececb652f636a3b');


--
-- Name: pages_last_modified_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pages_last_modified_id_seq', 65, true);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO posts VALUES ('2016-10-29 10:39:10.875079+00', '2016-10-29 10:39:16.978281+00', 2, 1, 'Lorem ipsum', false, true, 3, '833b3b3cd89111201c8afbc3313efd45630d41a438f53a63dff1ddeece02c24889bd9f23208760bb0d7e6dacf6ec400991923ecdd9d215dbf9a4aee8047097cc');
INSERT INTO posts VALUES ('2016-10-29 10:38:45.584668+00', '2016-11-01 16:56:48.845386+00', 1, 1, 'Hello world!', false, true, 2, '4bcec55d8bd4fbd16b9be02bf00922194a1526479c42c8b58a316a785d892bddad9b4ad128927c8265f6c5f057448ab031f2f27a724ecdd37004d297cc08e5b0');
INSERT INTO posts VALUES ('2016-11-16 02:32:49.433321+00', '2016-11-16 03:00:45.669882+00', 4, 3, 'Week 0: The Beginning and The End', true, true, 2, '89a036848565c5c2f2bae56b930ce5ab1122b26a071806ab2ef7861346865dba2bc545c4584a88cb9908df2fbff7906ce376720c94ee9abb0b92a19cd3c4cb0a');
INSERT INTO posts VALUES ('2016-10-29 10:42:27.850815+00', '2016-11-17 18:36:44.271404+00', 3, 2, 'youtube-dl', true, true, 5, 'd128d7cf37195a9b40da513dfe188c40710a16b8fd3fd10f043507a624fb51eb93a3928c08b1991abb31efd55a26717b06774359d52c2645af3f6e9df1376790');


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

