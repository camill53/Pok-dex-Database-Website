--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5 (Ubuntu 13.5-1.pgdg18.04+1)
-- Dumped by pg_dump version 13.5 (Ubuntu 13.5-1.pgdg18.04+1)

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
-- Name: abilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.abilities (
    abilityname character varying(35) NOT NULL
);


ALTER TABLE public.abilities OWNER TO postgres;

--
-- Name: evolvesfrom; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evolvesfrom (
    evolvedid integer NOT NULL,
    preevolveid integer NOT NULL,
    condition character varying(50)
);


ALTER TABLE public.evolvesfrom OWNER TO postgres;

--
-- Name: fromregion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fromregion (
    pokedexnum integer NOT NULL,
    generation integer NOT NULL
);


ALTER TABLE public.fromregion OWNER TO postgres;

--
-- Name: has; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.has (
    pokedexnum integer NOT NULL,
    abilityname character varying(35) NOT NULL
);


ALTER TABLE public.has OWNER TO postgres;

--
-- Name: of; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.of (
    pokedexnum integer NOT NULL,
    typename character varying(20)
);


ALTER TABLE public.of OWNER TO postgres;

--
-- Name: pokemon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemon (
    name character varying(20),
    pokedexnum integer NOT NULL,
    normcolor character varying(20),
    shinycolor character varying(20)
);


ALTER TABLE public.pokemon OWNER TO postgres;

--
-- Name: region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.region (
    generation integer NOT NULL,
    regionname character varying(20) NOT NULL
);


ALTER TABLE public.region OWNER TO postgres;

--
-- Name: types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.types (
    typename character varying(20) NOT NULL
);


ALTER TABLE public.types OWNER TO postgres;

--
-- Data for Name: abilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.abilities (abilityname) FROM stdin;
Run Away
Sand veil
Arena trap
Filter
Motor Drive
Overgrow
Chlorophyll
Blaze
Solar Power
Torrent
Rain Dish
Shield Dust
Run away
Shed Skin
Compound Eyes
Tinted Lens
Swarm
Sniper
Keen Eye
Tangled Feet
Guts
Intimidate
Static
Lightning Rod
Sand Veil
Sand Rush
Poison Point
Rivalry
Cute Charm
Magic Guard
Flash Fire
Drought
Competitive
Inner Focus
Infiltrator
Stench
Effect Spore
Dry Skin
Arena Trap
Pick Up
Technician
Limber
Damp
Cloud Nine
Vital Spirit
Anger Point
Water Absorb
Synchronize
No Guard
Gluttony
Clear Body
Liquid Ooze
Rock Head
Sturdy
Oblivious
Own Tempo
Magnet Pull
Early Bird
Thick Fat
Hydration
Sticky Hold
Shell Armor
Shell Link
Levitate
Cursed Body
Insomnia
Forewarn
Hyper Cutter
Soundproof
Harvest
Reckless
Iron Fist
Neutralizing Gas
Natural Cure
Serene Grace
Leaf Guard
Scrappy
Swift Swim
Water Veil
Illuminate
Flame Body
Mold Breaker
Rattled
Moxie
Imposter
Adaptability
Volt Absorb
Quick Feet
Trace
Download
Battle Armor
Pressure
Immunity
Snow Cloak
Marvel Scale
Multiscale
Unnerve
Healer
Steadfast
Solid Rock
Magic Bounce
Ice Body
Pixilate
\.


