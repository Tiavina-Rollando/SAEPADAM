toc.dat                                                                                             0000600 0004000 0002000 00000161700 14721674436 0014462 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       
    7            
    |            dsv-agrement-database    15.3    15.3 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �           1262    16895    dsv-agrement-database    DATABASE     �   CREATE DATABASE "dsv-agrement-database" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_Madagascar.1252';
 '   DROP DATABASE "dsv-agrement-database";
                postgres    false         �            1259    17246    agrement_demande    TABLE     �   CREATE TABLE public.agrement_demande (
    id bigint NOT NULL,
    demande_agrement_id bigint NOT NULL,
    agrement_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 $   DROP TABLE public.agrement_demande;
       public         heap    postgres    false         �            1259    17245    agrement_demande_id_seq    SEQUENCE     �   CREATE SEQUENCE public.agrement_demande_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.agrement_demande_id_seq;
       public          postgres    false    251         �           0    0    agrement_demande_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.agrement_demande_id_seq OWNED BY public.agrement_demande.id;
          public          postgres    false    250         �            1259    17002 	   agrements    TABLE     �  CREATE TABLE public.agrements (
    id bigint NOT NULL,
    numero character varying(255) NOT NULL,
    type_agrement_id smallint NOT NULL,
    date_debut date NOT NULL,
    date_fin date,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    status boolean DEFAULT true,
    etat character varying(255)
);
    DROP TABLE public.agrements;
       public         heap    postgres    false         �            1259    17001    agrements_id_seq    SEQUENCE     y   CREATE SEQUENCE public.agrements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.agrements_id_seq;
       public          postgres    false    236         �           0    0    agrements_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.agrements_id_seq OWNED BY public.agrements.id;
          public          postgres    false    235         �            1259    17048    demande_agrements    TABLE     7  CREATE TABLE public.demande_agrements (
    id bigint NOT NULL,
    etablissement_id bigint NOT NULL,
    type_agrement_id bigint NOT NULL,
    status bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);
 %   DROP TABLE public.demande_agrements;
       public         heap    postgres    false         �            1259    17047    demande_agrements_id_seq    SEQUENCE     �   CREATE SEQUENCE public.demande_agrements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.demande_agrements_id_seq;
       public          postgres    false    242         �           0    0    demande_agrements_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.demande_agrements_id_seq OWNED BY public.demande_agrements.id;
          public          postgres    false    241         �            1259    17031    etablissement_agrement    TABLE     �   CREATE TABLE public.etablissement_agrement (
    id bigint NOT NULL,
    etablissement_id bigint NOT NULL,
    agrement_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 *   DROP TABLE public.etablissement_agrement;
       public         heap    postgres    false         �            1259    17030    etablissement_agrement_id_seq    SEQUENCE     �   CREATE SEQUENCE public.etablissement_agrement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.etablissement_agrement_id_seq;
       public          postgres    false    240         �           0    0    etablissement_agrement_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.etablissement_agrement_id_seq OWNED BY public.etablissement_agrement.id;
          public          postgres    false    239         �            1259    17014    etablissement_user    TABLE     �   CREATE TABLE public.etablissement_user (
    id bigint NOT NULL,
    etablissement_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 &   DROP TABLE public.etablissement_user;
       public         heap    postgres    false         �            1259    17013    etablissement_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.etablissement_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.etablissement_user_id_seq;
       public          postgres    false    238         �           0    0    etablissement_user_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.etablissement_user_id_seq OWNED BY public.etablissement_user.id;
          public          postgres    false    237         �            1259    16988    etablissements    TABLE     ~  CREATE TABLE public.etablissements (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    filiere_id bigint NOT NULL,
    type_activite_id bigint NOT NULL,
    type_etablissement character varying(255),
    adresse character varying(255) NOT NULL,
    type_produit character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    region character varying(255),
    district character varying(255),
    commune character varying(255) DEFAULT NULL::character varying,
    veterinaire character varying(255),
    deleted_at timestamp(0) without time zone
);
 "   DROP TABLE public.etablissements;
       public         heap    postgres    false         �            1259    16987    etablissements_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.etablissements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.etablissements_id_seq;
       public          postgres    false    234         �           0    0    etablissements_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.etablissements_id_seq OWNED BY public.etablissements.id;
          public          postgres    false    233         �            1259    16922    failed_jobs    TABLE     &  CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.failed_jobs;
       public         heap    postgres    false         �            1259    16921    failed_jobs_id_seq    SEQUENCE     {   CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.failed_jobs_id_seq;
       public          postgres    false    220         �           0    0    failed_jobs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;
          public          postgres    false    219         �            1259    16960    filieres    TABLE     �   CREATE TABLE public.filieres (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.filieres;
       public         heap    postgres    false         �            1259    16959    filieres_id_seq    SEQUENCE     x   CREATE SEQUENCE public.filieres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.filieres_id_seq;
       public          postgres    false    226                     0    0    filieres_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.filieres_id_seq OWNED BY public.filieres.id;
          public          postgres    false    225         �            1259    16897 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    postgres    false         �            1259    16896    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          postgres    false    215                    0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          postgres    false    214         �            1259    17097    model_has_permissions    TABLE     �   CREATE TABLE public.model_has_permissions (
    permission_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);
 )   DROP TABLE public.model_has_permissions;
       public         heap    postgres    false         �            1259    17108    model_has_roles    TABLE     �   CREATE TABLE public.model_has_roles (
    role_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);
 #   DROP TABLE public.model_has_roles;
       public         heap    postgres    false         �            1259    17340    notifications    TABLE     .  CREATE TABLE public.notifications (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    message text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    status boolean DEFAULT false NOT NULL
);
 !   DROP TABLE public.notifications;
       public         heap    postgres    false         �            1259    17339    notifications_id_seq    SEQUENCE     }   CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.notifications_id_seq;
       public          postgres    false    253                    0    0    notifications_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;
          public          postgres    false    252         �            1259    16914    password_reset_tokens    TABLE     �   CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);
 )   DROP TABLE public.password_reset_tokens;
       public         heap    postgres    false         �            1259    17076    permissions    TABLE     �   CREATE TABLE public.permissions (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.permissions;
       public         heap    postgres    false         �            1259    17075    permissions_id_seq    SEQUENCE     {   CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.permissions_id_seq;
       public          postgres    false    244                    0    0    permissions_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;
          public          postgres    false    243         �            1259    16934    personal_access_tokens    TABLE     �  CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 *   DROP TABLE public.personal_access_tokens;
       public         heap    postgres    false         �            1259    16933    personal_access_tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.personal_access_tokens_id_seq;
       public          postgres    false    222                    0    0    personal_access_tokens_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;
          public          postgres    false    221                    1259    17428    remarks    TABLE       CREATE TABLE public.remarks (
    id bigint NOT NULL,
    agrement_id bigint NOT NULL,
    description character varying(255) NOT NULL,
    etat boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.remarks;
       public         heap    postgres    false                     1259    17427    remarks_id_seq    SEQUENCE     w   CREATE SEQUENCE public.remarks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.remarks_id_seq;
       public          postgres    false    257                    0    0    remarks_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.remarks_id_seq OWNED BY public.remarks.id;
          public          postgres    false    256         �            1259    17119    role_has_permissions    TABLE     m   CREATE TABLE public.role_has_permissions (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);
 (   DROP TABLE public.role_has_permissions;
       public         heap    postgres    false         �            1259    17087    roles    TABLE     �   CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.roles;
       public         heap    postgres    false         �            1259    17086    roles_id_seq    SEQUENCE     u   CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    246                    0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          postgres    false    245         �            1259    16981    status_demande_agrements    TABLE     �   CREATE TABLE public.status_demande_agrements (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 ,   DROP TABLE public.status_demande_agrements;
       public         heap    postgres    false         �            1259    16980    status_demande_agrements_id_seq    SEQUENCE     �   CREATE SEQUENCE public.status_demande_agrements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.status_demande_agrements_id_seq;
       public          postgres    false    232                    0    0    status_demande_agrements_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.status_demande_agrements_id_seq OWNED BY public.status_demande_agrements.id;
          public          postgres    false    231         �            1259    16967    type_activites    TABLE     �   CREATE TABLE public.type_activites (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 "   DROP TABLE public.type_activites;
       public         heap    postgres    false         �            1259    16966    type_activites_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.type_activites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.type_activites_id_seq;
       public          postgres    false    228                    0    0    type_activites_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.type_activites_id_seq OWNED BY public.type_activites.id;
          public          postgres    false    227         �            1259    16974    type_agrements    TABLE     �   CREATE TABLE public.type_agrements (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 "   DROP TABLE public.type_agrements;
       public         heap    postgres    false         �            1259    16973    type_agrements_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.type_agrements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.type_agrements_id_seq;
       public          postgres    false    230         	           0    0    type_agrements_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.type_agrements_id_seq OWNED BY public.type_agrements.id;
          public          postgres    false    229         �            1259    16946    user_information    TABLE     8  CREATE TABLE public.user_information (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    tel character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    matricule character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 $   DROP TABLE public.user_information;
       public         heap    postgres    false         �            1259    16945    user_information_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_information_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.user_information_id_seq;
       public          postgres    false    224         
           0    0    user_information_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.user_information_id_seq OWNED BY public.user_information.id;
          public          postgres    false    223         �            1259    16904    users    TABLE     x  CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.users;
       public         heap    postgres    false         �            1259    16903    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    217                    0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    216         �            1259    17377    websockets_statistics_entries    TABLE     [  CREATE TABLE public.websockets_statistics_entries (
    id integer NOT NULL,
    app_id character varying(255) NOT NULL,
    peak_connection_count integer NOT NULL,
    websocket_message_count integer NOT NULL,
    api_message_count integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 1   DROP TABLE public.websockets_statistics_entries;
       public         heap    postgres    false         �            1259    17376 $   websockets_statistics_entries_id_seq    SEQUENCE     �   CREATE SEQUENCE public.websockets_statistics_entries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.websockets_statistics_entries_id_seq;
       public          postgres    false    255                    0    0 $   websockets_statistics_entries_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.websockets_statistics_entries_id_seq OWNED BY public.websockets_statistics_entries.id;
          public          postgres    false    254         �           2604    17249    agrement_demande id    DEFAULT     z   ALTER TABLE ONLY public.agrement_demande ALTER COLUMN id SET DEFAULT nextval('public.agrement_demande_id_seq'::regclass);
 B   ALTER TABLE public.agrement_demande ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    251    250    251         �           2604    17005    agrements id    DEFAULT     l   ALTER TABLE ONLY public.agrements ALTER COLUMN id SET DEFAULT nextval('public.agrements_id_seq'::regclass);
 ;   ALTER TABLE public.agrements ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    236    236         �           2604    17051    demande_agrements id    DEFAULT     |   ALTER TABLE ONLY public.demande_agrements ALTER COLUMN id SET DEFAULT nextval('public.demande_agrements_id_seq'::regclass);
 C   ALTER TABLE public.demande_agrements ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    242    242         �           2604    17034    etablissement_agrement id    DEFAULT     �   ALTER TABLE ONLY public.etablissement_agrement ALTER COLUMN id SET DEFAULT nextval('public.etablissement_agrement_id_seq'::regclass);
 H   ALTER TABLE public.etablissement_agrement ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    240    240         �           2604    17017    etablissement_user id    DEFAULT     ~   ALTER TABLE ONLY public.etablissement_user ALTER COLUMN id SET DEFAULT nextval('public.etablissement_user_id_seq'::regclass);
 D   ALTER TABLE public.etablissement_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    238    238         �           2604    16991    etablissements id    DEFAULT     v   ALTER TABLE ONLY public.etablissements ALTER COLUMN id SET DEFAULT nextval('public.etablissements_id_seq'::regclass);
 @   ALTER TABLE public.etablissements ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    233    234         �           2604    16925    failed_jobs id    DEFAULT     p   ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);
 =   ALTER TABLE public.failed_jobs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220         �           2604    16963    filieres id    DEFAULT     j   ALTER TABLE ONLY public.filieres ALTER COLUMN id SET DEFAULT nextval('public.filieres_id_seq'::regclass);
 :   ALTER TABLE public.filieres ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    226    226         �           2604    16900    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215         �           2604    17343    notifications id    DEFAULT     t   ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);
 ?   ALTER TABLE public.notifications ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    252    253    253         �           2604    17079    permissions id    DEFAULT     p   ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);
 =   ALTER TABLE public.permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    244    244         �           2604    16937    personal_access_tokens id    DEFAULT     �   ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);
 H   ALTER TABLE public.personal_access_tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222         �           2604    17431 
   remarks id    DEFAULT     h   ALTER TABLE ONLY public.remarks ALTER COLUMN id SET DEFAULT nextval('public.remarks_id_seq'::regclass);
 9   ALTER TABLE public.remarks ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    256    257    257         �           2604    17090    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    245    246         �           2604    16984    status_demande_agrements id    DEFAULT     �   ALTER TABLE ONLY public.status_demande_agrements ALTER COLUMN id SET DEFAULT nextval('public.status_demande_agrements_id_seq'::regclass);
 J   ALTER TABLE public.status_demande_agrements ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    232    232         �           2604    16970    type_activites id    DEFAULT     v   ALTER TABLE ONLY public.type_activites ALTER COLUMN id SET DEFAULT nextval('public.type_activites_id_seq'::regclass);
 @   ALTER TABLE public.type_activites ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228         �           2604    16977    type_agrements id    DEFAULT     v   ALTER TABLE ONLY public.type_agrements ALTER COLUMN id SET DEFAULT nextval('public.type_agrements_id_seq'::regclass);
 @   ALTER TABLE public.type_agrements ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    230    230         �           2604    16949    user_information id    DEFAULT     z   ALTER TABLE ONLY public.user_information ALTER COLUMN id SET DEFAULT nextval('public.user_information_id_seq'::regclass);
 B   ALTER TABLE public.user_information ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224         �           2604    16907    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217         �           2604    17380     websockets_statistics_entries id    DEFAULT     �   ALTER TABLE ONLY public.websockets_statistics_entries ALTER COLUMN id SET DEFAULT nextval('public.websockets_statistics_entries_id_seq'::regclass);
 O   ALTER TABLE public.websockets_statistics_entries ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    255    254    255         �          0    17246    agrement_demande 
   TABLE DATA           h   COPY public.agrement_demande (id, demande_agrement_id, agrement_id, created_at, updated_at) FROM stdin;
    public          postgres    false    251       3564.dat �          0    17002 	   agrements 
   TABLE DATA           �   COPY public.agrements (id, numero, type_agrement_id, date_debut, date_fin, created_at, updated_at, deleted_at, status, etat) FROM stdin;
    public          postgres    false    236       3549.dat �          0    17048    demande_agrements 
   TABLE DATA              COPY public.demande_agrements (id, etablissement_id, type_agrement_id, status, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    242       3555.dat �          0    17031    etablissement_agrement 
   TABLE DATA           k   COPY public.etablissement_agrement (id, etablissement_id, agrement_id, created_at, updated_at) FROM stdin;
    public          postgres    false    240       3553.dat �          0    17014    etablissement_user 
   TABLE DATA           c   COPY public.etablissement_user (id, etablissement_id, user_id, created_at, updated_at) FROM stdin;
    public          postgres    false    238       3551.dat �          0    16988    etablissements 
   TABLE DATA           �   COPY public.etablissements (id, name, filiere_id, type_activite_id, type_etablissement, adresse, type_produit, created_at, updated_at, region, district, commune, veterinaire, deleted_at) FROM stdin;
    public          postgres    false    234       3547.dat �          0    16922    failed_jobs 
   TABLE DATA           a   COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
    public          postgres    false    220       3533.dat �          0    16960    filieres 
   TABLE DATA           D   COPY public.filieres (id, name, created_at, updated_at) FROM stdin;
    public          postgres    false    226       3539.dat �          0    16897 
   migrations 
   TABLE DATA           :   COPY public.migrations (id, migration, batch) FROM stdin;
    public          postgres    false    215       3528.dat �          0    17097    model_has_permissions 
   TABLE DATA           T   COPY public.model_has_permissions (permission_id, model_type, model_id) FROM stdin;
    public          postgres    false    247       3560.dat �          0    17108    model_has_roles 
   TABLE DATA           H   COPY public.model_has_roles (role_id, model_type, model_id) FROM stdin;
    public          postgres    false    248       3561.dat �          0    17340    notifications 
   TABLE DATA           i   COPY public.notifications (id, user_id, message, created_at, updated_at, deleted_at, status) FROM stdin;
    public          postgres    false    253       3566.dat �          0    16914    password_reset_tokens 
   TABLE DATA           I   COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
    public          postgres    false    218       3531.dat �          0    17076    permissions 
   TABLE DATA           S   COPY public.permissions (id, name, guard_name, created_at, updated_at) FROM stdin;
    public          postgres    false    244       3557.dat �          0    16934    personal_access_tokens 
   TABLE DATA           �   COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
    public          postgres    false    222       3535.dat �          0    17428    remarks 
   TABLE DATA           ]   COPY public.remarks (id, agrement_id, description, etat, created_at, updated_at) FROM stdin;
    public          postgres    false    257       3570.dat �          0    17119    role_has_permissions 
   TABLE DATA           F   COPY public.role_has_permissions (permission_id, role_id) FROM stdin;
    public          postgres    false    249       3562.dat �          0    17087    roles 
   TABLE DATA           M   COPY public.roles (id, name, guard_name, created_at, updated_at) FROM stdin;
    public          postgres    false    246       3559.dat �          0    16981    status_demande_agrements 
   TABLE DATA           T   COPY public.status_demande_agrements (id, name, created_at, updated_at) FROM stdin;
    public          postgres    false    232       3545.dat �          0    16967    type_activites 
   TABLE DATA           J   COPY public.type_activites (id, name, created_at, updated_at) FROM stdin;
    public          postgres    false    228       3541.dat �          0    16974    type_agrements 
   TABLE DATA           J   COPY public.type_agrements (id, name, created_at, updated_at) FROM stdin;
    public          postgres    false    230       3543.dat �          0    16946    user_information 
   TABLE DATA           h   COPY public.user_information (id, user_id, tel, address, matricule, created_at, updated_at) FROM stdin;
    public          postgres    false    224       3537.dat �          0    16904    users 
   TABLE DATA           u   COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
    public          postgres    false    217       3530.dat �          0    17377    websockets_statistics_entries 
   TABLE DATA           �   COPY public.websockets_statistics_entries (id, app_id, peak_connection_count, websocket_message_count, api_message_count, created_at, updated_at) FROM stdin;
    public          postgres    false    255       3568.dat            0    0    agrement_demande_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.agrement_demande_id_seq', 24, true);
          public          postgres    false    250                    0    0    agrements_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.agrements_id_seq', 190, true);
          public          postgres    false    235                    0    0    demande_agrements_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.demande_agrements_id_seq', 41, true);
          public          postgres    false    241                    0    0    etablissement_agrement_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.etablissement_agrement_id_seq', 154, true);
          public          postgres    false    239                    0    0    etablissement_user_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.etablissement_user_id_seq', 115, true);
          public          postgres    false    237                    0    0    etablissements_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.etablissements_id_seq', 194, true);
          public          postgres    false    233                    0    0    failed_jobs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);
          public          postgres    false    219                    0    0    filieres_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.filieres_id_seq', 5, true);
          public          postgres    false    225                    0    0    migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.migrations_id_seq', 42, true);
          public          postgres    false    214                    0    0    notifications_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.notifications_id_seq', 192, true);
          public          postgres    false    252                    0    0    permissions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.permissions_id_seq', 1, false);
          public          postgres    false    243                    0    0    personal_access_tokens_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 818, true);
          public          postgres    false    221                    0    0    remarks_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.remarks_id_seq', 13, true);
          public          postgres    false    256                    0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 4, true);
          public          postgres    false    245                    0    0    status_demande_agrements_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.status_demande_agrements_id_seq', 4, true);
          public          postgres    false    231                    0    0    type_activites_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.type_activites_id_seq', 3, true);
          public          postgres    false    227                    0    0    type_agrements_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.type_agrements_id_seq', 9, true);
          public          postgres    false    229                    0    0    user_information_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.user_information_id_seq', 99, true);
          public          postgres    false    223                    0    0    users_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.users_id_seq', 133, true);
          public          postgres    false    216                     0    0 $   websockets_statistics_entries_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.websockets_statistics_entries_id_seq', 1, false);
          public          postgres    false    254         #           2606    17251 &   agrement_demande agrement_demande_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.agrement_demande
    ADD CONSTRAINT agrement_demande_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.agrement_demande DROP CONSTRAINT agrement_demande_pkey;
       public            postgres    false    251                    2606    17007    agrements agrements_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.agrements
    ADD CONSTRAINT agrements_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.agrements DROP CONSTRAINT agrements_pkey;
       public            postgres    false    236                    2606    17053 (   demande_agrements demande_agrements_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.demande_agrements
    ADD CONSTRAINT demande_agrements_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.demande_agrements DROP CONSTRAINT demande_agrements_pkey;
       public            postgres    false    242                    2606    17036 2   etablissement_agrement etablissement_agrement_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.etablissement_agrement
    ADD CONSTRAINT etablissement_agrement_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.etablissement_agrement DROP CONSTRAINT etablissement_agrement_pkey;
       public            postgres    false    240                    2606    17019 *   etablissement_user etablissement_user_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.etablissement_user
    ADD CONSTRAINT etablissement_user_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.etablissement_user DROP CONSTRAINT etablissement_user_pkey;
       public            postgres    false    238         	           2606    16995 "   etablissements etablissements_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.etablissements
    ADD CONSTRAINT etablissements_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.etablissements DROP CONSTRAINT etablissements_pkey;
       public            postgres    false    234         �           2606    16930    failed_jobs failed_jobs_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_pkey;
       public            postgres    false    220         �           2606    16932 #   failed_jobs failed_jobs_uuid_unique 
   CONSTRAINT     ^   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);
 M   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_uuid_unique;
       public            postgres    false    220                    2606    16965    filieres filieres_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.filieres
    ADD CONSTRAINT filieres_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.filieres DROP CONSTRAINT filieres_pkey;
       public            postgres    false    226         �           2606    16902    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public            postgres    false    215                    2606    17107 0   model_has_permissions model_has_permissions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);
 Z   ALTER TABLE ONLY public.model_has_permissions DROP CONSTRAINT model_has_permissions_pkey;
       public            postgres    false    247    247    247                    2606    17118 $   model_has_roles model_has_roles_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);
 N   ALTER TABLE ONLY public.model_has_roles DROP CONSTRAINT model_has_roles_pkey;
       public            postgres    false    248    248    248         %           2606    17347     notifications notifications_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_pkey;
       public            postgres    false    253         �           2606    16920 0   password_reset_tokens password_reset_tokens_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);
 Z   ALTER TABLE ONLY public.password_reset_tokens DROP CONSTRAINT password_reset_tokens_pkey;
       public            postgres    false    218                    2606    17085 .   permissions permissions_name_guard_name_unique 
   CONSTRAINT     u   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_guard_name_unique UNIQUE (name, guard_name);
 X   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_name_guard_name_unique;
       public            postgres    false    244    244                    2606    17083    permissions permissions_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_pkey;
       public            postgres    false    244         �           2606    16941 2   personal_access_tokens personal_access_tokens_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_pkey;
       public            postgres    false    222         �           2606    16944 :   personal_access_tokens personal_access_tokens_token_unique 
   CONSTRAINT     v   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);
 d   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_token_unique;
       public            postgres    false    222         )           2606    17434    remarks remarks_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.remarks
    ADD CONSTRAINT remarks_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.remarks DROP CONSTRAINT remarks_pkey;
       public            postgres    false    257         !           2606    17133 .   role_has_permissions role_has_permissions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);
 X   ALTER TABLE ONLY public.role_has_permissions DROP CONSTRAINT role_has_permissions_pkey;
       public            postgres    false    249    249                    2606    17096 "   roles roles_name_guard_name_unique 
   CONSTRAINT     i   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_guard_name_unique UNIQUE (name, guard_name);
 L   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_name_guard_name_unique;
       public            postgres    false    246    246                    2606    17094    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    246                    2606    16986 6   status_demande_agrements status_demande_agrements_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.status_demande_agrements
    ADD CONSTRAINT status_demande_agrements_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.status_demande_agrements DROP CONSTRAINT status_demande_agrements_pkey;
       public            postgres    false    232                    2606    16972 "   type_activites type_activites_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.type_activites
    ADD CONSTRAINT type_activites_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.type_activites DROP CONSTRAINT type_activites_pkey;
       public            postgres    false    228                    2606    16979 "   type_agrements type_agrements_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.type_agrements
    ADD CONSTRAINT type_agrements_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.type_agrements DROP CONSTRAINT type_agrements_pkey;
       public            postgres    false    230         �           2606    16953 &   user_information user_information_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.user_information
    ADD CONSTRAINT user_information_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.user_information DROP CONSTRAINT user_information_pkey;
       public            postgres    false    224         �           2606    16913    users users_email_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_unique;
       public            postgres    false    217         �           2606    16911    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    217         '           2606    17382 @   websockets_statistics_entries websockets_statistics_entries_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.websockets_statistics_entries
    ADD CONSTRAINT websockets_statistics_entries_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.websockets_statistics_entries DROP CONSTRAINT websockets_statistics_entries_pkey;
       public            postgres    false    255                    1259    17100 /   model_has_permissions_model_id_model_type_index    INDEX     �   CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permissions USING btree (model_id, model_type);
 C   DROP INDEX public.model_has_permissions_model_id_model_type_index;
       public            postgres    false    247    247                    1259    17111 )   model_has_roles_model_id_model_type_index    INDEX     u   CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_roles USING btree (model_id, model_type);
 =   DROP INDEX public.model_has_roles_model_id_model_type_index;
       public            postgres    false    248    248         �           1259    16942 8   personal_access_tokens_tokenable_type_tokenable_id_index    INDEX     �   CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);
 L   DROP INDEX public.personal_access_tokens_tokenable_type_tokenable_id_index;
       public            postgres    false    222    222         6           2606    17257 5   agrement_demande agrement_demande_agrement_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.agrement_demande
    ADD CONSTRAINT agrement_demande_agrement_id_foreign FOREIGN KEY (agrement_id) REFERENCES public.agrements(id) ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.agrement_demande DROP CONSTRAINT agrement_demande_agrement_id_foreign;
       public          postgres    false    3339    236    251         7           2606    17252 =   agrement_demande agrement_demande_demande_agrement_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.agrement_demande
    ADD CONSTRAINT agrement_demande_demande_agrement_id_foreign FOREIGN KEY (demande_agrement_id) REFERENCES public.demande_agrements(id) ON DELETE CASCADE;
 g   ALTER TABLE ONLY public.agrement_demande DROP CONSTRAINT agrement_demande_demande_agrement_id_foreign;
       public          postgres    false    3345    251    242         ,           2606    17500 ,   agrements agrements_type_agrement_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.agrements
    ADD CONSTRAINT agrements_type_agrement_id_foreign FOREIGN KEY (type_agrement_id) REFERENCES public.type_agrements(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.agrements DROP CONSTRAINT agrements_type_agrement_id_foreign;
       public          postgres    false    3333    236    230         1           2606    17054 <   demande_agrements demande_agrements_etablissement_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.demande_agrements
    ADD CONSTRAINT demande_agrements_etablissement_id_foreign FOREIGN KEY (etablissement_id) REFERENCES public.etablissements(id) ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.demande_agrements DROP CONSTRAINT demande_agrements_etablissement_id_foreign;
       public          postgres    false    3337    242    234         /           2606    17042 A   etablissement_agrement etablissement_agrement_agrement_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.etablissement_agrement
    ADD CONSTRAINT etablissement_agrement_agrement_id_foreign FOREIGN KEY (agrement_id) REFERENCES public.agrements(id) ON DELETE CASCADE;
 k   ALTER TABLE ONLY public.etablissement_agrement DROP CONSTRAINT etablissement_agrement_agrement_id_foreign;
       public          postgres    false    236    240    3339         0           2606    17037 F   etablissement_agrement etablissement_agrement_etablissement_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.etablissement_agrement
    ADD CONSTRAINT etablissement_agrement_etablissement_id_foreign FOREIGN KEY (etablissement_id) REFERENCES public.etablissements(id) ON DELETE CASCADE;
 p   ALTER TABLE ONLY public.etablissement_agrement DROP CONSTRAINT etablissement_agrement_etablissement_id_foreign;
       public          postgres    false    234    240    3337         -           2606    17020 >   etablissement_user etablissement_user_etablissement_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.etablissement_user
    ADD CONSTRAINT etablissement_user_etablissement_id_foreign FOREIGN KEY (etablissement_id) REFERENCES public.etablissements(id) ON DELETE CASCADE;
 h   ALTER TABLE ONLY public.etablissement_user DROP CONSTRAINT etablissement_user_etablissement_id_foreign;
       public          postgres    false    234    3337    238         .           2606    17025 5   etablissement_user etablissement_user_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.etablissement_user
    ADD CONSTRAINT etablissement_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.etablissement_user DROP CONSTRAINT etablissement_user_user_id_foreign;
       public          postgres    false    217    3314    238         +           2606    16996 6   etablissements etablissements_type_activite_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.etablissements
    ADD CONSTRAINT etablissements_type_activite_id_foreign FOREIGN KEY (type_activite_id) REFERENCES public.type_activites(id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.etablissements DROP CONSTRAINT etablissements_type_activite_id_foreign;
       public          postgres    false    234    3331    228         2           2606    17101 A   model_has_permissions model_has_permissions_permission_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;
 k   ALTER TABLE ONLY public.model_has_permissions DROP CONSTRAINT model_has_permissions_permission_id_foreign;
       public          postgres    false    247    244    3349         3           2606    17112 /   model_has_roles model_has_roles_role_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.model_has_roles DROP CONSTRAINT model_has_roles_role_id_foreign;
       public          postgres    false    246    248    3353         8           2606    17435 #   remarks remarks_agrement_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.remarks
    ADD CONSTRAINT remarks_agrement_id_foreign FOREIGN KEY (agrement_id) REFERENCES public.agrements(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.remarks DROP CONSTRAINT remarks_agrement_id_foreign;
       public          postgres    false    236    257    3339         4           2606    17122 ?   role_has_permissions role_has_permissions_permission_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;
 i   ALTER TABLE ONLY public.role_has_permissions DROP CONSTRAINT role_has_permissions_permission_id_foreign;
       public          postgres    false    3349    249    244         5           2606    17127 9   role_has_permissions role_has_permissions_role_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;
 c   ALTER TABLE ONLY public.role_has_permissions DROP CONSTRAINT role_has_permissions_role_id_foreign;
       public          postgres    false    3353    249    246         *           2606    16954 1   user_information user_information_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_information
    ADD CONSTRAINT user_information_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.user_information DROP CONSTRAINT user_information_user_id_foreign;
       public          postgres    false    224    217    3314                                                                        3564.dat                                                                                            0000600 0004000 0002000 00000000065 14721674436 0014272 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        22	38	188	\N	\N
23	39	189	\N	\N
24	41	190	\N	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3549.dat                                                                                            0000600 0004000 0002000 00000001242 14721674436 0014273 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        184	MAD-MIEL 04/13 DSV	2	2024-08-15	\N	2024-08-15 11:29:22	2024-08-17 03:35:52	\N	t	Retiré
187	MAD-MIEL 08/21 DSV	2	2021-11-08	\N	2024-08-17 04:42:03	2024-08-17 04:42:47	\N	t	Actif
183	MAD-MINEL 01/12 DSV	2	2024-08-15	\N	2024-08-15 11:20:11	2024-08-22 09:40:46	\N	t	Suspendu
189	DSV-AB/04-24	3	2024-04-22	\N	2024-08-22 14:08:28	2024-08-22 14:14:52	\N	t	Actif
190	DSV-Miel/2024	1	2024-02-22	2024-05-22	2024-08-22 18:55:48	2024-08-22 19:01:44	\N	f	Actif
185	MAD-MIEL 05/18 DSV	2	2024-08-15	\N	2024-08-15 11:35:15	2024-08-31 06:16:52	2024-08-31 06:16:52	t	Actif
188	DSV-GD/08-24	1	2024-08-22	2024-11-22	2024-08-22 12:00:52	2024-08-31 06:17:17	2024-08-31 06:17:17	t	Actif
\.


                                                                                                                                                                                                                                                                                                                                                              3555.dat                                                                                            0000600 0004000 0002000 00000000335 14721674436 0014272 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        38	187	1	3	2024-08-22 11:59:25	2024-08-22 12:00:52	\N
39	193	1	3	2024-08-22 14:07:18	2024-08-22 14:08:28	\N
40	193	2	2	2024-08-22 14:09:34	2024-08-22 14:09:53	\N
41	194	1	3	2024-08-22 18:51:12	2024-08-22 18:55:48	\N
\.


                                                                                                                                                                                                                                                                                                   3553.dat                                                                                            0000600 0004000 0002000 00000000203 14721674436 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        147	181	183	\N	\N
148	182	184	\N	\N
149	183	185	\N	\N
151	186	187	\N	\N
152	187	188	\N	\N
153	193	189	\N	\N
154	194	190	\N	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                             3551.dat                                                                                            0000600 0004000 0002000 00000000225 14721674436 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        100	181	117	\N	\N
101	182	118	\N	\N
102	183	119	\N	\N
107	181	118	\N	\N
108	187	118	\N	\N
110	193	133	\N	\N
114	194	118	\N	\N
115	186	118	\N	\N
\.


                                                                                                                                                                                                                                                                                                                                                                           3547.dat                                                                                            0000600 0004000 0002000 00000001670 14721674436 0014276 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        181	SIGMA AGRO BIO/ T'TELO	1	2	Grand	Lot 16D Imerinafovoany Antananarivo	Miel	2024-08-15 11:20:10	2024-08-20 05:46:15	Analamanga	Antananarivo II	Andraikiba	Dr Tanjona	\N
183	SENTEURS ET SAVEUR DU MONDE (SSM)	1	2	\N	Talatamaty	Miel	2024-08-15 11:35:15	2024-08-20 15:51:54	Analamanga	\N	\N	Dr RANAIVOARIMANANA Lalatiana Olivia	\N
193	MBG	3	2	\N	Itaosy	Ruminants	2024-08-22 14:00:22	2024-08-22 14:00:22	\N	\N	\N	\N	\N
194	MIELLERIE DE LA GRANDE ILE	1	2	\N	Foulpointe	Miel	2024-08-22 18:37:59	2024-08-22 18:37:59	Atsinanana	\N	\N	\N	\N
187	JB	4	2	\N	Tanjombato	Plumpy et biscuits	2024-08-22 08:32:14	2024-08-31 06:17:17	Analamanga	Antananarivo I	Tanjombato	Dr Lalao	2024-08-31 06:17:17
186	THE BEEKEEPER	1	2	\N	Ambohipanja	Miel	2024-08-17 04:42:03	2024-08-17 04:51:22	Analamanga	\N	Ankadikely Ilafy	\N	\N
182	LES RUCHERS DE LA REINE BETIA	1	2	\N	Toamasina	Miel	2024-08-15 11:29:22	2024-08-15 11:29:22	Atsinanana	\N	\N	Dr VELONANDRO Honore Devalois	\N
\.


                                                                        3533.dat                                                                                            0000600 0004000 0002000 00000000005 14721674436 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3539.dat                                                                                            0000600 0004000 0002000 00000000432 14721674436 0014272 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Miel	2024-04-04 11:59:14	2024-04-04 11:59:14
2	Larve de guêpe	2024-04-04 11:59:14	2024-04-04 11:59:14
3	Abbatoire	2024-04-04 11:59:14	2024-04-04 11:59:14
4	Grande distribution	2024-04-04 11:59:14	2024-04-04 11:59:14
5	Produit laitier	2024-04-04 11:59:14	2024-04-04 11:59:14
\.


                                                                                                                                                                                                                                      3528.dat                                                                                            0000600 0004000 0002000 00000003763 14721674436 0014302 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_reset_tokens_table	1
3	2019_08_19_000000_create_failed_jobs_table	1
4	2019_12_14_000001_create_personal_access_tokens_table	1
5	2024_04_03_111832_create_user_information_table	1
6	2024_04_03_111952_create_filieres_table	1
7	2024_04_03_112356_create_type_activites_table	1
8	2024_04_03_112420_create_type_agrements_table	1
9	2024_04_03_112453_create_status_demande_agrements_table	1
10	2024_04_03_113124_create_etablissements_table	1
11	2024_04_03_113318_create_agrements_table	1
12	2024_04_03_113756_create_etablissement_user_table	1
13	2024_04_03_113959_create_etablissement_agrement_table	1
14	2024_04_03_114617_create_demande_agrements_table	1
15	2024_04_03_114951_create_demande_exportations_table	1
16	2024_04_03_120713_create_permission_tables	1
17	2024_04_12_081320_create_agrement_demande_table	2
18	2024_06_19_083020_add_deleted_at_to_agrements_and_demande_agrements_tables	2
19	2024_07_01_090358_add_region_and_district_to_etablissements_table	3
24	2024_07_11_075139_create_notifications_table	4
25	2024_07_11_113728_edit_agrement_table	5
26	2024_07_11_111804_edit_agrement_table	6
27	2024_07_16_084848_add_deleted_at_to_notifications_table	6
29	2024_07_16_094504_status_at_to_notifications_table	7
30	2024_07_17_040215_add_region_and_district_to_etablissements_table	8
31	0000_00_00_000000_create_websockets_statistics_entries_table	9
32	2024_07_29_120436_create_veterinaires_table	10
33	2024_07_29_120953_add_veterinaire_id_to_etablissements_table	10
34	2024_07_29_122600_add_commune_to_etablissements_table	11
35	2024_07_29_131732_edit_to_etablissements_table	12
36	2024_07_29_132234_edit_to_etablissements_table	13
37	2024_07_29_140741_edit_to_veterinaires_table	14
38	2024_07_29_180519_add_veterinaire_to_etablissements_table	15
39	2024_07_29_221226_edit_to_etablissements_table	16
40	2024_07_31_080337_edit_to_agrements_table	17
41	2024_07_31_111604_create_remark_table	18
42	2024_08_17_045754_add_deleted_at_to_etablissements_tables	19
\.


             3560.dat                                                                                            0000600 0004000 0002000 00000000005 14721674436 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3561.dat                                                                                            0000600 0004000 0002000 00000004133 14721674436 0014267 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        3	App\\Models\\User	1
3	App\\Models\\User	2
4	App\\Models\\User	3
4	App\\Models\\User	4
4	App\\Models\\User	5
4	App\\Models\\User	6
2	App\\Models\\User	7
3	App\\Models\\User	8
3	App\\Models\\User	9
3	App\\Models\\User	10
3	App\\Models\\User	11
4	App\\Models\\User	12
2	App\\Models\\User	13
3	App\\Models\\User	14
3	App\\Models\\User	15
1	App\\Models\\User	16
4	App\\Models\\User	17
3	App\\Models\\User	18
3	App\\Models\\User	19
2	App\\Models\\User	20
4	App\\Models\\User	36
4	App\\Models\\User	37
2	App\\Models\\User	39
3	App\\Models\\User	40
4	App\\Models\\User	43
4	App\\Models\\User	45
2	App\\Models\\User	46
3	App\\Models\\User	47
4	App\\Models\\User	48
4	App\\Models\\User	51
4	App\\Models\\User	52
4	App\\Models\\User	53
2	App\\Models\\User	54
4	App\\Models\\User	55
2	App\\Models\\User	56
4	App\\Models\\User	57
4	App\\Models\\User	60
2	App\\Models\\User	61
3	App\\Models\\User	62
4	App\\Models\\User	63
4	App\\Models\\User	64
2	App\\Models\\User	65
4	App\\Models\\User	66
4	App\\Models\\User	67
4	App\\Models\\User	72
4	App\\Models\\User	73
4	App\\Models\\User	74
4	App\\Models\\User	75
2	App\\Models\\User	76
2	App\\Models\\User	77
2	App\\Models\\User	78
4	App\\Models\\User	79
4	App\\Models\\User	80
2	App\\Models\\User	81
4	App\\Models\\User	82
4	App\\Models\\User	83
4	App\\Models\\User	84
4	App\\Models\\User	85
4	App\\Models\\User	91
4	App\\Models\\User	92
4	App\\Models\\User	93
4	App\\Models\\User	94
3	App\\Models\\User	95
4	App\\Models\\User	96
4	App\\Models\\User	99
3	App\\Models\\User	100
4	App\\Models\\User	101
3	App\\Models\\User	102
4	App\\Models\\User	103
4	App\\Models\\User	104
3	App\\Models\\User	105
3	App\\Models\\User	106
4	App\\Models\\User	107
3	App\\Models\\User	108
4	App\\Models\\User	109
4	App\\Models\\User	110
4	App\\Models\\User	111
4	App\\Models\\User	113
2	App\\Models\\User	114
4	App\\Models\\User	115
4	App\\Models\\User	117
4	App\\Models\\User	118
4	App\\Models\\User	119
4	App\\Models\\User	120
4	App\\Models\\User	121
2	App\\Models\\User	122
3	App\\Models\\User	123
3	App\\Models\\User	125
3	App\\Models\\User	126
3	App\\Models\\User	127
4	App\\Models\\User	132
4	App\\Models\\User	133
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                     3566.dat                                                                                            0000600 0004000 0002000 00000021122 14721674436 0014271 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        149	119	L'agrément pour votre établissement dénommé SENTEURS ET SAVEUR DU MONDE (SSM) a été mis à jour: valide, date d'éxpiration : N/A.	2024-08-17 03:35:37	2024-08-17 03:35:37	\N	f
150	119	Votre agrément pour l'établissement dénommé SENTEURS ET SAVEUR DU MONDE (SSM) a été reactivé.\nVous pouvez à présent continuer vos activités.	2024-08-17 03:35:37	2024-08-17 03:35:37	\N	f
153	119	Votre établissement dénommé SENTEURS ET SAVEUR DU MONDE (SSM) a réçu un agrément: n° MAD-MIEL 07/19 DSV	2024-08-17 04:05:23	2024-08-17 04:05:23	\N	f
154	119	L'agrément pour votre établissement dénommé SENTEURS ET SAVEUR DU MONDE (SSM) a été mis à jour: valide, date d'éxpiration : 17/11/2024.	2024-08-17 04:05:23	2024-08-17 04:05:23	\N	f
157	119	L'agrément pour votre établissement dénommé SENTEURS ET SAVEUR DU MONDE (SSM) a été mis à jour: valide, date d'éxpiration : 17/11/2024.	2024-08-20 05:03:19	2024-08-20 05:03:19	\N	f
159	119	L'agrément pour votre établissement dénommé SENTEURS ET SAVEUR DU MONDE (SSM) a été mis à jour: valide, date d'éxpiration : 17/11/2024.	2024-08-20 05:07:30	2024-08-20 05:07:30	\N	f
165	119	L'agrément pour votre établissement dénommé SENTEURS ET SAVEUR DU MONDE (SSM) a été mis à jour: valide, date d'éxpiration : N/A.	2024-08-20 13:47:09	2024-08-20 13:47:09	\N	f
167	119	L'agrément pour votre établissement dénommé SENTEURS ET SAVEUR DU MONDE (SSM) a été mis à jour: valide, date d'éxpiration : N/A.	2024-08-20 14:12:46	2024-08-20 14:12:46	\N	f
169	119	L'agrément pour votre établissement dénommé SENTEURS ET SAVEUR DU MONDE (SSM) a été mis à jour: valide, date d'éxpiration : N/A.	2024-08-20 15:52:07	2024-08-20 15:52:07	\N	f
163	118	Les informations sur votre établissement dénommé SIGMA AGRO BIO/ T'TELO ont été modifié.\nOn vous prie de les vérifier et de nous contacter s'il y a des données incorrectes.	2024-08-20 05:46:15	2024-08-22 12:12:57	\N	t
161	118	Les informations sur votre établissement dénommé SIGMA AGRO BIO/ T'TELO ont été modifié.\nOn vous prie de les vérifier et de nous contacter s'il y a des données incorrectes.	2024-08-20 05:45:31	2024-08-22 12:24:12	2024-08-22 12:24:12	t
170	118	L'agrément pour votre établissement dénommé SIGMA AGRO BIO/ T'TELO a été mis à jour: valide, date d'éxpiration : N/A.	2024-08-22 09:40:46	2024-08-22 12:28:05	2024-08-22 12:28:05	t
173	133	Votre établissement dénommé MBG a réçu un agrément: n° DSV-AB/24	2024-08-22 14:08:28	2024-08-22 14:08:28	\N	f
174	133	L'agrément pour votre établissement dénommé MBG a été mis à jour: valide, date d'éxpiration : 22/11/2024.	2024-08-22 14:08:28	2024-08-22 14:08:28	\N	f
177	133	L'agrément pour votre établissement dénommé MBG a été mis à jour: expiré, date d'éxpiration : 22/07/2024.	2024-08-22 14:12:21	2024-08-22 14:12:21	\N	f
178	133	Vos informations sur l'agrément pour l'établissement dénommé MBG a été mis à jour.	2024-08-22 14:12:21	2024-08-22 14:12:21	\N	f
181	133	L'agrément pour votre établissement dénommé MBG a été mis à jour: valide, date d'éxpiration : N/A.	2024-08-22 14:14:52	2024-08-22 14:14:52	\N	f
182	133	Vos informations sur l'agrément pour l'établissement dénommé MBG a été mis à jour.	2024-08-22 14:14:52	2024-08-22 14:14:52	\N	f
185	133	L'agrément pour votre établissement dénommé MIELLERIE DE LA GRANDE ILE a été mis à jour: expiré, date d'éxpiration : 22/05/2024.	2024-08-22 18:59:38	2024-08-22 18:59:38	\N	f
186	133	Vos informations sur l'agrément pour l'établissement dénommé MIELLERIE DE LA GRANDE ILE a été mis à jour.	2024-08-22 18:59:38	2024-08-22 18:59:38	\N	f
189	133	L'agrément pour votre établissement dénommé MIELLERIE DE LA GRANDE ILE a été mis à jour: valide, date d'éxpiration : N/A.	2024-08-22 19:00:29	2024-08-22 19:00:29	\N	f
190	133	Vos informations sur l'agrément pour l'établissement dénommé MIELLERIE DE LA GRANDE ILE a été mis à jour.	2024-08-22 19:00:29	2024-08-22 19:00:29	\N	f
155	120	L'agrément pour votre établissement dénommé THE BEEKEEPER a été mis à jour: valide, date d'éxpiration : N/A.	2024-08-17 04:42:47	2024-08-17 04:42:47	\N	f
156	120	Votre agrément pour l'établissement dénommé THE BEEKEEPER a été reactivé.\nVous pouvez à présent continuer vos activités.	2024-08-17 04:42:47	2024-08-17 04:42:47	\N	f
158	119	L'agrément pour votre établissement dénommé SENTEURS ET SAVEUR DU MONDE (SSM) a été mis à jour: valide, date d'éxpiration : N/A.	2024-08-20 05:07:23	2024-08-20 05:07:23	\N	f
145	117	L'agrément pour votre établissement dénommé SIGMA AGRO BIO/ T'TELO a été mis à jour: valide, date d'éxpiration : N/A.	2024-08-16 18:38:14	2024-08-16 18:38:14	\N	f
146	117	Votre agrément pour l'établissement dénommé SIGMA AGRO BIO/ T'TELO a été reactivé.\nVous pouvez à présent continuer vos activités.	2024-08-16 18:38:14	2024-08-16 18:38:14	\N	f
147	117	L'agrément pour votre établissement dénommé SIGMA AGRO BIO/ T'TELO a été mis à jour: valide, date d'éxpiration : N/A.	2024-08-16 18:39:49	2024-08-16 18:39:49	\N	f
148	117	Votre agrément pour l'établissement dénommé SIGMA AGRO BIO/ T'TELO a été suspendu.\nVeuillez contacter votre responsable au sein du service pour avoir plus d'informations.	2024-08-16 18:39:49	2024-08-16 18:39:49	\N	f
160	118	Les informations sur votre établissement dénommé SIGMA AGRO BIO/ T'TELO ont été modifié.\nOn vous prie de les vérifier et de nous contacter s'il y a des données incorrectes.	2024-08-20 05:44:23	2024-08-20 05:44:23	\N	f
162	118	Les informations sur votre établissement dénommé SIGMA AGRO BIO/ T'TELO ont été modifié.\nOn vous prie de les vérifier et de nous contacter s'il y a des données incorrectes.	2024-08-20 05:45:39	2024-08-20 05:45:39	\N	f
164	119	L'agrément pour votre établissement dénommé SENTEURS ET SAVEUR DU MONDE (SSM) a été mis à jour: valide, date d'éxpiration : 17/11/2024.	2024-08-20 13:46:58	2024-08-20 13:46:58	\N	f
166	119	L'agrément pour votre établissement dénommé SENTEURS ET SAVEUR DU MONDE (SSM) a été mis à jour: valide, date d'éxpiration : 17/11/2024.	2024-08-20 13:55:50	2024-08-20 13:55:50	\N	f
171	118	Votre établissement dénommé JB a réçu un agrément: n° DSV-GD/08-24	2024-08-22 12:00:53	2024-08-22 12:00:53	\N	f
172	118	L'agrément pour votre établissement dénommé JB a été mis à jour: valide, date d'éxpiration : 22/11/2024.	2024-08-22 12:00:53	2024-08-22 12:00:53	\N	f
151	118	L'agrément pour votre établissement dénommé LES RUCHERS DE LA REINE BETIA a été mis à jour: valide, date d'éxpiration : N/A.	2024-08-17 03:35:52	2024-08-22 12:14:30	\N	t
152	118	Votre agrément pour l'établissement dénommé LES RUCHERS DE LA REINE BETIA a été retiré.\nVeuillez contacter votre responsable au sein du service pour avoir plus d'informations.	2024-08-17 03:35:52	2024-08-22 12:14:35	\N	t
168	118	L'agrément pour votre établissement dénommé SIGMA AGRO BIO/ T'TELO a été mis à jour: valide, date d'éxpiration : N/A.	2024-08-20 15:51:36	2024-08-22 12:28:05	2024-08-22 12:28:05	f
175	133	L'agrément pour votre établissement dénommé MBG a été mis à jour: expiré, date d'éxpiration : 22/07/2024.	2024-08-22 14:09:05	2024-08-22 14:09:05	\N	f
176	133	Vos informations sur l'agrément pour l'établissement dénommé MBG a été mis à jour.	2024-08-22 14:09:05	2024-08-22 14:09:05	\N	f
179	133	L'agrément pour votre établissement dénommé MBG a été mis à jour: valide, date d'éxpiration : N/A.	2024-08-22 14:14:33	2024-08-22 14:14:33	\N	f
180	133	Vos informations sur l'agrément pour l'établissement dénommé MBG a été mis à jour.	2024-08-22 14:14:33	2024-08-22 14:14:33	\N	f
183	133	Votre établissement dénommé MIELLERIE DE LA GRANDE ILE a réçu un agrément: n° DSV-Miel/2024	2024-08-22 18:55:48	2024-08-22 18:55:48	\N	f
184	133	L'agrément pour votre établissement dénommé MIELLERIE DE LA GRANDE ILE a été mis à jour: valide, date d'éxpiration : 22/11/2024.	2024-08-22 18:55:48	2024-08-22 18:55:48	\N	f
187	133	L'agrément pour votre établissement dénommé MIELLERIE DE LA GRANDE ILE a été mis à jour: valide, date d'éxpiration : N/A.	2024-08-22 19:00:07	2024-08-22 19:00:07	\N	f
188	133	Vos informations sur l'agrément pour l'établissement dénommé MIELLERIE DE LA GRANDE ILE a été mis à jour.	2024-08-22 19:00:07	2024-08-22 19:00:07	\N	f
191	133	L'agrément pour votre établissement dénommé MIELLERIE DE LA GRANDE ILE a été mis à jour: expiré, date d'éxpiration : 22/05/2024.	2024-08-22 19:01:44	2024-08-22 19:01:44	\N	f
192	133	Vos informations sur l'agrément pour l'établissement dénommé MIELLERIE DE LA GRANDE ILE a été mis à jour.	2024-08-22 19:01:44	2024-08-22 19:01:44	\N	f
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                              3531.dat                                                                                            0000600 0004000 0002000 00000000005 14721674436 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3557.dat                                                                                            0000600 0004000 0002000 00000000005 14721674436 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3535.dat                                                                                            0000600 0004000 0002000 00000441405 14721674436 0014277 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	App\\Models\\User	1	angular-front	b44192a9f230462180100ec46935487e6dcb5aa4228819d8bd6b09a8ea8fd27f	["*"]	\N	2024-04-05 12:07:08	2024-04-04 12:07:08	2024-04-04 12:07:08
2	App\\Models\\User	1	angular-front	f24eefcfba611dee8dc1dc6f5d1636f6eaa8da4a0ad2e9f325ba9a9df8cd67ff	["*"]	\N	2024-04-09 07:53:49	2024-04-08 07:53:49	2024-04-08 07:53:49
3	App\\Models\\User	1	angular-front	e462fe81f146408b7f5a270872ac43f9095212635467b6025cc4d12ce739d3a7	["*"]	\N	2024-04-10 06:36:49	2024-04-09 06:36:49	2024-04-09 06:36:49
4	App\\Models\\User	1	angular-front	3349317eb6a60c720e1dca41af0ecd97b801ea8dd3b2120982986eca0a5da803	["*"]	\N	2024-04-10 07:00:25	2024-04-09 07:00:25	2024-04-09 07:00:25
5	App\\Models\\User	1	angular-front	d64a9f922c68b364b7508fad414ccbc507a5636a508d30d435d4c72f413fcf91	["*"]	\N	2024-04-10 09:51:04	2024-04-09 09:51:04	2024-04-09 09:51:04
6	App\\Models\\User	1	angular-front	57ce6d4f7b782943771ca50f39c0205b5143c2864972918d3a459cd5c8911f3a	["*"]	\N	2024-04-10 10:02:28	2024-04-09 10:02:28	2024-04-09 10:02:28
7	App\\Models\\User	1	angular-front	bfdaa76527c134c0d5a4fa0d0b0eff6fa4ab84c49d5a54b66fbf7a19d0c0dbd0	["*"]	\N	2024-04-10 10:17:55	2024-04-09 10:17:55	2024-04-09 10:17:55
8	App\\Models\\User	1	angular-front	48f223e7e8baf71bddc4c94b6a3f776dde61ffb3dfe9d7b28cc1dd5eaee0eaca	["*"]	\N	2024-04-10 10:18:24	2024-04-09 10:18:24	2024-04-09 10:18:24
9	App\\Models\\User	1	angular-front	86efad7dd59a90f46612e527e8357d921437c48e563a53af41cb0a458b7ecfaf	["*"]	\N	2024-04-10 11:55:09	2024-04-09 11:55:09	2024-04-09 11:55:09
10	App\\Models\\User	1	angular-front	b1ef994a7b833ba411f6ef4505b2d68f0c41e7c40e312ed32671b89a716677a9	["*"]	\N	2024-04-10 12:49:00	2024-04-09 12:49:00	2024-04-09 12:49:00
11	App\\Models\\User	1	angular-front	484bd4710f10a4cd51fdcfe921fbf7c8467fe95567aba497c67e2aa867b61931	["*"]	\N	2024-04-10 12:51:13	2024-04-09 12:51:13	2024-04-09 12:51:13
12	App\\Models\\User	1	angular-front	b9341ea028491ef1fa21d6acdb3a8500f4d99381db23d25d8edf384b83f79fa1	["*"]	\N	2024-04-10 12:54:41	2024-04-09 12:54:41	2024-04-09 12:54:41
13	App\\Models\\User	1	angular-front	6d00e668f2c6c315306855b76fdf77fade03519452c59fd5e39e29ed04f8e7ac	["*"]	\N	2024-04-10 12:55:13	2024-04-09 12:55:13	2024-04-09 12:55:13
14	App\\Models\\User	1	angular-front	9729da480df9694778c769e40091e30f9c805bb490512b7e1a3685b7ead4bb6d	["*"]	\N	2024-04-10 12:55:32	2024-04-09 12:55:32	2024-04-09 12:55:32
16	App\\Models\\User	2	angular-front	91316fd4b04f222abfc7074a44e97af17fa0ed3f44cb8e370f3a2feac1053bf7	["*"]	\N	2024-04-12 06:48:49	2024-04-11 06:48:49	2024-04-11 06:48:49
15	App\\Models\\User	2	angular-front	066ea61cad332173fef264bc2077bf97faccf98a0424247bbbe732294dc22da5	["*"]	\N	2024-04-12 06:48:49	2024-04-11 06:48:49	2024-04-11 06:48:49
17	App\\Models\\User	2	angular-front	c8a9c571e02c484dae23788d34cac11ef5868a1b75478076646986d455213f0e	["*"]	\N	2024-04-12 06:48:51	2024-04-11 06:48:51	2024-04-11 06:48:51
18	App\\Models\\User	2	angular-front	6921e8a96038f979bb1ec4acdc50a227429556cbf5547971cda50e1725b26902	["*"]	\N	2024-04-12 06:50:07	2024-04-11 06:50:07	2024-04-11 06:50:07
19	App\\Models\\User	8	angular-front	3c7c64acdd963fe0dee39d0e504123d503c5ca5bd255edcbb4ca0f767378bc4f	["*"]	\N	2024-04-12 06:54:27	2024-04-11 06:54:27	2024-04-11 06:54:27
20	App\\Models\\User	10	angular-front	729cf30ecce28dbec57286f925d35cf13b787d4f3184a363eaa69f0cda739508	["*"]	\N	2024-04-12 08:00:06	2024-04-11 08:00:06	2024-04-11 08:00:06
21	App\\Models\\User	10	angular-front	a2b89b4312c4999a80c6b4f553522310f7e41715b5975c5d7b147d91e8250a60	["*"]	\N	2024-04-12 08:00:06	2024-04-11 08:00:06	2024-04-11 08:00:06
22	App\\Models\\User	10	angular-front	ed5a4872a5c1e57659d0b9e6024ae87a619f3e334f5d8c50f98f17f0dc450140	["*"]	\N	2024-04-12 08:03:16	2024-04-11 08:03:16	2024-04-11 08:03:16
23	App\\Models\\User	16	angular-front	0104e8113a8e766d3a1d4f4139d4ae7a2f0f0fcf31650a6ac16287a51f810f86	["*"]	\N	2024-04-12 08:21:55	2024-04-11 08:21:55	2024-04-11 08:21:55
24	App\\Models\\User	16	angular-front	6dad4dd4904cf22323b4ff848d38ad55580643ad0c81e3b3b6a12a6097fdf239	["*"]	\N	2024-04-12 08:23:43	2024-04-11 08:23:43	2024-04-11 08:23:43
26	App\\Models\\User	20	angular-front	01165a5ed9c2a1f241cfc9bcfe7938bed9db5626daae5d02618d1e23ae384a57	["*"]	\N	2024-04-12 09:06:31	2024-04-11 09:06:31	2024-04-11 09:06:31
30	App\\Models\\User	2	angular-front	099d15a92f663a32491f8218f40bd4d103b9a76a919d2319900227501fb304e0	["*"]	2024-04-11 10:05:32	2024-04-12 10:05:31	2024-04-11 10:05:31	2024-04-11 10:05:32
39	App\\Models\\User	8	angular-front	a73e6aa62c851ea5ef2f9237db95cf6a5d2697cec45acb1c1c23c28343525292	["*"]	2024-04-11 11:30:11	2024-04-12 11:30:10	2024-04-11 11:30:10	2024-04-11 11:30:11
34	App\\Models\\User	4	angular-front	795ed6533cb58c014cac47abb72c0d43c6d89a0defad462dd01f65b643ec13b0	["*"]	2024-04-11 11:01:21	2024-04-12 10:47:03	2024-04-11 10:47:03	2024-04-11 11:01:21
37	App\\Models\\User	9	angular-front	067d39872cbd7a39335c3469039ec956f8e99ab8c4e147175c8aafa4670205f6	["*"]	2024-04-11 11:14:52	2024-04-12 11:14:36	2024-04-11 11:14:36	2024-04-11 11:14:52
31	App\\Models\\User	20	angular-front	c3260ed7b4c8a59ec38a211b60e8eb5995f063846b012dfc804e0a19bcda9f68	["*"]	2024-04-11 10:24:25	2024-04-12 10:06:05	2024-04-11 10:06:05	2024-04-11 10:24:25
27	App\\Models\\User	18	angular-front	1da632e6740e204bc9e8d2e8f50a00d9b6c66a7e387e5c95c5a42977b4dd0082	["*"]	2024-04-11 10:01:44	2024-04-12 09:41:16	2024-04-11 09:41:16	2024-04-11 10:01:44
28	App\\Models\\User	19	angular-front	725be2a51a7d77718763287440bf8322bc31009a0887b1f76e746bd02d6b1eee	["*"]	2024-04-11 10:02:33	2024-04-12 10:02:33	2024-04-11 10:02:33	2024-04-11 10:02:33
29	App\\Models\\User	8	angular-front	75f8b800dca1fdcea5164fa80e0a5c7cdd08964241a77adfbdec25de50705cb5	["*"]	2024-04-11 10:02:59	2024-04-12 10:02:59	2024-04-11 10:02:59	2024-04-11 10:02:59
32	App\\Models\\User	1	angular-front	86310bf2e7a21e3ad52e7d4227d7a93ae8a828cf675e267cde8276b1659ebe8c	["*"]	2024-04-11 10:35:25	2024-04-12 10:25:09	2024-04-11 10:25:09	2024-04-11 10:35:25
33	App\\Models\\User	14	angular-front	76b4d6b2613fbe62cffbce3a6786ad3566b305c4ce01bc69919e40c4d28d6ec6	["*"]	2024-04-11 10:41:35	2024-04-12 10:41:34	2024-04-11 10:41:34	2024-04-11 10:41:35
36	App\\Models\\User	10	angular-front	23b3efe121b067217dc506ae85f256a616d0b87fe56cfec4ba1487d9fce8c2ea	["*"]	2024-04-11 11:13:04	2024-04-12 11:06:05	2024-04-11 11:06:05	2024-04-11 11:13:04
35	App\\Models\\User	6	angular-front	869bb1b056770118cf38e734de2c8b3e26167a334934be86dc47952d1a97988e	["*"]	2024-04-11 11:05:03	2024-04-12 11:02:13	2024-04-11 11:02:13	2024-04-11 11:05:03
38	App\\Models\\User	9	angular-front	d8aad1dc251b7e83e048ce6d26c24f9bfb3d744d81f715e02a42dcd189eb511b	["*"]	2024-04-11 11:28:57	2024-04-12 11:15:07	2024-04-11 11:15:07	2024-04-11 11:28:57
40	App\\Models\\User	8	angular-front	3de67b2275724157d5ff97a067282f5ce633d1d38700048903525ce6ebfb6002	["*"]	2024-04-11 11:31:49	2024-04-12 11:31:49	2024-04-11 11:31:49	2024-04-11 11:31:49
41	App\\Models\\User	8	angular-front	c15f29b77c1b45bf236abe9dbfff3652552ac1508d529a124ee8dbdabe7e1d9a	["*"]	2024-04-11 11:33:07	2024-04-12 11:33:07	2024-04-11 11:33:07	2024-04-11 11:33:07
42	App\\Models\\User	8	angular-front	38b26c99107806c2d335084abf768a3ceff6ca61fbb41f916778ec56e0fafb02	["*"]	2024-04-11 11:33:56	2024-04-12 11:33:56	2024-04-11 11:33:56	2024-04-11 11:33:56
43	App\\Models\\User	8	angular-front	bcf28edd2cf2629c20d8ed1ac917240af4a3dc3f161178aff4896f2fac0ade10	["*"]	2024-04-11 11:34:33	2024-04-12 11:34:33	2024-04-11 11:34:33	2024-04-11 11:34:33
25	App\\Models\\User	1	angular-front	961de7d9cae5950d1eb99978bec33376be0cacfc3ef6669ef26e8b4962d92729	["*"]	2024-04-11 12:36:43	2024-04-12 08:35:37	2024-04-11 08:35:37	2024-04-11 12:36:43
44	App\\Models\\User	8	angular-front	4750a664217338bd8eee5ac302d279a1cc6730b877790ab30ef4e78e5e8792c1	["*"]	2024-04-11 11:35:15	2024-04-12 11:35:15	2024-04-11 11:35:15	2024-04-11 11:35:15
45	App\\Models\\User	7	angular-front	7cce38e2528976ffe5f3140c6075b6df3c98954edb028c59be6535e8235e99cf	["*"]	2024-04-11 11:36:05	2024-04-12 11:36:04	2024-04-11 11:36:04	2024-04-11 11:36:05
80	App\\Models\\User	16	angular-front	2b72f23d548c1a3ced40b9cb37bb4f57f7e292510a85bf4887c26de31a18ef10	["*"]	2024-04-17 15:48:01	2024-04-18 14:15:26	2024-04-17 14:15:26	2024-04-17 15:48:01
46	App\\Models\\User	6	angular-front	d155fba98eaa793aefe669033840d8453053b71d17067d2d499db305e9c810de	["*"]	2024-04-11 11:41:19	2024-04-12 11:40:22	2024-04-11 11:40:22	2024-04-11 11:41:19
68	App\\Models\\User	16	angular-front	d0077ce64ecaf5850a4662b320cbdc4d11c28a595cb22abd9e7ab77dbe7e388c	["*"]	2024-04-15 18:08:38	2024-04-16 12:26:57	2024-04-15 12:26:57	2024-04-15 18:08:38
66	App\\Models\\User	16	angular-front	fbbf44a23423f79dc9d4a2f4bb03b584c89d650966d4dd48bde31233ee16b6ff	["*"]	2024-04-15 12:26:18	2024-04-16 12:21:43	2024-04-15 12:21:43	2024-04-15 12:26:18
67	App\\Models\\User	16	angular-front	8ca9388a7d5436b173e9ef66a1b10b1422e1bb99cc37e8187c09202c266665c1	["*"]	\N	2024-04-16 12:26:46	2024-04-15 12:26:46	2024-04-15 12:26:46
58	App\\Models\\User	6	angular-front	e4262557405424c59e6bbe180b6fab27b42801622246d6f5ace87cf3fdfe0803	["*"]	2024-04-15 07:16:18	2024-04-16 07:15:12	2024-04-15 07:15:12	2024-04-15 07:16:18
49	App\\Models\\User	8	angular-front	29d67220f850e549c7e395138fc1e46f5fd9e582f214a77b73a1a751b79029ad	["*"]	2024-04-12 07:41:04	2024-04-13 07:03:50	2024-04-12 07:03:50	2024-04-12 07:41:04
60	App\\Models\\User	19	angular-front	f51a7490f295914d997139a303233ee385de78d1e5563d567170a589a44180e1	["*"]	2024-04-15 08:00:14	2024-04-16 07:27:20	2024-04-15 07:27:20	2024-04-15 08:00:14
59	App\\Models\\User	5	angular-front	681fa90df030bde9e2d91c80909eccc6ed1a5058c3d13f6b8133dc6202b232b9	["*"]	2024-04-15 07:17:26	2024-04-16 07:17:19	2024-04-15 07:17:19	2024-04-15 07:17:26
52	App\\Models\\User	7	angular-front	106b5d10e95b3a648dcbaf719330b07b1e354672b7c6eeca96e6c191ea31a0a6	["*"]	2024-04-12 12:39:36	2024-04-13 10:16:00	2024-04-12 10:16:00	2024-04-12 12:39:36
48	App\\Models\\User	7	angular-front	9b7755cea0a792678febe83bf8854ef4433c233726ec5047876b10c9dfb701e9	["*"]	2024-04-11 18:45:23	2024-04-12 15:56:54	2024-04-11 15:56:54	2024-04-11 18:45:23
64	App\\Models\\User	3	angular-front	5160a1039d5c532317032948776e8a6299a190d2edea668bf6964dd97fe38448	["*"]	2024-04-15 12:07:56	2024-04-16 10:13:34	2024-04-15 10:13:34	2024-04-15 12:07:56
53	App\\Models\\User	7	angular-front	59423a218af904e0ebc2452b83da2890793c334657bdfa88e26266b505a99947	["*"]	2024-04-12 12:53:11	2024-04-13 12:51:10	2024-04-12 12:51:11	2024-04-12 12:53:11
72	App\\Models\\User	16	angular-front	385ccd13853381bda52327129324469f06746ace16eb18f0e9b7619315b4270d	["*"]	2024-04-16 11:16:32	2024-04-17 11:12:46	2024-04-16 11:12:46	2024-04-16 11:16:32
73	App\\Models\\User	16	angular-front	a3f79b3f15f06337c287e7d83f47866773734195244c39915224bdbf5b314697	["*"]	\N	2024-04-17 11:23:38	2024-04-16 11:23:38	2024-04-16 11:23:38
74	App\\Models\\User	16	angular-front	c8391f6d2247f823256bfc556bada5a1c9a3d3e1256df9ede10052d49c52e223	["*"]	\N	2024-04-17 11:24:35	2024-04-16 11:24:35	2024-04-16 11:24:35
54	App\\Models\\User	7	angular-front	65288eefce03cc9a5360433ff42dea17522722cab3a9183249e36b5f4a12e694	["*"]	2024-04-12 12:57:05	2024-04-13 12:55:49	2024-04-12 12:55:49	2024-04-12 12:57:05
62	App\\Models\\User	16	angular-front	3c62b3c087cf789304883d54df417f9c1a460ddf3164c4be65e8738eb659daea	["*"]	2024-04-15 08:28:44	2024-04-16 08:08:30	2024-04-15 08:08:30	2024-04-15 08:28:44
50	App\\Models\\User	13	angular-front	b9255857c0a5d4a7408f37e33a7e33d77709c384c5c386cc856e4f8bc3f54810	["*"]	2024-04-12 10:13:49	2024-04-13 08:01:33	2024-04-12 08:01:33	2024-04-12 10:13:49
55	App\\Models\\User	7	angular-front	58386da72f649f68fc4167adddd9b641d97cb494de1d305fceab9747ff0e2fb6	["*"]	2024-04-12 12:59:35	2024-04-13 12:59:27	2024-04-12 12:59:27	2024-04-12 12:59:35
51	App\\Models\\User	6	angular-front	072d5abc79b1c837b251e5b342157ccada1cb9a02503c88deb046defc888af91	["*"]	2024-04-12 10:14:55	2024-04-13 10:14:48	2024-04-12 10:14:48	2024-04-12 10:14:55
47	App\\Models\\User	1	angular-front	325fbfcf91b16e0f149d5480a9da8ece786ac64a4a8727f124156b092df3e9ad	["*"]	2024-04-12 08:15:19	2024-04-12 15:36:22	2024-04-11 15:36:22	2024-04-12 08:15:19
56	App\\Models\\User	9	angular-front	baee54b3ee749bb132b899d06cefa18e464ee113447afda014d664d9f097829a	["*"]	2024-04-15 07:10:19	2024-04-16 07:01:23	2024-04-15 07:01:23	2024-04-15 07:10:19
75	App\\Models\\User	16	angular-front	f729e559345b9994624a040cc5c172ed86deb83e7b8eb1a8194b6fa9962ecf10	["*"]	\N	2024-04-17 11:26:07	2024-04-16 11:26:07	2024-04-16 11:26:07
76	App\\Models\\User	16	angular-front	2f9398f78744fe4ada15b9b7932ab7d975f89e8312c7a7136ad7395da1a19bd7	["*"]	2024-04-16 12:40:35	2024-04-17 11:28:06	2024-04-16 11:28:06	2024-04-16 12:40:35
57	App\\Models\\User	8	angular-front	43e32784a896765297df1a7b19c3ddbb318a49ea13f90913b313a8fad6fbb803	["*"]	2024-04-15 07:14:14	2024-04-16 07:12:11	2024-04-15 07:12:11	2024-04-15 07:14:14
63	App\\Models\\User	3	angular-front	549a03f9ff2a490b63d5f5c79667f310d055ffae72703dc05eb7fd442bdd48f7	["*"]	2024-04-15 10:10:07	2024-04-16 08:30:07	2024-04-15 08:30:07	2024-04-15 10:10:07
65	App\\Models\\User	16	angular-front	d074997afe8eaa3e26f8c64e7a0abd29d0788faae177a81a82050b866c12b54f	["*"]	2024-04-15 12:40:15	2024-04-16 12:09:27	2024-04-15 12:09:27	2024-04-15 12:40:15
79	App\\Models\\User	16	angular-front	6b004cc952722ea2812c8de555642109958fd8e7012d497c85b89d052e4b505b	["*"]	2024-04-17 14:15:26	2024-04-18 11:10:59	2024-04-17 11:10:59	2024-04-17 14:15:26
69	App\\Models\\User	16	angular-front	76bc224b392d671b12a30c04fcfb4cbc02c47b10399d1fba66af839afd3f7c83	["*"]	2024-04-16 11:06:19	2024-04-17 10:58:28	2024-04-16 10:58:28	2024-04-16 11:06:19
70	App\\Models\\User	16	angular-front	aa264ff7b3865c9dc13b5d26e5be9e1ab14980feb67f0360578ad0e6f1e48311	["*"]	\N	2024-04-17 11:07:48	2024-04-16 11:07:48	2024-04-16 11:07:48
61	App\\Models\\User	16	angular-front	fc83d223cff2fb44a1bd63a640362d9c0444d04d6309fbdd453d1f001ee8192d	["*"]	2024-04-15 12:20:17	2024-04-16 08:06:23	2024-04-15 08:06:23	2024-04-15 12:20:17
71	App\\Models\\User	16	angular-front	618177db26d143972b390a5d5b2b3d9aff83b2bd83fa4ec4a24356bcf9e7fd80	["*"]	\N	2024-04-17 11:11:21	2024-04-16 11:11:21	2024-04-16 11:11:21
78	App\\Models\\User	16	angular-front	448e52a29b3d72c6bfc44fe993d69a7f711e2d448505c4e84ecae17541e19083	["*"]	2024-04-17 11:07:57	2024-04-18 11:04:04	2024-04-17 11:04:04	2024-04-17 11:07:57
81	App\\Models\\User	6	angular-front	d3774f744e5a684ec6cdbb927d45fa72d3548ac3e8c62e484a68f1e404014c39	["*"]	2024-04-17 16:28:37	2024-04-18 15:48:01	2024-04-17 15:48:01	2024-04-17 16:28:37
77	App\\Models\\User	16	angular-front	70d958363582c35648ecebf07a7bd1bc72fb10aa985e25b2191c618489f8e503	["*"]	2024-04-16 12:48:19	2024-04-17 12:46:32	2024-04-16 12:46:32	2024-04-16 12:48:19
83	App\\Models\\User	6	angular-front	1642b328961d03314e1475f9e93acd03c18fe3d6095a2e7f0e0688bb5734e448	["*"]	2024-04-18 11:41:21	2024-04-18 16:05:10	2024-04-17 16:05:10	2024-04-18 11:41:21
82	App\\Models\\User	16	angular-front	42fc100a2907d295c3e26306126aede4943a21575bccd5e9c3a1e45f61c69162	["*"]	2024-04-17 16:04:29	2024-04-18 15:57:51	2024-04-17 15:57:51	2024-04-17 16:04:29
95	App\\Models\\User	16	angular-front	b17e9a4a59c91d9f330f259a30e42184cfc19b04ed0321088532f84a11e3fc4f	["*"]	2024-04-19 07:40:47	2024-04-20 07:39:44	2024-04-19 07:39:44	2024-04-19 07:40:47
96	App\\Models\\User	16	angular-front	c9208538e77e4735b6f91125913fb6f4c45b2747a7771d945928bcc91c9ed793	["*"]	2024-04-19 07:41:38	2024-04-20 07:40:46	2024-04-19 07:40:46	2024-04-19 07:41:38
98	App\\Models\\User	16	angular-front	6c023fe8755efad6f1a7ad63d7cacafe83bf4756ce62fe791e609eca326b31c6	["*"]	2024-04-19 07:45:13	2024-04-20 07:45:12	2024-04-19 07:45:12	2024-04-19 07:45:13
104	App\\Models\\User	6	angular-front	deed45d8d9235dda6fa6ff913682f0da018d7329b41a670fabf252f1bc4191ce	["*"]	2024-04-22 10:13:40	2024-04-23 10:13:39	2024-04-22 10:13:39	2024-04-22 10:13:40
114	App\\Models\\User	6	angular-front	ead2f915fb6f86fa3ae83916e8ca3492fd46e00241ce4746e18bad80b4149e34	["*"]	2024-04-23 06:21:07	2024-04-24 06:21:06	2024-04-23 06:21:06	2024-04-23 06:21:07
116	App\\Models\\User	16	angular-front	92a60d76878d52e64ba1ded2719b59726d06a76d6a73fcd333fee6ba239c6c05	["*"]	2024-04-23 08:49:51	2024-04-24 08:49:50	2024-04-23 08:49:50	2024-04-23 08:49:51
119	App\\Models\\User	6	angular-front	7477f3951881b0f19b3f26fe65c0015f41a407cdfa2cfac63ad8d86c5b6c9ebb	["*"]	2024-04-23 08:57:43	2024-04-24 08:55:21	2024-04-23 08:55:21	2024-04-23 08:57:43
84	App\\Models\\User	16	angular-front	97084fad11b5c7f097a9aae0682d8329fd2b814f5ca0ac1da9b35a413e4b130a	["*"]	2024-04-17 16:51:48	2024-04-18 16:28:37	2024-04-17 16:28:37	2024-04-17 16:51:48
122	App\\Models\\User	6	angular-front	6c0178462a4f7638641cdff351e150fd42311aade0806f189aa92c29c2999e6a	["*"]	\N	2024-04-24 09:09:04	2024-04-23 09:09:04	2024-04-23 09:09:04
107	App\\Models\\User	16	angular-front	04dec011c0947159b3c0304533ba90a099348cf5fb5d6aaf05b8b45a0df18046	["*"]	2024-04-22 15:50:08	2024-04-23 11:56:25	2024-04-22 11:56:25	2024-04-22 15:50:08
109	App\\Models\\User	6	angular-front	847ce1e43d35e684f3e2f2857fa7dda266c412883a6fbbb2a32bac622dbe24ab	["*"]	\N	2024-04-23 17:05:36	2024-04-22 17:05:36	2024-04-22 17:05:36
115	App\\Models\\User	6	angular-front	e83106772772eb5dacf15f22d1a794a50199f2d7724e2c590b9826ed2ca4204a	["*"]	2024-04-23 11:00:19	2024-04-24 06:21:06	2024-04-23 06:21:06	2024-04-23 11:00:19
110	App\\Models\\User	6	angular-front	727de0e9259ebb07a850cf00451c15f5d27dba941b48df222aa7efaf6bd009ea	["*"]	\N	2024-04-23 17:06:20	2024-04-22 17:06:20	2024-04-22 17:06:20
111	App\\Models\\User	6	angular-front	db50dc031a11a3a89c86b4bd1c94d7347af95532febf5525827339978526ddad	["*"]	\N	2024-04-23 17:06:20	2024-04-22 17:06:20	2024-04-22 17:06:20
85	App\\Models\\User	9	angular-front	3c00824892cdabf896996ee9fd65743b46e3892831b67f88f68965804d0b1968	["*"]	2024-04-17 16:59:00	2024-04-18 16:51:48	2024-04-17 16:51:48	2024-04-17 16:59:00
88	App\\Models\\User	16	angular-front	739e3c68a40f933ea94c6d4ea4a180a6781aadd2fd0832d87541cb81a533ab9a	["*"]	2024-04-18 12:31:10	2024-04-19 10:19:02	2024-04-18 10:19:02	2024-04-18 12:31:10
118	App\\Models\\User	6	angular-front	c44244206b1dc512920a361bca008586726e426f06c020dfb7470d276ec4e843	["*"]	\N	2024-04-24 08:55:21	2024-04-23 08:55:21	2024-04-23 08:55:21
102	App\\Models\\User	6	angular-front	1effc9dddef15fcfe5429d4fb9f1cb6cc3689d58ff57d640bdbb8b327aebaa63	["*"]	\N	2024-04-23 08:05:55	2024-04-22 08:05:55	2024-04-22 08:05:55
99	App\\Models\\User	16	angular-front	5fd591bfe66392fa4dd4a4990edbdbba8a2973ed1ac34adc7f5751ff68d73724	["*"]	2024-04-19 09:54:53	2024-04-20 07:45:12	2024-04-19 07:45:12	2024-04-19 09:54:53
87	App\\Models\\User	16	angular-front	aee75d96b5c99959410eec0127367d4c3a82b22724e51d754b3c854f0c8e34fb	["*"]	2024-04-18 10:19:03	2024-04-18 17:57:00	2024-04-17 17:57:00	2024-04-18 10:19:03
86	App\\Models\\User	6	angular-front	5f6aca8371d11cea807e9626986d0eebb7227c2c39e8990e0676bd17c596cce3	["*"]	2024-04-17 17:57:00	2024-04-18 16:59:00	2024-04-17 16:59:00	2024-04-17 17:57:00
89	App\\Models\\User	16	angular-front	e0936776bf510e1605338d06c54294bfb077abb5a4b9b1e47049d2ffccd2201c	["*"]	2024-04-19 07:34:41	2024-04-20 07:31:04	2024-04-19 07:31:04	2024-04-19 07:34:41
91	App\\Models\\User	16	angular-front	5a48b67669989fbcf33b8587b62d2abe51b5d526a5a860ec0b2146edbe03cd60	["*"]	\N	2024-04-20 07:36:50	2024-04-19 07:36:50	2024-04-19 07:36:50
92	App\\Models\\User	16	angular-front	965623586a804747e66d56619d26ea7e639b57793ef416989a42945d1c33ece9	["*"]	\N	2024-04-20 07:37:37	2024-04-19 07:37:37	2024-04-19 07:37:37
90	App\\Models\\User	16	angular-front	712b2d9178182d28c9f84de18899535aa45f43df4488e0eacda56734331e002e	["*"]	2024-04-19 07:37:37	2024-04-20 07:36:49	2024-04-19 07:36:49	2024-04-19 07:37:37
94	App\\Models\\User	16	angular-front	ee1fbb210a28f9d19d1831c8c359a5afe2ce08905b1d0ea269a7c1ce2da15a22	["*"]	\N	2024-04-20 07:39:44	2024-04-19 07:39:44	2024-04-19 07:39:44
93	App\\Models\\User	16	angular-front	e33137f400342de5cb2bf769b74b5d20ad78ebd8af35525c5cd0c3bf3abdbae2	["*"]	2024-04-19 07:39:44	2024-04-20 07:37:37	2024-04-19 07:37:37	2024-04-19 07:39:44
100	App\\Models\\User	16	angular-front	b119620d256863256a95f2d7b755c690f376e646b4fdbc874130aa3b95ed9013	["*"]	2024-04-22 07:36:01	2024-04-23 07:36:00	2024-04-22 07:36:00	2024-04-22 07:36:01
101	App\\Models\\User	16	angular-front	f996b90937219c7cd24f520b460f40874cf8d30494169180ede41b29ffec58de	["*"]	2024-04-22 08:05:56	2024-04-23 07:36:00	2024-04-22 07:36:00	2024-04-22 08:05:56
112	App\\Models\\User	6	angular-front	3359f41900df428ba98af0b5b3487f443b7808e69c0cd4d2650c4a85985bb316	["*"]	\N	2024-04-23 17:07:07	2024-04-22 17:07:07	2024-04-22 17:07:07
97	App\\Models\\User	16	angular-front	c28b9f1757caf0003e5a42bff0596cb9c5b72a3a71700a890822178670142c6a	["*"]	\N	2024-04-20 07:40:46	2024-04-19 07:40:46	2024-04-19 07:40:46
103	App\\Models\\User	6	angular-front	83a529f8e7d08a17958e374d3886cd6ea1c69fc27fdb116895ee2765de00881a	["*"]	2024-04-22 11:54:45	2024-04-23 08:05:55	2024-04-22 08:05:55	2024-04-22 11:54:45
106	App\\Models\\User	16	angular-front	13e5bfb6f10e2418fdea238ab83ebe0b577556187d737f9e33052bf7b777f356	["*"]	\N	2024-04-23 11:56:24	2024-04-22 11:56:24	2024-04-22 11:56:24
105	App\\Models\\User	6	angular-front	0f1d60d3e5bf1e668a4f290b7f7b5314b22758b773afd6ad26b0784eddff48e2	["*"]	2024-04-22 11:56:24	2024-04-23 10:13:39	2024-04-22 10:13:39	2024-04-22 11:56:24
108	App\\Models\\User	6	angular-front	107af22ffe30e2183a617386c9b640e005cc746631dace331b75e828d0c1f3d4	["*"]	2024-04-22 17:07:07	2024-04-23 17:05:36	2024-04-22 17:05:36	2024-04-22 17:07:07
113	App\\Models\\User	6	angular-front	1892bbfce99c9789b22651f94820173a66c94cd65ca2684b40f9b9dc3fcaed9c	["*"]	2024-04-22 19:04:05	2024-04-23 17:07:07	2024-04-22 17:07:07	2024-04-22 19:04:05
117	App\\Models\\User	16	angular-front	5fbe746f0d844de983bcd0760d9051927a43e5ce2e77b65e6fc188f18b32c04e	["*"]	2024-04-23 08:55:22	2024-04-24 08:49:50	2024-04-23 08:49:50	2024-04-23 08:55:22
120	App\\Models\\User	16	angular-front	c09fb589db7009d7b92d06ed32a71d4be6c5df67ec046f3624dc4bedb03d7e6d	["*"]	\N	2024-04-24 08:57:43	2024-04-23 08:57:43	2024-04-23 08:57:43
121	App\\Models\\User	16	angular-front	9ebacc0f055232802b087334ce944c6c5bcc635eacfda2c1237d464431cba30d	["*"]	2024-04-23 09:09:04	2024-04-24 08:57:43	2024-04-23 08:57:43	2024-04-23 09:09:04
123	App\\Models\\User	6	angular-front	753cd2ddc7bfee22960a032c9c9a4ebe7b238c5c2af7d93b6842d991041dddb7	["*"]	2024-04-23 09:11:04	2024-04-24 09:09:04	2024-04-23 09:09:04	2024-04-23 09:11:04
124	App\\Models\\User	16	angular-front	abcf782943a7979f46c2366cf80e5921d3640d17e306e0a6b765225f257bc421	["*"]	\N	2024-04-24 09:11:04	2024-04-23 09:11:04	2024-04-23 09:11:04
130	App\\Models\\User	6	angular-front	c05bf2a433180811b94ab89b2625826502a4cee78a4ca6b721e36ffda3e33628	["*"]	2024-04-26 10:20:49	2024-04-27 08:50:22	2024-04-26 08:50:22	2024-04-26 10:20:49
155	App\\Models\\User	7	angular-front	043a0e6bd6004c0318016abdf55ef1ce0e47210c70d37199eb6a0d798da6467e	["*"]	2024-05-01 20:53:10	2024-05-02 18:31:47	2024-05-01 18:31:47	2024-05-01 20:53:10
161	App\\Models\\User	13	angular-front	3e1eff9ef37ee629d54f642d0eb1e7f52faf38271ccfc5216de7c7685f91b1da	["*"]	2024-05-02 06:55:35	2024-05-03 06:55:31	2024-05-02 06:55:31	2024-05-02 06:55:35
146	App\\Models\\User	1	angular-front	3a904d32ab1e2f72a476b168139315f8caea326121a6a4a04b66362d35ac58a6	["*"]	\N	2024-05-02 14:03:35	2024-05-01 14:03:35	2024-05-01 14:03:35
145	App\\Models\\User	6	angular-front	86d7c7399056c63016c306b3272cbe06753b138b7dca1c8f71d3c20ed6a3bff4	["*"]	2024-05-01 14:03:36	2024-05-02 13:59:23	2024-05-01 13:59:23	2024-05-01 14:03:36
162	App\\Models\\User	13	angular-front	12c7beb44aff8902c99696b0751095cf9c61178753bb08df0a1414f8a8dca003	["*"]	\N	2024-05-03 06:57:47	2024-05-02 06:57:47	2024-05-02 06:57:47
159	App\\Models\\User	16	angular-front	aab09e00e56e144bbd3238cb8a75adee086f588abc6c8f74102007cb561ad4cd	["*"]	2024-05-02 04:37:10	2024-05-02 20:54:43	2024-05-01 20:54:43	2024-05-02 04:37:10
144	App\\Models\\User	6	angular-front	be8240c10e86bafb49fc5ebf9671bacab1962d4e7fb3f3bb5f88e7e735cb7766	["*"]	\N	2024-05-02 13:59:23	2024-05-01 13:59:23	2024-05-01 13:59:23
139	App\\Models\\User	16	angular-front	946affa3df0f746e2016facb244b6aa0a6ca7672ba4a3d4a26aaabe29bb3b26f	["*"]	\N	2024-04-30 12:11:29	2024-04-29 12:11:29	2024-04-29 12:11:29
143	App\\Models\\User	16	angular-front	746fb372f62487f41f898bd227abadd483ab17d0f642ad75d123b043fe0d833e	["*"]	2024-05-01 13:59:23	2024-05-02 13:50:48	2024-05-01 13:50:48	2024-05-01 13:59:23
136	App\\Models\\User	6	angular-front	45d2f11003b28bfcf63fbfc36236a58add94cabed6cdf501ff1238984ef0e6fd	["*"]	2024-04-29 13:10:13	2024-04-30 11:20:07	2024-04-29 11:20:07	2024-04-29 13:10:13
149	App\\Models\\User	7	angular-front	4ae8631143355d09e56abe4983bf81d1992ba1c94af8a46661d3c0f185b145a7	["*"]	2024-05-01 15:43:54	2024-05-02 14:05:52	2024-05-01 14:05:52	2024-05-01 15:43:54
151	App\\Models\\User	7	angular-front	b1e28e1375b33c28c41075b9869f1c0bc2687aa89b86fe90d5af60b107e4e34a	["*"]	2024-05-01 16:23:23	2024-05-02 16:23:23	2024-05-01 16:23:23	2024-05-01 16:23:23
163	App\\Models\\User	13	angular-front	b95c2ad129a3d2b10c7f27a1afe8b20d85652d1a744d2563cd737c508c6679eb	["*"]	\N	2024-05-03 06:58:13	2024-05-02 06:58:13	2024-05-02 06:58:13
135	App\\Models\\User	6	angular-front	df52952f680566a5f160c75fbd23a895c9f657d44264efbfcfe0767ff9e59234	["*"]	2024-04-26 19:20:18	2024-04-27 18:58:17	2024-04-26 18:58:17	2024-04-26 19:20:18
129	App\\Models\\User	6	angular-front	36fa2b8d9da3581de28502ab9c5389fb01baa559432cc25f94c579f267d9409a	["*"]	2024-04-26 08:10:19	2024-04-27 07:03:57	2024-04-26 07:03:57	2024-04-26 08:10:19
127	App\\Models\\User	6	angular-front	3f44f6c8864ad0acf28aa97a4f83bfc9e323716085b4f9a7651635d993b3d992	["*"]	2024-04-24 12:20:18	2024-04-25 09:24:35	2024-04-24 09:24:35	2024-04-24 12:20:18
128	App\\Models\\User	6	angular-front	ebaa5beedddd615ba201b079c55c2090b78d5ac3d248d916916d28a59879447f	["*"]	2024-04-26 07:03:58	2024-04-27 07:03:57	2024-04-26 07:03:57	2024-04-26 07:03:58
125	App\\Models\\User	16	angular-front	42e977db9eac9bb8b47102a3824f396948d1315c94964cc250de003a6883cbe7	["*"]	2024-04-23 12:45:01	2024-04-24 09:11:04	2024-04-23 09:11:04	2024-04-23 12:45:01
126	App\\Models\\User	6	angular-front	cf0353f4d5d1a784e850d7be904d3081653a94d8d164038fa8dbd2cb98a50424	["*"]	2024-04-24 09:24:35	2024-04-25 09:24:34	2024-04-24 09:24:34	2024-04-24 09:24:35
131	App\\Models\\User	6	angular-front	f0f93d0b4029d13e60fb2f880f8eb5e1b9cc3359faa063a454b897f05bdd749f	["*"]	2024-04-26 08:50:23	2024-04-27 08:50:22	2024-04-26 08:50:22	2024-04-26 08:50:23
137	App\\Models\\User	6	angular-front	850edbed530066bac4b406714ccdb9280d4c00cf0721302a8c64a0b8f2008c59	["*"]	2024-04-29 11:20:09	2024-04-30 11:20:07	2024-04-29 11:20:07	2024-04-29 11:20:09
134	App\\Models\\User	6	angular-front	f9fb456bb4f924843fedb785a5db2ad6507a4f2e526afcc569737fea4bebd6ff	["*"]	\N	2024-04-27 18:58:17	2024-04-26 18:58:17	2024-04-26 18:58:17
133	App\\Models\\User	6	angular-front	37a2fb774b570e7e8d41db491198160ae19ed2821ad18fd22e0f7b7c645b5195	["*"]	2024-04-26 18:58:17	2024-04-27 10:20:48	2024-04-26 10:20:48	2024-04-26 18:58:17
138	App\\Models\\User	16	angular-front	d808481e580c9d7cffe7b69948daf3c8eaacbc419413404182dbf26a3cd42528	["*"]	2024-04-29 13:12:19	2024-04-30 12:11:29	2024-04-29 12:11:29	2024-04-29 13:12:19
141	App\\Models\\User	16	angular-front	8f66a6f0ee1b9d29f700a53bbf5856667891e45ff751d0cfb81a01a863620c2e	["*"]	2024-04-30 08:20:47	2024-05-01 08:20:46	2024-04-30 08:20:46	2024-04-30 08:20:47
148	App\\Models\\User	7	angular-front	726ac2da7679fdc0487a65fa430145d2e9af45fc39b30356f33d1e79152afe39	["*"]	\N	2024-05-02 14:05:52	2024-05-01 14:05:52	2024-05-01 14:05:52
132	App\\Models\\User	6	angular-front	95630356c49827a30d25f161851212d583c7e9cc1ec0dbe67a90c5a4b0608ccb	["*"]	\N	2024-04-27 10:20:48	2024-04-26 10:20:48	2024-04-26 10:20:48
147	App\\Models\\User	1	angular-front	f5238578540b31d61916317eb26db670e791c720a9c049310e26b9ac338ddf6b	["*"]	2024-05-01 14:05:52	2024-05-02 14:03:35	2024-05-01 14:03:35	2024-05-01 14:05:52
150	App\\Models\\User	7	angular-front	914e0d469bbb83307b62abeade7cf92de8e1bfb0532b4dcee69404f3264198df	["*"]	2024-05-02 04:39:29	2024-05-02 16:23:23	2024-05-01 16:23:23	2024-05-02 04:39:29
140	App\\Models\\User	16	angular-front	91323b0f8b96675471741f5eeb7aa4dd15e8403313c50d7816d31cb5d4b0a996	["*"]	2024-04-30 08:25:03	2024-05-01 08:20:46	2024-04-30 08:20:46	2024-04-30 08:25:03
142	App\\Models\\User	16	angular-front	26d4c0e5c60b2f7a457a697995758c0d7140c5b7bce874be01b99154bfd45bd3	["*"]	\N	2024-05-02 13:50:48	2024-05-01 13:50:48	2024-05-01 13:50:48
158	App\\Models\\User	16	angular-front	868b42da94ed8c73683fec8ca012567023edfb88a0a7965348aeb21b69d7945d	["*"]	\N	2024-05-02 20:54:43	2024-05-01 20:54:43	2024-05-01 20:54:43
152	App\\Models\\User	5	angular-front	197d878e3bc0eb2adf3c9ad3be79c889f5d6fd5851ba723aa3b2a7e1813e0152	["*"]	\N	2024-05-02 18:18:04	2024-05-01 18:18:04	2024-05-01 18:18:04
157	App\\Models\\User	17	angular-front	0b5707d5338fc01b5c1c168dedbb1629c86ec476de446b67a7ae8fd4a82d7119	["*"]	2024-05-01 20:54:44	2024-05-02 20:53:10	2024-05-01 20:53:10	2024-05-01 20:54:44
160	App\\Models\\User	13	angular-front	18739fe20d4b8f7f31da3d49be60fa74e35a46faa8edb54cb76186e1c2c5335e	["*"]	\N	2024-05-03 06:55:30	2024-05-02 06:55:30	2024-05-02 06:55:30
154	App\\Models\\User	7	angular-front	0295630cef5401ddea120146fb6c8f4faf78a81b31c18c9665d3122e8172e0a5	["*"]	\N	2024-05-02 18:31:47	2024-05-01 18:31:47	2024-05-01 18:31:47
164	App\\Models\\User	13	angular-front	30b389f3fcdd1f8a3cb20c793887ef4ed2c699a954035e09a9403d24436c11fe	["*"]	\N	2024-05-03 07:00:46	2024-05-02 07:00:46	2024-05-02 07:00:46
153	App\\Models\\User	5	angular-front	fd60908b1025f44df6044ab34d84a55bd9f0775e59f158d98b17e78e0deb194e	["*"]	2024-05-01 18:31:47	2024-05-02 18:18:05	2024-05-01 18:18:05	2024-05-01 18:31:47
156	App\\Models\\User	17	angular-front	5de25813bfb050bd23c58397d8c9c6749941acc3795a270b044cd5e253d66f1e	["*"]	\N	2024-05-02 20:53:09	2024-05-01 20:53:09	2024-05-01 20:53:09
165	App\\Models\\User	13	angular-front	7707370ed5b3948312398f49ce4cc98b7a1481e426eb68edc38d4ac77b278be2	["*"]	2024-05-02 07:19:42	2024-05-03 07:00:46	2024-05-02 07:00:46	2024-05-02 07:19:42
166	App\\Models\\User	13	angular-front	3960ef5a96927444a9c81c0195e02e6525c6102ca1f7901df5fe848667b9fa82	["*"]	\N	2024-05-03 07:17:51	2024-05-02 07:17:51	2024-05-02 07:17:51
167	App\\Models\\User	13	angular-front	c5cb01ddc28613513302cf70151c686e678e2dfdd5a737557ce9700c7a7facf2	["*"]	\N	2024-05-03 07:17:51	2024-05-02 07:17:51	2024-05-02 07:17:51
168	App\\Models\\User	13	angular-front	36fee4a6bcd6c840a44896bffa729a8257076490a33c86e96c4d9874071863d3	["*"]	\N	2024-05-03 07:19:42	2024-05-02 07:19:42	2024-05-02 07:19:42
170	App\\Models\\User	13	angular-front	8ff3d96e29f751a1c4dba4243f627842227f65e4272c97bcbd7761f7d0a36a95	["*"]	\N	2024-05-03 07:28:30	2024-05-02 07:28:30	2024-05-02 07:28:30
169	App\\Models\\User	13	angular-front	4b1baf23f9d6f5a71f44c1157fcd3a0ac17ec57173ce4efd40bf801ecf85bea4	["*"]	2024-05-02 07:28:30	2024-05-03 07:19:42	2024-05-02 07:19:42	2024-05-02 07:28:30
198	App\\Models\\User	37	angular-front	abac4c78c0a7ac6dd9a680a36ce66cba4d4b072539e87938a47b9d245451d666	["*"]	2024-05-16 08:56:30	2024-05-17 06:55:51	2024-05-16 06:55:51	2024-05-16 08:56:30
171	App\\Models\\User	13	angular-front	f32d781246fb740af43a1990921538ee1fbc5a5237bf29ebcc7dbedcd4d2c6ac	["*"]	2024-05-02 07:33:44	2024-05-03 07:28:30	2024-05-02 07:28:30	2024-05-02 07:33:44
172	App\\Models\\User	13	angular-front	fca93123bd42aadb3abd460b29b45c2c7a3c3a1f890429d784fbf478ce09fd47	["*"]	2024-05-02 07:33:45	2024-05-03 07:31:45	2024-05-02 07:31:45	2024-05-02 07:33:45
195	App\\Models\\User	37	angular-front	7f1e3b9042b2bc0232a38f768306ffc356a6208b211b67dfcf94760f0da98fa5	["*"]	\N	2024-05-16 12:51:30	2024-05-15 12:51:30	2024-05-15 12:51:30
194	App\\Models\\User	16	angular-front	57d02582e084d9d22bdc3725c828ad39a421ba125f38d2e37dfe01dfd5c9071a	["*"]	2024-05-15 12:51:31	2024-05-16 12:49:49	2024-05-15 12:49:49	2024-05-15 12:51:31
182	App\\Models\\User	39	angular-front	38c30985aabb5357a4bf71c6816fa104ac72280c3c09799b6984450ff9b7b5ee	["*"]	\N	2024-05-03 11:12:51	2024-05-02 11:12:51	2024-05-02 11:12:51
183	App\\Models\\User	39	angular-front	2a4b995f701e1ab5763d610a83e7842172f0de59bffd01e744684f42360ee0a7	["*"]	\N	2024-05-03 11:12:51	2024-05-02 11:12:51	2024-05-02 11:12:51
204	App\\Models\\User	37	angular-front	438dae760a6006e5b902aaf5abb4f8b28187ea777e58980d780a2f181b5c72f4	["*"]	2024-05-16 12:53:27	2024-05-17 11:05:24	2024-05-16 11:05:24	2024-05-16 12:53:27
184	App\\Models\\User	16	angular-front	be75f9a9990daeb447cc1f97a18ca47b1a72a81208766f5e1b5d1df8da8230c8	["*"]	\N	2024-05-03 11:14:12	2024-05-02 11:14:12	2024-05-02 11:14:12
174	App\\Models\\User	16	angular-front	13e8ae56f50d541ca56c1ebac3793c004dd46d7466a13d204e7f53f5e6557f13	["*"]	\N	2024-05-03 10:00:55	2024-05-02 10:00:55	2024-05-02 10:00:55
175	App\\Models\\User	16	angular-front	713d7d1e2c8cee906c6a86dbd1c20cff0f3c2691db2dfe4376d5da45c6315b41	["*"]	\N	2024-05-03 10:00:55	2024-05-02 10:00:55	2024-05-02 10:00:55
181	App\\Models\\User	16	angular-front	9fddadb2247d1472e1d25c20fcb0cc958047d0c00c863b6ce3805333d20002f0	["*"]	2024-05-02 11:14:13	2024-05-03 10:59:56	2024-05-02 10:59:56	2024-05-02 11:14:13
176	App\\Models\\User	13	angular-front	8204d4bc0e769fb1be937628e9271e747bb853d3dad036b947137d570fc720b9	["*"]	\N	2024-05-03 10:01:45	2024-05-02 10:01:45	2024-05-02 10:01:45
173	App\\Models\\User	13	angular-front	5a24afa3e92359ced5e4017c2242d5cdd250de90298f43075271cac873ba95d9	["*"]	2024-05-02 10:01:46	2024-05-03 07:31:45	2024-05-02 07:31:45	2024-05-02 10:01:46
178	App\\Models\\User	37	angular-front	d452a52fe440fef7a48a3970934cde196b284c09d801b125be39882461f136a0	["*"]	\N	2024-05-03 10:28:12	2024-05-02 10:28:12	2024-05-02 10:28:12
177	App\\Models\\User	13	angular-front	5a2d1dbd92cba509b656c82de16165748e67dd2d8267645de4d6f83c8138a8a2	["*"]	2024-05-02 10:28:13	2024-05-03 10:01:45	2024-05-02 10:01:45	2024-05-02 10:28:13
197	App\\Models\\User	37	angular-front	556d98a6c95dd2cc8f5df0c57353949148e94043d4f8dbafad5ce0ec4ead4e6b	["*"]	\N	2024-05-17 06:55:49	2024-05-16 06:55:49	2024-05-16 06:55:49
190	App\\Models\\User	6	angular-front	38bc68d30bb9e5f91f3a93bcbb5818a0b4b7acfce6d9dbe8b1b8970d6ca2e881	["*"]	2024-05-10 10:28:03	2024-05-11 08:05:57	2024-05-10 08:05:57	2024-05-10 10:28:03
189	App\\Models\\User	6	angular-front	8ec30f569ffb05bcfe93497525c35ece24063e9e072805a7ac09adb26cdb7bb0	["*"]	\N	2024-05-11 08:05:55	2024-05-10 08:05:55	2024-05-10 08:05:55
188	App\\Models\\User	7	angular-front	9a64eaf4c7b7d207808de0f75eea4a98b5409efb96975d2be7be30ff17fbf647	["*"]	2024-05-10 08:05:55	2024-05-11 07:42:49	2024-05-10 07:42:49	2024-05-10 08:05:55
196	App\\Models\\User	37	angular-front	d2e939abbc153288a98765fd5d260ad99daac289a8d0ada8f71656d198c22b05	["*"]	2024-05-16 06:55:50	2024-05-16 12:51:30	2024-05-15 12:51:30	2024-05-16 06:55:50
180	App\\Models\\User	16	angular-front	48c4dc25ef5fea4028ed42e73204743fe1d4cae7fae3542c293de0b0e1b3ed44	["*"]	\N	2024-05-03 10:59:56	2024-05-02 10:59:56	2024-05-02 10:59:56
179	App\\Models\\User	37	angular-front	fe97c32f7751b3d28eecdfae93a5bfeefc5b36bee2137ea74a537a47d6dbb2ce	["*"]	2024-05-02 10:59:56	2024-05-03 10:28:13	2024-05-02 10:28:13	2024-05-02 10:59:56
203	App\\Models\\User	37	angular-front	8d0d5cda2711b2f82608cd86ccd01dcb829fc0b3efb8c66d514fd8d4da38e54a	["*"]	\N	2024-05-17 11:05:24	2024-05-16 11:05:24	2024-05-16 11:05:24
186	App\\Models\\User	40	angular-front	60be3ce2fbbcf6c6fe9e1c611f38bb9da4bf87868ebe4b3240f0da6aa1f4f256	["*"]	\N	2024-05-03 11:21:29	2024-05-02 11:21:29	2024-05-02 11:21:29
185	App\\Models\\User	16	angular-front	79b31c23691ffebced271bed84ec0513a55b767071dc809b50d22fb824a49810	["*"]	2024-05-02 11:21:29	2024-05-03 11:14:12	2024-05-02 11:14:12	2024-05-02 11:21:29
187	App\\Models\\User	7	angular-front	9f8238805d44b77b6eb626036a48778591ec88d9e9dce665657ae5c497e60ecc	["*"]	\N	2024-05-11 07:42:49	2024-05-10 07:42:49	2024-05-10 07:42:49
201	App\\Models\\User	45	angular-front	0f153bb009d3e92f429d8f6702840a9f18ae979647d02e0b86b80b11577f3ef3	["*"]	\N	2024-05-17 10:24:28	2024-05-16 10:24:28	2024-05-16 10:24:28
191	App\\Models\\User	16	angular-front	375ef2cb10315a19d489f3c5752e4a8f187c8c94b6acfe708dc92656bb34f215	["*"]	2024-05-10 12:04:43	2024-05-11 10:21:02	2024-05-10 10:21:02	2024-05-10 12:04:43
193	App\\Models\\User	16	angular-front	3e636ab7689ca307aca89acb8315f1366bbf4ba05ac384cc9d45d7738dae56e4	["*"]	\N	2024-05-16 12:49:46	2024-05-15 12:49:46	2024-05-15 12:49:46
192	App\\Models\\User	16	angular-front	8e8eca122d9fe102f485d598bc7a841b57bc46122b2b5e2819b801448cbdbc10	["*"]	\N	2024-05-11 10:21:02	2024-05-10 10:21:02	2024-05-10 10:21:02
200	App\\Models\\User	45	angular-front	3d478a153b034c8ee155b3ececcd9d9b97e063dde7337c67641d0cf3b68edc03	["*"]	2024-05-16 10:24:29	2024-05-17 08:56:31	2024-05-16 08:56:31	2024-05-16 10:24:29
202	App\\Models\\User	45	angular-front	98e4ebb83c76250196a92f7e6a375e6ddb388e90db6171bcd79c7e6b5719b31c	["*"]	2024-05-16 11:05:25	2024-05-17 10:24:28	2024-05-16 10:24:28	2024-05-16 11:05:25
199	App\\Models\\User	45	angular-front	bfcffc0982dca04753572847d4187c69f6bf6d6c8bfccb6234bbd4f0141d8495	["*"]	\N	2024-05-17 08:56:29	2024-05-16 08:56:29	2024-05-16 08:56:29
205	App\\Models\\User	16	angular-front	ec7550f77c040219c266563e2aebee56b6a1e4b63034b285a2a67e70f75af114	["*"]	\N	2024-05-19 07:20:10	2024-05-18 07:20:11	2024-05-18 07:20:11
206	App\\Models\\User	16	angular-front	8cd2694d27ef1bccecc672ae41e212fb52294cfb32b92d5cb639bd387ecfbb36	["*"]	2024-05-18 09:15:32	2024-05-19 07:20:12	2024-05-18 07:20:12	2024-05-18 09:15:32
208	App\\Models\\User	16	angular-front	ef6d7982819442316700e677039f96cf308808bc5360332163fe6a6c3f758621	["*"]	\N	2024-05-22 06:50:12	2024-05-21 06:50:12	2024-05-21 06:50:12
207	App\\Models\\User	16	angular-front	fb876dcf113dd20557b5e66a976becc8bbee8729e30ec3f1921759aa61fc970c	["*"]	2024-05-21 11:31:16	2024-05-22 06:50:12	2024-05-21 06:50:12	2024-05-21 11:31:16
236	App\\Models\\User	46	angular-front	351fd56e5814aa20889f24b5bfbf0946347cfd89f60fe594f90ca3b97dd99780	["*"]	2024-05-22 12:17:17	2024-05-23 12:15:50	2024-05-22 12:15:50	2024-05-22 12:17:17
211	App\\Models\\User	16	angular-front	d0be1288a413224448800e2baa7de61f97a9a9d1c3632703796bc7bed8213ae0	["*"]	\N	2024-05-22 11:32:18	2024-05-21 11:32:18	2024-05-21 11:32:18
209	App\\Models\\User	16	angular-front	530f022d06f0f463773ddd37e62dcf17d51326abe5913024e50f18dfa931a9d5	["*"]	2024-05-21 11:32:19	2024-05-22 11:31:15	2024-05-21 11:31:15	2024-05-21 11:32:19
242	App\\Models\\User	16	angular-front	c71fcf7801d16b5904f96660408653e0945049f83941e2f644fd2f5f7bf14f7e	["*"]	2024-05-23 08:07:31	2024-05-23 12:22:06	2024-05-22 12:22:06	2024-05-23 08:07:31
213	App\\Models\\User	16	angular-front	e661f46c825aab5ba59b73eae57af717097a01eeb67e51b3e2d9fc10f1d28c66	["*"]	\N	2024-05-22 11:34:42	2024-05-21 11:34:42	2024-05-21 11:34:42
214	App\\Models\\User	16	angular-front	6ccd00cd4dab1aa843a1e88a59d3beed8377290946f9df72b66e9f0489dd94c1	["*"]	\N	2024-05-22 11:34:42	2024-05-21 11:34:42	2024-05-21 11:34:42
241	App\\Models\\User	16	angular-front	3d03d8e49f541ede0be58a441278766a807c124e2a0b4b15d2bd9e86abd19fd1	["*"]	\N	2024-05-23 12:22:06	2024-05-22 12:22:06	2024-05-22 12:22:06
215	App\\Models\\User	6	angular-front	507cb0f178225efd3ef9ce150f5df7c010338d5d09f11223d20398a2637dbb74	["*"]	\N	2024-05-22 11:35:23	2024-05-21 11:35:23	2024-05-21 11:35:23
216	App\\Models\\User	6	angular-front	24a924c1c5c68d4371d20b1d87c886996a45a712e5f26acf0c03aa26e5d27be2	["*"]	\N	2024-05-22 11:35:54	2024-05-21 11:35:54	2024-05-21 11:35:54
212	App\\Models\\User	16	angular-front	037f469f86c32f5519374d1f9e99c66b856edc12f0be553fa2f1cd31dce7de1d	["*"]	2024-05-21 11:35:55	2024-05-22 11:32:18	2024-05-21 11:32:18	2024-05-21 11:35:55
227	App\\Models\\User	6	angular-front	4c043a27c31d6aa507f45a7efba721019de6c5b1bcf128aa59fe7dca27053483	["*"]	2024-05-21 12:07:18	2024-05-22 11:58:19	2024-05-21 11:58:19	2024-05-21 12:07:18
232	App\\Models\\User	3	angular-front	d990f7027f02a8b46621c6adca21198a7cb994c027f9f19112ffeafe68eb36ea	["*"]	\N	2024-05-23 07:26:02	2024-05-22 07:26:02	2024-05-22 07:26:02
218	App\\Models\\User	6	angular-front	75df7b75f37a4ac206830de0796756d1d3711130890e6495c2607d7cdfac0cc5	["*"]	\N	2024-05-22 11:39:47	2024-05-21 11:39:47	2024-05-21 11:39:47
217	App\\Models\\User	6	angular-front	c0dbeeb7089e62f04432d8214e197e972d69fbeb85f23bf273239925a1838722	["*"]	2024-05-21 11:39:47	2024-05-22 11:35:54	2024-05-21 11:35:54	2024-05-21 11:39:47
229	App\\Models\\User	3	angular-front	2d06427f20a54d581721c7610d201ce0bad51bf774624a918caa925684e12535	["*"]	\N	2024-05-22 12:08:11	2024-05-21 12:08:12	2024-05-21 12:08:12
220	App\\Models\\User	6	angular-front	82c69f74a5ab30c24f6c63b5cdb0b385ba225f5d1b57e60954465be732646d48	["*"]	\N	2024-05-22 11:45:44	2024-05-21 11:45:44	2024-05-21 11:45:44
219	App\\Models\\User	6	angular-front	0e1668557cd3c1b88f517e3b7db0fb62540091dc06e46722086df13bc9992d84	["*"]	2024-05-21 11:45:44	2024-05-22 11:39:47	2024-05-21 11:39:47	2024-05-21 11:45:44
226	App\\Models\\User	6	angular-front	901b0ce00af4b0a2a01cd8dee8359a6c35d918d76be5f2f416b7435525450812	["*"]	\N	2024-05-22 11:58:19	2024-05-21 11:58:19	2024-05-21 11:58:19
222	App\\Models\\User	6	angular-front	50882df4640975474bcbd32b22c4f5561e138a7be752c1653ebb8427a04e4975	["*"]	\N	2024-05-22 11:46:08	2024-05-21 11:46:08	2024-05-21 11:46:08
223	App\\Models\\User	6	angular-front	b514691df038cde9655ccbd9224e4ce369dc57193fa19d5aab35bfaba6658380	["*"]	\N	2024-05-22 11:46:08	2024-05-21 11:46:08	2024-05-21 11:46:08
224	App\\Models\\User	16	angular-front	cc848d9af457907e8aa26086d6e7f77554274620d05d357d3f74a56c664e68d8	["*"]	\N	2024-05-22 11:46:28	2024-05-21 11:46:28	2024-05-21 11:46:28
221	App\\Models\\User	6	angular-front	d3e428ec6cbc5660800bbdffe9c40d1a24b7a6802b4a819e463e15e0ae6ad977	["*"]	2024-05-21 11:46:28	2024-05-22 11:45:44	2024-05-21 11:45:44	2024-05-21 11:46:28
225	App\\Models\\User	16	angular-front	38f515bd2ddfd537b5e4d2a68d4a89fb1025410074481ca13900c3542df791c6	["*"]	2024-05-21 11:58:19	2024-05-22 11:46:28	2024-05-21 11:46:28	2024-05-21 11:58:19
228	App\\Models\\User	37	angular-front	b76644382d60825e87bae2eb0bd4bac68ffb02046b43f4617fb57d7a06c9cd98	["*"]	2024-05-21 12:08:12	2024-05-22 12:07:17	2024-05-21 12:07:17	2024-05-21 12:08:12
230	App\\Models\\User	3	angular-front	d27d772638a00637c6ebe735ea36cdacd6b8f0ab6074c0aa04cbec9c63364a59	["*"]	2024-05-22 07:26:03	2024-05-22 12:08:12	2024-05-21 12:08:12	2024-05-22 07:26:03
238	App\\Models\\User	47	angular-front	32ea0497d6a5fea64248e29e311625937bc0ddc958212adcb61f3137373f7a84	["*"]	2024-05-22 12:22:06	2024-05-23 12:17:17	2024-05-22 12:17:17	2024-05-22 12:22:06
243	App\\Models\\User	16	angular-front	a759cb10254808ba0aab6027b6e3bdfc1a624c0889b9e66aa82fd48c529abbf1	["*"]	2024-05-23 12:36:19	2024-05-24 08:07:29	2024-05-23 08:07:29	2024-05-23 12:36:19
233	App\\Models\\User	16	angular-front	2e348e27a121da69493beb74576c77249ae55669f2f4c1b9eab52f88dc1491c6	["*"]	\N	2024-05-23 12:12:43	2024-05-22 12:12:43	2024-05-22 12:12:43
210	App\\Models\\User	16	angular-front	d25ae9f9f5b03691e65cb4599640a1b10492cbf04d5080871d9d31d9bf60925e	["*"]	\N	2024-05-22 11:31:15	2024-05-21 11:31:15	2024-05-21 11:31:15
247	App\\Models\\User	16	angular-front	758132f2849325caf10cbb2fdc7dc60b83677b4c31769fa8b05dabd53baf7592	["*"]	\N	2024-05-28 13:24:23	2024-05-27 13:24:23	2024-05-27 13:24:23
231	App\\Models\\User	3	angular-front	d694f1a639eb98ce884ee3a6bf8544fb59f7b191d1d298a376e4644d070ab0a3	["*"]	2024-05-22 12:44:25	2024-05-23 07:26:02	2024-05-22 07:26:02	2024-05-22 12:44:25
239	App\\Models\\User	48	angular-front	77ffcd0e406a97e54c8a7bf954abc4bc55b07ed7d507c7b3015dc6b4c7eb9c60	["*"]	\N	2024-05-23 12:21:14	2024-05-22 12:21:14	2024-05-22 12:21:14
235	App\\Models\\User	46	angular-front	2de0e687ec288df024a2455cccf63e68f2d2f3c200231ec0977dae9e5f433732	["*"]	\N	2024-05-23 12:15:50	2024-05-22 12:15:50	2024-05-22 12:15:50
240	App\\Models\\User	48	angular-front	16767b3a0ff2dcfee84414efe5bd47355219736f06c4d3b3eb484701592f78ef	["*"]	\N	2024-05-23 12:21:14	2024-05-22 12:21:14	2024-05-22 12:21:14
234	App\\Models\\User	16	angular-front	746b55701c4f17c35f6b8f1df5e2b201cc810795daf512fb337bc214430b03e7	["*"]	2024-05-22 12:15:50	2024-05-23 12:12:43	2024-05-22 12:12:43	2024-05-22 12:15:50
237	App\\Models\\User	47	angular-front	b33d2c8a0fcaff250e88627500f212a1f1f0faba3c50cf6d51162f58d3c76aba	["*"]	\N	2024-05-23 12:17:17	2024-05-22 12:17:17	2024-05-22 12:17:17
244	App\\Models\\User	16	angular-front	45af2197ea3b2368c548c9680131a73d50f3bb3ed7e204c369fd2f003cc78283	["*"]	\N	2024-05-24 08:07:29	2024-05-23 08:07:29	2024-05-23 08:07:29
246	App\\Models\\User	3	angular-front	0e251d96e754a92a336613ce32d66be324066ceabe35262021453c25fb94234b	["*"]	\N	2024-05-24 12:36:18	2024-05-23 12:36:18	2024-05-23 12:36:18
245	App\\Models\\User	3	angular-front	17bb9b1e419589dc462b456188086e45b50a9f35d5074204619c128fde80d39d	["*"]	2024-05-23 12:45:21	2024-05-24 12:36:18	2024-05-23 12:36:18	2024-05-23 12:45:21
249	App\\Models\\User	3	angular-front	88694d0301fd66c72e1348ba0043a063068118668b439809ef87f2560aafa33d	["*"]	\N	2024-05-28 13:29:11	2024-05-27 13:29:11	2024-05-27 13:29:11
248	App\\Models\\User	16	angular-front	3108327de7c7d9f5fb5f5341046cd983bae4dfb359438458bbeea9eed6f874d5	["*"]	2024-05-27 13:29:12	2024-05-28 13:24:24	2024-05-27 13:24:24	2024-05-27 13:29:12
250	App\\Models\\User	3	angular-front	439f7772a170c37436df3f4a3fe19cef96e55900cc4ae2dbd99e58c39afdd7bc	["*"]	2024-05-27 13:44:24	2024-05-28 13:29:11	2024-05-27 13:29:11	2024-05-27 13:44:24
251	App\\Models\\User	16	angular-front	75a8a94cccee16bd5f9027a3bd25361c7b8486635bd4ad4d980579589f958157	["*"]	\N	2024-05-28 13:44:24	2024-05-27 13:44:24	2024-05-27 13:44:24
254	App\\Models\\User	16	angular-front	7d901bab86b5d52368bb0938535a2ebb16a48d785e120acae3f4caba84c7a591	["*"]	2024-05-27 16:49:54	2024-05-28 16:42:59	2024-05-27 16:42:59	2024-05-27 16:49:54
264	App\\Models\\User	3	angular-front	038bc114feca5dc02439757f9fe8c1adc542b58d5fdd395c1b8fe3ced3dca6cc	["*"]	2024-05-28 08:56:03	2024-05-29 08:25:31	2024-05-28 08:25:31	2024-05-28 08:56:03
286	App\\Models\\User	16	angular-front	496f405d6e2c0385cc3afa98c7864b060095b89ea087ff20ab6685f864d9a7d9	["*"]	2024-06-04 12:15:44	2024-06-05 12:10:04	2024-06-04 12:10:04	2024-06-04 12:15:44
271	App\\Models\\User	16	angular-front	b5add1f87d766c9e1f6568239bc8aa5355609bc7d4ae9fa7bcb654980658d20f	["*"]	\N	2024-05-29 10:06:28	2024-05-28 10:06:28	2024-05-28 10:06:28
267	App\\Models\\User	16	angular-front	80fa23f88340aa55e439974381e542b922f3b13de645628b31c7d8e357243e4d	["*"]	\N	2024-05-29 08:57:11	2024-05-28 08:57:11	2024-05-28 08:57:11
266	App\\Models\\User	16	angular-front	5af7584d6dbecbdb59c57d95564235efd54dd9e8c7e29f6826a8c0fcb503197d	["*"]	2024-05-28 08:57:11	2024-05-29 08:56:03	2024-05-28 08:56:03	2024-05-28 08:57:11
268	App\\Models\\User	16	angular-front	44b502bc58408cceed722f9fe208f289518dfa7870cc92b82ed894067670c1d7	["*"]	2024-05-28 10:06:28	2024-05-29 08:57:11	2024-05-28 08:57:11	2024-05-28 10:06:28
263	App\\Models\\User	3	angular-front	9e87260f75ec345556df33f97661bbf52ee08a3a150edf5ada46dd81abb95590	["*"]	\N	2024-05-29 08:25:31	2024-05-28 08:25:31	2024-05-28 08:25:31
262	App\\Models\\User	16	angular-front	3ff5510b8b185fa4d384565a80504d9bb7e8bcc52800bac1794aa9c39f592347	["*"]	2024-05-28 08:25:31	2024-05-29 08:03:10	2024-05-28 08:03:10	2024-05-28 08:25:31
257	App\\Models\\User	16	angular-front	c0919550cfdc8c6b527af86fab4a1daefb12aa4f54b99e45a8a16d4799e4e2c2	["*"]	\N	2024-05-28 16:59:13	2024-05-27 16:59:13	2024-05-27 16:59:13
256	App\\Models\\User	16	angular-front	1c4e171be8e20e75665f0832a9f215c3cba96708777cc2f74419887a571368f7	["*"]	2024-05-27 16:59:13	2024-05-28 16:49:54	2024-05-27 16:49:54	2024-05-27 16:59:13
280	App\\Models\\User	3	angular-front	ad6e543811ab8d642fdcee2327d75e575a8d819e1b94c86d27887d0f48cd7027	["*"]	2024-05-28 17:49:41	2024-05-29 13:56:43	2024-05-28 13:56:43	2024-05-28 17:49:41
261	App\\Models\\User	16	angular-front	1510534f9c7add0ce9741d3a7bc18194b5ae447661ff8e4a42fec39cdc34ffbb	["*"]	\N	2024-05-29 08:03:10	2024-05-28 08:03:10	2024-05-28 08:03:10
259	App\\Models\\User	16	angular-front	ca3201be11ab8b0a6e0b30384198ca4f79d5c62ee31334eaec3212c30630bf3a	["*"]	2024-05-28 08:03:10	2024-05-29 06:09:35	2024-05-28 06:09:35	2024-05-28 08:03:10
279	App\\Models\\User	3	angular-front	ac0952ab11b3d5d18c030ec06cdc6bd110a54be0ed62ad50c1134131e5769cff	["*"]	\N	2024-05-29 13:56:43	2024-05-28 13:56:43	2024-05-28 13:56:43
260	App\\Models\\User	16	angular-front	3e9f36001220ee8dd7066924671bb7eea1c0389d15d31d673d9fc4e2ae9326f3	["*"]	\N	2024-05-29 06:09:35	2024-05-28 06:09:35	2024-05-28 06:09:35
258	App\\Models\\User	16	angular-front	d54242047b54d139fd63599031a72e96bd8486eda73065f6bd608d83e9133935	["*"]	2024-05-28 06:09:36	2024-05-28 16:59:13	2024-05-27 16:59:13	2024-05-28 06:09:36
253	App\\Models\\User	16	angular-front	3ad885c966b16961daa71582e5811693f5a47355534f202054b3cbfe61ec2c6d	["*"]	\N	2024-05-28 16:42:59	2024-05-27 16:42:59	2024-05-27 16:42:59
278	App\\Models\\User	16	angular-front	ff0ef7fd5ca2054c6dc616a81c4c05581ba61c332c62f55afa5375cad053d26d	["*"]	2024-05-28 13:56:43	2024-05-29 13:54:25	2024-05-28 13:54:25	2024-05-28 13:56:43
284	App\\Models\\User	16	angular-front	b167aa9cd7e02d603d706ffdc94c9a589ccb389e2dabd3c1c9b4445ff1312d4c	["*"]	2024-06-04 12:11:10	2024-06-05 12:05:44	2024-06-04 12:05:44	2024-06-04 12:11:10
287	App\\Models\\User	55	angular-front	190ed75d4cf6afb9b327cd548ccd82c0d5d450c3128c1d92b171ad5a06da2a6b	["*"]	\N	2024-06-05 12:12:23	2024-06-04 12:12:23	2024-06-04 12:12:23
277	App\\Models\\User	16	angular-front	3fb5dd86caac2df2fb5ddc2bc80d22b378dc74991a82c53ca0c39dfc2e7d21d0	["*"]	\N	2024-05-29 13:54:24	2024-05-28 13:54:24	2024-05-28 13:54:24
276	App\\Models\\User	3	angular-front	232c721bf1eeaa4900f41bbef038bc7482a2b0d32894e9e393b30c77622e9cbd	["*"]	2024-05-28 13:54:25	2024-05-29 13:34:32	2024-05-28 13:34:32	2024-05-28 13:54:25
282	App\\Models\\User	16	angular-front	48812f249dcffd40936a8f8bd846376bbaafb3d93a625f81552180ad6754c2d1	["*"]	2024-05-28 18:07:16	2024-05-29 17:49:41	2024-05-28 17:49:41	2024-05-28 18:07:16
252	App\\Models\\User	16	angular-front	c6dc816b91d81814a225bac85e5c6b81b331a11e09cf84914b65187105a00828	["*"]	2024-05-28 09:05:01	2024-05-28 13:44:24	2024-05-27 13:44:24	2024-05-28 09:05:01
273	App\\Models\\User	53	angular-front	be7e42e54efaf41624f335cf699910028c9fb1b263ab2cf9f189c90ad29b7230	["*"]	\N	2024-05-29 12:14:51	2024-05-28 12:14:51	2024-05-28 12:14:51
255	App\\Models\\User	16	angular-front	25e7f8f53432b651c1a644e994c1ea2be4d028421a1f9388153bb701d3f67833	["*"]	\N	2024-05-28 16:49:54	2024-05-27 16:49:54	2024-05-27 16:49:54
272	App\\Models\\User	16	angular-front	a6e5ccb8e8346091a36e91b1152970fbc1ed95d399f4f768f4b48e52b1cb3312	["*"]	2024-05-28 12:14:51	2024-05-29 10:06:29	2024-05-28 10:06:29	2024-05-28 12:14:51
283	App\\Models\\User	16	angular-front	714fcd119eadc49532465663e68da607664c6bc9e4736b273d3db5c69d5d1a20	["*"]	\N	2024-06-05 12:05:44	2024-06-04 12:05:44	2024-06-04 12:05:44
269	App\\Models\\User	3	angular-front	cee5df729985847407b428280fa75c95d38b2bbb03a8aa3ac7ac61db5af9ca4b	["*"]	\N	2024-05-29 09:08:43	2024-05-28 09:08:43	2024-05-28 09:08:43
265	App\\Models\\User	16	angular-front	8930fcce4f5012c8747cdac4f085ce93b908c9d9d22ee92f3e653011cb45767b	["*"]	\N	2024-05-29 08:56:03	2024-05-28 08:56:03	2024-05-28 08:56:03
270	App\\Models\\User	3	angular-front	1148d3e092b96c8f2278302f54cb5a11848399fe106e4c00a77778e6a60271a5	["*"]	\N	2024-05-29 09:08:43	2024-05-28 09:08:43	2024-05-28 09:08:43
274	App\\Models\\User	53	angular-front	07359688ea4d11f6d6d47e00c4442d2548a1a7ee6bf8d51f26ec3ea8df0da37b	["*"]	2024-05-28 18:02:08	2024-05-29 12:14:51	2024-05-28 12:14:51	2024-05-28 18:02:08
288	App\\Models\\User	55	angular-front	c3789d47ddc5634bfa2e050725e3836694131034bb590493e80b1197d1e59992	["*"]	\N	2024-06-05 12:12:24	2024-06-04 12:12:24	2024-06-04 12:12:24
275	App\\Models\\User	3	angular-front	faa977ac6b4a03e6b0e6853ff59fb60df3178b1e8382f07ab804791542deadbc	["*"]	\N	2024-05-29 13:34:31	2024-05-28 13:34:31	2024-05-28 13:34:31
285	App\\Models\\User	16	angular-front	c0060169057209e4a0afbac9e6a590666edc2cc6202f35bf2838a91f48cf423a	["*"]	\N	2024-06-05 12:10:00	2024-06-04 12:10:00	2024-06-04 12:10:00
281	App\\Models\\User	16	angular-front	1c68941b2d2e54d7727264fbedb02c985cc21d562923eb3c1f090ca097c305fd	["*"]	\N	2024-05-29 17:49:41	2024-05-28 17:49:41	2024-05-28 17:49:41
290	App\\Models\\User	16	angular-front	8f9ef6452bc3add4cdb953022023eee31f7aa96697d68deea6f445af8d6e5497	["*"]	2024-06-04 12:38:00	2024-06-05 12:15:44	2024-06-04 12:15:44	2024-06-04 12:38:00
289	App\\Models\\User	16	angular-front	cb90d857898f189972f8cf46a291ff484c781ae963355ba81025ec548402399b	["*"]	\N	2024-06-05 12:15:44	2024-06-04 12:15:44	2024-06-04 12:15:44
291	App\\Models\\User	56	angular-front	869b11f209e4ed2709a668c7145f6d6c4abbb0618603288fbe5c958f1071e618	["*"]	\N	2024-06-05 12:36:34	2024-06-04 12:36:34	2024-06-04 12:36:34
292	App\\Models\\User	56	angular-front	1e0c1425571cb8d63d5501f3bf1b6fcc4e1455ee9063f53df8666bec251928bb	["*"]	\N	2024-06-05 12:36:34	2024-06-04 12:36:34	2024-06-04 12:36:34
293	App\\Models\\User	16	angular-front	8deae2f813b1c0c11ea903a4082d31d89e689d7984c1789aeee3c2ecfd502da6	["*"]	\N	2024-06-05 12:38:00	2024-06-04 12:38:00	2024-06-04 12:38:00
309	App\\Models\\User	16	angular-front	08203a20ca88ccbc6e7083c57b2f4a02a42045ba7d7cbaf914d0ea0defc3204c	["*"]	2024-06-05 08:09:43	2024-06-06 08:06:55	2024-06-05 08:06:55	2024-06-05 08:09:43
320	App\\Models\\User	16	angular-front	2400366b6ed4d9ae57f16f4a2a60723f58f9a8ad8136ade2e7ff250dcf508bdb	["*"]	2024-06-05 10:16:46	2024-06-06 10:14:22	2024-06-05 10:14:22	2024-06-05 10:16:46
299	App\\Models\\User	16	angular-front	123445d2b63c3bdf14e65114b548ee04691637550bc5d5a2513714c58b140d07	["*"]	\N	2024-06-06 06:45:54	2024-06-05 06:45:54	2024-06-05 06:45:54
297	App\\Models\\User	56	angular-front	4d1af07c74b7c18fac6142e37974f0982ae5e3a3bac09fb5f70e4e82da8ad5b8	["*"]	\N	2024-06-05 12:50:45	2024-06-04 12:50:45	2024-06-04 12:50:45
296	App\\Models\\User	57	angular-front	b438aa12078baf38fc6385571f2491b02790a3d170b81c0e796505a5fe7a4663	["*"]	2024-06-04 12:50:45	2024-06-05 12:48:30	2024-06-04 12:48:30	2024-06-04 12:50:45
298	App\\Models\\User	56	angular-front	a825d826a2a7a9f30d8480b40af150fb90fdfb97da78743acfff70604ca55909	["*"]	2024-06-05 06:45:55	2024-06-05 12:50:45	2024-06-04 12:50:45	2024-06-05 06:45:55
310	App\\Models\\User	16	angular-front	0a124e61c6531c4df3f8606538a1a39afa57f1565f5b6bb7121df845a5d75f71	["*"]	\N	2024-06-06 08:06:55	2024-06-05 08:06:55	2024-06-05 08:06:55
307	App\\Models\\User	16	angular-front	099027fabf8248485affa5a6444fd32d016bc258216b51a579d623fd27a46308	["*"]	\N	2024-06-06 07:27:48	2024-06-05 07:27:48	2024-06-05 07:27:48
306	App\\Models\\User	16	angular-front	4ddb9c73b6117ef905b41f5ea74337d8bc1bbf94c0c1f207739e24480530e02d	["*"]	2024-06-05 07:27:48	2024-06-06 07:20:08	2024-06-05 07:20:08	2024-06-05 07:27:48
308	App\\Models\\User	16	angular-front	edd0a4a7cf94898fabd2c5ac346de5b9135ce5d6f792e11ab51b9e205bf14c11	["*"]	2024-06-05 08:06:56	2024-06-06 07:27:48	2024-06-05 07:27:48	2024-06-05 08:06:56
313	App\\Models\\User	16	angular-front	37f826d6ccf3dde1525d8f55022bfb605ff8bcfff4d20efb383ff270e6bceccb	["*"]	\N	2024-06-06 08:47:59	2024-06-05 08:47:59	2024-06-05 08:47:59
312	App\\Models\\User	16	angular-front	e532e19bf651ab400abdc3e06b56b4b5ef367752e58e9750e5e9d744b19e12eb	["*"]	2024-06-05 08:47:59	2024-06-06 08:09:42	2024-06-05 08:09:42	2024-06-05 08:47:59
301	App\\Models\\User	16	angular-front	679a182db0d73256b189ae916b5df0ca38643f4a2972b8a83386d3462d0e3854	["*"]	\N	2024-06-06 07:00:41	2024-06-05 07:00:41	2024-06-05 07:00:41
300	App\\Models\\User	16	angular-front	619e8982a6e499188ba54e352fc17ae9710c15cb4d35ac4d76b857321bed1944	["*"]	2024-06-05 10:57:34	2024-06-06 06:45:55	2024-06-05 06:45:55	2024-06-05 10:57:34
324	App\\Models\\User	3	angular-front	323222906f08d381b7d91118510e1ee07b2dccba178798b13dafac0a23a349cb	["*"]	2024-06-05 11:32:47	2024-06-06 11:17:41	2024-06-05 11:17:41	2024-06-05 11:32:47
327	App\\Models\\User	16	angular-front	d2527878d3e37ffe9fc2bd63a23e69769ca0fc0b5ddeee935be17ae95dabf4b2	["*"]	2024-06-11 10:35:16	2024-06-12 09:57:43	2024-06-11 09:57:43	2024-06-11 10:35:16
315	App\\Models\\User	16	angular-front	2bdd15ef36640e37d415790949242481ade0afde2dab9ccc520d30479ccaadfd	["*"]	\N	2024-06-06 08:48:50	2024-06-05 08:48:50	2024-06-05 08:48:50
295	App\\Models\\User	57	angular-front	a854941e15531aa1a52870140f7d09868500ec5f4401447fa26401d75aa2f5da	["*"]	\N	2024-06-05 12:48:30	2024-06-04 12:48:30	2024-06-04 12:48:30
294	App\\Models\\User	16	angular-front	5e884319c6a1ac350a0454860df70df7324f541b48cc4d5388e49cc555e68c36	["*"]	2024-06-04 12:48:30	2024-06-05 12:38:00	2024-06-04 12:38:00	2024-06-04 12:48:30
314	App\\Models\\User	16	angular-front	be4b6c323989f338a375443b61c8647c4dce51a160ef05c7ee9380d17675cfed	["*"]	2024-06-05 08:48:50	2024-06-06 08:47:59	2024-06-05 08:47:59	2024-06-05 08:48:50
326	App\\Models\\User	16	angular-front	e87939d840409646dd0b40005163265194465d0cf6e7a826c1a9dafe32b60011	["*"]	2024-06-05 12:28:42	2024-06-06 11:32:47	2024-06-05 11:32:47	2024-06-05 12:28:42
328	App\\Models\\User	16	angular-front	1d9090ee1a22d3e103dab38af8ea0ddc7fe74ad01f9074fe93a4d18c8dbd93cf	["*"]	\N	2024-06-12 09:57:43	2024-06-11 09:57:43	2024-06-11 09:57:43
319	App\\Models\\User	16	angular-front	d382a7b34d3656ca08f5106f8aafc2dff6d44b440daa07c2cf5474f772301b76	["*"]	\N	2024-06-06 10:14:22	2024-06-05 10:14:22	2024-06-05 10:14:22
303	App\\Models\\User	16	angular-front	ae95a8ada9b7336420918fca441cb213987c6077d1665ab77f6133b8a6e9d53e	["*"]	\N	2024-06-06 07:06:00	2024-06-05 07:06:00	2024-06-05 07:06:00
302	App\\Models\\User	16	angular-front	d51f453fbf39efd0ed72581ed3ae7cf340fbb245dc68a49b73c94cac147c12b7	["*"]	2024-06-05 07:06:01	2024-06-06 07:00:41	2024-06-05 07:00:41	2024-06-05 07:06:01
305	App\\Models\\User	16	angular-front	cd242fa47f57f316e0fe682a5d5060a60f3b84dbc505c3cdd393c2d0eed64cd9	["*"]	\N	2024-06-06 07:20:08	2024-06-05 07:20:08	2024-06-05 07:20:08
304	App\\Models\\User	16	angular-front	93a2055a1a4c7b4f1c2befbdc10813d9e016d3820d2b24b6420ee960d1b241a5	["*"]	2024-06-05 07:20:08	2024-06-06 07:06:00	2024-06-05 07:06:00	2024-06-05 07:20:08
318	App\\Models\\User	3	angular-front	c3508d0fb6b4c4890f2b2f95030f49699f13b99ab4c09cdcd0271472d7511f1d	["*"]	2024-06-05 10:14:22	2024-06-06 10:06:51	2024-06-05 10:06:51	2024-06-05 10:14:22
333	App\\Models\\User	16	angular-front	a45b261d7a2b333b47201d7728f14f67beb0d467ee883d8761268cf696558dab	["*"]	2024-06-19 10:13:16	2024-06-20 10:13:15	2024-06-19 10:13:15	2024-06-19 10:13:16
317	App\\Models\\User	3	angular-front	ef800f4d144f2e31f05538980ce83a58c1363b02c0759b2db13afea27e27163c	["*"]	\N	2024-06-06 10:06:51	2024-06-05 10:06:51	2024-06-05 10:06:51
316	App\\Models\\User	16	angular-front	124c56aa5547ebe601589443e893a8c2afabc90ddd07c142ae84dc5143eb084a	["*"]	2024-06-05 10:06:52	2024-06-06 08:48:50	2024-06-05 08:48:50	2024-06-05 10:06:52
323	App\\Models\\User	3	angular-front	d0f533fda6041b86304b1e2287232e9973dd1e0ea79542e00875620b54de1106	["*"]	\N	2024-06-06 11:17:41	2024-06-05 11:17:41	2024-06-05 11:17:41
322	App\\Models\\User	16	angular-front	a8b0b51e72ab8afcc1f498a35411f260f518b7e6b2cb668d837271fd2d24b043	["*"]	2024-06-05 11:17:41	2024-06-06 10:16:46	2024-06-05 10:16:46	2024-06-05 11:17:41
336	App\\Models\\User	16	angular-front	c1a30c961965e81d7da460ee90e65d080fe69b813e793e98b87d40cf038d55f6	["*"]	2024-06-20 06:17:52	2024-06-21 06:17:51	2024-06-20 06:17:51	2024-06-20 06:17:52
311	App\\Models\\User	16	angular-front	abdacd25fbf6c16beda00a6e59582804dfdaaacbabfa2eb71a33ffae67109b9f	["*"]	\N	2024-06-06 08:09:42	2024-06-05 08:09:42	2024-06-05 08:09:42
334	App\\Models\\User	16	angular-front	e8248ffd8f0882619e21cd24d117ea78f5c6702dead658f4a418b4e518d6e140	["*"]	2024-06-20 06:17:53	2024-06-20 10:13:15	2024-06-19 10:13:15	2024-06-20 06:17:53
325	App\\Models\\User	16	angular-front	f833de763d7dd1b9acb4946db3c0ea8bd189e5236d2d844977ac69688d58a6ed	["*"]	\N	2024-06-06 11:32:47	2024-06-05 11:32:47	2024-06-05 11:32:47
321	App\\Models\\User	16	angular-front	03e02a5ccdf6746da4f23dc278cfe6948f8dfd198063e11a4835e453e99aca35	["*"]	\N	2024-06-06 10:16:46	2024-06-05 10:16:46	2024-06-05 10:16:46
329	App\\Models\\User	16	angular-front	ebb830c5c5539d05c8bc330df8af32935e919981ef84d2bab8adb0ad7c858345	["*"]	\N	2024-06-12 10:35:15	2024-06-11 10:35:15	2024-06-11 10:35:15
330	App\\Models\\User	16	angular-front	78556e56559595398cf1431c24c5680f6658ba119d0db5810208fe8321cc699f	["*"]	2024-06-11 10:36:13	2024-06-12 10:35:15	2024-06-11 10:35:15	2024-06-11 10:36:13
332	App\\Models\\User	16	angular-front	8027106d4bf5b687d43c6a7adb93cb2b2c21ad121c88f46a0eda12b89ac9f5c8	["*"]	2024-06-18 12:38:26	2024-06-19 09:53:47	2024-06-18 09:53:47	2024-06-18 12:38:26
331	App\\Models\\User	16	angular-front	f5b4406b65c24befa9cee6464ba8efd2df450634989d3b5dc3e5e9a57d1728ff	["*"]	\N	2024-06-19 09:53:47	2024-06-18 09:53:47	2024-06-18 09:53:47
335	App\\Models\\User	16	angular-front	5f7320018d1b5dd37bb185aca7de01f5e67301a3d85b06b2fae168b58378d208	["*"]	\N	2024-06-21 06:17:51	2024-06-20 06:17:51	2024-06-20 06:17:51
337	App\\Models\\User	16	angular-front	88499475546c3136753ad1bdc0996339d40ecaaed58f849ad181b34f2aa8100b	["*"]	\N	2024-06-21 06:17:53	2024-06-20 06:17:53	2024-06-20 06:17:53
366	App\\Models\\User	16	angular-front	1c176e5aba1ceb7a1152679ac9eaa20964428e945b04f7144d458bce69fea2c8	["*"]	2024-06-27 17:58:01	2024-06-28 17:58:00	2024-06-27 17:58:00	2024-06-27 17:58:01
348	App\\Models\\User	57	angular-front	b1d846490d99f5bf468ef489af4eb953ba57225285f72aad7ae0cda5cb9d4fa0	["*"]	\N	2024-06-21 12:18:50	2024-06-20 12:18:50	2024-06-20 12:18:50
357	App\\Models\\User	16	angular-front	74e91f4eeebf4a45345ce6e2bfcfbaf8207bfe8da5117d2cfca850eb051f0158	["*"]	2024-06-21 09:20:13	2024-06-22 09:11:54	2024-06-21 09:11:54	2024-06-21 09:20:13
345	App\\Models\\User	16	angular-front	d4ae80a1df96608b78c64f7647d9d531cc6d3954d32c12f542adc58cb5ac53fa	["*"]	2024-06-20 12:18:50	2024-06-21 12:15:37	2024-06-20 12:15:37	2024-06-20 12:18:50
359	App\\Models\\User	16	angular-front	9fb191a68aa419d40c75cf91d542cdddee01789aa8e042b0364e178c62c7801b	["*"]	2024-06-21 09:23:24	2024-06-22 09:23:23	2024-06-21 09:23:23	2024-06-21 09:23:24
358	App\\Models\\User	16	angular-front	7ef486230fb7d3e41fdd2da8c24266ead373be3bfd43aa698f56599976a5e9ee	["*"]	2024-06-21 09:23:25	2024-06-22 09:20:10	2024-06-21 09:20:11	2024-06-21 09:23:25
354	App\\Models\\User	16	angular-front	a59fc50ea1b44d3ce91465c7f9002602b6eb28fad4c75b09cc4166906baae2ab	["*"]	\N	2024-06-21 12:51:55	2024-06-20 12:51:55	2024-06-20 12:51:55
353	App\\Models\\User	57	angular-front	3892e3dba9f041994c2ea065096de0f5636a344ef29627288c322cd424447532	["*"]	2024-06-20 12:51:55	2024-06-21 12:22:57	2024-06-20 12:22:57	2024-06-20 12:51:55
370	App\\Models\\User	16	angular-front	f6346f90441eba6bc14155bbd6b92c2f15e32535c2cce4afe03e1d1dba7c9620	["*"]	2024-06-27 18:01:52	2024-06-28 18:01:28	2024-06-27 18:01:28	2024-06-27 18:01:52
350	App\\Models\\User	16	angular-front	ab795d4c12865aa2963b47755efd5e6edb15f2b5214f40462d33fa27edf75f1c	["*"]	\N	2024-06-21 12:21:58	2024-06-20 12:21:58	2024-06-20 12:21:58
360	App\\Models\\User	16	angular-front	cd75389676b792a55d3d03cac66213aadb63db45855d43e26dd8e943d28120cc	["*"]	2024-06-21 10:36:12	2024-06-22 09:23:23	2024-06-21 09:23:23	2024-06-21 10:36:12
339	App\\Models\\User	57	angular-front	0737978a78b5ea698019e39b9b7b7aef1869ebbee60bad50b718544333628608	["*"]	\N	2024-06-21 11:11:10	2024-06-20 11:11:11	2024-06-20 11:11:11
340	App\\Models\\User	57	angular-front	7c35bc2ec5428a5c69e4cc1284d9f7b1ffee42d7eea47576ee94c1cd88660b1d	["*"]	2024-06-20 11:11:14	2024-06-21 11:11:10	2024-06-20 11:11:11	2024-06-20 11:11:14
338	App\\Models\\User	16	angular-front	d146a722f980534dc4d43ce6ee2151b8d103a5f319729c4d05372c26dd3a253d	["*"]	2024-06-20 11:11:14	2024-06-21 06:17:53	2024-06-20 06:17:53	2024-06-20 11:11:14
349	App\\Models\\User	57	angular-front	ca106bc2e79fad415180de361bd97e069991973bf03c29b1b7039e469d7332ac	["*"]	2024-06-20 12:21:58	2024-06-21 12:18:50	2024-06-20 12:18:50	2024-06-20 12:21:58
355	App\\Models\\User	16	angular-front	57001560d032be267d78e7024c0e31776528bff31b10d99646c9678c5ec6a836	["*"]	2024-06-21 09:10:02	2024-06-21 12:51:55	2024-06-20 12:51:55	2024-06-21 09:10:02
368	App\\Models\\User	16	angular-front	7c7460834d32da3572bd010527630b2675944fdafa8095e09a7c9cfb9873b2c4	["*"]	\N	2024-06-28 17:58:25	2024-06-27 17:58:25	2024-06-27 17:58:25
372	App\\Models\\User	16	angular-front	860e7639d0524ac868b751d18d148193bd0ed49709b9ffd898336f4314e1dec8	["*"]	2024-07-01 11:19:02	2024-07-02 09:45:15	2024-07-01 09:45:15	2024-07-01 11:19:02
361	App\\Models\\User	16	angular-front	161624a2e4c2b7f2e298f786f46d9d661a2b6bcd0745336f1bad576dca7f6d68	["*"]	2024-06-21 11:46:53	2024-06-22 10:36:11	2024-06-21 10:36:11	2024-06-21 11:46:53
344	App\\Models\\User	16	angular-front	c0b1b4659e3e1917000e05a9a23a9a598814c7299e182a9e56b220b698b9b41d	["*"]	\N	2024-06-21 12:15:37	2024-06-20 12:15:37	2024-06-20 12:15:37
343	App\\Models\\User	16	angular-front	37f25d90d08e35ce058adfdfdda8efcac693f5c2c72bc796c8c5c7bc18dc36cf	["*"]	2024-06-20 12:15:38	2024-06-21 11:12:17	2024-06-20 11:12:17	2024-06-20 12:15:38
342	App\\Models\\User	16	angular-front	25219436315336fab040af61cc4984f306bb5b4de4583642c4d72e1db67b88d4	["*"]	\N	2024-06-21 11:12:16	2024-06-20 11:12:16	2024-06-20 11:12:16
341	App\\Models\\User	57	angular-front	9635790255c6c4e2c658477f7eb8ba5ab520bcfbff4ed92ebc3f68bc922ed4ca	["*"]	2024-06-20 11:12:17	2024-06-21 11:11:10	2024-06-20 11:11:11	2024-06-20 11:12:17
352	App\\Models\\User	57	angular-front	33cc3c3367fcc09d3500fcc3a6fc34792f9e1141a3ec9af68017e06ab8079b7b	["*"]	\N	2024-06-21 12:22:57	2024-06-20 12:22:57	2024-06-20 12:22:57
346	App\\Models\\User	16	angular-front	4bb3be94162366da955f4453334d8861a2afa43ff31907167188c3fd95e553a5	["*"]	\N	2024-06-21 12:17:36	2024-06-20 12:17:36	2024-06-20 12:17:36
347	App\\Models\\User	16	angular-front	b3627034f3fc518f59d9476449e320b5db58f8d9cefef7b92a01827ddc7acb3d	["*"]	\N	2024-06-21 12:17:36	2024-06-20 12:17:36	2024-06-20 12:17:36
351	App\\Models\\User	16	angular-front	ba6d932c4a6f8d526e458d2769a64f7b1c3b7aa08891dcf083899926d5b396bc	["*"]	2024-06-20 12:22:57	2024-06-21 12:21:58	2024-06-20 12:21:58	2024-06-20 12:22:57
362	App\\Models\\User	16	angular-front	701086d3e82108324aadce0ec64c83e90500ab999c3c6709d532c5aa4310d064	["*"]	2024-06-27 17:42:36	2024-06-28 17:42:35	2024-06-27 17:42:35	2024-06-27 17:42:36
356	App\\Models\\User	16	angular-front	a9e99ed4fd9eb85ee0ba1ab01f6567d5f23c1c34ca485a24298754bbfc18ada4	["*"]	2024-06-21 09:12:04	2024-06-22 09:09:59	2024-06-21 09:09:59	2024-06-21 09:12:04
367	App\\Models\\User	16	angular-front	ac91bf1b89b940f6c6e909a2c965300fd37fff0f2ea43ed0821705302ec3fc55	["*"]	2024-06-27 17:58:26	2024-06-28 17:58:00	2024-06-27 17:58:00	2024-06-27 17:58:26
369	App\\Models\\User	16	angular-front	3d82884a50af7906ed2456a129e888ec0893bdfddf7bcd8981b6b1ffbbc0905c	["*"]	2024-06-27 17:59:22	2024-06-28 17:58:25	2024-06-27 17:58:25	2024-06-27 17:59:22
364	App\\Models\\User	16	angular-front	b9b1f3d03f4518968eec3ebe5b224f8de33499b8bae145906ef61b055ff3713a	["*"]	\N	2024-06-28 17:51:20	2024-06-27 17:51:20	2024-06-27 17:51:20
363	App\\Models\\User	16	angular-front	6d7bc5a8fc6883ad7cbb7f92e8f937f4897aca3898a04f21e026cf17a6ce1113	["*"]	2024-06-27 17:51:20	2024-06-28 17:42:35	2024-06-27 17:42:35	2024-06-27 17:51:20
365	App\\Models\\User	16	angular-front	3cf05d2817aa3343f5d0994499a28db4bc63b6c750359c99e7a9cedb18b92115	["*"]	2024-06-27 17:54:49	2024-06-28 17:51:20	2024-06-27 17:51:20	2024-06-27 17:54:49
371	App\\Models\\User	16	angular-front	05b79f257e379d8ff44e6143d0d46419c8dcd83908ebf5d3d582c7209e8f4861	["*"]	2024-06-27 18:01:29	2024-06-28 18:01:28	2024-06-27 18:01:28	2024-06-27 18:01:29
373	App\\Models\\User	16	angular-front	faf72f1fe8b9c8a87c45591ee91da9def423dc76841e7faa658ffcba6aaeef42	["*"]	2024-07-01 11:19:21	2024-07-02 11:19:21	2024-07-01 11:19:21	2024-07-01 11:19:21
374	App\\Models\\User	16	angular-front	49840ef7f82615cd096f515c7330f868f3eff481dba53a7b67ad0808240c4afb	["*"]	2024-07-01 11:25:49	2024-07-02 11:19:21	2024-07-01 11:19:21	2024-07-01 11:25:49
377	App\\Models\\User	16	angular-front	ac002035eb42a8fe6318a983ef73c9d3ef98592bc8af9dc09d3dd53c66f55f9d	["*"]	\N	2024-07-02 11:28:03	2024-07-01 11:28:03	2024-07-01 11:28:03
375	App\\Models\\User	16	angular-front	dcbbe0fe975630283d2db851ae9af493efd88f52a2600c5d749b98b203e67413	["*"]	\N	2024-07-02 11:25:49	2024-07-01 11:25:49	2024-07-01 11:25:49
378	App\\Models\\User	16	angular-front	bd56387699ce34bd822f18c53c308ff5abba0615eb9d48d72da86d3f5a5a4a3c	["*"]	2024-07-01 11:30:47	2024-07-02 11:28:03	2024-07-01 11:28:03	2024-07-01 11:30:47
376	App\\Models\\User	16	angular-front	aeb4a1acc2ece11b33cfae323a53cbe43212bb5b5c4d82a922c2c1f3b13bd79c	["*"]	2024-07-01 11:28:04	2024-07-02 11:25:49	2024-07-01 11:25:49	2024-07-01 11:28:04
379	App\\Models\\User	16	angular-front	922aa6c04f818438e19e584bd8c1ab757376f16e77daddc9bbb75bc509d024ee	["*"]	\N	2024-07-02 11:28:56	2024-07-01 11:28:56	2024-07-01 11:28:56
380	App\\Models\\User	16	angular-front	bdad083335e8c244c183e2b72d64b57f5d36de891bf91467cb87d9dcff4c0e8f	["*"]	\N	2024-07-02 11:28:56	2024-07-01 11:28:56	2024-07-01 11:28:56
381	App\\Models\\User	16	angular-front	8b7e9a4ad801f03c5652ab61a5b14af219b37e4fef694948035551129336ecee	["*"]	\N	2024-07-02 11:29:22	2024-07-01 11:29:22	2024-07-01 11:29:22
382	App\\Models\\User	16	angular-front	f3a68459e35de1b97ced80cfdccb1dc433efe58440608ac5f6424c472e5045ff	["*"]	\N	2024-07-02 11:29:22	2024-07-01 11:29:22	2024-07-01 11:29:22
384	App\\Models\\User	17	angular-front	8772d81d087283ecc4e310559304e833b5d9a71eb2991a3097679a9a663f3346	["*"]	\N	2024-07-02 11:30:46	2024-07-01 11:30:46	2024-07-01 11:30:46
383	App\\Models\\User	17	angular-front	2c981ca2028a289b2b5dab382f1bd8d49838c9e6967eb272cd0fd60d6eb6ce68	["*"]	2024-07-01 11:32:03	2024-07-02 11:30:46	2024-07-01 11:30:46	2024-07-01 11:32:03
386	App\\Models\\User	20	angular-front	eeac144fbbea74c773263866164fdcc451b42eab8afb547aec2dda1cdf6a0f34	["*"]	\N	2024-07-02 11:32:30	2024-07-01 11:32:30	2024-07-01 11:32:30
394	App\\Models\\User	12	angular-front	39f918e4f950585499b622892ba4398b48f215f39d62a6ddb41ce78a6f42f01e	["*"]	2024-07-01 11:43:18	2024-07-02 11:42:42	2024-07-01 11:42:42	2024-07-01 11:43:18
387	App\\Models\\User	20	angular-front	b4d3393637c879b8591730f2ceaa495d1bc7ff027d7476964e7544fbcdbaab6e	["*"]	\N	2024-07-02 11:33:39	2024-07-01 11:33:39	2024-07-01 11:33:39
385	App\\Models\\User	20	angular-front	8e776dd2ad2ad343522efd0018fdc2e2d7abe57c8c52ffff3029adb32f7f5eda	["*"]	2024-07-01 11:33:40	2024-07-02 11:32:30	2024-07-01 11:32:30	2024-07-01 11:33:40
396	App\\Models\\User	12	angular-front	6dfd4536b2f427f207487a14dcdfc990b3444956c67c50d72d2286df28ddb664	["*"]	2024-07-01 11:43:53	2024-07-02 11:43:18	2024-07-01 11:43:18	2024-07-01 11:43:53
389	App\\Models\\User	20	angular-front	2b5690cba39965949a9e56c647a964a25e3d86d5438e522f0b2d3e10219fea7b	["*"]	\N	2024-07-02 11:34:12	2024-07-01 11:34:12	2024-07-01 11:34:12
388	App\\Models\\User	20	angular-front	b6031a0f2f38d59759ecaeec6387d7f1b6f327629d2c8a0b342c6705977861e0	["*"]	2024-07-01 11:34:12	2024-07-02 11:33:39	2024-07-01 11:33:39	2024-07-01 11:34:12
397	App\\Models\\User	12	angular-front	48963de213f1522d2984340faaf65167ecf053ebba30690d3f3c764bb8cac0eb	["*"]	2024-07-01 11:44:13	2024-07-02 11:44:13	2024-07-01 11:44:13	2024-07-01 11:44:13
398	App\\Models\\User	12	angular-front	eafdc5fd4850c0e928d98ed8954d091d8c6cb9efa9cb50f028f139a38a8ef053	["*"]	2024-07-01 11:45:11	2024-07-02 11:44:13	2024-07-01 11:44:13	2024-07-01 11:45:11
399	App\\Models\\User	12	angular-front	f7d93726fa26f917cfaac7f93812e855ed2e6af84426c17eebc3ef46b8b5565c	["*"]	2024-07-01 11:46:46	2024-07-02 11:46:45	2024-07-01 11:46:45	2024-07-01 11:46:46
400	App\\Models\\User	12	angular-front	6655e80ff8ca2e4f10360365ca53e6b6afe74f9825279e5679335eab165edec7	["*"]	2024-07-01 11:48:39	2024-07-02 11:46:45	2024-07-01 11:46:45	2024-07-01 11:48:39
401	App\\Models\\User	10	angular-front	bb278dc0ae0a6468f0170c765ead6eff8ed2519725b5468f89cea16eb756aaeb	["*"]	2024-07-01 11:49:19	2024-07-02 11:49:19	2024-07-01 11:49:19	2024-07-01 11:49:19
402	App\\Models\\User	10	angular-front	c61fd7e3d9c291da9d1b68b0dd94983c6099b8acb1d0751c913a675375b8d75a	["*"]	2024-07-01 11:49:33	2024-07-02 11:49:19	2024-07-01 11:49:19	2024-07-01 11:49:33
403	App\\Models\\User	6	angular-front	07cd58c8ee5de7967515f3bb61f6678c41c3a84933ae082478c512b24d7200cb	["*"]	\N	2024-07-02 11:51:08	2024-07-01 11:51:08	2024-07-01 11:51:08
391	App\\Models\\User	20	angular-front	471a52377b5c9487b9af18137677eac68176752817197948efb973ea06e3e624	["*"]	\N	2024-07-02 11:36:15	2024-07-01 11:36:15	2024-07-01 11:36:15
390	App\\Models\\User	20	angular-front	3133b73554c91c183e0814b93d03d625d33c46a79050e68cb20cc1ec262c466d	["*"]	2024-07-01 11:36:15	2024-07-02 11:34:12	2024-07-01 11:34:12	2024-07-01 11:36:15
393	App\\Models\\User	12	angular-front	aaa8d373c150b127b3d5046621d21dcce43e9f66cfdc84cfa58d6b97a58060b1	["*"]	\N	2024-07-02 11:42:42	2024-07-01 11:42:42	2024-07-01 11:42:42
392	App\\Models\\User	20	angular-front	a2974467d514cdfcc157db80817d3131b87c2c3e9cd918983b75633f0d2285f8	["*"]	2024-07-01 11:42:43	2024-07-02 11:36:15	2024-07-01 11:36:15	2024-07-01 11:42:43
408	App\\Models\\User	5	angular-front	9d3ce7dc0d6bc9ad680b53cbe2c81813c9c9593a9ea9a3e1168fb7234cd2abf1	["*"]	2024-07-01 12:06:08	2024-07-02 12:05:58	2024-07-01 12:05:58	2024-07-01 12:06:08
409	App\\Models\\User	2	angular-front	795dd5009ad532afb8f04c4764ed6e022ca11bdc77cf1819787f64a425b67531	["*"]	\N	2024-07-02 12:08:58	2024-07-01 12:08:58	2024-07-01 12:08:58
395	App\\Models\\User	12	angular-front	185b84e803a9b53259f26ac74765c66f37bb4370fb5d5ff8d8be66fc702fca17	["*"]	\N	2024-07-02 11:43:18	2024-07-01 11:43:18	2024-07-01 11:43:18
405	App\\Models\\User	7	angular-front	fc955f1818141d48da35bcc885dfb631ff6b21f42461e4d87c5242f74e44fdf8	["*"]	2024-07-01 11:58:14	2024-07-02 11:58:13	2024-07-01 11:58:13	2024-07-01 11:58:14
404	App\\Models\\User	6	angular-front	ea012825f80b421a559ccb5bbb3a473afad6709a7627510d493f818534a275eb	["*"]	2024-07-01 11:58:14	2024-07-02 11:51:08	2024-07-01 11:51:08	2024-07-01 11:58:14
418	App\\Models\\User	16	angular-front	8a8f456228ff9c87e5d3e408f807e4bfdf025bd5df595f86b7c393668b297f6a	["*"]	2024-07-01 12:26:29	2024-07-02 12:15:04	2024-07-01 12:15:04	2024-07-01 12:26:29
415	App\\Models\\User	16	angular-front	ca8e80992c4d4dacbe44c784f45482452f17baf82d4dfe41b83cde3de4f69991	["*"]	\N	2024-07-02 12:10:08	2024-07-01 12:10:08	2024-07-01 12:10:08
407	App\\Models\\User	5	angular-front	ea9d171de8595e81c2048b153ebb35fd6f007d33e19a120f2363a57718e4afcb	["*"]	\N	2024-07-02 12:05:58	2024-07-01 12:05:58	2024-07-01 12:05:58
411	App\\Models\\User	10	angular-front	92a567d6107cf8633afbded11195e6143e774c1b7014f09d174b67bdfb066657	["*"]	\N	2024-07-02 12:09:22	2024-07-01 12:09:22	2024-07-01 12:09:22
406	App\\Models\\User	7	angular-front	73ccef9478fd96f472d8b397bfbf8a1d9c8fc50cc2d3ba635ec27fbb8e1b7767	["*"]	2024-07-01 12:05:59	2024-07-02 11:58:13	2024-07-01 11:58:13	2024-07-01 12:05:59
412	App\\Models\\User	10	angular-front	b5ad9586157d94e5ee000ba455aeaa511dd6048648137898528cf315d29e713d	["*"]	\N	2024-07-02 12:09:22	2024-07-01 12:09:22	2024-07-01 12:09:22
416	App\\Models\\User	16	angular-front	769ca152c86cc660f06470938bd8b7f3f5a8524ed99b27b06da237bcbff22869	["*"]	2024-07-01 12:15:05	2024-07-02 12:10:08	2024-07-01 12:10:08	2024-07-01 12:15:05
413	App\\Models\\User	15	angular-front	4a41076cac14426935ea33450886cc7ea3b7d44ab09ba0fc20ad3bc206de09b9	["*"]	\N	2024-07-02 12:09:46	2024-07-01 12:09:46	2024-07-01 12:09:46
414	App\\Models\\User	15	angular-front	047debae0d08a0a41fe6e55fe5ea4e174d672e8b7680f6e1d3136dd8a42ecda2	["*"]	\N	2024-07-02 12:09:46	2024-07-01 12:09:46	2024-07-01 12:09:46
410	App\\Models\\User	2	angular-front	d6357ac939dfee15175a5ea04be6fe400ddb64d297e7b8e069b35b7bed39bfec	["*"]	2024-07-01 12:10:08	2024-07-02 12:08:58	2024-07-01 12:08:58	2024-07-01 12:10:08
417	App\\Models\\User	16	angular-front	955d513805ab98ffa85059754ecd7e5d7f63dc59072266b02357ba7f176bd03f	["*"]	\N	2024-07-02 12:15:04	2024-07-01 12:15:04	2024-07-01 12:15:04
419	App\\Models\\User	16	angular-front	ac6f28f2370b2a2a549336e092937a41a86ba98071220b3c876ae6175b34611d	["*"]	\N	2024-07-02 12:26:28	2024-07-01 12:26:28	2024-07-01 12:26:28
420	App\\Models\\User	16	angular-front	a7f63948f57d4bb5a247b5e3fb0e4b2fb88279185711c29ff95412e3916c4051	["*"]	2024-07-01 12:27:15	2024-07-02 12:26:28	2024-07-01 12:26:28	2024-07-01 12:27:15
421	App\\Models\\User	16	angular-front	6b4dae48b96ff9cc10fdf47bec87363f1ebfc0d28aa9605818d07079eca4feb6	["*"]	\N	2024-07-02 12:27:14	2024-07-01 12:27:14	2024-07-01 12:27:14
444	App\\Models\\User	16	angular-front	d05cf7a666f25ed3793a2536c86e7d6f03c048b4dd0a572c2c2b3eabd3812389	["*"]	2024-07-08 01:25:03	2024-07-09 00:54:25	2024-07-08 00:54:25	2024-07-08 01:25:03
431	App\\Models\\User	16	angular-front	f9d698e83541d495dbd2c8ec19705ba67fc388cf717ba1e95c1a7ac6ec3cb0de	["*"]	\N	2024-07-02 12:51:56	2024-07-01 12:51:56	2024-07-01 12:51:56
430	App\\Models\\User	16	angular-front	75a7c3ec42c5ed926c94418b4566069ad0cd887d075469db03d69c6050527940	["*"]	2024-07-01 12:51:57	2024-07-02 12:32:12	2024-07-01 12:32:12	2024-07-01 12:51:57
435	App\\Models\\User	57	angular-front	983940114fa4c34cda3d53050b9ee6f926ce09d79ea102b1177228bc3231a987	["*"]	2024-07-05 05:09:01	2024-07-06 03:08:45	2024-07-05 03:08:45	2024-07-05 05:09:01
437	App\\Models\\User	16	angular-front	71b7d4ca6b92528117f7ed906acc82d0f1289928113f07567f80b86aa8971fbe	["*"]	\N	2024-07-06 08:57:03	2024-07-05 08:57:03	2024-07-05 08:57:03
455	App\\Models\\User	16	angular-front	7b2456cab454ded52ee2e9f82bcace8e2076ef3d29085d73d96c17b35756cab1	["*"]	2024-07-09 08:49:17	2024-07-09 12:47:43	2024-07-08 12:47:43	2024-07-09 08:49:17
423	App\\Models\\User	16	angular-front	a48c6752f6f32e341fda873a1aa5951ead474037a25ef32b412697cb95b60c00	["*"]	\N	2024-07-02 12:27:38	2024-07-01 12:27:38	2024-07-01 12:27:38
424	App\\Models\\User	16	angular-front	724de2d3e75b644d5d756fae40a40862e6cf59d5e022d214b6dee2553d0629f1	["*"]	\N	2024-07-02 12:27:38	2024-07-01 12:27:38	2024-07-01 12:27:38
441	App\\Models\\User	16	angular-front	5a5505be4445862c1c48fa8077ee70fa32188a4b8e73375b07da6851ea62f392	["*"]	2024-07-08 00:47:14	2024-07-09 00:44:09	2024-07-08 00:44:09	2024-07-08 00:47:14
452	App\\Models\\User	16	angular-front	477ba3d6c4f8bed2d84021f36f0c4ed54a332227761fc289b8d1a45a1bb8689b	["*"]	2024-07-08 12:35:49	2024-07-09 07:07:17	2024-07-08 07:07:17	2024-07-08 12:35:49
425	App\\Models\\User	16	angular-front	78d2d96cad3c47ada7dd98d86a24cc5de1c48c13b5e623c313c547b63c5f10d2	["*"]	\N	2024-07-02 12:27:58	2024-07-01 12:27:58	2024-07-01 12:27:58
457	App\\Models\\User	16	angular-front	50bbc394613e63b598333f0c7a9fdb58fba33400de0a710b89cbcb2cd97549fb	["*"]	2024-07-09 10:48:13	2024-07-10 08:49:16	2024-07-09 08:49:16	2024-07-09 10:48:13
422	App\\Models\\User	16	angular-front	d59c987bea948075858b44c935e0f6595dfa6e717eab8d8aa6cc2cf859370f0a	["*"]	2024-07-01 12:27:58	2024-07-02 12:27:14	2024-07-01 12:27:14	2024-07-01 12:27:58
460	App\\Models\\User	16	angular-front	e3c7ea19edcf9402bc0f7bcd9c8c3d5cf0ce67f8bb085dc4e375b4e952e2ddaf	["*"]	\N	2024-07-10 10:07:54	2024-07-09 10:07:54	2024-07-09 10:07:54
449	App\\Models\\User	57	angular-front	b23083eb2a4587626636e44af48777022ef73cf84bc55cdcbf804265f212e6c1	["*"]	\N	2024-07-09 02:26:28	2024-07-08 02:26:28	2024-07-08 02:26:28
427	App\\Models\\User	19	angular-front	dcdb770afd2ac047ae330947093fe0d9a6cb2f4667ced6a097a6b2b965914276	["*"]	\N	2024-07-02 12:31:44	2024-07-01 12:31:44	2024-07-01 12:31:44
428	App\\Models\\User	19	angular-front	1b0e3b01b0f95e8bf37f9e87a49bee78c267dadbd3f1e6d6018aa4a27c1cbea1	["*"]	\N	2024-07-02 12:31:44	2024-07-01 12:31:44	2024-07-01 12:31:44
439	App\\Models\\User	16	angular-front	a2820febddc327a71d449f12dfad9b7f36b0a212cfaaf96bfe3bd3e4e2227c9d	["*"]	2024-07-05 19:28:43	2024-07-06 12:43:02	2024-07-05 12:43:02	2024-07-05 19:28:43
429	App\\Models\\User	16	angular-front	9b725a1aa1c92feb6bdb6d9058e5d5720227a250fbf4f6781df8409f708e68e9	["*"]	\N	2024-07-02 12:32:12	2024-07-01 12:32:12	2024-07-01 12:32:12
447	App\\Models\\User	16	angular-front	8368f26783696bfbb36bfca04cae9b4e18a9c310400b0c5c09699530e28962df	["*"]	\N	2024-07-09 01:28:24	2024-07-08 01:28:24	2024-07-08 01:28:24
426	App\\Models\\User	16	angular-front	0983d4a04eb6ddb9a99e1947ff1e0cad59447af05e9e3ce996f28eb0beb73726	["*"]	2024-07-01 12:32:12	2024-07-02 12:27:58	2024-07-01 12:27:58	2024-07-01 12:32:12
438	App\\Models\\User	16	angular-front	be88751acbe3bf2a51f71d74d348cb03bf021a42d541aca6c1c1134ecac42e7f	["*"]	2024-07-05 14:54:00	2024-07-06 08:57:03	2024-07-05 08:57:03	2024-07-05 14:54:00
432	App\\Models\\User	16	angular-front	014be24cf222c62ed16063b71d287b58e77de62e304c9b68d786e33076172c57	["*"]	2024-07-01 13:00:32	2024-07-02 12:51:56	2024-07-01 12:51:56	2024-07-01 13:00:32
434	App\\Models\\User	16	angular-front	6e376a0e43ce25c1e7eaf55d9235adcc00b75b29696ba987e0064455373b8341	["*"]	\N	2024-07-06 02:14:09	2024-07-05 02:14:09	2024-07-05 02:14:09
446	App\\Models\\User	57	angular-front	7db8e64b2c29675e7b0f76b94a481f10cfe139e5c1e19fad71cebd8cafa64ac2	["*"]	2024-07-08 01:28:25	2024-07-09 01:25:03	2024-07-08 01:25:03	2024-07-08 01:28:25
443	App\\Models\\User	16	angular-front	047757e126d4987780910e3375aa445ca3f972ed317758978d5b7465cc6979e6	["*"]	\N	2024-07-09 00:54:25	2024-07-08 00:54:25	2024-07-08 00:54:25
433	App\\Models\\User	16	angular-front	1e299a118991932ebc49826e2cc4e1582bc078e2728363d1fbfe001669a61f7f	["*"]	2024-07-05 03:07:36	2024-07-06 02:14:09	2024-07-05 02:14:09	2024-07-05 03:07:36
436	App\\Models\\User	57	angular-front	3f36dd357b86ce0c0b82341b2308dba1ed0c4300128e3fa03188dc515310de5a	["*"]	\N	2024-07-06 03:08:45	2024-07-05 03:08:45	2024-07-05 03:08:45
440	App\\Models\\User	16	angular-front	4124700fa4fc704f523b8b70285e7456b2d737a3a8e5dd6fd4b4f1203d31d2bb	["*"]	\N	2024-07-06 12:43:02	2024-07-05 12:43:02	2024-07-05 12:43:02
442	App\\Models\\User	57	angular-front	0955244b3f4ea29889e0bc66f4570d03f276d4a8fdc093e1f970b7a422d6673c	["*"]	2024-07-08 00:54:26	2024-07-09 00:47:13	2024-07-08 00:47:13	2024-07-08 00:54:26
456	App\\Models\\User	16	angular-front	2c3a3b3c3743ba2fefc2c82dfde05895c690772af35ba8f5a0a443540ff453c7	["*"]	\N	2024-07-09 12:47:43	2024-07-08 12:47:43	2024-07-08 12:47:43
448	App\\Models\\User	16	angular-front	c0fd153e126a8e8c500f6cb5c5cce072a407b44724083ae6b37d2dcf5e599001	["*"]	2024-07-08 02:26:28	2024-07-09 01:28:24	2024-07-08 01:28:24	2024-07-08 02:26:28
454	App\\Models\\User	16	angular-front	e95ffd491da0e79185bc116c350754a4b920335e9e3fa9b2779819cc1ad17548	["*"]	\N	2024-07-09 11:49:19	2024-07-08 11:49:19	2024-07-08 11:49:19
450	App\\Models\\User	57	angular-front	f9c9c389a563d2de6a27e737d0f5ba6a313b69a7f5dad583d9937d1e803c7cdb	["*"]	2024-07-08 02:26:33	2024-07-09 02:26:28	2024-07-08 02:26:28	2024-07-08 02:26:33
445	App\\Models\\User	57	angular-front	8b66d0ab8d069878e56a486293aa239003a8490a78eaa0d7eb26cc46fcb52571	["*"]	\N	2024-07-09 01:25:03	2024-07-08 01:25:03	2024-07-08 01:25:03
453	App\\Models\\User	16	angular-front	7ad10f6c614542e488c1218a2d761a5fec4a2129d3308c01c149456046097e99	["*"]	2024-07-08 12:47:43	2024-07-09 11:49:19	2024-07-08 11:49:19	2024-07-08 12:47:43
451	App\\Models\\User	16	angular-front	9f199ff50f6ccde7028477662683352bb08ca10c6689049428cf2a2e36ae84d8	["*"]	\N	2024-07-09 07:07:17	2024-07-08 07:07:17	2024-07-08 07:07:17
459	App\\Models\\User	16	angular-front	8244c846c3f7cc4df1bccc8ca286c06ca29d1e73b1ebea18490072b05b0aeb25	["*"]	2024-07-09 10:39:42	2024-07-10 10:07:54	2024-07-09 10:07:54	2024-07-09 10:39:42
458	App\\Models\\User	16	angular-front	abca005be4ebeafcddd99183655bac0c2df2ebc58b7b4a1d27d9c63c6a8f427b	["*"]	\N	2024-07-10 08:49:16	2024-07-09 08:49:16	2024-07-09 08:49:16
461	App\\Models\\User	16	angular-front	837048e1d292a8a00c11c4cccb4ef37e3d4bab88a7368a947c5f35419e7a185a	["*"]	\N	2024-07-10 10:39:41	2024-07-09 10:39:41	2024-07-09 10:39:41
489	App\\Models\\User	16	angular-front	55f8453ff809daf5c4928e05cff996df63a38ab5f39744d4feff089fb45e3386	["*"]	2024-07-11 09:59:00	2024-07-11 12:52:45	2024-07-10 12:52:45	2024-07-11 09:59:00
491	App\\Models\\User	16	angular-front	79e84d1bf12fa811415bad8e0ae6b6361dbfc63c2c87601a33e7ebe9bd810b04	["*"]	2024-07-12 09:35:33	2024-07-12 09:58:59	2024-07-11 09:58:59	2024-07-12 09:35:33
462	App\\Models\\User	16	angular-front	cbfb1c933341d4f5620ea8db0255b2562753537ad39fd13739c8eb912d031fda	["*"]	2024-07-09 10:57:50	2024-07-10 10:39:41	2024-07-09 10:39:41	2024-07-09 10:57:50
463	App\\Models\\User	16	angular-front	c0af6a72f6ed01ada7be69a97df0b853b0dc1e866a76d7a7687af870e64c0a3d	["*"]	\N	2024-07-10 12:42:46	2024-07-09 12:42:46	2024-07-09 12:42:46
484	App\\Models\\User	67	angular-front	8ae411cf514a2f8f83c2f9c0b03b030b10cb9a3e9fa46585d95abc14f47bfdd9	["*"]	2024-07-10 11:41:00	2024-07-11 11:34:29	2024-07-10 11:34:29	2024-07-10 11:41:00
497	App\\Models\\User	3	angular-front	78ea483fc484a4f6c4c0c2dc34efa29e212522d5735b3f86b139cd88101b2723	["*"]	2024-07-12 11:32:35	2024-07-13 11:30:28	2024-07-12 11:30:28	2024-07-12 11:32:35
464	App\\Models\\User	16	angular-front	0ee44e9cbb1e33ae778214793e35ceba03fcc8a43cb9a21ce6604307e08ee8bb	["*"]	2024-07-09 12:48:45	2024-07-10 12:42:46	2024-07-09 12:42:46	2024-07-09 12:48:45
465	App\\Models\\User	16	angular-front	8644a5d65972a99c7f8737ed40b23f4088b88fabec759a37cb73e2601e319669	["*"]	\N	2024-07-11 06:29:13	2024-07-10 06:29:13	2024-07-10 06:29:13
494	App\\Models\\User	16	angular-front	e48041f7dba7a74033014ec015cee0e231d15a4fc418f1536a60ec820731e472	["*"]	\N	2024-07-13 09:15:37	2024-07-12 09:15:37	2024-07-12 09:15:37
487	App\\Models\\User	57	angular-front	537cc40446586511ce8353c8bcbf10e7105057b1aa53b5ab61db05e360eee77a	["*"]	2024-07-10 11:59:04	2024-07-11 11:57:50	2024-07-10 11:57:50	2024-07-10 11:59:04
466	App\\Models\\User	16	angular-front	5933ef130d218786368e42213455fd6c3451be5ce2414850158de6e65a42bc6f	["*"]	2024-07-10 06:29:55	2024-07-11 06:29:13	2024-07-10 06:29:13	2024-07-10 06:29:55
468	App\\Models\\User	64	angular-front	51061d5b5970db617f364898f30d050179f7c0bcefc738e38894b951f4932616	["*"]	\N	2024-07-11 06:35:42	2024-07-10 06:35:42	2024-07-10 06:35:42
488	App\\Models\\User	16	angular-front	63a13644f29148d85520adc99d4240b510f0227d96e61191bbea4fdd09050af1	["*"]	\N	2024-07-11 12:52:45	2024-07-10 12:52:45	2024-07-10 12:52:45
492	App\\Models\\User	16	angular-front	3739652336e768d125b0012b1cdf7d5e06632e9907331014b462355537142c99	["*"]	2024-07-12 09:15:38	2024-07-13 07:01:01	2024-07-12 07:01:01	2024-07-12 09:15:38
475	App\\Models\\User	16	angular-front	297b9fd053024678fb0780d50280b30076cc4b0f45c74b5f05e0e38fe59411a4	["*"]	2024-07-10 08:20:28	2024-07-11 08:18:13	2024-07-10 08:18:13	2024-07-10 08:20:28
478	App\\Models\\User	16	angular-front	06a120a477593b5c4c8ec2806f8750f892aa778e2928d17ca56fe9b94f8bcc69	["*"]	\N	2024-07-11 09:07:01	2024-07-10 09:07:01	2024-07-10 09:07:01
477	App\\Models\\User	16	angular-front	b849fe8f96fffbc3142ebb7ef30bc20d2e6c615d6efeb216293827ed7a61e4f7	["*"]	\N	2024-07-11 09:07:01	2024-07-10 09:07:01	2024-07-10 09:07:01
472	App\\Models\\User	66	angular-front	122835c12b6c582ab0cd8c450d20c8989c9936a8ea43c2f9f1a1afa6f0fd1add	["*"]	\N	2024-07-11 06:57:21	2024-07-10 06:57:21	2024-07-10 06:57:21
470	App\\Models\\User	16	angular-front	06ba8c209756eab8483e308fdfd2f0025d950fb8f7c7e36213a04840bb7bb0dc	["*"]	2024-07-10 06:57:21	2024-07-11 06:38:48	2024-07-10 06:38:48	2024-07-10 06:57:21
471	App\\Models\\User	66	angular-front	2378a6d725e19c30ead63bafcaedb751d6bb9166e3f96cff51439f1c80e93375	["*"]	2024-07-10 07:07:04	2024-07-11 06:57:21	2024-07-10 06:57:21	2024-07-10 07:07:04
474	App\\Models\\User	16	angular-front	58b78e485c7510c5d0bc1fa136552af3dcf0837ac6950e8beb0d2909f369ceaa	["*"]	\N	2024-07-11 07:33:13	2024-07-10 07:33:13	2024-07-10 07:33:13
480	App\\Models\\User	16	angular-front	201ba42427cb44808899d744192a27c499200b9bcf3a310e304fdeebb3b87d3a	["*"]	\N	2024-07-11 09:12:28	2024-07-10 09:12:28	2024-07-10 09:12:28
499	App\\Models\\User	16	angular-front	f64de204c885887bd1d50b333a6ca4171ebf366bc9c7e6a6fd155c20a25aac66	["*"]	2024-07-12 12:52:14	2024-07-13 11:32:35	2024-07-12 11:32:35	2024-07-12 12:52:14
479	App\\Models\\User	16	angular-front	afa1d39908e6436649712c4ac30e111e22af948ec4f281461769f81d0ccee981	["*"]	2024-07-10 09:12:29	2024-07-11 09:07:01	2024-07-10 09:07:01	2024-07-10 09:12:29
482	App\\Models\\User	16	angular-front	6b1cdcd10010ccab970f1663dcf9e50022592f905dc57ed7d70dc9d9345de230	["*"]	2024-07-10 11:31:26	2024-07-11 10:06:00	2024-07-10 10:06:00	2024-07-10 11:31:26
483	App\\Models\\User	16	angular-front	456e26f448e7dc8b8d73e404f4bed63e96c317a7df8f2784e8453dfd58c01349	["*"]	\N	2024-07-11 10:06:00	2024-07-10 10:06:00	2024-07-10 10:06:00
469	App\\Models\\User	16	angular-front	e60e89400ea098ed1a82bc2b74cd5eed6a3a66284ac433bc424e47bff176aef3	["*"]	\N	2024-07-11 06:38:48	2024-07-10 06:38:48	2024-07-10 06:38:48
467	App\\Models\\User	64	angular-front	e025fcf87cf2063d4b1d068398376fadbf2d3a784d0f7672960c31eaaac35519	["*"]	2024-07-10 06:38:49	2024-07-11 06:35:42	2024-07-10 06:35:42	2024-07-10 06:38:49
473	App\\Models\\User	16	angular-front	a2a5ca79198022e460102c6914310ea04682ee7d3282fdcde8488a19cfde2cfd	["*"]	2024-07-10 08:15:26	2024-07-11 07:33:13	2024-07-10 07:33:13	2024-07-10 08:15:26
486	App\\Models\\User	57	angular-front	bf9dc7ff46c0c1b709a6f4cc9155fd63ecca359930058bd74f36f5233481172f	["*"]	\N	2024-07-11 11:57:50	2024-07-10 11:57:50	2024-07-10 11:57:50
476	App\\Models\\User	16	angular-front	a92b6b121773ad729a0af28b3078f7dc4fc09b23cb728d0545e4975b5ed5ca40	["*"]	\N	2024-07-11 08:18:13	2024-07-10 08:18:13	2024-07-10 08:18:13
481	App\\Models\\User	16	angular-front	dbaa2db06f14ad33c5b8e137f69435d4b028fdd274d14ce00e47cdf451d04be2	["*"]	2024-07-10 10:06:01	2024-07-11 09:12:28	2024-07-10 09:12:28	2024-07-10 10:06:01
485	App\\Models\\User	16	angular-front	2e3a84e7a9a439c283992db00735a4a978770b860585cacffa34789589497d90	["*"]	2024-07-10 11:57:51	2024-07-11 11:41:00	2024-07-10 11:41:00	2024-07-10 11:57:51
496	App\\Models\\User	3	angular-front	67e7261e54aaa1d585e7276ad71c5aab44f81c613ff4f423ca19e7a63d5d1f6c	["*"]	\N	2024-07-13 11:30:28	2024-07-12 11:30:28	2024-07-12 11:30:28
493	App\\Models\\User	16	angular-front	31b2b18a0ad76841ce3a9e5de792819ca0022de54c23cd77d7ae31af2a95caf5	["*"]	\N	2024-07-13 07:01:01	2024-07-12 07:01:01	2024-07-12 07:01:01
490	App\\Models\\User	16	angular-front	1fe0f5483a2ae787cb484585df9ccbd08d5562bce1d13675ffe925b476607dea	["*"]	\N	2024-07-12 09:58:59	2024-07-11 09:58:59	2024-07-11 09:58:59
502	App\\Models\\User	16	angular-front	505c2341e48fa6d40747292f736c2eb10aa42be504c4bba2d82ddcbf88834b43	["*"]	2024-07-15 14:05:03	2024-07-16 10:28:47	2024-07-15 10:28:47	2024-07-15 14:05:03
495	App\\Models\\User	16	angular-front	07c351e698c3fb82b60323aa1977405c7de0ed9c3e821c3dd2b1db1f7e55fd72	["*"]	2024-07-12 13:09:32	2024-07-13 09:15:37	2024-07-12 09:15:37	2024-07-12 13:09:32
498	App\\Models\\User	16	angular-front	81f9db2dcdda22d9e15890b3925d158929f6919fad4153a1dd2b535c2d59a930	["*"]	\N	2024-07-13 11:32:35	2024-07-12 11:32:35	2024-07-12 11:32:35
503	App\\Models\\User	16	angular-front	7a08153787f60aac88379f76b159de6dbc2989d74312aa5d9bc248f4c913b43d	["*"]	\N	2024-07-16 10:28:47	2024-07-15 10:28:47	2024-07-15 10:28:47
500	App\\Models\\User	16	angular-front	b125acf016f9d4b7bc024897207bd7d14e2f66eac9b057da588b83e18a9bd5a8	["*"]	\N	2024-07-13 12:52:14	2024-07-12 12:52:14	2024-07-12 12:52:14
501	App\\Models\\User	16	angular-front	658a3bb8f9c780f168dd3c6146f28253d361d1ad7ef8e35023e0daec59f5561a	["*"]	\N	2024-07-13 12:52:14	2024-07-12 12:52:14	2024-07-12 12:52:14
504	App\\Models\\User	3	angular-front	9efd10f5e5f7e9c32d5cd61f2ffdd2a6b6e3c6785dd611b34ceb96920aa4fb56	["*"]	\N	2024-07-16 11:42:39	2024-07-15 11:42:39	2024-07-15 11:42:39
529	App\\Models\\User	16	angular-front	7af0629177343f1b5baddc855f6965bef255c9a6ae65b713aa3ac7e65f16013e	["*"]	2024-07-23 08:56:06	2024-07-24 07:49:26	2024-07-23 07:49:26	2024-07-23 08:56:06
545	App\\Models\\User	80	angular-front	d8ca9c2a2a80598f25600984d67165ef487ba6435c50ef1cb1d05d2c190e3895	["*"]	2024-07-24 10:31:31	2024-07-25 10:30:20	2024-07-24 10:30:20	2024-07-24 10:31:31
536	App\\Models\\User	16	angular-front	ec27683590bcaca3827f15dfd5ef8389e4108c189dc12bb7d9a3ff27e25b1afb	["*"]	2024-07-23 12:54:55	2024-07-24 12:33:27	2024-07-23 12:33:27	2024-07-23 12:54:55
534	App\\Models\\User	16	angular-front	6672d05c69a09ebf008df9a547b9ae05ff0906d232977b1e2badbd832d84b698	["*"]	\N	2024-07-24 09:40:54	2024-07-23 09:40:54	2024-07-23 09:40:54
524	App\\Models\\User	16	angular-front	5b0ae5883e28a53bd09ff9bceff9a5b3276fc9f1d8d6fe5c0295459c18379aa9	["*"]	2024-07-17 17:32:23	2024-07-18 17:30:01	2024-07-17 17:30:01	2024-07-17 17:32:23
526	App\\Models\\User	16	angular-front	297297407de162260830271dd93e11e941a78dea80ba9ffb7eae25d554a72b4d	["*"]	\N	2024-07-19 08:54:47	2024-07-18 08:54:47	2024-07-18 08:54:47
525	App\\Models\\User	16	angular-front	e59037df7c9174bcda8645f2c602982b25ce30ba16d2a0bb0346db0332e4ac37	["*"]	2024-07-18 09:04:10	2024-07-19 08:54:47	2024-07-18 08:54:47	2024-07-18 09:04:10
507	App\\Models\\User	16	angular-front	0f632bb062bed38355275d512c6f595d73128bfd5855c660806b967830e935ae	["*"]	\N	2024-07-16 12:46:54	2024-07-15 12:46:54	2024-07-15 12:46:54
505	App\\Models\\User	3	angular-front	76c933393de60bbd5f0cfbd5d0a689eb14d53fe42a8e3da1bcb770c25a128917	["*"]	2024-07-15 12:46:55	2024-07-16 11:42:39	2024-07-15 11:42:39	2024-07-15 12:46:55
515	App\\Models\\User	16	angular-front	c6c9431f9a71383c86ff2c59776c4d56c722c26327885e0384452cb08d0a8413	["*"]	\N	2024-07-17 23:52:37	2024-07-16 23:52:37	2024-07-16 23:52:37
530	App\\Models\\User	16	angular-front	95802b540d8b2ef1a1b6d99c34954741d0f338c7e1897232ec23d8ef68a5b683	["*"]	\N	2024-07-24 07:49:26	2024-07-23 07:49:26	2024-07-23 07:49:26
513	App\\Models\\User	3	angular-front	b109a60153e11f551ea2c31281e3e15339bfd6547c0df8fe816f558bd32a5d03	["*"]	2024-07-16 23:52:39	2024-07-17 10:28:18	2024-07-16 10:28:18	2024-07-16 23:52:39
533	App\\Models\\User	16	angular-front	ef4c65d1912d44dc472d9491d24bbb86e340041ae892c5310f508882599d43c8	["*"]	2024-07-23 09:52:21	2024-07-24 09:40:54	2024-07-23 09:40:54	2024-07-23 09:52:21
527	App\\Models\\User	73	angular-front	b65b564d51d9c9ddfb04545ca9f6d1a8cba1b03e0e1e65fe5b3426b60a937726	["*"]	\N	2024-07-19 08:55:44	2024-07-18 08:55:44	2024-07-18 08:55:44
521	App\\Models\\User	3	angular-front	6cffade8cd4a968f01fdfa77620a0870eb30914f57f5526ed2e7a775b6961fbb	["*"]	2024-07-17 04:25:05	2024-07-18 04:22:12	2024-07-17 04:22:12	2024-07-17 04:25:05
522	App\\Models\\User	16	angular-front	5f5211f63ef171b0294b80735a3d5f2e12b3f697d1bcda5e47c47e2a4e79bfc3	["*"]	\N	2024-07-18 04:28:34	2024-07-17 04:28:34	2024-07-17 04:28:34
511	App\\Models\\User	3	angular-front	a0e7607178ea8560df608f389ce1cf9ab2fdf86121b40678f7dea50b8df5f6f9	["*"]	2024-07-16 11:25:24	2024-07-17 09:07:05	2024-07-16 09:07:05	2024-07-16 11:25:24
519	App\\Models\\User	16	angular-front	a38dd3456d6861b0375dad2affe560e3f476fdbb421bdecbb9234e767abfe3aa	["*"]	2024-07-17 04:18:40	2024-07-18 03:38:35	2024-07-17 03:38:35	2024-07-17 04:18:40
520	App\\Models\\User	3	angular-front	297c98a42771aaf654af0cc8b1114f5de1fd06a51d5294251274d415848ee2cc	["*"]	\N	2024-07-18 04:22:12	2024-07-17 04:22:12	2024-07-17 04:22:12
510	App\\Models\\User	3	angular-front	b98ee3ee6548dda868454f1ced693e546c10ea2fa8b98ef18fee5e8db50251d0	["*"]	\N	2024-07-17 09:07:05	2024-07-16 09:07:05	2024-07-16 09:07:05
508	App\\Models\\User	16	angular-front	50aa69f308524226e4ea9da2cc25421714fbe72a5382fb41e2bd8de4a249b996	["*"]	\N	2024-07-16 13:55:10	2024-07-15 13:55:10	2024-07-15 13:55:10
506	App\\Models\\User	16	angular-front	d07d5e7a4788294223e60ed9bf8f568d9cdd37cfce93c0137d481ddfb5e17b35	["*"]	2024-07-15 13:55:11	2024-07-16 12:46:54	2024-07-15 12:46:54	2024-07-15 13:55:11
509	App\\Models\\User	16	angular-front	13479aea1d4615d52c215c1a56982621c0877fe2c92be9c784e9b774a69fa444	["*"]	2024-07-16 09:07:06	2024-07-16 13:55:10	2024-07-15 13:55:10	2024-07-16 09:07:06
518	App\\Models\\User	16	angular-front	bfee77e0c5de8f49dac0c395e77527c926e3b8e3923714d827be0182f3187409	["*"]	\N	2024-07-18 03:38:35	2024-07-17 03:38:35	2024-07-17 03:38:35
512	App\\Models\\User	3	angular-front	683e7336f6fc041fbe9021100f16f9c3e3884036340a60afe4820a09aa6be24d	["*"]	\N	2024-07-17 10:28:18	2024-07-16 10:28:18	2024-07-16 10:28:18
516	App\\Models\\User	16	angular-front	a04dd91b657ccd17406ea2a1e6f3132f660e46e7ead8e33458ba0764b24c9073	["*"]	\N	2024-07-18 01:56:03	2024-07-17 01:56:03	2024-07-17 01:56:03
517	App\\Models\\User	16	angular-front	24156c8effb5d63cc175dc846249811fa7800ab3432aef477d4fafaa5026d2e5	["*"]	2024-07-17 03:38:37	2024-07-18 01:56:03	2024-07-17 01:56:03	2024-07-17 03:38:37
532	App\\Models\\User	16	angular-front	47242113a17ee47cefbc656adbddea2b6843b86c05d7d88081d062a73f5a1720	["*"]	2024-07-23 09:40:54	2024-07-24 08:56:05	2024-07-23 08:56:05	2024-07-23 09:40:54
535	App\\Models\\User	16	angular-front	af1ca29d61f74fd514aae711705cba4b0d10aa8e9e2824d6c9e765616581e465	["*"]	\N	2024-07-24 12:33:27	2024-07-23 12:33:27	2024-07-23 12:33:27
537	App\\Models\\User	16	angular-front	b9cef22f3c9d60b325ea507de5c3705d29e438ac951b1f4aa39d899999c59dfd	["*"]	\N	2024-07-25 04:28:12	2024-07-24 04:28:13	2024-07-24 04:28:13
523	App\\Models\\User	16	angular-front	8850c37057ffd40771c42111ed570ecba841083f353c0fc4461ec321cac0959a	["*"]	2024-07-17 04:28:43	2024-07-18 04:28:34	2024-07-17 04:28:34	2024-07-17 04:28:43
528	App\\Models\\User	73	angular-front	31e9ad6e895b67ba3edc94633802e297671a0cf5c0049d6b63afb47f385d9a33	["*"]	2024-07-18 09:03:56	2024-07-19 08:55:44	2024-07-18 08:55:44	2024-07-18 09:03:56
514	App\\Models\\User	16	angular-front	c13cf51e273931d83e3b9db6162cd047e4bb8e89882451dc6d9bb01e87729ce7	["*"]	2024-07-17 04:10:30	2024-07-17 23:52:37	2024-07-16 23:52:37	2024-07-17 04:10:30
531	App\\Models\\User	16	angular-front	70a90b1de018a206bbe4a864badf96b00bc5fce87e8bf7d5a4ae787240cb4dcb	["*"]	\N	2024-07-24 08:56:05	2024-07-23 08:56:05	2024-07-23 08:56:05
543	App\\Models\\User	16	angular-front	2f6ef0102a4513de3b9aa436d0fef0f59ce2b31d666a3fd7c3bc32a01d084fdc	["*"]	2024-07-24 11:00:42	2024-07-25 10:26:07	2024-07-24 10:26:07	2024-07-24 11:00:42
540	App\\Models\\User	80	angular-front	bbf4362a4f3683bbebd1bbc2b002613cd36ebd985662f1f7719798f064c234d1	["*"]	\N	2024-07-25 10:24:05	2024-07-24 10:24:05	2024-07-24 10:24:05
544	App\\Models\\User	80	angular-front	f59fbbeadedbb13ebcc0b32774cc4a3b3611e9f3f68b36757b4ac51034a9ffab	["*"]	\N	2024-07-25 10:30:20	2024-07-24 10:30:20	2024-07-24 10:30:20
542	App\\Models\\User	16	angular-front	502dd6d031d8dc86514e03202e4a4f98e29539db9e3822e8bfacae86f9f33e4e	["*"]	\N	2024-07-25 10:26:07	2024-07-24 10:26:07	2024-07-24 10:26:07
538	App\\Models\\User	16	angular-front	e51febdc8387d2cdf1fc72379f5bba7670dd9a4e9d03d5aa79ce92dce2a04cb8	["*"]	2024-07-24 05:14:52	2024-07-25 04:28:12	2024-07-24 04:28:13	2024-07-24 05:14:52
541	App\\Models\\User	80	angular-front	40477778505ed609aea54b46e44a27fa16044f514b95a0a2d8e0a6e835acc37f	["*"]	2024-07-24 10:26:09	2024-07-25 10:24:05	2024-07-24 10:24:05	2024-07-24 10:26:09
539	App\\Models\\User	16	angular-front	e96f97001dd1e692b1a58f60f1febeb91003c8802951b25c90e0217b9edac794	["*"]	2024-07-24 10:38:00	2024-07-25 07:59:32	2024-07-24 07:59:32	2024-07-24 10:38:00
546	App\\Models\\User	16	angular-front	2affa2e6277741baeff4942d9f3ea411fdf5fa40374a83d5f7ae3e2652f49a1c	["*"]	\N	2024-07-25 11:12:42	2024-07-24 11:12:42	2024-07-24 11:12:42
547	App\\Models\\User	16	angular-front	f9dd29516ddf2b9629fcf3e95c38bc381b8939023749508d950b19539643059b	["*"]	\N	2024-07-25 11:13:30	2024-07-24 11:13:30	2024-07-24 11:13:30
581	App\\Models\\User	16	angular-front	f39a113c8250068bad01c734d4dcfcc1322f35a3068d1d5b9394c498c5292404	["*"]	2024-07-28 16:33:28	2024-07-29 12:55:42	2024-07-28 12:55:42	2024-07-28 16:33:28
553	App\\Models\\User	85	angular-front	515695dd9c8b250f9ba3ee6c8d591545f84b00e56071eeeff4110b6ac8fb63af	["*"]	\N	2024-07-26 13:04:45	2024-07-25 13:04:45	2024-07-25 13:04:45
554	App\\Models\\User	85	angular-front	e25728faa9b1289495a8ab2754c13497e163986df29f850a42be148e78121206	["*"]	\N	2024-07-26 13:04:45	2024-07-25 13:04:45	2024-07-25 13:04:45
584	App\\Models\\User	16	angular-front	3f489e18e308f99f3d5dadc163baf4927e050288984898b7a9b98c8c7cd81df9	["*"]	2024-07-28 18:34:27	2024-07-29 16:33:22	2024-07-28 16:33:22	2024-07-28 18:34:27
566	App\\Models\\User	85	angular-front	bf1f49e4be4ca06b8ca6227aa81f7e50c329cb1ef86043430d51a130a8d8e285	["*"]	2024-07-26 07:29:32	2024-07-27 07:29:05	2024-07-26 07:29:05	2024-07-26 07:29:32
552	App\\Models\\User	16	angular-front	486b2becb80eec64389e60a7b069f2bc3333efc31f8a30c9a662349f65f9b76d	["*"]	2024-07-25 13:04:47	2024-07-26 13:01:40	2024-07-25 13:01:40	2024-07-25 13:04:47
548	App\\Models\\User	16	angular-front	088339f7f7dbfa319d6f47a9899c28cee7c22a78492198b97716eaa5bdf4bd1c	["*"]	2024-07-24 11:13:45	2024-07-25 11:13:30	2024-07-24 11:13:30	2024-07-24 11:13:45
587	App\\Models\\User	85	angular-front	5db29a354b501065887f75eb09d50cfbffaaf1af5ea104eeae0284ff8b371987	["*"]	2024-07-28 18:29:10	2024-07-29 18:27:11	2024-07-28 18:27:11	2024-07-28 18:29:10
564	App\\Models\\User	16	angular-front	85cde25df1ae4e0a32758f823415f4e587c8ac4aa07abb9a8ac81245fe0cbb1e	["*"]	2024-07-26 07:55:08	2024-07-27 07:24:52	2024-07-26 07:24:52	2024-07-26 07:55:08
568	App\\Models\\User	16	angular-front	c57d16fff3d5e29286c9456a21b9485102c4d7ad79c1bd1080c9dbf0be76824a	["*"]	\N	2024-07-29 11:41:46	2024-07-28 11:41:46	2024-07-28 11:41:46
550	App\\Models\\User	85	angular-front	1a6b80ea74c054fc937598cfae251723b57b2207a9b77b4b847cdd514b1494b7	["*"]	\N	2024-07-25 11:51:37	2024-07-24 11:51:37	2024-07-24 11:51:37
562	App\\Models\\User	85	angular-front	3dd31a884fa2d9dcb018387e2fbb3479514f25ab891843c80bb903cd43792121	["*"]	2024-07-26 07:29:42	2024-07-27 06:44:33	2024-07-26 06:44:33	2024-07-26 07:29:42
567	App\\Models\\User	16	angular-front	e3de46fd554273fa381bac3d361493ea8c58cc2a43a3d68f037700e6bd1cf737	["*"]	\N	2024-07-29 11:41:46	2024-07-28 11:41:46	2024-07-28 11:41:46
570	App\\Models\\User	16	angular-front	21d3c38c20c2f20ea8371ffcabc12a5f0f44cc34889a8e26ec785dada977baa4	["*"]	\N	2024-07-29 11:52:33	2024-07-28 11:52:33	2024-07-28 11:52:33
569	App\\Models\\User	16	angular-front	013f9d3138bf90f209d3f509c53be4b945662be777353e0c89085e9055994d63	["*"]	\N	2024-07-29 11:52:33	2024-07-28 11:52:33	2024-07-28 11:52:33
571	App\\Models\\User	16	angular-front	5e28230f44f5d5ef410a0e15b45858ab26ec2d0de3556c62adc2f5d740d53f3b	["*"]	\N	2024-07-29 12:02:24	2024-07-28 12:02:24	2024-07-28 12:02:24
572	App\\Models\\User	16	angular-front	13056ca3d0900d823eccac84eefa6a4e512b1770c7daddfb7b1fedc5a686efad	["*"]	\N	2024-07-29 12:02:24	2024-07-28 12:02:24	2024-07-28 12:02:24
573	App\\Models\\User	16	angular-front	a94f89ba112b49e30bd5544e0382a5130e75486f1d74cd07bc07eb89157ae60f	["*"]	\N	2024-07-29 12:39:05	2024-07-28 12:39:05	2024-07-28 12:39:05
561	App\\Models\\User	85	angular-front	d398f637e899b063a309e086e94291b5d0de46bc72c4815fa9a9ade5d66a48f2	["*"]	\N	2024-07-27 06:44:33	2024-07-26 06:44:33	2024-07-26 06:44:33
574	App\\Models\\User	16	angular-front	3337b1bd6cceff9618df7eab4fe2c2eb7350a72b63c51d66ff818a5330c8f0f1	["*"]	\N	2024-07-29 12:39:05	2024-07-28 12:39:05	2024-07-28 12:39:05
560	App\\Models\\User	16	angular-front	23a6f0ebf62b954825f8f688ac2b61844ff5dff14fd952c210ab7c5007f1c9aa	["*"]	2024-07-26 06:44:34	2024-07-27 04:40:16	2024-07-26 04:40:16	2024-07-26 06:44:34
563	App\\Models\\User	16	angular-front	76528b3d42a73bd622083b9f2fb76d49e5f3b20c3a944ddbf1fe7dd6a739dd3f	["*"]	\N	2024-07-27 07:24:52	2024-07-26 07:24:52	2024-07-26 07:24:52
559	App\\Models\\User	16	angular-front	cb5a7c7e28704acd01fb4079fe7404e27a242ed77e5c4da6ce203a8c4f35e908	["*"]	\N	2024-07-27 04:40:16	2024-07-26 04:40:16	2024-07-26 04:40:16
575	App\\Models\\User	16	angular-front	966168b5a779ceaee735405cc6a9e483402e214c5f41127a3fd023cc7a3aa31e	["*"]	\N	2024-07-29 12:40:07	2024-07-28 12:40:07	2024-07-28 12:40:07
558	App\\Models\\User	85	angular-front	65db28ba962be26d74ff7514cb3bcce8809d871eb7a62b4be0d6d058d623e308	["*"]	2024-07-26 04:40:17	2024-07-27 04:32:17	2024-07-26 04:32:17	2024-07-26 04:40:17
576	App\\Models\\User	16	angular-front	7e94331529f1bed3559c07db618c23bac139a15b7e244b299e9162d1656ec367	["*"]	\N	2024-07-29 12:40:07	2024-07-28 12:40:07	2024-07-28 12:40:07
555	App\\Models\\User	85	angular-front	67cca703dee773684773c5e9f1eaafc6a1411afaea921d956782e47a32a98b61	["*"]	2024-07-26 04:28:55	2024-07-27 04:26:12	2024-07-26 04:26:13	2024-07-26 04:28:55
577	App\\Models\\User	16	angular-front	a27c09638693c06066b57744f0efd2ca03ae567e09a2f2bb8ff3ba9fddfd3ff7	["*"]	\N	2024-07-29 12:45:31	2024-07-28 12:45:31	2024-07-28 12:45:31
551	App\\Models\\User	85	angular-front	c81884070babee4947966bb8c21fe22bc2e4330b77ebc9aba517528d8f2a6fd0	["*"]	2024-07-24 12:48:01	2024-07-25 11:51:37	2024-07-24 11:51:37	2024-07-24 12:48:01
549	App\\Models\\User	16	angular-front	40bdb1f1c6148fa0dd2803fe23384cb557edabe96c63735bf0a21095c72f8a41	["*"]	2024-07-24 12:48:20	2024-07-25 11:49:29	2024-07-24 11:49:29	2024-07-24 12:48:20
565	App\\Models\\User	85	angular-front	cda7e50b327af0e0ee0ebec13ebf23789cfbffc1e9d92594057623c74341ae33	["*"]	\N	2024-07-27 07:29:05	2024-07-26 07:29:05	2024-07-26 07:29:05
578	App\\Models\\User	16	angular-front	de0818d8881cc9fd1b5525f60af25deac49ec26ef4e9c6b2c7063132b0bb78bc	["*"]	\N	2024-07-29 12:45:31	2024-07-28 12:45:31	2024-07-28 12:45:31
579	App\\Models\\User	16	angular-front	269dda3a5a0a2d723998c0800d010f7fc7b9b6e4dfcf265351266b6dde9ca28c	["*"]	\N	2024-07-29 12:48:30	2024-07-28 12:48:30	2024-07-28 12:48:30
580	App\\Models\\User	16	angular-front	610a1ebaa00f05f79d2b79ae7875372ce04fd17cad28c8af02e74ab5fbc80b48	["*"]	\N	2024-07-29 12:48:30	2024-07-28 12:48:30	2024-07-28 12:48:30
556	App\\Models\\User	85	angular-front	d6e6891a12f77b8591cd8b05c5ac3a5d805c88c588698b07c18b88d784720be8	["*"]	2024-07-26 04:31:23	2024-07-27 04:31:14	2024-07-26 04:31:14	2024-07-26 04:31:23
557	App\\Models\\User	85	angular-front	b6b5c37c8f27a80024a4fbe6aa6d26040ac064bd768953b01099bc75f61b3f45	["*"]	\N	2024-07-27 04:32:17	2024-07-26 04:32:17	2024-07-26 04:32:17
582	App\\Models\\User	16	angular-front	727b0c65395d3f3e6205bdc083403f922d398df80097118f1a0f4378aab441c8	["*"]	\N	2024-07-29 12:55:42	2024-07-28 12:55:42	2024-07-28 12:55:42
583	App\\Models\\User	16	angular-front	20996c9f0b66497b35e2b7ecee606195293e128915aa38fa15dfb3c5c7ac5791	["*"]	\N	2024-07-29 16:33:22	2024-07-28 16:33:22	2024-07-28 16:33:22
589	App\\Models\\User	73	angular-front	6dfb6358745672d1abd80411a270c6914c009bb40464cffc173a2ea1d7ebb637	["*"]	2024-07-28 18:30:45	2024-07-29 18:28:53	2024-07-28 18:28:53	2024-07-28 18:30:45
585	App\\Models\\User	73	angular-front	021edfa28000a5e02651c72ec05914921448145489e41213569586145e5724cb	["*"]	2024-07-28 18:27:31	2024-07-29 18:20:01	2024-07-28 18:20:01	2024-07-28 18:27:31
588	App\\Models\\User	73	angular-front	82e833059bfac94c3e0443e50eb4cb6d48b768b3745043a8870f687db8228a08	["*"]	\N	2024-07-29 18:28:53	2024-07-28 18:28:53	2024-07-28 18:28:53
586	App\\Models\\User	85	angular-front	9cddc147b5b7f3fce0602f2aae1d15894631a14700e0a4bde51947227f92107e	["*"]	\N	2024-07-29 18:27:11	2024-07-28 18:27:11	2024-07-28 18:27:11
590	App\\Models\\User	85	angular-front	7fd2d021095990e57d94a75d0d057c9e410b05c483d74eebb2e83bd46590b199	["*"]	\N	2024-07-29 18:30:26	2024-07-28 18:30:26	2024-07-28 18:30:26
599	App\\Models\\User	73	angular-front	0f8dba52da2f6bbe94ffd23514dd5744f36b881370eabcd0fe307905085d5d80	["*"]	2024-07-28 18:57:50	2024-07-29 18:55:25	2024-07-28 18:55:25	2024-07-28 18:57:50
602	App\\Models\\User	73	angular-front	be4fdf57f362b81eb6be02f1d828a867f904dfc65c512d54eee3d880732a09ba	["*"]	\N	2024-07-29 18:59:56	2024-07-28 18:59:56	2024-07-28 18:59:56
617	App\\Models\\User	16	angular-front	b7591e1dc5ebd77d4175810f9743c17d77d3e5fd28dd79f43adbf9e9d83093ff	["*"]	2024-07-29 10:17:33	2024-07-30 09:28:17	2024-07-29 09:28:17	2024-07-29 10:17:33
615	App\\Models\\User	16	angular-front	6d969cda7e4523b22c592e3f70809cd781680dd877dc2ca87b1d9a3e844fc881	["*"]	2024-07-29 09:28:19	2024-07-30 09:25:42	2024-07-29 09:25:42	2024-07-29 09:28:19
595	App\\Models\\User	85	angular-front	1f9ab5b03d1f4788a703e5be750534c79d7c0fd867ce1545df7014ebaf5aba09	["*"]	2024-07-28 18:51:19	2024-07-29 18:47:02	2024-07-28 18:47:02	2024-07-28 18:51:19
597	App\\Models\\User	16	angular-front	e673f2a9454cb6be4e6bbceade433c520b7b33a4f4a3614c13e451b9609cd2bf	["*"]	\N	2024-07-29 18:54:58	2024-07-28 18:54:58	2024-07-28 18:54:58
598	App\\Models\\User	73	angular-front	e749bedddbd1ae4abd8b79befd1f086ab6853f401b2b39bb9cf1d9b1c9568492	["*"]	\N	2024-07-29 18:55:25	2024-07-28 18:55:25	2024-07-28 18:55:25
603	App\\Models\\User	73	angular-front	13ce7593c39dcec4288bf42e7c7b295af427ceeac2244d9c2b5482a1cffda865	["*"]	2024-07-28 19:02:50	2024-07-29 18:59:56	2024-07-28 18:59:56	2024-07-28 19:02:50
613	App\\Models\\User	73	angular-front	5a42215eed28d39c10f15efb44e7be03b29bff50009bb6c024b31a0e5dff6c14	["*"]	\N	2024-07-30 05:31:04	2024-07-29 05:31:04	2024-07-29 05:31:04
600	App\\Models\\User	85	angular-front	385e2691d893c8f19e59606d5c5217b8c6de3d3ee46c66459803621f5b425d30	["*"]	\N	2024-07-29 18:55:57	2024-07-28 18:55:57	2024-07-28 18:55:57
601	App\\Models\\User	85	angular-front	abd5e5a0d48b854bce27b8914d697c44a744bb05fffa0f632513bbc22d6219de	["*"]	2024-07-28 19:03:20	2024-07-29 18:55:57	2024-07-28 18:55:57	2024-07-28 19:03:20
596	App\\Models\\User	16	angular-front	35e9e7a2a3fefd11e879d45a2ca393eb51d8a5e8257429809344548ad27382f4	["*"]	2024-07-28 19:03:35	2024-07-29 18:54:58	2024-07-28 18:54:58	2024-07-28 19:03:35
605	App\\Models\\User	16	angular-front	a37d2ad301aeaa75c569844491b5de858745b446d34e1f383846516be4e01b5f	["*"]	\N	2024-07-29 19:30:47	2024-07-28 19:30:47	2024-07-28 19:30:47
592	App\\Models\\User	73	angular-front	ad69ae5ad5f73997da36cb7f1da3f7910361b7e49fe5002520f976cc212922df	["*"]	\N	2024-07-29 18:34:47	2024-07-28 18:34:47	2024-07-28 18:34:47
628	App\\Models\\User	16	angular-front	ef0e9608332bc91282c133e7da7368ff88c56d2f683b6d381579d794ac02ef56	["*"]	2024-07-30 06:41:27	2024-07-31 04:31:15	2024-07-30 04:31:15	2024-07-30 06:41:27
591	App\\Models\\User	85	angular-front	330834c4cdcf3806e51fb1dba633248035fae45aacdd8b44cc80ceb27242d68c	["*"]	2024-07-28 18:34:49	2024-07-29 18:30:26	2024-07-28 18:30:26	2024-07-28 18:34:49
621	App\\Models\\User	16	angular-front	8cfb547bf07f80f0245915f1d79f6d837f33e60babab1b6485280290756266a6	["*"]	2024-07-30 04:38:38	2024-07-30 11:43:24	2024-07-29 11:43:24	2024-07-30 04:38:38
606	App\\Models\\User	73	angular-front	879f171620c866e5c636406ef81c2ee3c01d43672395bfb759cc201176bbd856	["*"]	\N	2024-07-29 19:31:19	2024-07-28 19:31:19	2024-07-28 19:31:19
624	App\\Models\\User	16	angular-front	e0c46701e51c38a718f12ad00e47ad1d422c7d1d1c0b1ad113614fed2b20da4b	["*"]	2024-07-29 23:15:26	2024-07-30 21:07:35	2024-07-29 21:07:35	2024-07-29 23:15:26
614	App\\Models\\User	73	angular-front	cfcceee6f85f10ee2d82f4b62102f5fcfce7c73fabbbf1fdbb5715e206bb240a	["*"]	2024-07-29 05:31:59	2024-07-30 05:31:04	2024-07-29 05:31:04	2024-07-29 05:31:59
607	App\\Models\\User	73	angular-front	bfedca3adc30e4736edad4d7b560890e029b3549e767e23dfad45267e187dff4	["*"]	2024-07-28 19:39:17	2024-07-29 19:31:19	2024-07-28 19:31:19	2024-07-28 19:39:17
612	App\\Models\\User	16	angular-front	5be3bff17e915af870164d825b019f68ce7c07c59a0dede4362140d0988f4bb5	["*"]	2024-07-29 05:32:00	2024-07-30 05:28:10	2024-07-29 05:28:10	2024-07-29 05:32:00
594	App\\Models\\User	85	angular-front	6c99e04cc5bba10a2ce3b90a79b005178381b01a5a30c7903c46c7c33709e866	["*"]	\N	2024-07-29 18:47:02	2024-07-28 18:47:02	2024-07-28 18:47:02
593	App\\Models\\User	73	angular-front	318ee1db3e6d2e230622e404b59f03f42e441b04beadcb524ebbfffeb0a2a87c	["*"]	2024-07-28 18:47:04	2024-07-29 18:34:47	2024-07-28 18:34:47	2024-07-28 18:47:04
604	App\\Models\\User	16	angular-front	10dc01730ac354ce740bb3b0ed5ee620051409730eeab2b1276fc12d1ad3aea4	["*"]	2024-07-28 19:45:26	2024-07-29 19:30:47	2024-07-28 19:30:47	2024-07-28 19:45:26
618	App\\Models\\User	85	angular-front	4445e1d92e243b5c9b97b41f6f3799a4a4885c2525065478e3ffc2b0e79089c8	["*"]	2024-07-29 10:19:15	2024-07-30 09:28:53	2024-07-29 09:28:53	2024-07-29 10:19:15
623	App\\Models\\User	16	angular-front	4ce344f5ae155dbd63cc0ab146c4200fbd348f7e3c2531be45b47b5ed5379327	["*"]	\N	2024-07-30 21:07:35	2024-07-29 21:07:35	2024-07-29 21:07:35
620	App\\Models\\User	16	angular-front	b886b8cc9adf2bc8275b1a18d76f6be74623184154f825928914617329d1eaf8	["*"]	\N	2024-07-30 11:31:11	2024-07-29 11:31:12	2024-07-29 11:31:12
619	App\\Models\\User	16	angular-front	018555c70012a322038295781e56d9d22dc318a4d1e3eef7d245517355f9331a	["*"]	2024-07-29 11:43:24	2024-07-30 11:31:11	2024-07-29 11:31:12	2024-07-29 11:43:24
610	App\\Models\\User	73	angular-front	a02a32e0b1a8f23efc0236a3549b350b8f3651203b95ead1c618ba5d24712314	["*"]	2024-07-28 19:48:51	2024-07-29 19:37:57	2024-07-28 19:37:57	2024-07-28 19:48:51
608	App\\Models\\User	73	angular-front	4c792ee1431857a2190454064841370dc8030e33ac615c8688497a45b5e2db65	["*"]	2024-07-28 19:36:54	2024-07-29 19:36:11	2024-07-28 19:36:11	2024-07-28 19:36:54
609	App\\Models\\User	73	angular-front	b6199995cbb6678e1e10e70809138f869f68cbacaa6117daf331a05e6805b79d	["*"]	\N	2024-07-29 19:37:57	2024-07-28 19:37:57	2024-07-28 19:37:57
611	App\\Models\\User	16	angular-front	b0cc3c4e51cb0f685d7f12efc49c9904a29c9f9af37d51bc4d3923b4c71eb565	["*"]	\N	2024-07-30 05:28:10	2024-07-29 05:28:10	2024-07-29 05:28:10
622	App\\Models\\User	109	angular-front	2e8d9247f2a534ae261cdcd7ca59f2d5fad22c1ad07c6efe86b4e876097a9ad0	["*"]	2024-07-29 21:07:35	2024-07-30 20:47:18	2024-07-29 20:47:18	2024-07-29 21:07:35
616	App\\Models\\User	16	angular-front	861475ff98f4d008e6d7dac707cb9ecc59e88f96820be52641c576347dfe962d	["*"]	\N	2024-07-30 09:28:17	2024-07-29 09:28:17	2024-07-29 09:28:17
626	App\\Models\\User	16	angular-front	12f650708d771653e4ea076bb322a0c56961594bd7110542b2e7aaa0b88cc2ad	["*"]	\N	2024-07-30 23:19:03	2024-07-29 23:19:04	2024-07-29 23:19:04
630	App\\Models\\User	16	angular-front	e72592e5f016a0994891f309099b1bf1e4a2bbd1c5a19d5b548547327b9fe5ff	["*"]	\N	2024-07-31 06:24:37	2024-07-30 06:24:38	2024-07-30 06:24:38
629	App\\Models\\User	16	angular-front	57d66c3ae1f3e3a0fdb6b90dea0c0008a66d24ab89bf848d3c1ce04b2766649c	["*"]	\N	2024-07-31 06:24:37	2024-07-30 06:24:38	2024-07-30 06:24:38
625	App\\Models\\User	16	angular-front	47a4d408d1ccb6afd2b7ba40f5fe4a97dcb6c2be100fb935c35c5b998b604905	["*"]	2024-07-29 23:29:44	2024-07-30 23:19:03	2024-07-29 23:19:04	2024-07-29 23:29:44
627	App\\Models\\User	16	angular-front	cc595f304c9045104a2fe0f4ead0b9edc3b5a7db6177916b39b3fe7f89dfc0f0	["*"]	\N	2024-07-31 04:31:15	2024-07-30 04:31:15	2024-07-30 04:31:15
632	App\\Models\\User	16	angular-front	dd9e240eb22fcae51e06ed4a34abca8b7ff8ab58f3f3b431c24311a77d2a15a0	["*"]	\N	2024-07-31 08:06:36	2024-07-30 08:06:36	2024-07-30 08:06:36
663	App\\Models\\User	16	angular-front	f69a0560b98678004309d7193e91e69f4a0e292923c86984fb9cd7374ee5b1ae	["*"]	2024-08-03 08:23:13	2024-08-04 07:21:59	2024-08-03 07:21:59	2024-08-03 08:23:13
660	App\\Models\\User	113	angular-front	f2653d430b979dade67803c0b850e8b3e8b51b3cb8f202c3b3561ceef068e479	["*"]	2024-08-02 22:29:22	2024-08-03 22:07:36	2024-08-02 22:07:36	2024-08-02 22:29:22
657	App\\Models\\User	113	angular-front	e9f23bc6cdee0a86dcfc6b43bbbbeab0a1c400945383c9604c7b7beaf3f58c5c	["*"]	2024-08-02 14:24:58	2024-08-03 09:24:22	2024-08-02 09:24:22	2024-08-02 14:24:58
642	App\\Models\\User	16	angular-front	a210f4b350773d8107e961b89c2896f80dc30bc136bce8651c0cefcd4981942e	["*"]	2024-07-31 17:28:12	2024-08-01 08:59:15	2024-07-31 08:59:16	2024-07-31 17:28:12
633	App\\Models\\User	16	angular-front	215f156a4aed9611eaad637ad8553efa27823af804ceb37ce3cfa5b9e411d362	["*"]	2024-07-30 08:10:17	2024-07-31 08:06:36	2024-07-30 08:06:36	2024-07-30 08:10:17
669	App\\Models\\User	16	angular-front	d8237cc07c817a468f905a55ee10222cfe1f1eb9db38eb17c766980b556963f1	["*"]	2024-08-03 09:08:59	2024-08-04 09:01:41	2024-08-03 09:01:41	2024-08-03 09:08:59
656	App\\Models\\User	113	angular-front	a0098f1239e2aa9a819add4f3e3e211c16960fb50b71dfa2f90b46996c37e430	["*"]	\N	2024-08-03 09:24:22	2024-08-02 09:24:22	2024-08-02 09:24:22
645	App\\Models\\User	113	angular-front	f8d7e07fc57706f3bceb2c44c4b9926a7d25c7e760972bab4d19ccb81aaf349c	["*"]	\N	2024-08-01 18:36:12	2024-07-31 18:36:12	2024-07-31 18:36:12
653	App\\Models\\User	16	angular-front	5d8e63cf2c379bdd4db2a4d44d224a7052380a9626e6647290c3826dfddac126	["*"]	2024-08-01 20:36:38	2024-08-02 13:53:41	2024-08-01 13:53:41	2024-08-01 20:36:38
651	App\\Models\\User	16	angular-front	6581d4133400af7dc5f0d3a264184083e2dee064900eb9b74293d9089947a462	["*"]	2024-08-01 13:51:08	2024-08-02 12:29:59	2024-08-01 12:29:59	2024-08-01 13:51:08
652	App\\Models\\User	16	angular-front	6021ab39db388b4589a04168d0f1dfd12e5af5e5d5b710081ca33bbe043bf259	["*"]	\N	2024-08-02 13:53:41	2024-08-01 13:53:41	2024-08-01 13:53:41
636	App\\Models\\User	16	angular-front	018bad4d0c2c79f0d61023884efce139368b12053d706ab5300ba1063043ec38	["*"]	2024-07-30 11:08:35	2024-07-31 10:38:41	2024-07-30 10:38:41	2024-07-30 11:08:35
654	App\\Models\\User	113	angular-front	bf671ec2292703e931a79f46a02708ff47d6c1a47862f33556f3cc03010bb309	["*"]	2024-08-01 20:36:38	2024-08-02 17:22:08	2024-08-01 17:22:08	2024-08-01 20:36:38
634	App\\Models\\User	113	angular-front	73f827c0a30d6f4ec2d106c6d584cdc591183ac392bc701c3461e5920c95fa43	["*"]	2024-07-30 08:40:10	2024-07-31 08:12:59	2024-07-30 08:12:59	2024-07-30 08:40:10
638	App\\Models\\User	113	angular-front	53d1f657fbf8dff9ee50e6c466f68f47cbd5d49186da60aaf9bbf2967f54d2d0	["*"]	2024-07-30 11:24:40	2024-07-31 10:39:03	2024-07-30 10:39:03	2024-07-30 11:24:40
665	App\\Models\\User	113	angular-front	2eaaf936ab3d9d451deeaa6c904aa7dc1c542b43843126344725caa0b22edb27	["*"]	2024-08-03 08:39:31	2024-08-04 08:23:13	2024-08-03 08:23:13	2024-08-03 08:39:31
647	App\\Models\\User	113	angular-front	650bd6bd60c4e1e683153ba2a2f3f30a300967ec2a3fab48926a451d9aaa4e3d	["*"]	2024-08-01 04:38:31	2024-08-02 04:11:15	2024-08-01 04:11:15	2024-08-01 04:38:31
659	App\\Models\\User	16	angular-front	62e49e0b62ad6a5c93680384c917c5d8f6afde499c32f532fd74c26385fc8aad	["*"]	2024-08-02 15:09:38	2024-08-03 09:38:17	2024-08-02 09:38:17	2024-08-02 15:09:38
661	App\\Models\\User	16	angular-front	06745f5f17b67b4aa945def94970fb19d28121ef602746492170f423f7a378a8	["*"]	2024-08-02 22:37:01	2024-08-03 22:14:03	2024-08-02 22:14:03	2024-08-02 22:37:01
649	App\\Models\\User	16	angular-front	17c580919c1cd0cfad2079b29878f57916bd7d0851950bdd4ac3951456d8b6b1	["*"]	2024-08-01 18:38:31	2024-08-02 04:12:18	2024-08-01 04:12:18	2024-08-01 18:38:31
631	App\\Models\\User	16	angular-front	489a234e4888f72cfedef200d24e510360451b79d84e2bf3d734368c57def25b	["*"]	2024-07-30 10:07:39	2024-07-31 06:37:39	2024-07-30 06:37:39	2024-07-30 10:07:39
635	App\\Models\\User	16	angular-front	fac2b8aab7da105553262e2c621008c872f3d28b3f1b9bd1363f131fa1f10d02	["*"]	\N	2024-07-31 10:38:40	2024-07-30 10:38:40	2024-07-30 10:38:40
637	App\\Models\\User	113	angular-front	5e900c250c67d3978d92b351a8227c4d07222cb858cc5b84fa58555ddbf99bac	["*"]	\N	2024-07-31 10:39:03	2024-07-30 10:39:03	2024-07-30 10:39:03
646	App\\Models\\User	113	angular-front	928e9ccbcfab407bab68eaf41a95eed1c204db26cd7f650eb96142f99d744e26	["*"]	2024-08-01 04:11:15	2024-08-01 18:36:12	2024-07-31 18:36:12	2024-08-01 04:11:15
643	App\\Models\\User	16	angular-front	66354ea066a48906dd9db370e5868a123ef7e202990cf57a8ac6408c6fda680c	["*"]	\N	2024-08-01 15:00:44	2024-07-31 15:00:44	2024-07-31 15:00:44
640	App\\Models\\User	113	angular-front	2af504c5067d2595d686138c4f0fd1f84dce92e72e33f4f32afcc8cffe83f2bf	["*"]	2024-07-30 12:11:31	2024-07-31 11:24:39	2024-07-30 11:24:39	2024-07-30 12:11:31
648	App\\Models\\User	16	angular-front	d0bce81de4f29219afb783b150531cd018dd71b7770e249e31f876ae9626d970	["*"]	\N	2024-08-02 04:12:18	2024-08-01 04:12:18	2024-08-01 04:12:18
639	App\\Models\\User	16	angular-front	77cd79c09015281ba1acb1b5a5da66c1c93c25e67491567280987b0924660c53	["*"]	2024-07-30 12:11:43	2024-07-31 11:08:33	2024-07-30 11:08:33	2024-07-30 12:11:43
658	App\\Models\\User	16	angular-front	88f30ec15198f54590969f6a153b47bbe397ada16a24517da2775f4c3ba43538	["*"]	\N	2024-08-03 09:38:17	2024-08-02 09:38:17	2024-08-02 09:38:17
641	App\\Models\\User	16	angular-front	d2d80ce3563b7d0526604b926641d7d330e944dadb994d66731d90ab12bad998	["*"]	\N	2024-08-01 08:59:15	2024-07-31 08:59:16	2024-07-31 08:59:16
650	App\\Models\\User	16	angular-front	d11930db191077677a13b9edf27fb7bd9b20ec24e0f85a7053bac4700c89c87e	["*"]	\N	2024-08-02 12:29:57	2024-08-01 12:29:57	2024-08-01 12:29:57
644	App\\Models\\User	16	angular-front	26c66145fb3496396a0b4548c87f61db48cc2d43061296162d40906a921abd3b	["*"]	2024-08-01 04:12:19	2024-08-01 15:00:44	2024-07-31 15:00:44	2024-08-01 04:12:19
667	App\\Models\\User	16	angular-front	a585be1e22ea77e2f574eaf7f1ecf843edfcd8f663e34a4cec36006f5bff66ae	["*"]	2024-08-03 08:58:29	2024-08-04 08:39:30	2024-08-03 08:39:30	2024-08-03 08:58:29
655	App\\Models\\User	113	angular-front	41760a2c985b2141a37eb2aa4c4d70ab7cb71d40b28d7e32e5e0c1b1a4f76713	["*"]	2024-08-02 09:38:18	2024-08-03 07:21:51	2024-08-02 07:21:51	2024-08-02 09:38:18
662	App\\Models\\User	16	angular-front	9b357848ae6e51a9bab9b2d09a8679db3fc66eb54ada37f7eb86b899536c9f55	["*"]	\N	2024-08-03 22:14:03	2024-08-02 22:14:03	2024-08-02 22:14:03
666	App\\Models\\User	16	angular-front	05fbe5dc782583a26d09307dd51e99d074f54da5ac16c13ce8ae3db1dc650378	["*"]	\N	2024-08-04 08:39:30	2024-08-03 08:39:30	2024-08-03 08:39:30
664	App\\Models\\User	113	angular-front	369757c2c05d13f7483cb7d147ea35f5a635c0da01613208bc1afdd187fd86b8	["*"]	\N	2024-08-04 08:23:13	2024-08-03 08:23:13	2024-08-03 08:23:13
668	App\\Models\\User	16	angular-front	0c0d13a5b3d33489996aab0571f3faf88ccb0380a4aa46891e72bc5ea3147f80	["*"]	\N	2024-08-04 09:01:41	2024-08-03 09:01:41	2024-08-03 09:01:41
670	App\\Models\\User	16	angular-front	8c0f46208ae0eb5761b46dbe6014e0de059f21c56f7d602a8beb2ff1a0ec77b3	["*"]	\N	2024-08-04 09:15:14	2024-08-03 09:15:14	2024-08-03 09:15:14
671	App\\Models\\User	16	angular-front	df3773b9c8a6c71f6fb985d5e16af0bd86a4dab169a088d9230f1f19f79f1794	["*"]	\N	2024-08-04 09:15:15	2024-08-03 09:15:15	2024-08-03 09:15:15
672	App\\Models\\User	16	angular-front	be0c08c637f168991f0229241e3e40f5338053dc84b198fd14d3a17b123b24cb	["*"]	\N	2024-08-04 09:15:28	2024-08-03 09:15:28	2024-08-03 09:15:28
673	App\\Models\\User	16	angular-front	ece16b8a89851f62ef1862992838ac90a9321857ce1fe9a7ab8aee592b7633b6	["*"]	\N	2024-08-04 09:15:29	2024-08-03 09:15:29	2024-08-03 09:15:29
674	App\\Models\\User	16	angular-front	acccf8b17bbfa806bad91d1be531e959d0214157ade00ea38f3d938dbcc9a8a3	["*"]	\N	2024-08-04 09:15:53	2024-08-03 09:15:53	2024-08-03 09:15:53
675	App\\Models\\User	16	angular-front	4181b49ecd3cf730081f192c309f103f787ae8dba9d1b9fd9ac6cbcc0c4da754	["*"]	\N	2024-08-04 09:15:54	2024-08-03 09:15:54	2024-08-03 09:15:54
676	App\\Models\\User	16	angular-front	cd9a5be47fc3d07055605fd78c115f04b3b343fc0835dde34bf2ac02f0b43c70	["*"]	\N	2024-08-04 09:19:02	2024-08-03 09:19:02	2024-08-03 09:19:02
677	App\\Models\\User	16	angular-front	73629596f1d3820bc8747ea4038a8f0678b021fde51e74f3b42bfc57fe0305f0	["*"]	\N	2024-08-04 09:19:03	2024-08-03 09:19:03	2024-08-03 09:19:03
678	App\\Models\\User	16	angular-front	22b8e36c7d57ab675923d97da3054c83a16d9a01a49bf1f55f0e54ea4bd383cc	["*"]	\N	2024-08-04 09:22:44	2024-08-03 09:22:44	2024-08-03 09:22:44
679	App\\Models\\User	16	angular-front	8837f355511698e323ea60bc44bb34e1100b61b041c6a36ca310f49a41e218cf	["*"]	\N	2024-08-04 09:22:45	2024-08-03 09:22:45	2024-08-03 09:22:45
680	App\\Models\\User	16	angular-front	53d140ed63b1626a08bc5aabc995758ebd691368ae21d4ba575d87614c5f6a8c	["*"]	\N	2024-08-04 09:23:15	2024-08-03 09:23:15	2024-08-03 09:23:15
681	App\\Models\\User	16	angular-front	b7a166236437fbb1d50bc3595659e9aebe0b91abfd283d69b588eb03e73fe6f2	["*"]	\N	2024-08-04 09:23:16	2024-08-03 09:23:16	2024-08-03 09:23:16
682	App\\Models\\User	16	angular-front	d8098741f7919aecfc6e4980fa118910e4f61acbaa89db4cdcd401db59da52ac	["*"]	\N	2024-08-04 09:25:07	2024-08-03 09:25:07	2024-08-03 09:25:07
683	App\\Models\\User	16	angular-front	c26db9c48fe14ec7d3224cea0d023ce0a1f9c9adab438e13c072a3b4e2953d63	["*"]	\N	2024-08-04 09:25:08	2024-08-03 09:25:08	2024-08-03 09:25:08
684	App\\Models\\User	16	angular-front	84d5cc9bc8ffb031bfee66889c469a7b362b848d78cd43eb110bb6936838495a	["*"]	\N	2024-08-04 09:26:01	2024-08-03 09:26:01	2024-08-03 09:26:01
685	App\\Models\\User	16	angular-front	392bcd5b088cdfa02b81d9bc2692c2b468378eb9f8e1f6f63a42562a8c1286a5	["*"]	\N	2024-08-04 09:26:02	2024-08-03 09:26:02	2024-08-03 09:26:02
686	App\\Models\\User	16	angular-front	728c1ac93404daadcc29f7df0f7193e1e9a8d059b54db78207e704054a4a4426	["*"]	\N	2024-08-04 09:27:04	2024-08-03 09:27:04	2024-08-03 09:27:04
687	App\\Models\\User	16	angular-front	4c84f5c1f22cfbd7caa3eedfdaa6f46620cb9ead9110629f5cbc1f567667761e	["*"]	\N	2024-08-04 09:27:05	2024-08-03 09:27:05	2024-08-03 09:27:05
688	App\\Models\\User	16	angular-front	a2c19edb2f3ea3f1090067dd481d38cdc7c8e46db25a7da92cc3233ed37c2107	["*"]	\N	2024-08-04 09:29:41	2024-08-03 09:29:41	2024-08-03 09:29:41
689	App\\Models\\User	16	angular-front	8baeefaf94c3103b054c689fff2e2ec5f0ca463f05c7945c2f7d7466b4d40d65	["*"]	\N	2024-08-04 09:29:42	2024-08-03 09:29:42	2024-08-03 09:29:42
690	App\\Models\\User	16	angular-front	fd4d4a41c93e25f6a7a1ebe356cf9201f2d36b1a9fde882a687c5421b947fd26	["*"]	\N	2024-08-04 09:30:53	2024-08-03 09:30:53	2024-08-03 09:30:53
691	App\\Models\\User	16	angular-front	1e65b5df79a01449f1df146c1e3c05565e31038ce32fc47569cabb63ea78731a	["*"]	\N	2024-08-04 09:30:55	2024-08-03 09:30:55	2024-08-03 09:30:55
692	App\\Models\\User	16	angular-front	738c014361f39cc135546c6ac8e6cd071c1847c51de9d90eae78eda91ba485fb	["*"]	\N	2024-08-04 09:32:23	2024-08-03 09:32:23	2024-08-03 09:32:23
693	App\\Models\\User	16	angular-front	aef41799e6312523362a9f8d023806bd97db89253c07ea4f995d5d062e177f44	["*"]	\N	2024-08-04 09:32:24	2024-08-03 09:32:24	2024-08-03 09:32:24
694	App\\Models\\User	113	angular-front	bca8c623339355f215f5bbeaee0419c9e2b6785d340492554dffc7dacee98133	["*"]	\N	2024-08-04 10:02:47	2024-08-03 10:02:47	2024-08-03 10:02:47
695	App\\Models\\User	113	angular-front	230dbe10119847ec0178ddcba12909ddaf20f953ecf3c7dd4c56eceeb40b8547	["*"]	\N	2024-08-04 10:02:48	2024-08-03 10:02:48	2024-08-03 10:02:48
696	App\\Models\\User	113	angular-front	b8f150d01386451705bb1b69a611c37b5b7b31484a2a5f724b6a6d9acc800106	["*"]	\N	2024-08-04 10:03:35	2024-08-03 10:03:35	2024-08-03 10:03:35
697	App\\Models\\User	113	angular-front	50e7ff108be7297a7f438f6d2d92bf1045d30b5b423bb7a04ce00c220cbe0b04	["*"]	\N	2024-08-04 10:03:36	2024-08-03 10:03:36	2024-08-03 10:03:36
698	App\\Models\\User	113	angular-front	7e862f11dd59c4f4a6bd7533175ca56f16a5347fe60ef94d731796a008fe6dcc	["*"]	\N	2024-08-04 10:04:16	2024-08-03 10:04:16	2024-08-03 10:04:16
700	App\\Models\\User	113	angular-front	2e902d6bbbd4b780b8e85bef62a070e3008d9a998909e93092585a9f4db42bc6	["*"]	\N	2024-08-04 10:05:01	2024-08-03 10:05:01	2024-08-03 10:05:01
705	App\\Models\\User	16	angular-front	5e7695bf313eddf26c56211bc7d73213d7f1909df67ba433484d2968d977ae79	["*"]	2024-08-03 10:24:31	2024-08-04 10:12:04	2024-08-03 10:12:04	2024-08-03 10:24:31
706	App\\Models\\User	16	angular-front	df37e660ca0369ccfe09c04eea246d1c9af443b721ed64279a1949adf03473e6	["*"]	\N	2024-08-04 10:27:34	2024-08-03 10:27:34	2024-08-03 10:27:34
699	App\\Models\\User	113	angular-front	5c95ac22da49e4f7ff2b28df7aa0094a9b00d40e2d10c19a4bbbfd9b6636ec9e	["*"]	2024-08-03 10:05:03	2024-08-04 10:04:17	2024-08-03 10:04:17	2024-08-03 10:05:03
702	App\\Models\\User	16	angular-front	dbbbef6ad09e8b03dfb23790437e0a1f83838314e5ee2a01d4dc750c030e2b43	["*"]	\N	2024-08-04 10:05:54	2024-08-03 10:05:54	2024-08-03 10:05:54
707	App\\Models\\User	16	angular-front	388833836c4966e8c02ff2d4be6257144131f7717ceb24abef0e0c68f736cb33	["*"]	\N	2024-08-04 10:27:35	2024-08-03 10:27:35	2024-08-03 10:27:35
704	App\\Models\\User	16	angular-front	cc62a39cc16acbf2b025c121c987adb50011ad428ea8b3ea1a7441c06d563ffd	["*"]	\N	2024-08-04 10:12:04	2024-08-03 10:12:04	2024-08-03 10:12:04
709	App\\Models\\User	113	angular-front	85dade117fcbcabdd6c4f9ef4d93525c052b210a8ed534990e0c27f527925796	["*"]	\N	2024-08-04 11:21:21	2024-08-03 11:21:21	2024-08-03 11:21:21
711	App\\Models\\User	113	angular-front	2637e69aa0bd28862493294d7ae37da842312e2180b977ede9f1dcf94eb43c75	["*"]	2024-08-03 13:08:39	2024-08-04 12:05:11	2024-08-03 12:05:11	2024-08-03 13:08:39
703	App\\Models\\User	16	angular-front	197b6f05298f97e332e779c80b3221e64240b927fef4bd4c09f1b8cf61ad0e78	["*"]	2024-08-03 10:08:11	2024-08-04 10:05:54	2024-08-03 10:05:54	2024-08-03 10:08:11
701	App\\Models\\User	113	angular-front	5e9394cfd26dbe58e7ae297bc3b230cd0875db43cac0222ee37670e2158846a5	["*"]	2024-08-03 10:12:04	2024-08-04 10:05:03	2024-08-03 10:05:03	2024-08-03 10:12:04
710	App\\Models\\User	113	angular-front	0596b131d3e28c37bcd1e0c75b79c6727125c987becffd0b558c301f820c9a14	["*"]	\N	2024-08-04 12:05:11	2024-08-03 12:05:11	2024-08-03 12:05:11
712	App\\Models\\User	113	angular-front	78c7d590ebee8e3f8af00311212770268548e472cc35cf84fc51bd288aecbe60	["*"]	\N	2024-08-05 13:02:17	2024-08-04 13:02:17	2024-08-04 13:02:17
708	App\\Models\\User	113	angular-front	c87fd3c0cde0bedd9221dd4f3bd763c1ed4a113a9bb589c7269ed6b06e1c580d	["*"]	2024-08-03 12:05:12	2024-08-04 11:21:21	2024-08-03 11:21:21	2024-08-03 12:05:12
714	App\\Models\\User	16	angular-front	d7abefe505117b9784e83f41420631db38bdccadfb2a257d87518ba36c9e859c	["*"]	\N	2024-08-05 13:23:48	2024-08-04 13:23:48	2024-08-04 13:23:48
723	App\\Models\\User	16	angular-front	af202d10c7fcff6b09ebb8c928b4fc90f5ee5ce90745d14e50bd6daebdcadb12	["*"]	2024-08-07 08:10:00	2024-08-08 08:00:07	2024-08-07 08:00:07	2024-08-07 08:10:00
713	App\\Models\\User	113	angular-front	514773cc8cf0262bdd9538c4647b7af7535e2026a9e5031d87961eef4bbe8ebf	["*"]	2024-08-04 14:09:19	2024-08-05 13:02:17	2024-08-04 13:02:17	2024-08-04 14:09:19
719	App\\Models\\User	16	angular-front	dbac1b14e944e1fabef8162fa40e25dd05d76d0a4961b8d19d63475f601d66d1	["*"]	\N	2024-08-08 07:01:34	2024-08-07 07:01:34	2024-08-07 07:01:34
724	App\\Models\\User	16	angular-front	d4a85bcdb4ddae6555b9fe97df7d3a9f333b030bddffeaddc7d939dbafce7c6c	["*"]	\N	2024-08-08 08:13:20	2024-08-07 08:13:20	2024-08-07 08:13:20
725	App\\Models\\User	16	angular-front	2859b6f8b1a3dad94c2314b06a6b74fc8633e0b7c16d2f1e2079490ee5c539de	["*"]	\N	2024-08-08 08:13:20	2024-08-07 08:13:21	2024-08-07 08:13:21
726	App\\Models\\User	16	angular-front	c214c9bb6270fb501c66736109bb42ea2049709e18d3e2767c155d3f34fc50b6	["*"]	\N	2024-08-08 08:13:53	2024-08-07 08:13:53	2024-08-07 08:13:53
728	App\\Models\\User	16	angular-front	41eb7e8ad9a9ef0dbccc5e38e775170117e4425cf8d3945f75bf894df0ecb8c2	["*"]	\N	2024-08-08 08:14:26	2024-08-07 08:14:26	2024-08-07 08:14:26
743	App\\Models\\User	16	angular-front	c4f116b62c816050f17e69f2fad688695fe75d20503aeff7ac743ba110beb286	["*"]	2024-08-21 04:26:24	2024-08-22 04:26:15	2024-08-21 04:26:15	2024-08-21 04:26:24
727	App\\Models\\User	16	angular-front	51d853e182f1b5a1ba32cce68c728e2b044a23cd1ee3dfb9b49dc74b5c8259af	["*"]	2024-08-07 08:14:26	2024-08-08 08:13:53	2024-08-07 08:13:53	2024-08-07 08:14:26
718	App\\Models\\User	16	angular-front	8912314d100afdceb23b176941e846afc62b223d108a8bdb908a5bf0edf21508	["*"]	2024-08-07 07:52:21	2024-08-08 07:01:34	2024-08-07 07:01:34	2024-08-07 07:52:21
721	App\\Models\\User	16	angular-front	efb151808297da12680d288160c40b582ff1f099f161830b5a93f18655baf534	["*"]	\N	2024-08-08 07:57:42	2024-08-07 07:57:42	2024-08-07 07:57:42
720	App\\Models\\User	16	angular-front	ba5eb44068d924c9e918fc0cd7299a4740bc4ef637ab1c67e282cae259cf7523	["*"]	\N	2024-08-08 07:57:42	2024-08-07 07:57:42	2024-08-07 07:57:42
722	App\\Models\\User	16	angular-front	1c6e5ee6b944ba6b4f03be6e7ecbac8e72c6d24331605a55fc9c339362d2c8df	["*"]	\N	2024-08-08 08:00:07	2024-08-07 08:00:07	2024-08-07 08:00:07
744	App\\Models\\User	16	angular-front	67f4362d02e6d2fe8b14c799bad1c3779a171fb1376868deb513c2e9a4fb335d	["*"]	\N	2024-08-22 04:29:00	2024-08-21 04:29:00	2024-08-21 04:29:00
729	App\\Models\\User	16	angular-front	bc6a0f9c485663eb9a0ddffe80a82b286cbf164eb1638192ef7cdea36c7dd936	["*"]	2024-08-07 14:57:46	2024-08-08 08:14:26	2024-08-07 08:14:26	2024-08-07 14:57:46
731	App\\Models\\User	16	angular-front	796eeec1aa754544576682dd48e935fcae835b94293b6e6b9193aa2e62a73179	["*"]	\N	2024-08-16 11:08:02	2024-08-15 11:08:02	2024-08-15 11:08:02
745	App\\Models\\User	16	angular-front	43277a48b5da99869e772bc7ae34c9a6a37b8c463923c7d716fbf055f0a4bfa0	["*"]	2024-08-21 04:29:04	2024-08-22 04:29:00	2024-08-21 04:29:00	2024-08-21 04:29:04
747	App\\Models\\User	16	angular-front	f7b638e516dc89758a7301192d1e4287e9f261f87f344259b2efce4427e9dd0f	["*"]	\N	2024-08-22 04:30:15	2024-08-21 04:30:15	2024-08-21 04:30:15
736	App\\Models\\User	119	angular-front	cdb4356c01b3f39a34825f93299d42f7feebe1ed643934469370133feb2e26c4	["*"]	\N	2024-08-18 03:42:38	2024-08-17 03:42:38	2024-08-17 03:42:38
734	App\\Models\\User	16	angular-front	deca8e1d2dd34d4f22dca8f7afe13f234e8e85791335ea54f0f861feb3efb30d	["*"]	\N	2024-08-18 03:20:34	2024-08-17 03:20:35	2024-08-17 03:20:35
748	App\\Models\\User	16	angular-front	8a1959ce12db1da160f627e401cda8009780f1f72ff40dfa68e0dd00108ed665	["*"]	2024-08-21 04:42:09	2024-08-22 04:33:25	2024-08-21 04:33:25	2024-08-21 04:42:09
735	App\\Models\\User	16	angular-front	da5591009b7fcb3f6698393f8c813ce93626ea10f22fed1e045739f4c1b9a081	["*"]	2024-08-17 03:42:39	2024-08-18 03:20:34	2024-08-17 03:20:35	2024-08-17 03:42:39
733	App\\Models\\User	16	angular-front	d08ed06b4616b58b4a29db2186c14eccd8ec297b56973d47017d299176c84450	["*"]	2024-08-17 03:20:35	2024-08-17 16:53:05	2024-08-16 16:53:05	2024-08-17 03:20:35
750	App\\Models\\User	16	angular-front	d8cc0b09063333e3f863357661eff9da11bd83027e019759193fa99e7dfd8df4	["*"]	\N	2024-08-22 04:42:56	2024-08-21 04:42:56	2024-08-21 04:42:56
730	App\\Models\\User	16	angular-front	e3ab8d2d3cb608c1b1914f0015a5747e39c6e8ac1f5a9b83657f2f8a8a5bd416	["*"]	2024-08-15 14:11:27	2024-08-16 11:08:02	2024-08-15 11:08:02	2024-08-15 14:11:27
715	App\\Models\\User	16	angular-front	62b44a9b1f3872f04ea890d914b293238d1dcd055384dc2b67a9876e14b75522	["*"]	2024-08-04 14:08:36	2024-08-05 13:23:48	2024-08-04 13:23:48	2024-08-04 14:08:36
716	App\\Models\\User	113	angular-front	ee15526200d839956b465577cf5f4cc676cfeac93fd3ae163cff9ed88033a918	["*"]	\N	2024-08-05 14:09:06	2024-08-04 14:09:06	2024-08-04 14:09:06
717	App\\Models\\User	113	angular-front	35160ac670b9dc44ac281f83cd0702b6ab44cadb5ffd6610dec2714d4c97c7ea	["*"]	\N	2024-08-05 14:09:06	2024-08-04 14:09:06	2024-08-04 14:09:06
732	App\\Models\\User	16	angular-front	3071e930e19cad842b1d3c1f651ef44374bdaefa462679663b42cfa02cde4db6	["*"]	\N	2024-08-17 16:53:05	2024-08-16 16:53:05	2024-08-16 16:53:05
751	App\\Models\\User	16	angular-front	123a0c5f161d1da98742883d84866f3b3e0abfce139b69a4f6af66a5a383d5d0	["*"]	2024-08-21 04:46:35	2024-08-22 04:42:56	2024-08-21 04:42:56	2024-08-21 04:46:35
739	App\\Models\\User	16	angular-front	5b826b6ee45cc9b41450e24a52da6a61063d805290b6d269425cf6743d6a64db	["*"]	2024-08-17 05:47:36	2024-08-18 03:53:12	2024-08-17 03:53:12	2024-08-17 05:47:36
738	App\\Models\\User	16	angular-front	00cca2dab86f6c1fcc18b04a80f231d5acd9f4473fe5f649060f83bac1202aaf	["*"]	\N	2024-08-18 03:53:12	2024-08-17 03:53:12	2024-08-17 03:53:12
741	App\\Models\\User	16	angular-front	4c7da51a13ea2a234c46a88a33205245b29bf1a5850174872017297ade499069	["*"]	2024-08-20 15:53:47	2024-08-21 04:55:11	2024-08-20 04:55:11	2024-08-20 15:53:47
737	App\\Models\\User	119	angular-front	8a84fb215ee27a5c25f85782dbe5b90f61672e0c142ff0599a9a43c9ee98c794	["*"]	2024-08-17 05:47:37	2024-08-18 03:42:38	2024-08-17 03:42:38	2024-08-17 05:47:37
740	App\\Models\\User	16	angular-front	55537cac4eec3b09d8c2738617ed5783f7257e01002a5afde8289952ce968932	["*"]	\N	2024-08-21 04:55:10	2024-08-20 04:55:10	2024-08-20 04:55:10
746	App\\Models\\User	16	angular-front	77ed6feac631a338bed9b5a66fc39566d23118df2f08ff098a9e0fb35508e655	["*"]	2024-08-21 04:32:12	2024-08-22 04:30:15	2024-08-21 04:30:15	2024-08-21 04:32:12
742	App\\Models\\User	16	angular-front	c121e87f09895a9ae1bee26001a25174ed15675f40a5b51e4cf5af30ae634836	["*"]	\N	2024-08-22 04:26:15	2024-08-21 04:26:15	2024-08-21 04:26:15
749	App\\Models\\User	16	angular-front	4d85ba5a9727d30dacfb740061c614f64ead1795fb75b78755a89cbf6f25655f	["*"]	\N	2024-08-22 04:33:25	2024-08-21 04:33:25	2024-08-21 04:33:25
752	App\\Models\\User	16	angular-front	1a0cbf4f180e313aa106e2b9c10cbfdb5afd06a1ec4c143ff73d8605e346c3cc	["*"]	\N	2024-08-22 04:47:36	2024-08-21 04:47:36	2024-08-21 04:47:36
755	App\\Models\\User	16	angular-front	31afa7ffd6e0910f0c90cd8c19d10efe78c45ec3b0a026c98b65bbf707133a71	["*"]	2024-08-21 05:12:50	2024-08-22 04:52:31	2024-08-21 04:52:31	2024-08-21 05:12:50
753	App\\Models\\User	16	angular-front	1dff92f6a0c394656a8ecb6fe92f23316ad3ad97308aa5923afba58857c74c6e	["*"]	2024-08-21 04:51:59	2024-08-22 04:47:36	2024-08-21 04:47:36	2024-08-21 04:51:59
754	App\\Models\\User	16	angular-front	e40b6dcc6c38c263ee4319585c3f31f354375f22a6d2fc0374c18e3b83fc42bf	["*"]	\N	2024-08-22 04:52:31	2024-08-21 04:52:31	2024-08-21 04:52:31
756	App\\Models\\User	16	angular-front	11a599a83f914a5133d0718d6d1a532e2b1d7cf97159fb66fe0bccb54f0a474e	["*"]	\N	2024-08-22 05:23:45	2024-08-21 05:23:45	2024-08-21 05:23:45
757	App\\Models\\User	16	angular-front	ddcc66c7c15f69435de6f3c5e4efd6d67bb030944bcbd25c151de01c0f6c2720	["*"]	2024-08-21 05:23:52	2024-08-22 05:23:45	2024-08-21 05:23:45	2024-08-21 05:23:52
759	App\\Models\\User	16	angular-front	9ec0ec57204675240063f79d6a40924098f78f4a819fa254d0b7b8997e6c5add	["*"]	\N	2024-08-23 05:37:24	2024-08-22 05:37:24	2024-08-22 05:37:24
760	App\\Models\\User	16	angular-front	08b3aa01630f482d946d3deca3d40e869445360ba8fa523776b43f5d28fe093d	["*"]	\N	2024-08-23 05:38:22	2024-08-22 05:38:22	2024-08-22 05:38:22
766	App\\Models\\User	16	angular-front	fa6c2c0d6b1d28e27f79ec70d305793696fdba85a559e955bf81d0c2beadb820	["*"]	\N	2024-08-23 06:40:58	2024-08-22 06:40:58	2024-08-22 06:40:58
758	App\\Models\\User	16	angular-front	c6d362dee476922da315ac17b3f3369d4c87a3e0b3b22e4de6fc75a8f6421229	["*"]	2024-08-22 05:38:23	2024-08-23 05:37:24	2024-08-22 05:37:24	2024-08-22 05:38:23
762	App\\Models\\User	16	angular-front	80648395d592eb60ebd91e1d075934d7fe5a1a34f51e46e24857a81ab3c2d7e9	["*"]	\N	2024-08-23 05:45:13	2024-08-22 05:45:13	2024-08-22 05:45:13
763	App\\Models\\User	16	angular-front	f7efc715f52412b7a64e221c4cd85c641f3eddd79a236c8a619dcd22d18f68c1	["*"]	\N	2024-08-23 05:45:13	2024-08-22 05:45:13	2024-08-22 05:45:13
765	App\\Models\\User	16	angular-front	d24d854879ac83bdf3c8955bbc2a526ac7444968ebe35919cbfad0a127ebda3e	["*"]	2024-08-22 06:40:58	2024-08-23 05:58:04	2024-08-22 05:58:04	2024-08-22 06:40:58
761	App\\Models\\User	16	angular-front	e146a7fa9ae8d770fb3ba66c15fdf6a58e1fffc132a90e33e763c46fa4ea7240	["*"]	2024-08-22 05:45:14	2024-08-23 05:38:22	2024-08-22 05:38:22	2024-08-22 05:45:14
764	App\\Models\\User	16	angular-front	8a174fa1edefdee1eb595e62d32e8590a4969a21c90446c20b3b71ebc07844fb	["*"]	\N	2024-08-23 05:58:04	2024-08-22 05:58:04	2024-08-22 05:58:04
769	App\\Models\\User	16	angular-front	88312a5aa1ed5f230c7f12ef4c06e2c6b40dd21a574bb1e9fbe786ec83ea81bd	["*"]	2024-08-22 09:57:13	2024-08-23 09:53:33	2024-08-22 09:53:33	2024-08-22 09:57:13
771	App\\Models\\User	16	angular-front	7af91ae2de92553283b90abe495ddd3c2cb4ff6e4ac9fed6e3ff0f44e34fb0a7	["*"]	\N	2024-08-23 09:58:37	2024-08-22 09:58:37	2024-08-22 09:58:37
770	App\\Models\\User	16	angular-front	75d521036ac45fda1298f7cb90d0e9d8c41f8cbeaec3d02ab1861c2be6f99db0	["*"]	2024-08-22 10:04:34	2024-08-23 09:58:37	2024-08-22 09:58:37	2024-08-22 10:04:34
772	App\\Models\\User	16	angular-front	9715ed2cad764be6d0b4883d30f37aebdae4e702a9e9508d4bbf630c8d9a6cb8	["*"]	\N	2024-08-23 10:05:39	2024-08-22 10:05:39	2024-08-22 10:05:39
767	App\\Models\\User	16	angular-front	3ab27e5be25f1811630db1f77388a362b94be19106b823b4febfa5683c4a0776	["*"]	2024-08-22 09:50:20	2024-08-23 06:40:58	2024-08-22 06:40:58	2024-08-22 09:50:20
768	App\\Models\\User	16	angular-front	aa604fd29b5e34341e7e0129f3b9f41debdc6a4bc3b4b9f3a1ec98d92226f886	["*"]	\N	2024-08-23 09:53:33	2024-08-22 09:53:33	2024-08-22 09:53:33
773	App\\Models\\User	16	angular-front	1e0b17762220fe6c2605f30617beb325b7b05d3b82d5a36fa2feadaf941bcd5d	["*"]	2024-08-22 10:09:13	2024-08-23 10:05:39	2024-08-22 10:05:39	2024-08-22 10:09:13
774	App\\Models\\User	16	angular-front	8276c0a0026e8fbfa18488792c2730c808b7c453413593ed04f9c8296faaa9d8	["*"]	\N	2024-08-23 10:10:01	2024-08-22 10:10:01	2024-08-22 10:10:01
775	App\\Models\\User	16	angular-front	2176e6064e28b9dda75190bdb12f17106857014b1612fce09038da2ad3ed9baa	["*"]	\N	2024-08-23 10:10:01	2024-08-22 10:10:01	2024-08-22 10:10:01
776	App\\Models\\User	16	angular-front	e30a1ce485c9cfeea37def1c8004ef7dd92d34e430b683228cbae9121a70a02b	["*"]	\N	2024-08-23 10:11:44	2024-08-22 10:11:44	2024-08-22 10:11:44
777	App\\Models\\User	16	angular-front	4616ba05b6825723d26a8d6520099795144735aa2c000ab555558fadd28bc715	["*"]	\N	2024-08-23 10:11:44	2024-08-22 10:11:44	2024-08-22 10:11:44
778	App\\Models\\User	16	angular-front	1b2ac2420db4fa1ac42f281f5760d1dc1d6b0eeba9405236f890804f6304c888	["*"]	\N	2024-08-23 10:16:33	2024-08-22 10:16:33	2024-08-22 10:16:33
779	App\\Models\\User	16	angular-front	1c6ffb2d31fdfefc69c60ed1304c9507bf4c4d842168f5e98612f6dbed4c6b66	["*"]	\N	2024-08-23 10:16:34	2024-08-22 10:16:34	2024-08-22 10:16:34
780	App\\Models\\User	16	angular-front	7a3568968bb082e966a6bb74fe35e5ff780cae7fc886aaf7714163c191a00f4b	["*"]	\N	2024-08-23 10:17:55	2024-08-22 10:17:55	2024-08-22 10:17:55
781	App\\Models\\User	16	angular-front	9b9cfa35239e35e3fa10046917217231c7b4ec6551b599d8647bc69515e1e935	["*"]	\N	2024-08-23 10:17:55	2024-08-22 10:17:55	2024-08-22 10:17:55
782	App\\Models\\User	16	angular-front	5fdaab041ac00b88c6d1eea0814a24b6c7ca97f3f2939831d0aa6019d6e9c613	["*"]	2024-08-22 11:12:38	2024-08-23 11:11:26	2024-08-22 11:11:26	2024-08-22 11:12:38
783	App\\Models\\User	16	angular-front	4bd323da112ea7aabb24818d464283228795f866d662b93089110821736daeb1	["*"]	\N	2024-08-23 11:12:52	2024-08-22 11:12:52	2024-08-22 11:12:52
790	App\\Models\\User	16	angular-front	91cb852e28bab0ebb97718a81cb7572d6fc5ec1386a5911b74832d09ca4eb533	["*"]	2024-08-22 11:30:06	2024-08-23 11:29:41	2024-08-22 11:29:41	2024-08-22 11:30:06
791	App\\Models\\User	16	angular-front	0f70e93f74768a9567c98fd981dea2b7f64d93415519408f900e86082a1c8495	["*"]	\N	2024-08-23 11:32:22	2024-08-22 11:32:22	2024-08-22 11:32:22
784	App\\Models\\User	16	angular-front	b2cbc9dc89626c705002cb26c52e85f5a7601982563f7094164a8dee41fd436f	["*"]	2024-08-22 11:18:42	2024-08-23 11:12:52	2024-08-22 11:12:52	2024-08-22 11:18:42
785	App\\Models\\User	16	angular-front	10ce445a0da55808ef584b42a5dff6461fad2baf477f10dc72ec0a0745ce2ce8	["*"]	\N	2024-08-23 11:19:54	2024-08-22 11:19:54	2024-08-22 11:19:54
809	App\\Models\\User	122	angular-front	536f8ce650f4dc30bbfb530125ec302bae79e6ae10b01e8bc7320d9089adf5c3	["*"]	2024-08-22 13:07:56	2024-08-23 13:07:24	2024-08-22 13:07:24	2024-08-22 13:07:56
808	App\\Models\\User	121	angular-front	24a8e89e941cd2ff47ba9de381d76d7931d8ec9c7f253943fdada46805aece95	["*"]	2024-08-22 13:05:26	2024-08-23 13:05:18	2024-08-22 13:05:18	2024-08-22 13:05:26
800	App\\Models\\User	16	angular-front	89def67f58a2819c812bd5bd4c7844fe460d55f84ecf433729e3bc306e892864	["*"]	2024-08-22 11:40:24	2024-08-23 11:38:09	2024-08-22 11:38:09	2024-08-22 11:40:24
801	App\\Models\\User	16	angular-front	1ebd7e94a5533684c75c3e826ca06c8c10600ed76d971fc91b01acb84688c524	["*"]	\N	2024-08-23 11:41:13	2024-08-22 11:41:13	2024-08-22 11:41:13
806	App\\Models\\User	121	angular-front	dcca5578197ffa6e3b3b625c528a61220aac24e3399cb7d991693678d2ca3318	["*"]	\N	2024-08-23 12:50:20	2024-08-22 12:50:20	2024-08-22 12:50:20
793	App\\Models\\User	16	angular-front	10685b1ab9677661d2c086fe34949d7afb33f399beb0b8595d490cb4801cc8cb	["*"]	\N	2024-08-23 11:35:15	2024-08-22 11:35:15	2024-08-22 11:35:15
794	App\\Models\\User	16	angular-front	99ce294ac88f33b49ebe01dadbe928c4777b9427b4cac33d480a52c08afd5716	["*"]	\N	2024-08-23 11:35:15	2024-08-22 11:35:15	2024-08-22 11:35:15
786	App\\Models\\User	16	angular-front	2432c9ae398689d2f859f3c857b37f0dcf65992abd6852c08be2773605c0780c	["*"]	2024-08-22 11:23:43	2024-08-23 11:19:54	2024-08-22 11:19:54	2024-08-22 11:23:43
787	App\\Models\\User	16	angular-front	a258f0fa84da8e3a6ff941b1a71dfca71fb4bb9e822a5664cb19e271c8f9cfff	["*"]	\N	2024-08-23 11:26:28	2024-08-22 11:26:28	2024-08-22 11:26:28
805	App\\Models\\User	121	angular-front	a18f144b1f36992a36ec0c0eb6802c9b495de0d35c890d135868555459603b9e	["*"]	2024-08-22 12:50:29	2024-08-23 12:50:20	2024-08-22 12:50:20	2024-08-22 12:50:29
792	App\\Models\\User	16	angular-front	994fa6672ef3ccb2b85bed76835d916750d3d3017d3bfae811f9d8aee92ddb7b	["*"]	2024-08-22 11:35:25	2024-08-23 11:32:22	2024-08-22 11:32:22	2024-08-22 11:35:25
795	App\\Models\\User	16	angular-front	736be772be16082df8ff23a3bd5f2fbea1850db3add52456845ba0046fa27d2b	["*"]	\N	2024-08-23 11:36:19	2024-08-22 11:36:19	2024-08-22 11:36:19
803	App\\Models\\User	118	angular-front	25336bf31ec1873f1b0c40e33f0789fa5310d3a43c790b4d823e2357b2cb0f4d	["*"]	\N	2024-08-23 11:48:03	2024-08-22 11:48:03	2024-08-22 11:48:03
802	App\\Models\\User	16	angular-front	c659bcedd6dc066e95999cc5474705f0330780c90f15d2afd9dae4a2457ab375	["*"]	2024-08-22 14:35:44	2024-08-23 11:41:13	2024-08-22 11:41:13	2024-08-22 14:35:44
797	App\\Models\\User	16	angular-front	935dce1b6910c143047bc738def8b77c03d24d93af96b60e863db16d25274eaf	["*"]	\N	2024-08-23 11:37:16	2024-08-22 11:37:16	2024-08-22 11:37:16
789	App\\Models\\User	16	angular-front	25a5cd35e494b164bcb42c545b533e62188c51aee8f8ca43237423ae6b301202	["*"]	\N	2024-08-23 11:29:41	2024-08-22 11:29:41	2024-08-22 11:29:41
798	App\\Models\\User	16	angular-front	a9ba5c1c5896cbf8a466057643e16e5abe7029463d15d3b0164c92972f712242	["*"]	\N	2024-08-23 11:37:16	2024-08-22 11:37:16	2024-08-22 11:37:16
788	App\\Models\\User	16	angular-front	84a68315ba46665a256c938f55ed3a6fcd36d1162df11e346c92a84e24a3c872	["*"]	2024-08-22 11:29:42	2024-08-23 11:26:28	2024-08-22 11:26:28	2024-08-22 11:29:42
796	App\\Models\\User	16	angular-front	166a8e03831841eff127f8ac704e55429cf680a2e6f332a6f472100d616736d8	["*"]	2024-08-22 11:37:23	2024-08-23 11:36:19	2024-08-22 11:36:19	2024-08-22 11:37:23
799	App\\Models\\User	16	angular-front	3886b1101409bc9f817ebe86f1e6a9efd6fcaa6c8b511fded489329007667da2	["*"]	\N	2024-08-23 11:38:09	2024-08-22 11:38:09	2024-08-22 11:38:09
807	App\\Models\\User	121	angular-front	32b9e0227fbc4adedada9a9f4e3a71d6b09efb3bf6bf23833953a88acc1cadd1	["*"]	\N	2024-08-23 13:05:18	2024-08-22 13:05:18	2024-08-22 13:05:18
812	App\\Models\\User	16	angular-front	9871ce344d06046f37eb5a739664145856188a61f4ff1eb5dba92d0dacf7c283	["*"]	2024-08-22 19:26:49	2024-08-23 18:10:18	2024-08-22 18:10:18	2024-08-22 19:26:49
817	App\\Models\\User	16	angular-front	b8a5e1f3d358b8941378f6c2b32ac4c8e77e3bdbcd6e98739b069408d4fac219	["*"]	\N	2024-09-01 06:15:58	2024-08-31 06:15:58	2024-08-31 06:15:58
804	App\\Models\\User	118	angular-front	613a4d3fb11ffb77c2e0fe1597803a0cf3f2d34c17b4997720c2ae60f3b13f95	["*"]	2024-08-22 14:32:45	2024-08-23 11:48:03	2024-08-22 11:48:03	2024-08-22 14:32:45
810	App\\Models\\User	133	angular-front	01a05b028f06851927e775b5ea30836f36d1a4d1e51bfe736054a5c7a253c2d7	["*"]	2024-08-22 14:32:46	2024-08-23 14:07:03	2024-08-22 14:07:03	2024-08-22 14:32:46
811	App\\Models\\User	16	angular-front	32b7dbcbaa58b1bb1086926f220cabae1e488e72226b0c5411d8d65ad7fd861a	["*"]	\N	2024-08-23 18:10:17	2024-08-22 18:10:17	2024-08-22 18:10:17
813	App\\Models\\User	133	angular-front	89354e98e8254725b42536ebfe2d9f6934323d7db256afdfee42705c23a35535	["*"]	\N	2024-08-23 18:43:25	2024-08-22 18:43:25	2024-08-22 18:43:25
818	App\\Models\\User	16	angular-front	1050505f0770fdfcfad9564f855c23ccd490c960ce7d2c8ab1933b880d971f88	["*"]	2024-08-31 06:17:34	2024-09-01 06:15:58	2024-08-31 06:15:58	2024-08-31 06:17:34
814	App\\Models\\User	133	angular-front	bfb9d03b44b40eec48c4793b77dcfe79668a9578d26ac9aae9083e78914cd631	["*"]	2024-08-22 19:25:24	2024-08-23 18:43:25	2024-08-22 18:43:25	2024-08-22 19:25:24
815	App\\Models\\User	119	angular-front	ec9864abb0b969ad61851d3a51da2bd3627e2531a11404d0fc800bff297c87e2	["*"]	\N	2024-08-23 19:06:48	2024-08-22 19:06:48	2024-08-22 19:06:48
816	App\\Models\\User	119	angular-front	289e0846b09e55ba594bac5e9b9a0040530cd650118a1868d90a4c32e4354d66	["*"]	2024-08-22 19:25:28	2024-08-23 19:06:48	2024-08-22 19:06:48	2024-08-22 19:25:28
\.


                                                                                                                                                                                                                                                           3570.dat                                                                                            0000600 0004000 0002000 00000000233 14721674436 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        13	188	Environnement pas assez sainne	f	2024-08-22 12:01:27	2024-08-22 12:01:27
12	188	Rennovation du toît	f	2024-08-22 12:01:27	2024-08-22 12:01:27
\.


                                                                                                                                                                                                                                                                                                                                                                     3562.dat                                                                                            0000600 0004000 0002000 00000000005 14721674436 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3559.dat                                                                                            0000600 0004000 0002000 00000000375 14721674436 0014302 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Super Administrateur	web	2024-04-04 11:59:14	2024-04-04 11:59:14
2	Administrateur	web	2024-04-04 11:59:14	2024-04-04 11:59:14
3	Veterinaire Officiel	web	2024-04-04 11:59:14	2024-04-04 11:59:14
4	Client	web	2024-04-04 11:59:14	2024-04-04 11:59:14
\.


                                                                                                                                                                                                                                                                   3545.dat                                                                                            0000600 0004000 0002000 00000000335 14721674436 0014271 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Nouveau	2024-04-04 11:59:14	2024-04-04 11:59:14
3	Accepté	2024-04-04 11:59:14	2024-04-04 11:59:14
4	Refusé	2024-04-04 11:59:14	2024-04-04 11:59:14
2	En cours de traitement	2024-04-04 11:59:14	2024-04-04 11:59:14
\.


                                                                                                                                                                                                                                                                                                   3541.dat                                                                                            0000600 0004000 0002000 00000000270 14721674436 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Vente locale	2024-04-04 11:59:14	2024-04-04 11:59:14
3	Vente locale et exportation	2024-04-04 11:59:14	2024-04-04 11:59:14
2	Exportation	2024-04-04 11:59:14	2024-04-04 11:59:14
\.


                                                                                                                                                                                                                                                                                                                                        3543.dat                                                                                            0000600 0004000 0002000 00000000214 14721674436 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	Définitif	2024-04-04 11:59:14	2024-04-04 11:59:14
1	Provisoire	2024-04-04 11:59:14	2024-04-04 11:59:14
3	Provisoire prolongé	\N	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                    3537.dat                                                                                            0000600 0004000 0002000 00000000671 14721674436 0014275 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        16	16	+261340559320	Ampandrianomby	514331	2024-04-04 12:01:41	2024-07-30 08:09:28
89	118	Aucun	Toamasina	\N	2024-08-15 11:29:23	2024-08-15 11:29:23
90	119	Aucun	Talatamaty	\N	2024-08-15 11:35:16	2024-08-15 11:35:16
88	117	+261382258360	Madagascar	\N	2024-08-15 11:20:11	2024-08-15 11:57:23
91	120	+261327801622	Madagascar	\N	2024-08-17 04:42:03	2024-08-17 04:42:03
99	133	+261341717909	Itaosy	\N	2024-08-22 14:00:23	2024-08-22 14:00:23
\.


                                                                       3530.dat                                                                                            0000600 0004000 0002000 00000001540 14721674436 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        16	SSPVMV	jraharimiarana@gmail.com	2024-04-04 12:01:41	$2y$12$BxHkNUPG4nyPm3DaBZ4PAegihWwBWVf9yb0clYhZ7zdWL2XcBAJae	8qMYM6caHx	2024-04-04 12:01:41	2024-07-30 08:09:28
118	JLB	jlb@moov.mg	\N	$2y$12$gqe9bTSqOdojKACI6HzlNuT6cfHnQKW3cdRA4nNuLjbeqvjKEP0Yi	\N	2024-08-15 11:29:23	2024-08-15 11:29:23
119	Laura	laura@redsand.be	\N	$2y$12$EG3miOgrixSL1/wb6LpSW.TAuLavKw3LVptQtnDyq2i.PFzY9tqWy	\N	2024-08-15 11:35:16	2024-08-15 11:35:16
117	Client inconnu	client@gmail.mg	\N	$2y$12$vMdTRZQk2Ip1yUUpPIA/QeBcvdqkFuFQy/TTXex/qyyRmH78WEHXu	\N	2024-08-15 11:20:11	2024-08-15 12:01:31
120	Client inconnu	client1@gmail.mg	\N	$2y$12$47GAJpgtwNRBQK4Mif8PnueAittOamuiEJiA49w/yQ1TZusraJpq6	\N	2024-08-17 04:42:03	2024-08-17 04:42:03
133	Tiavina	tiavina.rollando@gmail.com	\N	$2y$12$B6EeGXHzeOLX21Gm1fm1ruG9.KmC/65opCvbf9DXuj9jGm4ClCZeC	\N	2024-08-22 14:00:23	2024-08-22 14:06:58
\.


                                                                                                                                                                3568.dat                                                                                            0000600 0004000 0002000 00000000005 14721674436 0014270 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000132477 14721674436 0015420 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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

DROP DATABASE "dsv-agrement-database";
--
-- Name: dsv-agrement-database; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "dsv-agrement-database" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_Madagascar.1252';


ALTER DATABASE "dsv-agrement-database" OWNER TO postgres;

\connect -reuse-previous=on "dbname='dsv-agrement-database'"

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
-- Name: agrement_demande; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agrement_demande (
    id bigint NOT NULL,
    demande_agrement_id bigint NOT NULL,
    agrement_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.agrement_demande OWNER TO postgres;

--
-- Name: agrement_demande_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agrement_demande_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agrement_demande_id_seq OWNER TO postgres;

--
-- Name: agrement_demande_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agrement_demande_id_seq OWNED BY public.agrement_demande.id;


--
-- Name: agrements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agrements (
    id bigint NOT NULL,
    numero character varying(255) NOT NULL,
    type_agrement_id smallint NOT NULL,
    date_debut date NOT NULL,
    date_fin date,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    status boolean DEFAULT true,
    etat character varying(255)
);


ALTER TABLE public.agrements OWNER TO postgres;

--
-- Name: agrements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agrements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agrements_id_seq OWNER TO postgres;

--
-- Name: agrements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agrements_id_seq OWNED BY public.agrements.id;


--
-- Name: demande_agrements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.demande_agrements (
    id bigint NOT NULL,
    etablissement_id bigint NOT NULL,
    type_agrement_id bigint NOT NULL,
    status bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.demande_agrements OWNER TO postgres;

--
-- Name: demande_agrements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.demande_agrements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.demande_agrements_id_seq OWNER TO postgres;

--
-- Name: demande_agrements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.demande_agrements_id_seq OWNED BY public.demande_agrements.id;


--
-- Name: etablissement_agrement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.etablissement_agrement (
    id bigint NOT NULL,
    etablissement_id bigint NOT NULL,
    agrement_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.etablissement_agrement OWNER TO postgres;

--
-- Name: etablissement_agrement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.etablissement_agrement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.etablissement_agrement_id_seq OWNER TO postgres;

--
-- Name: etablissement_agrement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.etablissement_agrement_id_seq OWNED BY public.etablissement_agrement.id;


--
-- Name: etablissement_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.etablissement_user (
    id bigint NOT NULL,
    etablissement_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.etablissement_user OWNER TO postgres;

--
-- Name: etablissement_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.etablissement_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.etablissement_user_id_seq OWNER TO postgres;

--
-- Name: etablissement_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.etablissement_user_id_seq OWNED BY public.etablissement_user.id;


--
-- Name: etablissements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.etablissements (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    filiere_id bigint NOT NULL,
    type_activite_id bigint NOT NULL,
    type_etablissement character varying(255),
    adresse character varying(255) NOT NULL,
    type_produit character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    region character varying(255),
    district character varying(255),
    commune character varying(255) DEFAULT NULL::character varying,
    veterinaire character varying(255),
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.etablissements OWNER TO postgres;

--
-- Name: etablissements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.etablissements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.etablissements_id_seq OWNER TO postgres;

--
-- Name: etablissements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.etablissements_id_seq OWNED BY public.etablissements.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: filieres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filieres (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.filieres OWNER TO postgres;

--
-- Name: filieres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.filieres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filieres_id_seq OWNER TO postgres;

--
-- Name: filieres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.filieres_id_seq OWNED BY public.filieres.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: model_has_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model_has_permissions (
    permission_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_permissions OWNER TO postgres;

--
-- Name: model_has_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model_has_roles (
    role_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_roles OWNER TO postgres;

--
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    message text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    status boolean DEFAULT false NOT NULL
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_id_seq OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: remarks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.remarks (
    id bigint NOT NULL,
    agrement_id bigint NOT NULL,
    description character varying(255) NOT NULL,
    etat boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.remarks OWNER TO postgres;

--
-- Name: remarks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.remarks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.remarks_id_seq OWNER TO postgres;

--
-- Name: remarks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.remarks_id_seq OWNED BY public.remarks.id;


--
-- Name: role_has_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_has_permissions (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.role_has_permissions OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: status_demande_agrements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status_demande_agrements (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.status_demande_agrements OWNER TO postgres;

--
-- Name: status_demande_agrements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.status_demande_agrements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.status_demande_agrements_id_seq OWNER TO postgres;

--
-- Name: status_demande_agrements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.status_demande_agrements_id_seq OWNED BY public.status_demande_agrements.id;


--
-- Name: type_activites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_activites (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.type_activites OWNER TO postgres;

--
-- Name: type_activites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_activites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_activites_id_seq OWNER TO postgres;

--
-- Name: type_activites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_activites_id_seq OWNED BY public.type_activites.id;


--
-- Name: type_agrements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_agrements (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.type_agrements OWNER TO postgres;

--
-- Name: type_agrements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_agrements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_agrements_id_seq OWNER TO postgres;

--
-- Name: type_agrements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_agrements_id_seq OWNED BY public.type_agrements.id;


--
-- Name: user_information; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_information (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    tel character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    matricule character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.user_information OWNER TO postgres;

--
-- Name: user_information_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_information_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_information_id_seq OWNER TO postgres;

--
-- Name: user_information_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_information_id_seq OWNED BY public.user_information.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: websockets_statistics_entries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.websockets_statistics_entries (
    id integer NOT NULL,
    app_id character varying(255) NOT NULL,
    peak_connection_count integer NOT NULL,
    websocket_message_count integer NOT NULL,
    api_message_count integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.websockets_statistics_entries OWNER TO postgres;

--
-- Name: websockets_statistics_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.websockets_statistics_entries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.websockets_statistics_entries_id_seq OWNER TO postgres;

--
-- Name: websockets_statistics_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.websockets_statistics_entries_id_seq OWNED BY public.websockets_statistics_entries.id;


--
-- Name: agrement_demande id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agrement_demande ALTER COLUMN id SET DEFAULT nextval('public.agrement_demande_id_seq'::regclass);


--
-- Name: agrements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agrements ALTER COLUMN id SET DEFAULT nextval('public.agrements_id_seq'::regclass);


--
-- Name: demande_agrements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.demande_agrements ALTER COLUMN id SET DEFAULT nextval('public.demande_agrements_id_seq'::regclass);


--
-- Name: etablissement_agrement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etablissement_agrement ALTER COLUMN id SET DEFAULT nextval('public.etablissement_agrement_id_seq'::regclass);


--
-- Name: etablissement_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etablissement_user ALTER COLUMN id SET DEFAULT nextval('public.etablissement_user_id_seq'::regclass);


--
-- Name: etablissements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etablissements ALTER COLUMN id SET DEFAULT nextval('public.etablissements_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: filieres id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filieres ALTER COLUMN id SET DEFAULT nextval('public.filieres_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: remarks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remarks ALTER COLUMN id SET DEFAULT nextval('public.remarks_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: status_demande_agrements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status_demande_agrements ALTER COLUMN id SET DEFAULT nextval('public.status_demande_agrements_id_seq'::regclass);


--
-- Name: type_activites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_activites ALTER COLUMN id SET DEFAULT nextval('public.type_activites_id_seq'::regclass);


--
-- Name: type_agrements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_agrements ALTER COLUMN id SET DEFAULT nextval('public.type_agrements_id_seq'::regclass);


--
-- Name: user_information id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_information ALTER COLUMN id SET DEFAULT nextval('public.user_information_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: websockets_statistics_entries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.websockets_statistics_entries ALTER COLUMN id SET DEFAULT nextval('public.websockets_statistics_entries_id_seq'::regclass);


--
-- Data for Name: agrement_demande; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agrement_demande (id, demande_agrement_id, agrement_id, created_at, updated_at) FROM stdin;
\.
COPY public.agrement_demande (id, demande_agrement_id, agrement_id, created_at, updated_at) FROM '$$PATH$$/3564.dat';

--
-- Data for Name: agrements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agrements (id, numero, type_agrement_id, date_debut, date_fin, created_at, updated_at, deleted_at, status, etat) FROM stdin;
\.
COPY public.agrements (id, numero, type_agrement_id, date_debut, date_fin, created_at, updated_at, deleted_at, status, etat) FROM '$$PATH$$/3549.dat';

--
-- Data for Name: demande_agrements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.demande_agrements (id, etablissement_id, type_agrement_id, status, created_at, updated_at, deleted_at) FROM stdin;
\.
COPY public.demande_agrements (id, etablissement_id, type_agrement_id, status, created_at, updated_at, deleted_at) FROM '$$PATH$$/3555.dat';

--
-- Data for Name: etablissement_agrement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.etablissement_agrement (id, etablissement_id, agrement_id, created_at, updated_at) FROM stdin;
\.
COPY public.etablissement_agrement (id, etablissement_id, agrement_id, created_at, updated_at) FROM '$$PATH$$/3553.dat';

--
-- Data for Name: etablissement_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.etablissement_user (id, etablissement_id, user_id, created_at, updated_at) FROM stdin;
\.
COPY public.etablissement_user (id, etablissement_id, user_id, created_at, updated_at) FROM '$$PATH$$/3551.dat';

--
-- Data for Name: etablissements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.etablissements (id, name, filiere_id, type_activite_id, type_etablissement, adresse, type_produit, created_at, updated_at, region, district, commune, veterinaire, deleted_at) FROM stdin;
\.
COPY public.etablissements (id, name, filiere_id, type_activite_id, type_etablissement, adresse, type_produit, created_at, updated_at, region, district, commune, veterinaire, deleted_at) FROM '$$PATH$$/3547.dat';

--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.
COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM '$$PATH$$/3533.dat';

--
-- Data for Name: filieres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.filieres (id, name, created_at, updated_at) FROM stdin;
\.
COPY public.filieres (id, name, created_at, updated_at) FROM '$$PATH$$/3539.dat';

--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
\.
COPY public.migrations (id, migration, batch) FROM '$$PATH$$/3528.dat';

--
-- Data for Name: model_has_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model_has_permissions (permission_id, model_type, model_id) FROM stdin;
\.
COPY public.model_has_permissions (permission_id, model_type, model_id) FROM '$$PATH$$/3560.dat';

--
-- Data for Name: model_has_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model_has_roles (role_id, model_type, model_id) FROM stdin;
\.
COPY public.model_has_roles (role_id, model_type, model_id) FROM '$$PATH$$/3561.dat';

--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, user_id, message, created_at, updated_at, deleted_at, status) FROM stdin;
\.
COPY public.notifications (id, user_id, message, created_at, updated_at, deleted_at, status) FROM '$$PATH$$/3566.dat';

--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.
COPY public.password_reset_tokens (email, token, created_at) FROM '$$PATH$$/3531.dat';

--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permissions (id, name, guard_name, created_at, updated_at) FROM stdin;
\.
COPY public.permissions (id, name, guard_name, created_at, updated_at) FROM '$$PATH$$/3557.dat';

--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.
COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM '$$PATH$$/3535.dat';

--
-- Data for Name: remarks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.remarks (id, agrement_id, description, etat, created_at, updated_at) FROM stdin;
\.
COPY public.remarks (id, agrement_id, description, etat, created_at, updated_at) FROM '$$PATH$$/3570.dat';

--
-- Data for Name: role_has_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_has_permissions (permission_id, role_id) FROM stdin;
\.
COPY public.role_has_permissions (permission_id, role_id) FROM '$$PATH$$/3562.dat';

--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, guard_name, created_at, updated_at) FROM stdin;
\.
COPY public.roles (id, name, guard_name, created_at, updated_at) FROM '$$PATH$$/3559.dat';

--
-- Data for Name: status_demande_agrements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status_demande_agrements (id, name, created_at, updated_at) FROM stdin;
\.
COPY public.status_demande_agrements (id, name, created_at, updated_at) FROM '$$PATH$$/3545.dat';

--
-- Data for Name: type_activites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_activites (id, name, created_at, updated_at) FROM stdin;
\.
COPY public.type_activites (id, name, created_at, updated_at) FROM '$$PATH$$/3541.dat';

--
-- Data for Name: type_agrements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_agrements (id, name, created_at, updated_at) FROM stdin;
\.
COPY public.type_agrements (id, name, created_at, updated_at) FROM '$$PATH$$/3543.dat';

--
-- Data for Name: user_information; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_information (id, user_id, tel, address, matricule, created_at, updated_at) FROM stdin;
\.
COPY public.user_information (id, user_id, tel, address, matricule, created_at, updated_at) FROM '$$PATH$$/3537.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
\.
COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM '$$PATH$$/3530.dat';

--
-- Data for Name: websockets_statistics_entries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.websockets_statistics_entries (id, app_id, peak_connection_count, websocket_message_count, api_message_count, created_at, updated_at) FROM stdin;
\.
COPY public.websockets_statistics_entries (id, app_id, peak_connection_count, websocket_message_count, api_message_count, created_at, updated_at) FROM '$$PATH$$/3568.dat';

--
-- Name: agrement_demande_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agrement_demande_id_seq', 24, true);


--
-- Name: agrements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agrements_id_seq', 190, true);


--
-- Name: demande_agrements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.demande_agrements_id_seq', 41, true);


--
-- Name: etablissement_agrement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.etablissement_agrement_id_seq', 154, true);


--
-- Name: etablissement_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.etablissement_user_id_seq', 115, true);


--
-- Name: etablissements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.etablissements_id_seq', 194, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: filieres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.filieres_id_seq', 5, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 42, true);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_id_seq', 192, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_id_seq', 1, false);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 818, true);


--
-- Name: remarks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.remarks_id_seq', 13, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 4, true);


--
-- Name: status_demande_agrements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_demande_agrements_id_seq', 4, true);


--
-- Name: type_activites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_activites_id_seq', 3, true);


--
-- Name: type_agrements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_agrements_id_seq', 9, true);


--
-- Name: user_information_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_information_id_seq', 99, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 133, true);


--
-- Name: websockets_statistics_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.websockets_statistics_entries_id_seq', 1, false);


--
-- Name: agrement_demande agrement_demande_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agrement_demande
    ADD CONSTRAINT agrement_demande_pkey PRIMARY KEY (id);


--
-- Name: agrements agrements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agrements
    ADD CONSTRAINT agrements_pkey PRIMARY KEY (id);


--
-- Name: demande_agrements demande_agrements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.demande_agrements
    ADD CONSTRAINT demande_agrements_pkey PRIMARY KEY (id);


--
-- Name: etablissement_agrement etablissement_agrement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etablissement_agrement
    ADD CONSTRAINT etablissement_agrement_pkey PRIMARY KEY (id);


--
-- Name: etablissement_user etablissement_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etablissement_user
    ADD CONSTRAINT etablissement_user_pkey PRIMARY KEY (id);


--
-- Name: etablissements etablissements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etablissements
    ADD CONSTRAINT etablissements_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: filieres filieres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filieres
    ADD CONSTRAINT filieres_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: model_has_permissions model_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);


--
-- Name: model_has_roles model_has_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: permissions permissions_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: remarks remarks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remarks
    ADD CONSTRAINT remarks_pkey PRIMARY KEY (id);


--
-- Name: role_has_permissions role_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);


--
-- Name: roles roles_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: status_demande_agrements status_demande_agrements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status_demande_agrements
    ADD CONSTRAINT status_demande_agrements_pkey PRIMARY KEY (id);


--
-- Name: type_activites type_activites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_activites
    ADD CONSTRAINT type_activites_pkey PRIMARY KEY (id);


--
-- Name: type_agrements type_agrements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_agrements
    ADD CONSTRAINT type_agrements_pkey PRIMARY KEY (id);


--
-- Name: user_information user_information_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_information
    ADD CONSTRAINT user_information_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: websockets_statistics_entries websockets_statistics_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.websockets_statistics_entries
    ADD CONSTRAINT websockets_statistics_entries_pkey PRIMARY KEY (id);


--
-- Name: model_has_permissions_model_id_model_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permissions USING btree (model_id, model_type);


--
-- Name: model_has_roles_model_id_model_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_roles USING btree (model_id, model_type);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: agrement_demande agrement_demande_agrement_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agrement_demande
    ADD CONSTRAINT agrement_demande_agrement_id_foreign FOREIGN KEY (agrement_id) REFERENCES public.agrements(id) ON DELETE CASCADE;


--
-- Name: agrement_demande agrement_demande_demande_agrement_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agrement_demande
    ADD CONSTRAINT agrement_demande_demande_agrement_id_foreign FOREIGN KEY (demande_agrement_id) REFERENCES public.demande_agrements(id) ON DELETE CASCADE;


--
-- Name: agrements agrements_type_agrement_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agrements
    ADD CONSTRAINT agrements_type_agrement_id_foreign FOREIGN KEY (type_agrement_id) REFERENCES public.type_agrements(id) ON DELETE CASCADE;


--
-- Name: demande_agrements demande_agrements_etablissement_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.demande_agrements
    ADD CONSTRAINT demande_agrements_etablissement_id_foreign FOREIGN KEY (etablissement_id) REFERENCES public.etablissements(id) ON DELETE CASCADE;


--
-- Name: etablissement_agrement etablissement_agrement_agrement_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etablissement_agrement
    ADD CONSTRAINT etablissement_agrement_agrement_id_foreign FOREIGN KEY (agrement_id) REFERENCES public.agrements(id) ON DELETE CASCADE;


--
-- Name: etablissement_agrement etablissement_agrement_etablissement_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etablissement_agrement
    ADD CONSTRAINT etablissement_agrement_etablissement_id_foreign FOREIGN KEY (etablissement_id) REFERENCES public.etablissements(id) ON DELETE CASCADE;


--
-- Name: etablissement_user etablissement_user_etablissement_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etablissement_user
    ADD CONSTRAINT etablissement_user_etablissement_id_foreign FOREIGN KEY (etablissement_id) REFERENCES public.etablissements(id) ON DELETE CASCADE;


--
-- Name: etablissement_user etablissement_user_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etablissement_user
    ADD CONSTRAINT etablissement_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: etablissements etablissements_type_activite_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etablissements
    ADD CONSTRAINT etablissements_type_activite_id_foreign FOREIGN KEY (type_activite_id) REFERENCES public.type_activites(id) ON DELETE CASCADE;


--
-- Name: model_has_permissions model_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: model_has_roles model_has_roles_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: remarks remarks_agrement_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remarks
    ADD CONSTRAINT remarks_agrement_id_foreign FOREIGN KEY (agrement_id) REFERENCES public.agrements(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: user_information user_information_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_information
    ADD CONSTRAINT user_information_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 