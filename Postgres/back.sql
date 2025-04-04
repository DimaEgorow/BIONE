PGDMP      (                }         
   warehouse2    16.4    16.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    155026 
   warehouse2    DATABASE     ~   CREATE DATABASE warehouse2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE warehouse2;
                postgres    false            �            1259    155048    products    TABLE     �   CREATE TABLE public.products (
    id integer NOT NULL,
    section integer NOT NULL,
    name character varying(100) NOT NULL,
    quantity integer NOT NULL
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    155047    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public          postgres    false    218            �           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public          postgres    false    217            �            1259    155028    sections    TABLE     c   CREATE TABLE public.sections (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.sections;
       public         heap    postgres    false            �            1259    155027    sections_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sections_id_seq;
       public          postgres    false    216            �           0    0    sections_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.sections_id_seq OWNED BY public.sections.id;
          public          postgres    false    215                        2604    155051    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218                       2604    155031    sections id    DEFAULT     j   ALTER TABLE ONLY public.sections ALTER COLUMN id SET DEFAULT nextval('public.sections_id_seq'::regclass);
 :   ALTER TABLE public.sections ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �          0    155048    products 
   TABLE DATA           ?   COPY public.products (id, section, name, quantity) FROM stdin;
    public          postgres    false    218   �       �          0    155028    sections 
   TABLE DATA           ,   COPY public.sections (id, name) FROM stdin;
    public          postgres    false    216   o       �           0    0    products_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.products_id_seq', 6, true);
          public          postgres    false    217            �           0    0    sections_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.sections_id_seq', 1, false);
          public          postgres    false    215            $           2606    155053    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    218            "           2606    155033    sections sections_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sections DROP CONSTRAINT sections_pkey;
       public            postgres    false    216            �   �   x���	�@���*��}U�P��p��@+���SB4�a�#�|���qd	fm5�-F9�7��� a҈�9�3�,y��}Ą#ِ5�+����EҐQ�$[ZU\����z�Նm���Ͳ�����ɮ��`��H�      �      x������ � �     