--
-- Data for Name: evolvesfrom; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.evolvesfrom (evolvedid, preevolveid, condition) FROM stdin;
2	1	lvl 16
3	2	lvl 32
5	4	lvl 16
6	5	lvl 36
8	7	lvl 16
9	8	lvl 36
11	10	lvl 7
12	11	lvl 10
14	13	lvl 7
15	14	lvl 10
17	16	lvl 18
18	17	lvl 36
20	19	lvl 20
22	21	lvl 20
24	23	lvl 22
25	172	happiness
26	25	thunderstone
28	27	lvl 22
30	29	lvl 16
31	30	moonstone
33	32	lvl 16
34	33	moonstone
35	173	happiness
36	35	moonstone
38	37	firestone
39	174	happiness
40	39	moonstone
42	41	lvl 22
169	42	happiness
44	43	lvl 21
45	44	leafstone
182	44	sunstone
47	46	lvl 24
49	48	lvl 31
51	50	lvl 26
53	52	lvl 28
55	54	lvl 33
57	56	lvl 28
59	58	firestone
61	60	lvl 25
62	61	waterstone
186	61	trade: kings rock
64	63	lvl 16
65	64	trade
67	66	lvl 28
68	67	trade
70	69	lvl 21
71	70	leafstone
73	72	lvl 30
75	74	lvl 25
76	75	trade
78	77	lvl 40
82	81	lvl 30
462	82	thunderstone
85	84	lvl 31
87	86	lvl 34
89	88	lvl 38
91	90	waterstone
93	92	lvl 25
94	93	trade
208	95	trade: metal coat
97	96	lvl 26
99	98	lvl 28
101	100	lvl 30
103	102	leafstone
105	104	lvl 28
106	236	lvl 20: ATK<DEF
107	236	lvl 20: ATK>DEF
237	236	lvl 20: ATK=DEF
463	108	lvl up with Rollout
110	109	lvl 35
112	111	lvl 42
464	112	trade: protector
113	440	lvl up with oval stone
242	113	happiness
465	114	lvl up with Ancient Power
117	116	lvl 32
230	117	trade: dragon scale
119	118	lvl 33
121	120	waterstone
122	439	lvl up with Mimic
212	123	trade: metal coat
124	238	lvl 30
125	239	lvl 30
466	125	trade: electirizer
126	240	lvl 30
467	126	trade: magmarizer
130	129	lvl 20
134	133	waterstone
135	133	thunderstone
136	133	firestone
196	133	happiness: day
197	133	happiness: night
470	133	leafstone
471	133	icestone
700	133	lvl up with fairy move
233	137	trade: upgrade
474	233	trade: dubious disc
139	138	lvl 40
141	140	lvl 40
143	446	happiness
148	147	lvl 30
149	148	lvl 55
\.


--
-- Data for Name: fromregion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fromregion (pokedexnum, generation) FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	1
20	1
21	1
22	1
23	1
24	1
25	1
26	1
27	1
28	1
29	1
30	1
31	1
32	1
33	1
34	1
35	1
36	1
37	1
38	1
39	1
40	1
41	1
42	1
43	1
44	1
45	1
46	1
47	1
48	1
49	1
50	1
51	1
52	1
53	1
54	1
55	1
56	1
57	1
58	1
59	1
60	1
61	1
62	1
63	1
64	1
65	1
66	1
67	1
68	1
69	1
70	1
71	1
72	1
73	1
74	1
75	1
76	1
77	1
78	1
79	1
80	1
81	1
82	1
83	1
84	1
85	1
86	1
87	1
88	1
89	1
90	1
91	1
92	1
93	1
94	1
95	1
96	1
97	1
98	1
99	1
100	1
101	1
102	1
103	1
104	1
105	1
106	1
107	1
108	1
109	1
110	1
111	1
112	1
113	1
114	1
115	1
116	1
117	1
118	1
119	1
120	1
121	1
122	1
123	1
124	1
125	1
126	1
127	1
128	1
129	1
130	1
131	1
132	1
133	1
134	1
135	1
136	1
137	1
138	1
139	1
140	1
141	1
142	1
143	1
144	1
145	1
146	1
147	1
148	1
149	1
150	1
151	1
172	2
173	2
174	2
169	2
182	2
186	2
199	2
462	4
237	2
236	2
464	4
242	2
440	4
465	4
230	2
439	4
212	2
238	2
239	2
240	2
466	4
467	4
196	2
197	2
470	4
471	4
700	6
233	2
474	4
446	4
\.


