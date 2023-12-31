PGDMP  3                	    {            InventoryManager    16.0    16.0 4               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                        0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            !           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            "           1262    16968    InventoryManager    DATABASE     �   CREATE DATABASE "InventoryManager" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Vietnamese_Vietnam.1252';
 "   DROP DATABASE "InventoryManager";
                postgres    false            �            1259    16991 
   department    TABLE     p   CREATE TABLE public.department (
    id integer NOT NULL,
    department_name character varying(50) NOT NULL
);
    DROP TABLE public.department;
       public         heap    postgres    false            �            1259    16990    department_id_seq    SEQUENCE     �   CREATE SEQUENCE public.department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.department_id_seq;
       public          postgres    false    222            #           0    0    department_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.department_id_seq OWNED BY public.department.id;
          public          postgres    false    221            �            1259    16998 	   pratitive    TABLE     �   CREATE TABLE public.pratitive (
    id integer NOT NULL,
    pratitive_name character varying(50) NOT NULL,
    department_id integer
);
    DROP TABLE public.pratitive;
       public         heap    postgres    false            �            1259    16997    pratitive_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pratitive_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.pratitive_id_seq;
       public          postgres    false    224            $           0    0    pratitive_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.pratitive_id_seq OWNED BY public.pratitive.id;
          public          postgres    false    223            �            1259    16977    product    TABLE     �   CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    code character varying(50) NOT NULL,
    unit character varying(20) NOT NULL
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    16976    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    218            %           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    217            �            1259    17005    receipt    TABLE     r  CREATE TABLE public.receipt (
    id integer NOT NULL,
    code_number character varying NOT NULL,
    create_at date NOT NULL,
    deliverer character varying(50) NOT NULL,
    creator character varying(50) NOT NULL,
    stocker character varying(50) NOT NULL,
    "chiefAccountant" character varying(50) NOT NULL,
    pratitive_id integer,
    warehouse_id integer
);
    DROP TABLE public.receipt;
       public         heap    postgres    false            �            1259    16984    receipt_detail    TABLE     �   CREATE TABLE public.receipt_detail (
    id integer NOT NULL,
    "quantityOnNote" integer NOT NULL,
    "quantityReal" integer NOT NULL,
    price real NOT NULL,
    receipt_id integer,
    product_id integer
);
 "   DROP TABLE public.receipt_detail;
       public         heap    postgres    false            �            1259    16983    receipt_detail_id_seq    SEQUENCE     �   CREATE SEQUENCE public.receipt_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.receipt_detail_id_seq;
       public          postgres    false    220            &           0    0    receipt_detail_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.receipt_detail_id_seq OWNED BY public.receipt_detail.id;
          public          postgres    false    219            �            1259    17004    receipt_id_seq    SEQUENCE     �   CREATE SEQUENCE public.receipt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.receipt_id_seq;
       public          postgres    false    226            '           0    0    receipt_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.receipt_id_seq OWNED BY public.receipt.id;
          public          postgres    false    225            �            1259    16970 	   warehouse    TABLE     �   CREATE TABLE public.warehouse (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    location character varying(100) NOT NULL
);
    DROP TABLE public.warehouse;
       public         heap    postgres    false            �            1259    16969    warehouse_id_seq    SEQUENCE     �   CREATE SEQUENCE public.warehouse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.warehouse_id_seq;
       public          postgres    false    216            (           0    0    warehouse_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.warehouse_id_seq OWNED BY public.warehouse.id;
          public          postgres    false    215            l           2604    16994    department id    DEFAULT     n   ALTER TABLE ONLY public.department ALTER COLUMN id SET DEFAULT nextval('public.department_id_seq'::regclass);
 <   ALTER TABLE public.department ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            m           2604    17001    pratitive id    DEFAULT     l   ALTER TABLE ONLY public.pratitive ALTER COLUMN id SET DEFAULT nextval('public.pratitive_id_seq'::regclass);
 ;   ALTER TABLE public.pratitive ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            j           2604    16980 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            n           2604    17008 
   receipt id    DEFAULT     h   ALTER TABLE ONLY public.receipt ALTER COLUMN id SET DEFAULT nextval('public.receipt_id_seq'::regclass);
 9   ALTER TABLE public.receipt ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    226    226            k           2604    16987    receipt_detail id    DEFAULT     v   ALTER TABLE ONLY public.receipt_detail ALTER COLUMN id SET DEFAULT nextval('public.receipt_detail_id_seq'::regclass);
 @   ALTER TABLE public.receipt_detail ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            i           2604    16973    warehouse id    DEFAULT     l   ALTER TABLE ONLY public.warehouse ALTER COLUMN id SET DEFAULT nextval('public.warehouse_id_seq'::regclass);
 ;   ALTER TABLE public.warehouse ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216                      0    16991 
   department 
   TABLE DATA           9   COPY public.department (id, department_name) FROM stdin;
    public          postgres    false    222   �<                 0    16998 	   pratitive 
   TABLE DATA           F   COPY public.pratitive (id, pratitive_name, department_id) FROM stdin;
    public          postgres    false    224   �<                 0    16977    product 
   TABLE DATA           7   COPY public.product (id, name, code, unit) FROM stdin;
    public          postgres    false    218   @=                 0    17005    receipt 
   TABLE DATA           �   COPY public.receipt (id, code_number, create_at, deliverer, creator, stocker, "chiefAccountant", pratitive_id, warehouse_id) FROM stdin;
    public          postgres    false    226   �=                 0    16984    receipt_detail 
   TABLE DATA           m   COPY public.receipt_detail (id, "quantityOnNote", "quantityReal", price, receipt_id, product_id) FROM stdin;
    public          postgres    false    220   >                 0    16970 	   warehouse 
   TABLE DATA           7   COPY public.warehouse (id, name, location) FROM stdin;
    public          postgres    false    216   ]>       )           0    0    department_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.department_id_seq', 1, false);
          public          postgres    false    221            *           0    0    pratitive_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.pratitive_id_seq', 1, false);
          public          postgres    false    223            +           0    0    product_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.product_id_seq', 4, true);
          public          postgres    false    217            ,           0    0    receipt_detail_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.receipt_detail_id_seq', 5, true);
          public          postgres    false    219            -           0    0    receipt_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.receipt_id_seq', 7, true);
          public          postgres    false    225            .           0    0    warehouse_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.warehouse_id_seq', 1, false);
          public          postgres    false    215            p           2606    16975 (   warehouse PK_965abf9f99ae8c5983ae74ebde8 
   CONSTRAINT     h   ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT "PK_965abf9f99ae8c5983ae74ebde8" PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.warehouse DROP CONSTRAINT "PK_965abf9f99ae8c5983ae74ebde8";
       public            postgres    false    216            v           2606    16996 )   department PK_9a2213262c1593bffb581e382f5 
   CONSTRAINT     i   ALTER TABLE ONLY public.department
    ADD CONSTRAINT "PK_9a2213262c1593bffb581e382f5" PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.department DROP CONSTRAINT "PK_9a2213262c1593bffb581e382f5";
       public            postgres    false    222            z           2606    17012 &   receipt PK_b4b9ec7d164235fbba023da9832 
   CONSTRAINT     f   ALTER TABLE ONLY public.receipt
    ADD CONSTRAINT "PK_b4b9ec7d164235fbba023da9832" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.receipt DROP CONSTRAINT "PK_b4b9ec7d164235fbba023da9832";
       public            postgres    false    226            r           2606    16982 &   product PK_bebc9158e480b949565b4dc7a82 
   CONSTRAINT     f   ALTER TABLE ONLY public.product
    ADD CONSTRAINT "PK_bebc9158e480b949565b4dc7a82" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.product DROP CONSTRAINT "PK_bebc9158e480b949565b4dc7a82";
       public            postgres    false    218            x           2606    17003 (   pratitive PK_c8bc0bde8db2d195f8896b3e138 
   CONSTRAINT     h   ALTER TABLE ONLY public.pratitive
    ADD CONSTRAINT "PK_c8bc0bde8db2d195f8896b3e138" PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.pratitive DROP CONSTRAINT "PK_c8bc0bde8db2d195f8896b3e138";
       public            postgres    false    224            t           2606    16989 -   receipt_detail PK_d1e559010e59818b426315eb912 
   CONSTRAINT     m   ALTER TABLE ONLY public.receipt_detail
    ADD CONSTRAINT "PK_d1e559010e59818b426315eb912" PRIMARY KEY (id);
 Y   ALTER TABLE ONLY public.receipt_detail DROP CONSTRAINT "PK_d1e559010e59818b426315eb912";
       public            postgres    false    220            |           2606    17014 &   receipt UQ_bf6d2d47947ddb742c5057629e8 
   CONSTRAINT     j   ALTER TABLE ONLY public.receipt
    ADD CONSTRAINT "UQ_bf6d2d47947ddb742c5057629e8" UNIQUE (code_number);
 R   ALTER TABLE ONLY public.receipt DROP CONSTRAINT "UQ_bf6d2d47947ddb742c5057629e8";
       public            postgres    false    226            �           2606    17035 &   receipt FK_0068ef0da8cd5c15f270e26076e    FK CONSTRAINT     �   ALTER TABLE ONLY public.receipt
    ADD CONSTRAINT "FK_0068ef0da8cd5c15f270e26076e" FOREIGN KEY (warehouse_id) REFERENCES public.warehouse(id);
 R   ALTER TABLE ONLY public.receipt DROP CONSTRAINT "FK_0068ef0da8cd5c15f270e26076e";
       public          postgres    false    216    4720    226            }           2606    17020 -   receipt_detail FK_6a68206a9dcf815a9dabeb149f8    FK CONSTRAINT     �   ALTER TABLE ONLY public.receipt_detail
    ADD CONSTRAINT "FK_6a68206a9dcf815a9dabeb149f8" FOREIGN KEY (product_id) REFERENCES public.product(id);
 Y   ALTER TABLE ONLY public.receipt_detail DROP CONSTRAINT "FK_6a68206a9dcf815a9dabeb149f8";
       public          postgres    false    4722    220    218            ~           2606    17015 -   receipt_detail FK_80e9a3f8294b052047fcc7bbc64    FK CONSTRAINT     �   ALTER TABLE ONLY public.receipt_detail
    ADD CONSTRAINT "FK_80e9a3f8294b052047fcc7bbc64" FOREIGN KEY (receipt_id) REFERENCES public.receipt(id);
 Y   ALTER TABLE ONLY public.receipt_detail DROP CONSTRAINT "FK_80e9a3f8294b052047fcc7bbc64";
       public          postgres    false    220    4730    226            �           2606    17030 &   receipt FK_c9c34049bbc7e30939b45ad6fa7    FK CONSTRAINT     �   ALTER TABLE ONLY public.receipt
    ADD CONSTRAINT "FK_c9c34049bbc7e30939b45ad6fa7" FOREIGN KEY (pratitive_id) REFERENCES public.pratitive(id);
 R   ALTER TABLE ONLY public.receipt DROP CONSTRAINT "FK_c9c34049bbc7e30939b45ad6fa7";
       public          postgres    false    224    4728    226                       2606    17025 (   pratitive FK_effd63a93b2db3ad238b767cbbb    FK CONSTRAINT     �   ALTER TABLE ONLY public.pratitive
    ADD CONSTRAINT "FK_effd63a93b2db3ad238b767cbbb" FOREIGN KEY (department_id) REFERENCES public.department(id);
 T   ALTER TABLE ONLY public.pratitive DROP CONSTRAINT "FK_effd63a93b2db3ad238b767cbbb";
       public          postgres    false    4726    224    222               &   x�3�<2���<���������F\��\c�=... ,�          R   x�3�tz�{�BA��]k�9��PD��"�("�@4]F\�h������s���1�@3٘�E�(bh�"d
����� ��F�         B   x�3�~�kq�BA��]+s9�9�/��2B�r� 2ƨ2@n�1D�U�0����qqq TB)�         j   x�3�400�4202�54 "N��c������`���<ܵ� (��p�r������]�J�/�r9��́���30A3��8#$㌐�3�4�4����� ¼:�         A   x�5ʱ�0C�Z���������x*t_pį��h��ԟ�Ќ����ݱ��%'���_7�$_6@]         >   x�3����W0�<2����D�#3�n�U0�2K�Kq�%��%��L�&�&\1z\\\ ��*     