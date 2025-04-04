PGDMP  *    7                }            sale_db    16.4    16.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    155054    sale_db    DATABASE     {   CREATE DATABASE sale_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE sale_db;
                postgres    false            �            1259    155056 
   categories    TABLE     f   CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);
    DROP TABLE public.categories;
       public         heap    postgres    false            �            1259    155055    categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public          postgres    false    216            �           0    0    categories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
          public          postgres    false    215            �            1259    155063    products    TABLE     �   CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    category_id integer,
    price numeric(10,2) NOT NULL
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    155062    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public          postgres    false    218            �           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public          postgres    false    217            �            1259    155075    sales    TABLE     �   CREATE TABLE public.sales (
    id integer NOT NULL,
    product_id integer,
    quantity integer NOT NULL,
    sale_date date NOT NULL
);
    DROP TABLE public.sales;
       public         heap    postgres    false            �            1259    155074    sales_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.sales_id_seq;
       public          postgres    false    220            �           0    0    sales_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.sales_id_seq OWNED BY public.sales.id;
          public          postgres    false    219            $           2604    155059    categories id    DEFAULT     n   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            %           2604    155066    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            &           2604    155078    sales id    DEFAULT     d   ALTER TABLE ONLY public.sales ALTER COLUMN id SET DEFAULT nextval('public.sales_id_seq'::regclass);
 7   ALTER TABLE public.sales ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            �          0    155056 
   categories 
   TABLE DATA           .   COPY public.categories (id, name) FROM stdin;
    public          postgres    false    216   %       �          0    155063    products 
   TABLE DATA           @   COPY public.products (id, name, category_id, price) FROM stdin;
    public          postgres    false    218   �       �          0    155075    sales 
   TABLE DATA           D   COPY public.sales (id, product_id, quantity, sale_date) FROM stdin;
    public          postgres    false    220   �       �           0    0    categories_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.categories_id_seq', 5, true);
          public          postgres    false    215            �           0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 10, true);
          public          postgres    false    217            �           0    0    sales_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.sales_id_seq', 20, true);
          public          postgres    false    219            (           2606    155061    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    216            *           2606    155068    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    218            ,           2606    155080    sales sales_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.sales DROP CONSTRAINT sales_pkey;
       public            postgres    false    220            -           2606    155069 "   products products_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);
 L   ALTER TABLE ONLY public.products DROP CONSTRAINT products_category_id_fkey;
       public          postgres    false    218    216    4648            .           2606    155081    sales sales_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);
 E   ALTER TABLE ONLY public.sales DROP CONSTRAINT sales_product_id_fkey;
       public          postgres    false    220    4650    218            �   b   x�U��	�@�;Q�����������`�B5����~��J=�V�h��!�cdec��9.����Zs3,�R8&n�������2�s�BE      �   �   x�M�MN�0���S�Q�Z߅ä?R+�+�6]Ӗ�V*�+��o$�X����o�o:���:��h��[A����Ղ\u��ߜn�Y�	���%X�|�7[�y�t�O�H���#ΆC��Ef�|����QZi�6�.�����O� ���X�W:$]Q��I���yݕU��ͣ5�33��X�w�ŗJ�7��"�M�5��GXX:����oF����m����7��g������K���L�      �   �   x�E��C!�v//���K���I����-������)�X��K$�U*���cE�4��$4�2����<	����@C�Nlducʒ���j|�֋B�Y���%���}�$:�K0D�v��A[�.���J��F푄k�>�VX�[�/
�~T�@>9�     