--
-- Data for Name: has; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.has (pokedexnum, abilityname) FROM stdin;
1	Overgrow
1	Chlorophyll
2	Overgrow
2	Chlorophyll
3	Overgrow
3	Chlorophyll
4	Blaze
4	Solar Power
5	Blaze
5	Solar Power
6	Blaze
6	Solar Power
7	Torrent
7	Rain Dish
8	Torrent
8	Rain Dish
9	Torrent
9	Rain Dish
10	Shield Dust
10	Run away
11	Shed Skin
12	Compound Eyes
12	Tinted Lens
13	Shield Dust
13	Run away
14	Shed Skin
15	Swarm
15	Sniper
16	Keen Eye
16	Tangled Feet
17	Keen Eye
17	Tangled Feet
18	Keen Eye
18	Tangled Feet
19	Run Away
19	Guts
20	Run Away
20	Guts
21	Keen Eye
21	Sniper
22	Keen Eye
22	Sniper
23	Intimidate
23	Shed Skin
24	Intimidate
24	Shed Skin
25	Static
25	Lightning Rod
26	Static
26	Lightning Rod
27	Sand Veil
27	Sand Rush
28	Sand Veil
28	Sand Rush
29	Poison Point
29	Rivalry
30	Poison Point
30	Rivalry
31	Poison Point
31	Rivalry
32	Poison Point
32	Rivalry
33	Poison Point
33	Rivalry
34	Poison Point
34	Rivalry
35	Cute Charm
35	Magic Guard
36	Cute Charm
36	Magic Guard
37	Flash Fire
37	Drought
38	Flash Fire
38	Drought
39	Cute Charm
39	Competitive
40	Cute Charm
40	Competitive
41	Inner Focus
41	Infiltrator
42	Inner Focus
42	Infiltrator
43	Chlorophyll
43	Run Away
44	Chlorophyll
44	Stench
45	Chlorophyll
45	Effect Spore
46	Effect Spore
46	Dry Skin
47	Effect Spore
47	Dry Skin
48	Compound Eyes
48	Tinted Lens
49	Shield Dust
49	Tinted Lens
50	Sand Veil
50	Arena Trap
51	Sand veil
51	Arena trap
52	Pick Up
52	Technician
53	Limber
53	Technician
54	Damp
54	Cloud Nine
55	Damp
55	Cloud Nine
56	Vital Spirit
56	Anger Point
57	Vital Spirit
57	Anger Point
58	Intimidate
58	Flash Fire
59	Intimidate
59	Flash Fire
60	Water Absorb
60	Damp
61	Water Absorb
61	Damp
62	Water Absorb
62	Damp
63	Synchronize
63	Inner Focus
64	Synchronize
64	Inner Focus
65	Synchronize
65	Inner Focus
66	Guts
66	No Guard
67	Guts
67	No Guard
68	Guts
68	No Guard
69	Chlorophyll
69	Gluttony
70	Chlorophyll
70	Gluttony
71	Chlorophyll
71	Gluttony
72	Clear Body
72	Liquid Ooze
73	Clear Body
73	Liquid Ooze
74	Rock Head
74	Sturdy
75	Rock Head
75	Sturdy
76	Rock Head
76	Sturdy
77	Run Away
77	Flash Fire
78	Run Away
78	Flash Fire
79	Oblivious
79	Own Tempo
80	Oblivious
80	Own Tempo
81	Magnet Pull
81	Sturdy
82	Magnet Pull
82	Sturdy
83	Keen Eye
83	Inner Focus
84	Run Away
84	Early Bird
85	Run Away
85	Early Bird
86	Thick Fat
86	Hydration
87	Thick Fat
87	Hydration
88	Stench
88	Sticky Hold
89	Stench
89	Sticky Hold
90	Shell Armor
90	Shell Link
91	Shell Armor
91	Shell Link
92	Levitate
93	Levitate
94	Cursed Body
95	Rock Head
95	Sturdy
96	Insomnia
96	Forewarn
97	Insomnia
97	Forewarn
98	Hyper Cutter
98	Shell Armor
99	Hyper Cutter
99	Shell Armor
100	Soundproof
100	Static
101	Soundproof
101	Static
102	Chlorophyll
102	Harvest
103	Chlorophyll
103	Harvest
104	Rock Head
104	Lightning Rod
105	Rock Head
105	Lightning Rod
106	Limber
106	Reckless
107	Keen Eye
107	Iron Fist
108	Own Tempo
108	Oblivious
109	Levitate
109	Neutralizing Gas
110	Levitate
110	Neutralizing Gas
111	Lightning Rod
111	Rock Head
112	Lightning Rod
112	Rock Head
113	Natural Cure
113	Serene Grace
114	Chlorophyll
114	Leaf Guard
115	Early Bird
115	Scrappy
116	Swift Swim
116	Sniper
117	Poison Point
117	Sniper
118	Swift Swim
118	Water Veil
119	Swift Swim
119	Water Veil
120	Illuminate
120	Natural Cure
121	Illuminate
121	Natural Cure
122	Soundproof
122	Filter
123	Swarm
123	Technician
124	Oblivious
124	Forewarn
125	Static
125	Vital Spirit
126	Flame Body
126	Vital Spirit
127	Hyper Cutter
127	Mold Breaker
128	Intimidate
128	Anger Point
129	Swift Swim
129	Rattled
130	Intimidate
130	Moxie
131	Water Absorb
131	Shell Armor
132	Limber
132	Imposter
133	Run Away
133	Adaptability
134	Water Absorb
134	Hydration
135	Volt Absorb
135	Quick Feet
136	Flash Fire
136	Guts
137	Trace
137	Download
138	Swift Swim
138	Shell Armor
139	Swift Swim
139	Shell Armor
140	Swift Swim
140	Battle Armor
141	Swift Swim
141	Battle Armor
142	Rock Head
142	Pressure
143	Immunity
143	Thick Fat
144	Pressure
144	Snow Cloak
145	Pressure
145	Static
146	Pressure
146	Flame Body
147	Shed Skin
147	Marvel Scale
148	Shed Skin
148	Marvel Scale
149	Inner Focus
149	Multiscale
150	Pressure
150	Unnerve
151	Synchronize
172	Static
172	Lightning Rod
173	Magic Guard
173	Competitive
169	Inner Focus
173	Cute Charm
169	Infiltrator
182	Chlorophyll
182	Healer
186	Water Absorb
186	Damp
199	Oblivious
199	Own Tempo
462	Magnet Pull
462	Sturdy
237	Intimidate
237	Technician
236	Guts
236	Steadfast
464	Lightning Rod
464	Solid Rock
242	Natural Cure
242	Serene Grace
440	Natural Cure
440	Serene Grace
465	Chlorophyll
465	Leaf Guard
230	Swift Swim
230	Sniper
439	Soundproof
439	Filter
212	Swarm
212	Technician
238	Oblivious
238	Forewarn
239	Static
239	Vital Spirit
466	Motor Drive
466	Vital Spirit
240	Flame Body
240	Vital Spirit
467	Flame Body
467	Vital Spirit
196	Synchronize
196	Magic Bounce
197	Synchronize
197	Inner Focus
470	Leaf Guard
470	Chlorophyll
471	Snow Cloak
471	Ice Body
700	Cute Charm
700	Pixilate
233	Trace
233	Adaptability
233	Download
233	Pick Up
233	Thick Fat
\.


