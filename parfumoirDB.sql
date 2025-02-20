toc.dat                                                                                             0000600 0004000 0002000 00000045154 14711313407 0014451 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP   *        
        
    |            Lemonade    16.0    16.0 =    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �           1262    16515    Lemonade    DATABASE     �   CREATE DATABASE "Lemonade" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "Lemonade";
                postgres    false         
            2615    16950 	   perfumior    SCHEMA        CREATE SCHEMA perfumior;
    DROP SCHEMA perfumior;
                postgres    false                     1259    17116    carts    TABLE     D  CREATE TABLE perfumior.carts (
    id integer NOT NULL,
    cus_id integer,
    product_id integer,
    quantity integer DEFAULT 0,
    price numeric(10,2) NOT NULL,
    description text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE perfumior.carts;
    	   perfumior         heap    postgres    false    10                    1259    17115    carts_id_seq    SEQUENCE     �   CREATE SEQUENCE perfumior.carts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE perfumior.carts_id_seq;
    	   perfumior          postgres    false    288    10         �           0    0    carts_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE perfumior.carts_id_seq OWNED BY perfumior.carts.id;
       	   perfumior          postgres    false    287                    1259    17026 
   categories    TABLE     ?  CREATE TABLE perfumior.categories (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255),
    photo character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 !   DROP TABLE perfumior.categories;
    	   perfumior         heap    postgres    false    10                    1259    17025    categories_id_seq    SEQUENCE     �   CREATE SEQUENCE perfumior.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE perfumior.categories_id_seq;
    	   perfumior          postgres    false    10    278         �           0    0    categories_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE perfumior.categories_id_seq OWNED BY perfumior.categories.id;
       	   perfumior          postgres    false    277                    1259    17037 	   customers    TABLE     ]  CREATE TABLE perfumior.customers (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(255),
    password character varying(255),
    photo character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
     DROP TABLE perfumior.customers;
    	   perfumior         heap    postgres    false    10                    1259    17036    customers_id_seq    SEQUENCE     �   CREATE SEQUENCE perfumior.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE perfumior.customers_id_seq;
    	   perfumior          postgres    false    280    10         �           0    0    customers_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE perfumior.customers_id_seq OWNED BY perfumior.customers.id;
       	   perfumior          postgres    false    279                    1259    17094    order_details    TABLE     N  CREATE TABLE perfumior.order_details (
    id integer NOT NULL,
    order_id integer,
    product_id integer,
    quantity integer DEFAULT 0,
    price numeric(10,2) NOT NULL,
    description text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
 $   DROP TABLE perfumior.order_details;
    	   perfumior         heap    postgres    false    10                    1259    17093    order_details_id_seq    SEQUENCE     �   CREATE SEQUENCE perfumior.order_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE perfumior.order_details_id_seq;
    	   perfumior          postgres    false    286    10         �           0    0    order_details_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE perfumior.order_details_id_seq OWNED BY perfumior.order_details.id;
       	   perfumior          postgres    false    285                    1259    17077    orders    TABLE     V  CREATE TABLE perfumior.orders (
    id integer NOT NULL,
    cus_id integer,
    order_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    total_price numeric(10,2) NOT NULL,
    description text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE perfumior.orders;
    	   perfumior         heap    postgres    false    10                    1259    17076    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE perfumior.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE perfumior.orders_id_seq;
    	   perfumior          postgres    false    284    10         �           0    0    orders_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE perfumior.orders_id_seq OWNED BY perfumior.orders.id;
       	   perfumior          postgres    false    283                    1259    17060    products    TABLE     �  CREATE TABLE perfumior.products (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    price numeric(10,2) NOT NULL,
    stock_quantity integer DEFAULT 0,
    photo character varying(255),
    category_id integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE perfumior.products;
    	   perfumior         heap    postgres    false    10                    1259    17059    products_id_seq    SEQUENCE     �   CREATE SEQUENCE perfumior.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE perfumior.products_id_seq;
    	   perfumior          postgres    false    10    282         �           0    0    products_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE perfumior.products_id_seq OWNED BY perfumior.products.id;
       	   perfumior          postgres    false    281                    1259    17004    users    TABLE     k  CREATE TABLE perfumior.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    photo character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE perfumior.users;
    	   perfumior         heap    postgres    false    10                    1259    17003    users_id_seq    SEQUENCE     �   CREATE SEQUENCE perfumior.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE perfumior.users_id_seq;
    	   perfumior          postgres    false    10    276         �           0    0    users_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE perfumior.users_id_seq OWNED BY perfumior.users.id;
       	   perfumior          postgres    false    275                    2604    17119    carts id    DEFAULT     j   ALTER TABLE ONLY perfumior.carts ALTER COLUMN id SET DEFAULT nextval('perfumior.carts_id_seq'::regclass);
 :   ALTER TABLE perfumior.carts ALTER COLUMN id DROP DEFAULT;
    	   perfumior          postgres    false    288    287    288         �           2604    17029    categories id    DEFAULT     t   ALTER TABLE ONLY perfumior.categories ALTER COLUMN id SET DEFAULT nextval('perfumior.categories_id_seq'::regclass);
 ?   ALTER TABLE perfumior.categories ALTER COLUMN id DROP DEFAULT;
    	   perfumior          postgres    false    278    277    278         �           2604    17040    customers id    DEFAULT     r   ALTER TABLE ONLY perfumior.customers ALTER COLUMN id SET DEFAULT nextval('perfumior.customers_id_seq'::regclass);
 >   ALTER TABLE perfumior.customers ALTER COLUMN id DROP DEFAULT;
    	   perfumior          postgres    false    280    279    280                    2604    17097    order_details id    DEFAULT     z   ALTER TABLE ONLY perfumior.order_details ALTER COLUMN id SET DEFAULT nextval('perfumior.order_details_id_seq'::regclass);
 B   ALTER TABLE perfumior.order_details ALTER COLUMN id DROP DEFAULT;
    	   perfumior          postgres    false    286    285    286                    2604    17080 	   orders id    DEFAULT     l   ALTER TABLE ONLY perfumior.orders ALTER COLUMN id SET DEFAULT nextval('perfumior.orders_id_seq'::regclass);
 ;   ALTER TABLE perfumior.orders ALTER COLUMN id DROP DEFAULT;
    	   perfumior          postgres    false    284    283    284                     2604    17063    products id    DEFAULT     p   ALTER TABLE ONLY perfumior.products ALTER COLUMN id SET DEFAULT nextval('perfumior.products_id_seq'::regclass);
 =   ALTER TABLE perfumior.products ALTER COLUMN id DROP DEFAULT;
    	   perfumior          postgres    false    282    281    282         �           2604    17007    users id    DEFAULT     j   ALTER TABLE ONLY perfumior.users ALTER COLUMN id SET DEFAULT nextval('perfumior.users_id_seq'::regclass);
 :   ALTER TABLE perfumior.users ALTER COLUMN id DROP DEFAULT;
    	   perfumior          postgres    false    275    276    276         �          0    17116    carts 
   TABLE DATA           p   COPY perfumior.carts (id, cus_id, product_id, quantity, price, description, created_at, updated_at) FROM stdin;
 	   perfumior          postgres    false    288       5058.dat �          0    17026 
   categories 
   TABLE DATA           ]   COPY perfumior.categories (id, name, description, photo, created_at, updated_at) FROM stdin;
 	   perfumior          postgres    false    278       5048.dat �          0    17037 	   customers 
   TABLE DATA           `   COPY perfumior.customers (id, name, email, password, photo, created_at, updated_at) FROM stdin;
 	   perfumior          postgres    false    280       5050.dat �          0    17094    order_details 
   TABLE DATA           z   COPY perfumior.order_details (id, order_id, product_id, quantity, price, description, created_at, updated_at) FROM stdin;
 	   perfumior          postgres    false    286       5056.dat �          0    17077    orders 
   TABLE DATA           m   COPY perfumior.orders (id, cus_id, order_date, total_price, description, created_at, updated_at) FROM stdin;
 	   perfumior          postgres    false    284       5054.dat �          0    17060    products 
   TABLE DATA              COPY perfumior.products (id, name, description, price, stock_quantity, photo, category_id, created_at, updated_at) FROM stdin;
 	   perfumior          postgres    false    282       5052.dat �          0    17004    users 
   TABLE DATA           \   COPY perfumior.users (id, name, email, password, photo, created_at, updated_at) FROM stdin;
 	   perfumior          postgres    false    276       5046.dat �           0    0    carts_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('perfumior.carts_id_seq', 82, true);
       	   perfumior          postgres    false    287         �           0    0    categories_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('perfumior.categories_id_seq', 9, true);
       	   perfumior          postgres    false    277         �           0    0    customers_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('perfumior.customers_id_seq', 18, true);
       	   perfumior          postgres    false    279         �           0    0    order_details_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('perfumior.order_details_id_seq', 41, true);
       	   perfumior          postgres    false    285         �           0    0    orders_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('perfumior.orders_id_seq', 33, true);
       	   perfumior          postgres    false    283         �           0    0    products_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('perfumior.products_id_seq', 23, true);
       	   perfumior          postgres    false    281         �           0    0    users_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('perfumior.users_id_seq', 25, true);
       	   perfumior          postgres    false    275                    2606    17126    carts carts_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY perfumior.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY perfumior.carts DROP CONSTRAINT carts_pkey;
    	   perfumior            postgres    false    288                    2606    17035    categories categories_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY perfumior.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY perfumior.categories DROP CONSTRAINT categories_pkey;
    	   perfumior            postgres    false    278                    2606    17046    customers customers_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY perfumior.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY perfumior.customers DROP CONSTRAINT customers_pkey;
    	   perfumior            postgres    false    280                    2606    17104     order_details order_details_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY perfumior.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (id);
 M   ALTER TABLE ONLY perfumior.order_details DROP CONSTRAINT order_details_pkey;
    	   perfumior            postgres    false    286                    2606    17087    orders orders_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY perfumior.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY perfumior.orders DROP CONSTRAINT orders_pkey;
    	   perfumior            postgres    false    284                    2606    17070    products products_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY perfumior.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY perfumior.products DROP CONSTRAINT products_pkey;
    	   perfumior            postgres    false    282                    2606    17015    users users_email_key 
   CONSTRAINT     T   ALTER TABLE ONLY perfumior.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 B   ALTER TABLE ONLY perfumior.users DROP CONSTRAINT users_email_key;
    	   perfumior            postgres    false    276                    2606    17013    users users_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY perfumior.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY perfumior.users DROP CONSTRAINT users_pkey;
    	   perfumior            postgres    false    276         $           2606    17127    carts carts_cus_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY perfumior.carts
    ADD CONSTRAINT carts_cus_id_fkey FOREIGN KEY (cus_id) REFERENCES perfumior.customers(id) ON DELETE SET NULL;
 D   ALTER TABLE ONLY perfumior.carts DROP CONSTRAINT carts_cus_id_fkey;
    	   perfumior          postgres    false    280    4887    288         %           2606    17132    carts carts_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY perfumior.carts
    ADD CONSTRAINT carts_product_id_fkey FOREIGN KEY (product_id) REFERENCES perfumior.products(id) ON DELETE SET NULL;
 H   ALTER TABLE ONLY perfumior.carts DROP CONSTRAINT carts_product_id_fkey;
    	   perfumior          postgres    false    288    282    4889         "           2606    17105 )   order_details order_details_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY perfumior.order_details
    ADD CONSTRAINT order_details_order_id_fkey FOREIGN KEY (order_id) REFERENCES perfumior.orders(id) ON DELETE SET NULL;
 V   ALTER TABLE ONLY perfumior.order_details DROP CONSTRAINT order_details_order_id_fkey;
    	   perfumior          postgres    false    284    286    4891         #           2606    17110 +   order_details order_details_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY perfumior.order_details
    ADD CONSTRAINT order_details_product_id_fkey FOREIGN KEY (product_id) REFERENCES perfumior.products(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY perfumior.order_details DROP CONSTRAINT order_details_product_id_fkey;
    	   perfumior          postgres    false    4889    282    286         !           2606    17088    orders orders_cus_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY perfumior.orders
    ADD CONSTRAINT orders_cus_id_fkey FOREIGN KEY (cus_id) REFERENCES perfumior.customers(id) ON DELETE SET NULL;
 F   ALTER TABLE ONLY perfumior.orders DROP CONSTRAINT orders_cus_id_fkey;
    	   perfumior          postgres    false    4887    284    280                     2606    17071 "   products products_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY perfumior.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES perfumior.categories(id) ON DELETE SET NULL;
 O   ALTER TABLE ONLY perfumior.products DROP CONSTRAINT products_category_id_fkey;
    	   perfumior          postgres    false    278    4885    282                                                                                                                                                                                                                                                                                                                                                                                                                            5058.dat                                                                                            0000600 0004000 0002000 00000000444 14711313407 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        80	17	21	1	222.00	herythunh	2024-11-02 09:29:52.305289+07	2024-11-02 09:29:52.305289+07
57	15	15	2	400.00	For Men	2024-11-01 09:56:53.563603+07	2024-11-01 09:56:53.563603+07
81	17	7	1	699.00	Latest model with advanced features	2024-11-02 09:30:00.050048+07	2024-11-02 09:30:00.050048+07
\.


                                                                                                                                                                                                                            5048.dat                                                                                            0000600 0004000 0002000 00000000233 14711313407 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        5	Women	\N	1_Renner-1.jpg	2024-10-25 18:12:33.516339	2024-10-25 18:12:33.516339
6	Men	\N	6e.jpg	2024-10-25 18:38:30.480051	2024-10-25 18:38:30.480051
\.


                                                                                                                                                                                                                                                                                                                                                                     5050.dat                                                                                            0000600 0004000 0002000 00000001251 14711313407 0014243 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        15	HeryThunh	thunh@gmail.com	$2b$12$7NyRh9ZO9t8UYgJKxPd/7e8h9BlFa44zuy1E25EbOKMK/NN0aLZO2	Chhoy_Kimchhay_-_Copy.jpg	2024-10-29 18:32:45.645659	2024-10-29 18:32:45.645659
16	Lemonade	lemonade@gmail.com	$2b$12$5H2PWHLPZpKaBtdW7bKNueqC8OpdlzZHZVo1K4vBnHOHG8WejLCxi	Chhoy_Kimchhay_-_Copy.jpg	2024-10-29 18:36:34.522948	2024-10-29 18:36:34.522948
17	Nha	nha@gmail.com	$2b$12$TJzjXtSoEWOWcEYqnG7MW.7oEKSzjF1/qOwv8pQK7OaEMI.SkPGI6	Chhoy_Kimchhay_-_Copy.jpg	2024-10-30 09:23:13.668863	2024-10-30 09:23:13.668863
18	Lemonade	lemonade@gmail.com	$2b$12$ab5.ZRC5t.DhRAhZUlHFjeUzN71HYKT0u4p4D3TZlufG4QsD3mRDi	Chhoy_Kimchhay_-_Copy.jpg	2024-11-02 09:24:52.756885	2024-11-02 09:24:52.756885
\.


                                                                                                                                                                                                                                                                                                                                                       5056.dat                                                                                            0000600 0004000 0002000 00000007411 14711313407 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	7	2	50.00	Two bottles of Product 1 in order 1	2024-10-27 14:42:53.416317+07	2024-10-27 14:42:53.416317+07
5	5	7	2	25.00	Two units of Product 5 in guest order 5	2024-10-27 14:42:53.416317+07	2024-10-27 14:42:53.416317+07
2	1	\N	1	30.00	One bottle of Product 2 in order 1	2024-10-27 14:42:53.416317+07	2024-10-27 14:42:53.416317+07
3	2	\N	1	150.50	One luxury bottle of Product 3 in order 2	2024-10-27 14:42:53.416317+07	2024-10-27 14:42:53.416317+07
4	3	\N	3	25.00	Three bottles of Product 4 in order 3	2024-10-27 14:42:53.416317+07	2024-10-27 14:42:53.416317+07
6	6	15	3	200.00	Errors Flame	2024-10-31 16:34:24.870416+07	2024-10-31 16:34:24.870416+07
7	6	20	10	30.00	DengEyTtHeNeak	2024-10-31 16:34:24.870416+07	2024-10-31 16:34:24.870416+07
8	7	21	3	222.00	Lemonade	2024-10-31 16:35:05.387276+07	2024-10-31 16:35:05.387276+07
9	8	7	3	699.00	Smartphonee	2024-10-31 16:36:02.875293+07	2024-10-31 16:36:02.875293+07
10	8	17	2	300.00	Eyttheh	2024-10-31 16:36:02.875293+07	2024-10-31 16:36:02.875293+07
11	9	19	2	15.00	OtDengMarkEy	2024-11-01 09:13:06.604666+07	2024-11-01 09:13:06.604666+07
12	9	17	7	300.00	Eyttheh	2024-11-01 09:13:06.604666+07	2024-11-01 09:13:06.604666+07
13	10	22	2	30.00	Lattafa Bade'e Al Oud Honor & Glory	2024-11-01 09:18:21.020896+07	2024-11-01 09:18:21.020896+07
14	11	15	2	200.00	Errors Flame	2024-11-01 09:19:45.615864+07	2024-11-01 09:19:45.615864+07
15	11	16	1	250.00	Savague	2024-11-01 09:19:45.615864+07	2024-11-01 09:19:45.615864+07
16	11	19	2	15.00	OtDengMarkEy	2024-11-01 09:19:45.615864+07	2024-11-01 09:19:45.615864+07
17	11	20	25	30.00	DengEyTtHeNeak	2024-11-01 09:19:45.615864+07	2024-11-01 09:19:45.615864+07
18	12	15	8	200.00	Errors Flame	2024-11-01 09:55:42.855771+07	2024-11-01 09:55:42.855771+07
19	13	19	1	15.00	OtDengMarkEy	2024-11-01 13:29:59.03318+07	2024-11-01 13:29:59.03318+07
20	13	15	5	200.00	Errors Flame	2024-11-01 13:29:59.03318+07	2024-11-01 13:29:59.03318+07
21	14	7	1	699.00	Smartphonee	2024-11-01 13:30:22.65354+07	2024-11-01 13:30:22.65354+07
22	15	16	2	250.00	Savague	2024-11-01 13:41:10.793741+07	2024-11-01 13:41:10.793741+07
23	16	17	1	300.00	Eyttheh	2024-11-01 13:41:42.848606+07	2024-11-01 13:41:42.848606+07
24	17	21	1	222.00	Lemonade	2024-11-01 13:42:47.691551+07	2024-11-01 13:42:47.691551+07
25	18	22	2	30.00	Lattafa Bade'e Al Oud Honor & Glory	2024-11-01 13:43:46.693022+07	2024-11-01 13:43:46.693022+07
26	19	20	3	30.00	DengEyTtHeNeak	2024-11-01 13:47:00.992539+07	2024-11-01 13:47:00.992539+07
27	20	7	2	699.00	Smartphonee	2024-11-01 13:47:22.088584+07	2024-11-01 13:47:22.088584+07
28	21	17	2	300.00	Eyttheh	2024-11-01 13:52:29.716979+07	2024-11-01 13:52:29.716979+07
29	22	22	3	30.00	Lattafa Bade'e Al Oud Honor & Glory	2024-11-01 14:02:46.398554+07	2024-11-01 14:02:46.398554+07
30	23	21	2	222.00	Lemonade	2024-11-01 14:04:40.903715+07	2024-11-01 14:04:40.903715+07
31	24	16	2	250.00	Savague	2024-11-01 14:06:55.987848+07	2024-11-01 14:06:55.987848+07
32	25	19	3	15.00	OtDengMarkEy	2024-11-01 14:10:12.79519+07	2024-11-01 14:10:12.79519+07
33	26	20	3	30.00	DengEyTtHeNeak	2024-11-01 14:11:38.353322+07	2024-11-01 14:11:38.353322+07
34	27	16	3	250.00	Savague	2024-11-01 14:12:24.348791+07	2024-11-01 14:12:24.348791+07
35	28	21	3	222.00	Lemonade	2024-11-01 14:15:37.234427+07	2024-11-01 14:15:37.234427+07
36	29	19	3	15.00	OtDengMarkEy	2024-11-01 14:17:00.964365+07	2024-11-01 14:17:00.964365+07
37	30	15	3	200.00	Errors Flame	2024-11-02 08:23:02.852116+07	2024-11-02 08:23:02.852116+07
38	31	15	3	200.00	Errors Flame	2024-11-02 08:23:04.114662+07	2024-11-02 08:23:04.114662+07
39	32	22	2	30.00	Lattafa Bade'e Al Oud Honor & Glory	2024-11-02 09:27:12.348802+07	2024-11-02 09:27:12.348802+07
41	33	15	3	200.00	Errors Flame	2024-11-02 09:32:45.208814+07	2024-11-02 09:32:45.208814+07
40	33	\N	2	100.00	Versace	2024-11-02 09:32:45.208814+07	2024-11-02 09:32:45.208814+07
\.


                                                                                                                                                                                                                                                       5054.dat                                                                                            0000600 0004000 0002000 00000010163 14711313407 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	\N	2024-10-27 14:41:44.301933+07	100.00	Order for customer 1 - fragrance collection	2024-10-27 14:41:44.301933+07	2024-10-27 14:41:44.301933+07
2	\N	2024-10-27 14:41:44.301933+07	150.50	Order for customer 2 - luxury perfumes	2024-10-27 14:41:44.301933+07	2024-10-27 14:41:44.301933+07
3	\N	2024-10-27 14:41:44.301933+07	75.00	Order for customer 3 - essential oils set	2024-10-27 14:41:44.301933+07	2024-10-27 14:41:44.301933+07
4	\N	2024-10-27 14:41:44.301933+07	200.00	Order for customer 4 - premium fragrances	2024-10-27 14:41:44.301933+07	2024-10-27 14:41:44.301933+07
5	\N	2024-10-27 14:41:44.301933+07	50.00	Guest order - one-time purchase of a gift set	2024-10-27 14:41:44.301933+07	2024-10-27 14:41:44.301933+07
6	17	2024-10-31 16:34:24.870416+07	900.00	Order for customer 17	2024-10-31 16:34:24.870416+07	2024-10-31 16:34:24.870416+07
7	17	2024-10-31 16:35:05.387276+07	666.00	Order for customer 17	2024-10-31 16:35:05.387276+07	2024-10-31 16:35:05.387276+07
8	17	2024-10-31 16:36:02.875293+07	2697.00	Order for customer 17	2024-10-31 16:36:02.875293+07	2024-10-31 16:36:02.875293+07
9	17	2024-11-01 09:13:06.604666+07	2130.00	Order for customer 17	2024-11-01 09:13:06.604666+07	2024-11-01 09:13:06.604666+07
10	17	2024-11-01 09:18:21.020896+07	60.00	Order for customer 17	2024-11-01 09:18:21.020896+07	2024-11-01 09:18:21.020896+07
11	15	2024-11-01 09:19:45.615864+07	1430.00	Order for customer 15	2024-11-01 09:19:45.615864+07	2024-11-01 09:19:45.615864+07
12	15	2024-11-01 09:55:42.855771+07	1600.00	Order for customer 15	2024-11-01 09:55:42.855771+07	2024-11-01 09:55:42.855771+07
13	17	2024-11-01 13:29:59.03318+07	1015.00	Order for customer 17	2024-11-01 13:29:59.03318+07	2024-11-01 13:29:59.03318+07
14	17	2024-11-01 13:30:22.65354+07	699.00	Order for customer 17	2024-11-01 13:30:22.65354+07	2024-11-01 13:30:22.65354+07
15	17	2024-11-01 13:41:10.793741+07	500.00	Order for customer 17	2024-11-01 13:41:10.793741+07	2024-11-01 13:41:10.793741+07
16	17	2024-11-01 13:41:42.848606+07	300.00	Order for customer 17	2024-11-01 13:41:42.848606+07	2024-11-01 13:41:42.848606+07
17	17	2024-11-01 13:42:47.691551+07	222.00	Order for customer 17	2024-11-01 13:42:47.691551+07	2024-11-01 13:42:47.691551+07
18	17	2024-11-01 13:43:46.693022+07	60.00	Order for customer 17	2024-11-01 13:43:46.693022+07	2024-11-01 13:43:46.693022+07
19	17	2024-11-01 13:47:00.992539+07	90.00	Order for customer 17	2024-11-01 13:47:00.992539+07	2024-11-01 13:47:00.992539+07
20	17	2024-11-01 13:47:22.088584+07	1398.00	Order for customer 17	2024-11-01 13:47:22.088584+07	2024-11-01 13:47:22.088584+07
21	17	2024-11-01 13:52:29.716979+07	600.00	Order for customer 17	2024-11-01 13:52:29.716979+07	2024-11-01 13:52:29.716979+07
22	17	2024-11-01 14:02:46.398554+07	90.00	Order for customer 17	2024-11-01 14:02:46.398554+07	2024-11-01 14:02:46.398554+07
23	17	2024-11-01 14:04:40.903715+07	444.00	Order for customer 17	2024-11-01 14:04:40.903715+07	2024-11-01 14:04:40.903715+07
24	17	2024-11-01 14:06:55.987848+07	500.00	Order for customer 17	2024-11-01 14:06:55.987848+07	2024-11-01 14:06:55.987848+07
25	17	2024-11-01 14:10:12.79519+07	45.00	Order for customer 17	2024-11-01 14:10:12.79519+07	2024-11-01 14:10:12.79519+07
26	17	2024-11-01 14:11:38.353322+07	90.00	Order for customer 17	2024-11-01 14:11:38.353322+07	2024-11-01 14:11:38.353322+07
27	17	2024-11-01 14:12:24.348791+07	750.00	Order for customer 17	2024-11-01 14:12:24.348791+07	2024-11-01 14:12:24.348791+07
28	17	2024-11-01 14:15:37.234427+07	666.00	Order for customer 17	2024-11-01 14:15:37.234427+07	2024-11-01 14:15:37.234427+07
29	17	2024-11-01 14:17:00.964365+07	45.00	Order for customer 17	2024-11-01 14:17:00.964365+07	2024-11-01 14:17:00.964365+07
30	17	2024-11-02 08:23:02.852116+07	600.00	Order for customer 17	2024-11-02 08:23:02.852116+07	2024-11-02 08:23:02.852116+07
31	17	2024-11-02 08:23:04.114662+07	600.00	Order for customer 17	2024-11-02 08:23:04.114662+07	2024-11-02 08:23:04.114662+07
32	16	2024-11-02 09:27:12.348802+07	60.00	Order for customer 16	2024-11-02 09:27:12.348802+07	2024-11-02 09:27:12.348802+07
33	16	2024-11-02 09:32:45.208814+07	800.00	Order for customer 16	2024-11-02 09:32:45.208814+07	2024-11-02 09:32:45.208814+07
\.


                                                                                                                                                                                                                                                                                                                                                                                                             5052.dat                                                                                            0000600 0004000 0002000 00000004124 14711313407 0014247 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        16	Savague	herythunh	250.00	23	51ZZOa0fpfL.jpg	5	2024-10-30 13:27:53.59963+07	2024-10-30 13:27:53.59963+07
21	Lemonade	herythunh	222.00	15	3139avmS9uL._SX600_.jpg	6	2024-10-30 14:16:24.659112+07	2024-10-30 14:16:24.659112+07
7	Eros Flame EDP	Latest model with advanced features	699.00	47	51ZZOa0fpfL.jpg	6	2024-10-27 09:27:43.837725+07	2024-10-27 09:27:43.837725+07
19	CA Pafume	CheckKlunengTv	15.00	3	3139avmS9uL._SX600_.jpg	6	2024-10-30 13:32:28.090036+07	2024-10-30 13:32:28.090036+07
20	Dior Survage	otskoldenghah	30.00	4	Sauvage-EDP-500x500-product_thumb.jpg	6	2024-10-30 13:34:15.784057+07	2024-10-30 13:34:15.784057+07
15	Errors Flame	For Men	200.00	9	51ZZOa0fpfL.jpg	6	2024-10-30 13:25:56.407226+07	2024-10-30 13:25:56.407226+07
17	Eyttheh	juii	300.00	7	51ZZOa0fpfL.jpg	5	2024-10-30 13:28:18.885999+07	2024-10-30 13:28:18.885999+07
22	Lattafa Bade'e Al Oud Honor & Glory	Experience the allure of the Middle East with Lattafa’s latest fragrance, Bade’e Al Oud Honor & Glory. Launched in 2023, this unisex Eau de Parfum spray offers a captivating blend of amber and spicy notes that will leave a lasting impression.  At the top, you’ll discover the delightful combination of juicy pineapple and rich creme brulee, creating an irresistible opening that is both sweet and intriguing. The heart of the fragrance features a unique mix of benzoin, cinnamon, turmeric, and black pepper, adding depth and complexity to the scent profile. Finally, the base notes of vanilla, sandalwood, cashmeran, and moss provide a warm and comforting finish that lingers on the skin.  Crafted by the renowned design house Lattafa, Bade’e Al Oud Honor & Glory is a testament to the brand’s expertise in creating luxurious Middle Eastern fragrances. The 3.4 oz bottle is perfect for daily wear or special occasions, making it a versatile addition to any fragrance collection. With its unisex appeal, this fragrance is suitable for anyone looking to add a touch of elegance and mystery to their scent repertoire.	30.00	3	Lattafa-Badee-Al-Oud-Honor-Glory-Him-Her-100mL-1.jpg	6	2024-11-01 09:16:27.015187+07	2024-11-01 09:16:27.015187+07
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                            5046.dat                                                                                            0000600 0004000 0002000 00000000151 14711313407 0014246 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        16	vatna	vatna@gmail.com	12345	download_1.jpg	2024-10-24 09:58:37.316215	2024-10-24 09:58:37.316215
\.


                                                                                                                                                                                                                                                                                                                                                                                                                       restore.sql                                                                                         0000600 0004000 0002000 00000036520 14711313407 0015373 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

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

DROP DATABASE "Lemonade";
--
-- Name: Lemonade; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Lemonade" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE "Lemonade" OWNER TO postgres;

\connect "Lemonade"

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

--
-- Name: perfumior; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA perfumior;


ALTER SCHEMA perfumior OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: carts; Type: TABLE; Schema: perfumior; Owner: postgres
--

CREATE TABLE perfumior.carts (
    id integer NOT NULL,
    cus_id integer,
    product_id integer,
    quantity integer DEFAULT 0,
    price numeric(10,2) NOT NULL,
    description text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE perfumior.carts OWNER TO postgres;

--
-- Name: carts_id_seq; Type: SEQUENCE; Schema: perfumior; Owner: postgres
--

CREATE SEQUENCE perfumior.carts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE perfumior.carts_id_seq OWNER TO postgres;

--
-- Name: carts_id_seq; Type: SEQUENCE OWNED BY; Schema: perfumior; Owner: postgres
--

ALTER SEQUENCE perfumior.carts_id_seq OWNED BY perfumior.carts.id;


--
-- Name: categories; Type: TABLE; Schema: perfumior; Owner: postgres
--

CREATE TABLE perfumior.categories (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255),
    photo character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE perfumior.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: perfumior; Owner: postgres
--

CREATE SEQUENCE perfumior.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE perfumior.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: perfumior; Owner: postgres
--

ALTER SEQUENCE perfumior.categories_id_seq OWNED BY perfumior.categories.id;


--
-- Name: customers; Type: TABLE; Schema: perfumior; Owner: postgres
--

CREATE TABLE perfumior.customers (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(255),
    password character varying(255),
    photo character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE perfumior.customers OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: perfumior; Owner: postgres
--

CREATE SEQUENCE perfumior.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE perfumior.customers_id_seq OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: perfumior; Owner: postgres
--

ALTER SEQUENCE perfumior.customers_id_seq OWNED BY perfumior.customers.id;


--
-- Name: order_details; Type: TABLE; Schema: perfumior; Owner: postgres
--

CREATE TABLE perfumior.order_details (
    id integer NOT NULL,
    order_id integer,
    product_id integer,
    quantity integer DEFAULT 0,
    price numeric(10,2) NOT NULL,
    description text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE perfumior.order_details OWNER TO postgres;

--
-- Name: order_details_id_seq; Type: SEQUENCE; Schema: perfumior; Owner: postgres
--

CREATE SEQUENCE perfumior.order_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE perfumior.order_details_id_seq OWNER TO postgres;

--
-- Name: order_details_id_seq; Type: SEQUENCE OWNED BY; Schema: perfumior; Owner: postgres
--

ALTER SEQUENCE perfumior.order_details_id_seq OWNED BY perfumior.order_details.id;


--
-- Name: orders; Type: TABLE; Schema: perfumior; Owner: postgres
--

CREATE TABLE perfumior.orders (
    id integer NOT NULL,
    cus_id integer,
    order_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    total_price numeric(10,2) NOT NULL,
    description text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE perfumior.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: perfumior; Owner: postgres
--

CREATE SEQUENCE perfumior.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE perfumior.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: perfumior; Owner: postgres
--

ALTER SEQUENCE perfumior.orders_id_seq OWNED BY perfumior.orders.id;


--
-- Name: products; Type: TABLE; Schema: perfumior; Owner: postgres
--

CREATE TABLE perfumior.products (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    price numeric(10,2) NOT NULL,
    stock_quantity integer DEFAULT 0,
    photo character varying(255),
    category_id integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE perfumior.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: perfumior; Owner: postgres
--

CREATE SEQUENCE perfumior.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE perfumior.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: perfumior; Owner: postgres
--

ALTER SEQUENCE perfumior.products_id_seq OWNED BY perfumior.products.id;


--
-- Name: users; Type: TABLE; Schema: perfumior; Owner: postgres
--

CREATE TABLE perfumior.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    photo character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE perfumior.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: perfumior; Owner: postgres
--

CREATE SEQUENCE perfumior.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE perfumior.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: perfumior; Owner: postgres
--

ALTER SEQUENCE perfumior.users_id_seq OWNED BY perfumior.users.id;


--
-- Name: carts id; Type: DEFAULT; Schema: perfumior; Owner: postgres
--

ALTER TABLE ONLY perfumior.carts ALTER COLUMN id SET DEFAULT nextval('perfumior.carts_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: perfumior; Owner: postgres
--

ALTER TABLE ONLY perfumior.categories ALTER COLUMN id SET DEFAULT nextval('perfumior.categories_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: perfumior; Owner: postgres
--

ALTER TABLE ONLY perfumior.customers ALTER COLUMN id SET DEFAULT nextval('perfumior.customers_id_seq'::regclass);


--
-- Name: order_details id; Type: DEFAULT; Schema: perfumior; Owner: postgres
--

ALTER TABLE ONLY perfumior.order_details ALTER COLUMN id SET DEFAULT nextval('perfumior.order_details_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: perfumior; Owner: postgres
--

ALTER TABLE ONLY perfumior.orders ALTER COLUMN id SET DEFAULT nextval('perfumior.orders_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: perfumior; Owner: postgres
--

ALTER TABLE ONLY perfumior.products ALTER COLUMN id SET DEFAULT nextval('perfumior.products_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: perfumior; Owner: postgres
--

ALTER TABLE ONLY perfumior.users ALTER COLUMN id SET DEFAULT nextval('perfumior.users_id_seq'::regclass);


--
-- Data for Name: carts; Type: TABLE DATA; Schema: perfumior; Owner: postgres
--

COPY perfumior.carts (id, cus_id, product_id, quantity, price, description, created_at, updated_at) FROM stdin;
\.
COPY perfumior.carts (id, cus_id, product_id, quantity, price, description, created_at, updated_at) FROM '$$PATH$$/5058.dat';

--
-- Data for Name: categories; Type: TABLE DATA; Schema: perfumior; Owner: postgres
--

COPY perfumior.categories (id, name, description, photo, created_at, updated_at) FROM stdin;
\.
COPY perfumior.categories (id, name, description, photo, created_at, updated_at) FROM '$$PATH$$/5048.dat';

--
-- Data for Name: customers; Type: TABLE DATA; Schema: perfumior; Owner: postgres
--

COPY perfumior.customers (id, name, email, password, photo, created_at, updated_at) FROM stdin;
\.
COPY perfumior.customers (id, name, email, password, photo, created_at, updated_at) FROM '$$PATH$$/5050.dat';

--
-- Data for Name: order_details; Type: TABLE DATA; Schema: perfumior; Owner: postgres
--

COPY perfumior.order_details (id, order_id, product_id, quantity, price, description, created_at, updated_at) FROM stdin;
\.
COPY perfumior.order_details (id, order_id, product_id, quantity, price, description, created_at, updated_at) FROM '$$PATH$$/5056.dat';

--
-- Data for Name: orders; Type: TABLE DATA; Schema: perfumior; Owner: postgres
--

COPY perfumior.orders (id, cus_id, order_date, total_price, description, created_at, updated_at) FROM stdin;
\.
COPY perfumior.orders (id, cus_id, order_date, total_price, description, created_at, updated_at) FROM '$$PATH$$/5054.dat';

--
-- Data for Name: products; Type: TABLE DATA; Schema: perfumior; Owner: postgres
--

COPY perfumior.products (id, name, description, price, stock_quantity, photo, category_id, created_at, updated_at) FROM stdin;
\.
COPY perfumior.products (id, name, description, price, stock_quantity, photo, category_id, created_at, updated_at) FROM '$$PATH$$/5052.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: perfumior; Owner: postgres
--

COPY perfumior.users (id, name, email, password, photo, created_at, updated_at) FROM stdin;
\.
COPY perfumior.users (id, name, email, password, photo, created_at, updated_at) FROM '$$PATH$$/5046.dat';

--
-- Name: carts_id_seq; Type: SEQUENCE SET; Schema: perfumior; Owner: postgres
--

SELECT pg_catalog.setval('perfumior.carts_id_seq', 82, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: perfumior; Owner: postgres
--

SELECT pg_catalog.setval('perfumior.categories_id_seq', 9, true);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: perfumior; Owner: postgres
--

SELECT pg_catalog.setval('perfumior.customers_id_seq', 18, true);


--
-- Name: order_details_id_seq; Type: SEQUENCE SET; Schema: perfumior; Owner: postgres
--

SELECT pg_catalog.setval('perfumior.order_details_id_seq', 41, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: perfumior; Owner: postgres
--

SELECT pg_catalog.setval('perfumior.orders_id_seq', 33, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: perfumior; Owner: postgres
--

SELECT pg_catalog.setval('perfumior.products_id_seq', 23, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: perfumior; Owner: postgres
--

SELECT pg_catalog.setval('perfumior.users_id_seq', 25, true);


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: perfumior; Owner: postgres
--

ALTER TABLE ONLY perfumior.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: perfumior; Owner: postgres
--

ALTER TABLE ONLY perfumior.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: perfumior; Owner: postgres
--

ALTER TABLE ONLY perfumior.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: order_details order_details_pkey; Type: CONSTRAINT; Schema: perfumior; Owner: postgres
--

ALTER TABLE ONLY perfumior.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: perfumior; Owner: postgres
--

ALTER TABLE ONLY perfumior.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: perfumior; Owner: postgres
--

ALTER TABLE ONLY perfumior.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: perfumior; Owner: postgres
--

ALTER TABLE ONLY perfumior.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: perfumior; Owner: postgres
--

ALTER TABLE ONLY perfumior.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: carts carts_cus_id_fkey; Type: FK CONSTRAINT; Schema: perfumior; Owner: postgres
--

ALTER TABLE ONLY perfumior.carts
    ADD CONSTRAINT carts_cus_id_fkey FOREIGN KEY (cus_id) REFERENCES perfumior.customers(id) ON DELETE SET NULL;


--
-- Name: carts carts_product_id_fkey; Type: FK CONSTRAINT; Schema: perfumior; Owner: postgres
--

ALTER TABLE ONLY perfumior.carts
    ADD CONSTRAINT carts_product_id_fkey FOREIGN KEY (product_id) REFERENCES perfumior.products(id) ON DELETE SET NULL;


--
-- Name: order_details order_details_order_id_fkey; Type: FK CONSTRAINT; Schema: perfumior; Owner: postgres
--

ALTER TABLE ONLY perfumior.order_details
    ADD CONSTRAINT order_details_order_id_fkey FOREIGN KEY (order_id) REFERENCES perfumior.orders(id) ON DELETE SET NULL;


--
-- Name: order_details order_details_product_id_fkey; Type: FK CONSTRAINT; Schema: perfumior; Owner: postgres
--

ALTER TABLE ONLY perfumior.order_details
    ADD CONSTRAINT order_details_product_id_fkey FOREIGN KEY (product_id) REFERENCES perfumior.products(id) ON DELETE SET NULL;


--
-- Name: orders orders_cus_id_fkey; Type: FK CONSTRAINT; Schema: perfumior; Owner: postgres
--

ALTER TABLE ONLY perfumior.orders
    ADD CONSTRAINT orders_cus_id_fkey FOREIGN KEY (cus_id) REFERENCES perfumior.customers(id) ON DELETE SET NULL;


--
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: perfumior; Owner: postgres
--

ALTER TABLE ONLY perfumior.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES perfumior.categories(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                