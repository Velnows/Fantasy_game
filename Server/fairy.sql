PGDMP                      }            fairy    17.2    17.1 q    R           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            S           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            T           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            U           1262    115113    fairy    DATABASE     y   CREATE DATABASE fairy WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE fairy;
                     postgres    false            �            1259    115114    amulet    TABLE     n   CREATE TABLE public.amulet (
    id smallint NOT NULL,
    name text NOT NULL,
    value smallint NOT NULL
);
    DROP TABLE public.amulet;
       public         heap r       postgres    false            �            1259    115119    amulet_id_seq    SEQUENCE     �   CREATE SEQUENCE public.amulet_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.amulet_id_seq;
       public               postgres    false    217            V           0    0    amulet_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.amulet_id_seq OWNED BY public.amulet.id;
          public               postgres    false    218            �            1259    115120    chapter    TABLE     q   CREATE TABLE public.chapter (
    id smallint NOT NULL,
    name text NOT NULL,
    tail_id smallint NOT NULL
);
    DROP TABLE public.chapter;
       public         heap r       postgres    false            �            1259    115125    chapter_id_seq    SEQUENCE     �   CREATE SEQUENCE public.chapter_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.chapter_id_seq;
       public               postgres    false    219            W           0    0    chapter_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.chapter_id_seq OWNED BY public.chapter.id;
          public               postgres    false    220            �            1259    115126    class    TABLE     o   CREATE TABLE public.class (
    id smallint NOT NULL,
    description text NOT NULL,
    name text NOT NULL
);
    DROP TABLE public.class;
       public         heap r       postgres    false            �            1259    115131    class_id_seq    SEQUENCE     �   CREATE SEQUENCE public.class_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.class_id_seq;
       public               postgres    false    221            X           0    0    class_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.class_id_seq OWNED BY public.class.id;
          public               postgres    false    222            �            1259    115132    player    TABLE     �   CREATE TABLE public.player (
    id smallint NOT NULL,
    name text NOT NULL,
    surname text NOT NULL,
    is_headman boolean DEFAULT false NOT NULL,
    password text NOT NULL,
    squad_id smallint NOT NULL
);
    DROP TABLE public.player;
       public         heap r       postgres    false            �            1259    115138    player_id_seq    SEQUENCE     �   CREATE SEQUENCE public.player_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.player_id_seq;
       public               postgres    false    223            Y           0    0    player_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.player_id_seq OWNED BY public.player.id;
          public               postgres    false    224            �            1259    115139    playerclass    TABLE     �   CREATE TABLE public.playerclass (
    player_id smallint NOT NULL,
    tail_id smallint NOT NULL,
    class_id smallint,
    is_archive boolean DEFAULT false NOT NULL
);
    DROP TABLE public.playerclass;
       public         heap r       postgres    false            �            1259    115143    playerlection    TABLE     �   CREATE TABLE public.playerlection (
    player_id smallint NOT NULL,
    tail_id smallint NOT NULL,
    is_apointed boolean DEFAULT false
);
 !   DROP TABLE public.playerlection;
       public         heap r       postgres    false            �            1259    115147    playerquests    TABLE     �   CREATE TABLE public.playerquests (
    player_id smallint NOT NULL,
    quest_id smallint NOT NULL,
    is_completed boolean DEFAULT false NOT NULL
);
     DROP TABLE public.playerquests;
       public         heap r       postgres    false            �            1259    115151    playersteps    TABLE     �   CREATE TABLE public.playersteps (
    player_id smallint NOT NULL,
    stage_steps_id smallint NOT NULL,
    points smallint
);
    DROP TABLE public.playersteps;
       public         heap r       postgres    false            �            1259    115154    quest    TABLE     �   CREATE TABLE public.quest (
    id smallint NOT NULL,
    name text NOT NULL,
    amulet_id smallint NOT NULL,
    chapter_id smallint
);
    DROP TABLE public.quest;
       public         heap r       postgres    false            �            1259    115159    quest_id_seq    SEQUENCE     �   CREATE SEQUENCE public.quest_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.quest_id_seq;
       public               postgres    false    229            Z           0    0    quest_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.quest_id_seq OWNED BY public.quest.id;
          public               postgres    false    230            �            1259    115160    race    TABLE     m   CREATE TABLE public.race (
    id smallint NOT NULL,
    name text NOT NULL,
    points smallint NOT NULL
);
    DROP TABLE public.race;
       public         heap r       postgres    false            �            1259    115165    race_id_seq    SEQUENCE     �   CREATE SEQUENCE public.race_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.race_id_seq;
       public               postgres    false    231            [           0    0    race_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.race_id_seq OWNED BY public.race.id;
          public               postgres    false    232            �            1259    115166    squad    TABLE     h   CREATE TABLE public.squad (
    id smallint NOT NULL,
    name text NOT NULL,
    code text NOT NULL
);
    DROP TABLE public.squad;
       public         heap r       postgres    false            �            1259    115171    squad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.squad_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.squad_id_seq;
       public               postgres    false    233            \           0    0    squad_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.squad_id_seq OWNED BY public.squad.id;
          public               postgres    false    234            �            1259    115172    stage    TABLE     r   CREATE TABLE public.stage (
    id smallint NOT NULL,
    name text NOT NULL,
    chapter_id smallint NOT NULL
);
    DROP TABLE public.stage;
       public         heap r       postgres    false            �            1259    115177    stage_id_seq    SEQUENCE     �   CREATE SEQUENCE public.stage_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.stage_id_seq;
       public               postgres    false    235            ]           0    0    stage_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.stage_id_seq OWNED BY public.stage.id;
          public               postgres    false    236            �            1259    115178 
   stagesteps    TABLE     	  CREATE TABLE public.stagesteps (
    id smallint NOT NULL,
    stage_id smallint NOT NULL,
    step_id smallint NOT NULL,
    time_begin time without time zone DEFAULT CURRENT_TIME,
    time_end time without time zone,
    lection_date date DEFAULT CURRENT_DATE
);
    DROP TABLE public.stagesteps;
       public         heap r       postgres    false            �            1259    115183    stagesteps_id_seq    SEQUENCE     �   CREATE SEQUENCE public.stagesteps_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.stagesteps_id_seq;
       public               postgres    false    237            ^           0    0    stagesteps_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.stagesteps_id_seq OWNED BY public.stagesteps.id;
          public               postgres    false    238            �            1259    115184    step    TABLE     O   CREATE TABLE public.step (
    id smallint NOT NULL,
    type text NOT NULL
);
    DROP TABLE public.step;
       public         heap r       postgres    false            �            1259    115189    step_id_seq    SEQUENCE     �   CREATE SEQUENCE public.step_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.step_id_seq;
       public               postgres    false    239            _           0    0    step_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.step_id_seq OWNED BY public.step.id;
          public               postgres    false    240            �            1259    115190    tail    TABLE     q   CREATE TABLE public.tail (
    id smallint NOT NULL,
    name text NOT NULL,
    teacher_id smallint NOT NULL
);
    DROP TABLE public.tail;
       public         heap r       postgres    false            �            1259    115195    tail_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tail_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.tail_id_seq;
       public               postgres    false    241            `           0    0    tail_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.tail_id_seq OWNED BY public.tail.id;
          public               postgres    false    242            �            1259    115196    teacher    TABLE     �   CREATE TABLE public.teacher (
    id smallint NOT NULL,
    name text NOT NULL,
    surname text NOT NULL,
    password text NOT NULL
);
    DROP TABLE public.teacher;
       public         heap r       postgres    false            �            1259    115201    teacher_id_seq    SEQUENCE     �   CREATE SEQUENCE public.teacher_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.teacher_id_seq;
       public               postgres    false    243            a           0    0    teacher_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.teacher_id_seq OWNED BY public.teacher.id;
          public               postgres    false    244            h           2604    115202 	   amulet id    DEFAULT     f   ALTER TABLE ONLY public.amulet ALTER COLUMN id SET DEFAULT nextval('public.amulet_id_seq'::regclass);
 8   ALTER TABLE public.amulet ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    218    217            i           2604    115203 
   chapter id    DEFAULT     h   ALTER TABLE ONLY public.chapter ALTER COLUMN id SET DEFAULT nextval('public.chapter_id_seq'::regclass);
 9   ALTER TABLE public.chapter ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    219            j           2604    115204    class id    DEFAULT     d   ALTER TABLE ONLY public.class ALTER COLUMN id SET DEFAULT nextval('public.class_id_seq'::regclass);
 7   ALTER TABLE public.class ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    222    221            k           2604    115205 	   player id    DEFAULT     f   ALTER TABLE ONLY public.player ALTER COLUMN id SET DEFAULT nextval('public.player_id_seq'::regclass);
 8   ALTER TABLE public.player ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    224    223            p           2604    115206    quest id    DEFAULT     d   ALTER TABLE ONLY public.quest ALTER COLUMN id SET DEFAULT nextval('public.quest_id_seq'::regclass);
 7   ALTER TABLE public.quest ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    230    229            q           2604    115207    race id    DEFAULT     b   ALTER TABLE ONLY public.race ALTER COLUMN id SET DEFAULT nextval('public.race_id_seq'::regclass);
 6   ALTER TABLE public.race ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    232    231            r           2604    115208    squad id    DEFAULT     d   ALTER TABLE ONLY public.squad ALTER COLUMN id SET DEFAULT nextval('public.squad_id_seq'::regclass);
 7   ALTER TABLE public.squad ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    234    233            s           2604    115209    stage id    DEFAULT     d   ALTER TABLE ONLY public.stage ALTER COLUMN id SET DEFAULT nextval('public.stage_id_seq'::regclass);
 7   ALTER TABLE public.stage ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    236    235            t           2604    115210    stagesteps id    DEFAULT     n   ALTER TABLE ONLY public.stagesteps ALTER COLUMN id SET DEFAULT nextval('public.stagesteps_id_seq'::regclass);
 <   ALTER TABLE public.stagesteps ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    238    237            w           2604    115211    step id    DEFAULT     b   ALTER TABLE ONLY public.step ALTER COLUMN id SET DEFAULT nextval('public.step_id_seq'::regclass);
 6   ALTER TABLE public.step ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    240    239            x           2604    115212    tail id    DEFAULT     b   ALTER TABLE ONLY public.tail ALTER COLUMN id SET DEFAULT nextval('public.tail_id_seq'::regclass);
 6   ALTER TABLE public.tail ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    242    241            y           2604    115213 
   teacher id    DEFAULT     h   ALTER TABLE ONLY public.teacher ALTER COLUMN id SET DEFAULT nextval('public.teacher_id_seq'::regclass);
 9   ALTER TABLE public.teacher ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    244    243            4          0    115114    amulet 
   TABLE DATA           1   COPY public.amulet (id, name, value) FROM stdin;
    public               postgres    false    217   �~       6          0    115120    chapter 
   TABLE DATA           4   COPY public.chapter (id, name, tail_id) FROM stdin;
    public               postgres    false    219   �~       8          0    115126    class 
   TABLE DATA           6   COPY public.class (id, description, name) FROM stdin;
    public               postgres    false    221   �       :          0    115132    player 
   TABLE DATA           S   COPY public.player (id, name, surname, is_headman, password, squad_id) FROM stdin;
    public               postgres    false    223   �       <          0    115139    playerclass 
   TABLE DATA           O   COPY public.playerclass (player_id, tail_id, class_id, is_archive) FROM stdin;
    public               postgres    false    225   ��       =          0    115143    playerlection 
   TABLE DATA           H   COPY public.playerlection (player_id, tail_id, is_apointed) FROM stdin;
    public               postgres    false    226   l�       >          0    115147    playerquests 
   TABLE DATA           I   COPY public.playerquests (player_id, quest_id, is_completed) FROM stdin;
    public               postgres    false    227   ��       ?          0    115151    playersteps 
   TABLE DATA           H   COPY public.playersteps (player_id, stage_steps_id, points) FROM stdin;
    public               postgres    false    228   ��       @          0    115154    quest 
   TABLE DATA           @   COPY public.quest (id, name, amulet_id, chapter_id) FROM stdin;
    public               postgres    false    229    �       B          0    115160    race 
   TABLE DATA           0   COPY public.race (id, name, points) FROM stdin;
    public               postgres    false    231   �       D          0    115166    squad 
   TABLE DATA           /   COPY public.squad (id, name, code) FROM stdin;
    public               postgres    false    233   �       F          0    115172    stage 
   TABLE DATA           5   COPY public.stage (id, name, chapter_id) FROM stdin;
    public               postgres    false    235   W�       H          0    115178 
   stagesteps 
   TABLE DATA           _   COPY public.stagesteps (id, stage_id, step_id, time_begin, time_end, lection_date) FROM stdin;
    public               postgres    false    237   ą       J          0    115184    step 
   TABLE DATA           (   COPY public.step (id, type) FROM stdin;
    public               postgres    false    239   ;�       L          0    115190    tail 
   TABLE DATA           4   COPY public.tail (id, name, teacher_id) FROM stdin;
    public               postgres    false    241   ��       N          0    115196    teacher 
   TABLE DATA           >   COPY public.teacher (id, name, surname, password) FROM stdin;
    public               postgres    false    243   �       b           0    0    amulet_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.amulet_id_seq', 3, true);
          public               postgres    false    218            c           0    0    chapter_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.chapter_id_seq', 8, true);
          public               postgres    false    220            d           0    0    class_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.class_id_seq', 4, true);
          public               postgres    false    222            e           0    0    player_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.player_id_seq', 8, true);
          public               postgres    false    224            f           0    0    quest_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.quest_id_seq', 1, false);
          public               postgres    false    230            g           0    0    race_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.race_id_seq', 15, true);
          public               postgres    false    232            h           0    0    squad_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.squad_id_seq', 4, true);
          public               postgres    false    234            i           0    0    stage_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.stage_id_seq', 16, true);
          public               postgres    false    236            j           0    0    stagesteps_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.stagesteps_id_seq', 15, true);
          public               postgres    false    238            k           0    0    step_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.step_id_seq', 3, true);
          public               postgres    false    240            l           0    0    tail_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.tail_id_seq', 4, true);
          public               postgres    false    242            m           0    0    teacher_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.teacher_id_seq', 4, true);
          public               postgres    false    244            {           2606    115215    amulet amulet_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.amulet
    ADD CONSTRAINT amulet_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.amulet DROP CONSTRAINT amulet_pkey;
       public                 postgres    false    217            }           2606    115217    chapter chapter_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.chapter
    ADD CONSTRAINT chapter_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.chapter DROP CONSTRAINT chapter_pkey;
       public                 postgres    false    219                       2606    115219    class class_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.class DROP CONSTRAINT class_pkey;
       public                 postgres    false    221            �           2606    115221    player player_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.player DROP CONSTRAINT player_pkey;
       public                 postgres    false    223            �           2606    115223    quest quest_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.quest
    ADD CONSTRAINT quest_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.quest DROP CONSTRAINT quest_pkey;
       public                 postgres    false    229            �           2606    115225    race race_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.race
    ADD CONSTRAINT race_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.race DROP CONSTRAINT race_pkey;
       public                 postgres    false    231            �           2606    115227    squad squad_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.squad
    ADD CONSTRAINT squad_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.squad DROP CONSTRAINT squad_pkey;
       public                 postgres    false    233            �           2606    115229    stage stage_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.stage
    ADD CONSTRAINT stage_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.stage DROP CONSTRAINT stage_pkey;
       public                 postgres    false    235            �           2606    115231    stagesteps stagesteps_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.stagesteps
    ADD CONSTRAINT stagesteps_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.stagesteps DROP CONSTRAINT stagesteps_pkey;
       public                 postgres    false    237            �           2606    115233    step step_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.step
    ADD CONSTRAINT step_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.step DROP CONSTRAINT step_pkey;
       public                 postgres    false    239            �           2606    115235    tail tail_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.tail
    ADD CONSTRAINT tail_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.tail DROP CONSTRAINT tail_pkey;
       public                 postgres    false    241            �           2606    115237    teacher teacher_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT teacher_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.teacher DROP CONSTRAINT teacher_pkey;
       public                 postgres    false    243            �           2606    115238    chapter chapter_tail_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.chapter
    ADD CONSTRAINT chapter_tail_id_fkey FOREIGN KEY (tail_id) REFERENCES public.tail(id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.chapter DROP CONSTRAINT chapter_tail_id_fkey;
       public               postgres    false    219    4751    241            �           2606    115243    player player_squad_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_squad_id_fkey FOREIGN KEY (squad_id) REFERENCES public.squad(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.player DROP CONSTRAINT player_squad_id_fkey;
       public               postgres    false    223    4743    233            �           2606    115248 %   playerclass playerclass_class_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.playerclass
    ADD CONSTRAINT playerclass_class_id_fkey FOREIGN KEY (class_id) REFERENCES public.class(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.playerclass DROP CONSTRAINT playerclass_class_id_fkey;
       public               postgres    false    225    4735    221            �           2606    115253 &   playerclass playerclass_player_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.playerclass
    ADD CONSTRAINT playerclass_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.player(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.playerclass DROP CONSTRAINT playerclass_player_id_fkey;
       public               postgres    false    4737    225    223            �           2606    115258 $   playerclass playerclass_tail_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.playerclass
    ADD CONSTRAINT playerclass_tail_id_fkey FOREIGN KEY (tail_id) REFERENCES public.tail(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.playerclass DROP CONSTRAINT playerclass_tail_id_fkey;
       public               postgres    false    225    4751    241            �           2606    115263 *   playerlection playerlection_player_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.playerlection
    ADD CONSTRAINT playerlection_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.player(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.playerlection DROP CONSTRAINT playerlection_player_id_fkey;
       public               postgres    false    223    226    4737            �           2606    115268 (   playerlection playerlection_tail_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.playerlection
    ADD CONSTRAINT playerlection_tail_id_fkey FOREIGN KEY (tail_id) REFERENCES public.tail(id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.playerlection DROP CONSTRAINT playerlection_tail_id_fkey;
       public               postgres    false    241    4751    226            �           2606    115273 (   playerquests playerquests_player_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.playerquests
    ADD CONSTRAINT playerquests_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.player(id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.playerquests DROP CONSTRAINT playerquests_player_id_fkey;
       public               postgres    false    223    4737    227            �           2606    115278 '   playerquests playerquests_quest_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.playerquests
    ADD CONSTRAINT playerquests_quest_id_fkey FOREIGN KEY (quest_id) REFERENCES public.quest(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.playerquests DROP CONSTRAINT playerquests_quest_id_fkey;
       public               postgres    false    229    4739    227            �           2606    115283 &   playersteps playersteps_player_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.playersteps
    ADD CONSTRAINT playersteps_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.player(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.playersteps DROP CONSTRAINT playersteps_player_id_fkey;
       public               postgres    false    223    4737    228            �           2606    115288 +   playersteps playersteps_stage_steps_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.playersteps
    ADD CONSTRAINT playersteps_stage_steps_id_fkey FOREIGN KEY (stage_steps_id) REFERENCES public.stagesteps(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.playersteps DROP CONSTRAINT playersteps_stage_steps_id_fkey;
       public               postgres    false    228    237    4747            �           2606    115293    quest quest_amulet_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.quest
    ADD CONSTRAINT quest_amulet_id_fkey FOREIGN KEY (amulet_id) REFERENCES public.amulet(id) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.quest DROP CONSTRAINT quest_amulet_id_fkey;
       public               postgres    false    217    229    4731            �           2606    115298    quest quest_chapter_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.quest
    ADD CONSTRAINT quest_chapter_id_fkey FOREIGN KEY (chapter_id) REFERENCES public.chapter(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.quest DROP CONSTRAINT quest_chapter_id_fkey;
       public               postgres    false    229    219    4733            �           2606    115303    stage stage_chapter_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stage
    ADD CONSTRAINT stage_chapter_id_fkey FOREIGN KEY (chapter_id) REFERENCES public.chapter(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.stage DROP CONSTRAINT stage_chapter_id_fkey;
       public               postgres    false    4733    219    235            �           2606    115308 #   stagesteps stagesteps_stage_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stagesteps
    ADD CONSTRAINT stagesteps_stage_id_fkey FOREIGN KEY (stage_id) REFERENCES public.stage(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.stagesteps DROP CONSTRAINT stagesteps_stage_id_fkey;
       public               postgres    false    237    235    4745            �           2606    115313 "   stagesteps stagesteps_step_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stagesteps
    ADD CONSTRAINT stagesteps_step_id_fkey FOREIGN KEY (step_id) REFERENCES public.step(id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.stagesteps DROP CONSTRAINT stagesteps_step_id_fkey;
       public               postgres    false    239    4749    237            �           2606    115318    tail tail_teacher_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tail
    ADD CONSTRAINT tail_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teacher(id) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.tail DROP CONSTRAINT tail_teacher_id_fkey;
       public               postgres    false    4753    241    243            4   C   x�3�0��/v_ة d��|a����8��8/L@0�2�0��V wǅ]@����+F��� �.�      6   �   x�=M�
�P����^�������Ru���$�$����r�/����$$9�9'�d�^I��,Ӕ�<���j���\K�_S���[g*{DF� �ΎCEG}$�Й��ec��"1����+^��<Cd�ڀ7�'�.7�����NT���k�      8   �  x��S]N�@~�b�1$�1��@�	D���b�ޠ�J�+���ofK�| 6�3��,��?�s#���q)1�����Jb.q����hB����x�q!�soi�k��0&���q*�<&��h-s����[ݝ� QD���ȃ�F���5ES�ڌо~0��;!�*���qmz�p��D�K���R�G��+2J�C5H%u�}ip�q��9M�+��,�b���!M� �㝞�t��d��d�,���N�ٕjӃ��ё���Y�?]@�G�F��ؿ�d���B��MH�b��|�"���4��qP�	鱗�=���i��=�~�f=�Yl%�E���/8�.xE	��B��֔u�!E�����M^��Կ�Ѵ�;�~��q      :   �   x�M�KN�@D�5�A��wa�� I6l���BN�8��Ĳs��������ݙ��փ���<����%⚷�JY^��B.����� �=�޸�ţ*�� ��]��=�Gh(�c%���P�M�4ާ��m'�� ��o�Q�MZ��z:�`PKa.�/�4~G�3��B~g��/���U��? n`qd���!�p��      <   a   x�-��	�0DѳUL���brv�H�3���rd�U��ʭ�ʕ5�:ҫ��u��j��x�+^�7���x�;��|����'>������#"f&      =      x������ � �      >      x������ � �      ?   J  x�%��m�0D�5UL�!��%�ב;��+?�
��"#�Ŝ=WL��<��7��e�7��|Z��5�ja��a&*�?��$�dnDҟ���w��f���ҷ�oJ��A��,Pѿ�)�b@����]�};���-����YQ\�b/ ~f�?̍������]�}3�v��[�7����������w��,��y ��󏻖�f���ҷ�oJ~?j�ȮA;�>�+�:b�_���wm�����7�o��T�BNx��u���]b(B�n<=�����]�}3������fS�a��^ �D÷�|� ���w]�ͤvʆ���M�/��g��`�      @      x������ � �      B   �   x�-�MJA�ׯN�����.f��A��Pt��A��8�^����ix]���|��o��=����*�y�n#�#���
�6��ӟ����|d�NGyV��ݦ��Z�J[L�f����kL���{ٚ+��૚<�}�_�@(�s��jh����
���&M6�;�*����l�yW�r�^ ��T�S������MH�F�
!��ƶ(	a`���鉙�-
��      D   6   x�5ȱ  �:�����`����H��e�뻨��Z�Y�P#e)��|��-      F   ]   x�U�K�@��
z�����XX17z��w)�y���0��yfUCQ5TՌ���U�j��Z�Mٛ�c�ᬃa�;�0�+��rmR      H   g   x��ϱ�0D�v�gcϒ��nS�������k�'p���-�h�f����C�Vg���(HV�mr4��l�l�)JV�$ؿ�e�e�s}H��)I�����U��ut      J   C   x�3�0����.�]�q��ˈ����6 �.츰��.c��6^�� 
��@V?W� P:'J      L   D   x�3�0��"NC.#��.,���ӈ˘�.6]�za��qaׅ��\&�� 9ۡ&\1z\\\ �8!�      N   }   x�m���@��b,ǯ���b$:@|$8���#?.&�7��D��+����b�`�'F{L��,��R�5π��+�R3A�/6��`����T���Zݹ��3{L/|�9ĖT�:��MU��,_A     