--
-- Data for Name: of; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.of (pokedexnum, typename) FROM stdin;
1	Grass
1	Poison
2	Grass
2	Poison
3	Grass
3	Poison
4	Fire
5	Fire
6	Fire
6	Flying
7	Water
8	Water
9	Water
10	Bug
11	Bug
12	Bug
12	Flying
13	Bug
13	Poison
14	Bug
14	Poison
15	Bug
15	Poison
16	Normal
16	Flying
17	Normal
17	Flying 
18	Normal
18	Flying
19	Normal
20	Normal
21	Normal
21	Flying
22	Normal
22	Flying
23	Poison
24	Poison
25	Electric
26	Electric
27	Ground
28	Ground
29	Poison
30	Poison
31	Ground
31	Poison
32	Poison
33	Poison
34	Ground
34	Poison
35	Fairy
36	Fairy
37	Fire
38	Fire
39	Normal
39	Fairy
40	Normal
40	Fairy
41	Poison
41	Flying
42	Poison
42	Flying
43	Grass
43	Poison
44	Grass
44	Poison
45	Grass
45	Poison
46	Bug
46	Grass
47	Bug
47	Grass
48	Bug
48	Grass
49	Bug
49	Grass
50	Ground
51	Ground
52	Normal
53	Normal
54	Water
55	Water
56	Fighting
57	Fighting
58	Fire
59	Fire
60	Water
61	Water
62	Water
62	Fighting
63	Psychic
64	Psychic
65	Psychic
66	Fighting
67	Fighting
68	Fighting
69	Grass
69	Poison
70	Grass
70	Poison
71	Grass
71	Poison
72	Water
72	Poison
73	Water
73	Poison
74	Rock
74	Ground
75	Rock
75	Ground
76	Rock
76	Ground
77	Fire
78	Fire
79	Water
79	Psychic
80	Water
80	Psychic
81	Electric
81	Steel
82	Electric
82	Steel
83	Normal
83	Flying
84	Normal
84	Flying
85	Normal
85	Flying
86	Water
87	Water
87	Ice
88	Poison
89	Poison
90	Water
91	Water
91	Ice
92	Ghost
92	Poison
93	Ghost
93	Poison
94	Ghost
94	Poison
95	Rock
95	Ground
96	Psychic
97	Psychic
98	Water
99	Water
100	Electric
101	Electric
102	Grass
102	Psychic
103	Grass
103	Psychic
104	Ground
105	Ground
106	Fighting
107	Fighting
108	Normal
109	Poison
110	Poison
111	Ground
111	Rock
112	Ground
112	Rock
113	Normal
114	Grass
115	Normal
116	Water
117	Water
118	Water
119	Water
120	Water
121	Water
121	Psychic
122	Psychic
122	Fairy
123	Bug
123	Flying
124	Ice
124	Psychic
125	Electric
126	Fire
127	Bug
128	Normal
129	Water
130	Water
130	Flying
131	Water
131	Ice
132	Normal
133	Normal
134	Water
135	Electric
136	Fire
137	Normal
138	Rock
138	Water
139	Rock
139	Water
140	Rock
140	Water
141	Rock
141	Water
142	Rock
142	Flying
143	Normal
144	Ice
144	Flying
145	Electric
145	Flying
146	Fire
146	Flying
147	Dragon
148	Dragon
149	Dragon
149	Flying
150	Psychic
151	Psychic
169	Poison
169	Flying
172	Electric
173	Fairy
174	Normal
174	Fairy
182	Grass
186	Water
196	Psychic
197	Dark
199	Water
199	Psychic
212	Bug
212	Steel
230	Water
230	Dragon
233	Normal
236	Fighting
237	Fighting
238	Ice
238	Psychic
239	Electric
240	Fire
242	Normal
439	Fairy
439	Psychic
440	Normal
446	Normal
462	Electric
462	Steel
464	Ground
464	Rock
465	Grass
466	Electric
467	Fire
470	Grass
471	Ice
474	Normal
700	Fairy
\.


--
-- Data for Name: pokemon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pokemon (name, pokedexnum, normcolor, shinycolor) FROM stdin;
Bulbasaur	1	green	green
Ivysaur	2	blue	green
Venusaur	3	blue	green
Charmander	4	orange	yellow
Charmeleon	5	red	orange
Charizard	6	orange	back
Squirtle	7	blue	blue
Wartortle	8	blue	purple
Blastoise	9	blue	purple
Caterpie	10	green	yellow
Metapod	11	green	orange
Butterfree	12	purple	pink
Weedle	13	orange	yellow
Kakuna	14	yellow	green
Beedrill	15	yellow	green
Pidgey	16	brown	brown
Pidgeotto	17	brown	yellow
Pidgeot	18	brown	yellow
Rattata	19	purple	green
Raticate	20	brown	orange
Spearow	21	brown	yellow
Fearow	22	brown	green
Ekans	23	purple	yellow
Arbok	24	purple	orange
Pikachu	25	yellow	orange
Raichu	26	orange	orange
Pichu	172	yellow	yellow
Sandshrew	27	yellow	green
Sandslash	28	yellow	red
Nidoran♀	29	blue	purple
Nidorina	30	blue	purple
Nidoqueen	31	blue	green
Nidoran♂	32	purple	blue
Nidorino	33	purple	blue
Nidoking	34	purple	blue
Clefairy	35	pink	pink
Clefable	36	pink	pink
Cleffa	173	pink	pink
Vulpix	37	red	yellow
Ninetales	38	red	gray
Wigglytuff	40	pink	pink
igglybuff	174	pink	pink
Zubat	41	blue	green
Golbat	42	blue	green
Crobat	169	purple	pink
Oddish	43	blue	green
Gloom	44	blue	green
Vileplume	45	blue	green
Bellossom	182	green	purple
Paras	46	orange	orange
Parasect	47	orange	yellow
Venonat	48	purple	blue
Venomoth	49	purple	blue
Diglett	50	brown	brown
Dugtrio	51	brown	brown
Meowth	52	tan	brown
Persian	53	tan	yellow
Psyduck	54	yellow	blue
Golduck	55	blue	blue
Mankey	56	tan	green
Primeape	57	tan	green
Growlithe	58	orange	yellow
Arcanine	59	orange	yellow
Poliwag	60	blue	blue
Poliwhirl	61	blue	yellow
Poliwrath	62	blue	green
Politoed	186	green	blue
Abra	63	yellow	yellow
Kadabra	64	yellow	yellow
Alakazam	65	yellow	pink
Machop	66	gray	brown
Machoke	67	gray	green
Machamp	68	gray	green
Bellsprout	69	green	yellow
Weepinbell	70	yellow	green
Victreebell	71	yellow	green
Tentacool	72	blue	purple
Tentacruel	73	blue	blue
Geodude	74	gray	yellow
Graveler	75	gray	brown
Golem	76	gray	brown
Ponyta	77	orange	blue
Rapidash	78	orange	gray
Slowpoke	79	pink	pink
Slowbro	80	pink	purple
Slowking	199	pink	pink
Magnemite	81	gray	yellow
Magneton	82	gray	yellow
Magnezone	462	gray	white
Farfetch`d	83	brown	orange
Doduo	84	brown	green
Dodrio	85	pink	pink
Seel	86	white	tan
Dewgong	87	white	tan
Grimer	88	purple	green
Muk	89	purple	green
Shellder	90	purple	orange
Cloyster	91	purple	blue
Ghastly	92	purple	blue
Haunter	93	purple	purple
Gengar	94	purple	purple
Onix	95	gray	green
Steelix	208	gray	yellow
Drowzee	96	yellow	pink
Hypno	97	yellow	pink
Krabby	98	orange	yellow
Kingler	99	orange	green
Voltorb	100	red	blue
Electrode	101	red	blue
Exeggcute	102	pink	yellow
Exeggutor	103	brown	yellow
Cubone	104	brown	green
Marowak	105	brown	green
Hitmonlee	106	brown	green
Hitmonchan	107	brown	green
Hitmontop	237	brown	gray
Tyrogue	236	pink	gray
Lickitung	108	pink	yellow
Koffing	109	purple	blue
Wheezing	110	purple	green
Rhyhorn	111	gray	brown
Rhydon	112	gray	yellow
Rhyperior	464	orange	yellow
Chansey	113	pink	green
Blissey	242	pink	pink
Happiny	440	pink	pink
Tangela	114	blue	green
Tangrowth	465	blue	green
Kangaskhan	115	brown	gray
Horsea	116	blue	blue
Seadra	117	blue	purple
Kingdra	230	blue	purple
Goldeen	118	red	yellow
Seaking	119	red	orange
Staryu	120	brown	white
Starmie	121	purple	blue
Mr. Mime	122	pink	green
Mime Jr.	439	blue	green
Scyther	123	green	green
Scizor	212	red	green
Jinx	124	red	pink
Smoochum	238	pink	pink
Electabuzz	125	yellow	orange
Elekid	239	yellow	yellow
Electivire	466	yellow	orange
Magmar	126	red	pink
Magby	240	red	orange
Magmortar	467	red	pink
Pinsir	127	brown	blue
Tauros	128	brown	green
Magikarp	129	red	yellow
Gyarados	130	blue	red
Lapras	131	blue	purple
Ditto	132	pink	blue
Eevee	133	brown	gray
Vaporeon	134	water	pink
Jolteon	135	yellow	green
Flareon	136	red	orange
Espeon	196	pink	green
Umbreon	197	black	blue
Leafeon	470	yellow	orange
Glaceon	471	blue	blue
Sylveon	700	pink	blue
Porygon	137	blue	pink
Porygon2	233	red	blue
Porygon-Z	474	red	blue
Omanyte	138	blue	pink
Omastar	139	blue	pink
Kabuto	140	brown	green
Kabutops	141	brown	green
Aerodactyl	142	gray	pink
Snorlax	143	blue	blue
Munchlax	446	blue	blue
Articuno	144	blue	blue
Zapdos	145	yellow	yellow
Moltres	146	yellow	pink
Dratini	147	blue	pink
Dragonair	148	blue	pink
Dragonite	149	yellow	green
Mewtwo	150	purple	green
Mew	151	pink	blue
Lickilicky	463	pink	yellow
Jigglypuff	39	pink	blue
\.


--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.region (generation, regionname) FROM stdin;
1	Kanto
2	Johto
3	Hoenn
4	Sinnoh
5	Unova
6	Kalos
7	Alola
8	Galar
\.


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.types (typename) FROM stdin;
Bug
Dark
Dragon
Electric
Fairy
Fighting
Fire
Flying
Ghost
Grass
Ground
Ice
Normal
Poison
Psychic
Rock
Steel
Water
\.


--
-- Name: abilities abilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abilities
    ADD CONSTRAINT abilities_pkey PRIMARY KEY (abilityname);


--
-- Name: evolvesfrom evolvesfrom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evolvesfrom
    ADD CONSTRAINT evolvesfrom_pkey PRIMARY KEY (evolvedid, preevolveid);


--
-- Name: fromregion fromregion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fromregion
    ADD CONSTRAINT fromregion_pkey PRIMARY KEY (pokedexnum);


--
-- Name: has has_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.has
    ADD CONSTRAINT has_pkey PRIMARY KEY (pokedexnum, abilityname);


--
-- Name: pokemon pokemon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemon
    ADD CONSTRAINT pokemon_pkey PRIMARY KEY (pokedexnum);


--
-- Name: region region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (generation);


--
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (typename);


--
-- Name: evolvesfrom evolvesfrom_evolvedid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evolvesfrom
    ADD CONSTRAINT evolvesfrom_evolvedid_fkey FOREIGN KEY (evolvedid) REFERENCES public.pokemon(pokedexnum) ON DELETE CASCADE;


--
-- Name: evolvesfrom evolvesfrom_preevolveid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evolvesfrom
    ADD CONSTRAINT evolvesfrom_preevolveid_fkey FOREIGN KEY (preevolveid) REFERENCES public.pokemon(pokedexnum) ON DELETE CASCADE;


--
-- Name: fromregion fromregion_generation_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fromregion
    ADD CONSTRAINT fromregion_generation_fkey FOREIGN KEY (generation) REFERENCES public.region(generation) ON DELETE CASCADE;


--
-- Name: fromregion fromregion_pokedexnum_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fromregion
    ADD CONSTRAINT fromregion_pokedexnum_fkey FOREIGN KEY (pokedexnum) REFERENCES public.pokemon(pokedexnum) ON DELETE CASCADE;


--
-- Name: has has_abilityname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.has
    ADD CONSTRAINT has_abilityname_fkey FOREIGN KEY (abilityname) REFERENCES public.abilities(abilityname) ON DELETE CASCADE;


--
-- Name: has has_pokedexnum_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.has
    ADD CONSTRAINT has_pokedexnum_fkey FOREIGN KEY (pokedexnum) REFERENCES public.pokemon(pokedexnum) ON DELETE CASCADE;


--
-- Name: of of_pokedexnum_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.of
    ADD CONSTRAINT of_pokedexnum_fkey FOREIGN KEY (pokedexnum) REFERENCES public.pokemon(pokedexnum);


--
-- PostgreSQL database dump complete
--

