PGDMP                          {            skynet    13.8    13.8     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    41128    skynet    DATABASE     k   CREATE DATABASE skynet WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United Kingdom.1252';
    DROP DATABASE skynet;
                postgres    false            �            1259    41129    account    TABLE     M  CREATE TABLE public.account (
    username character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    surname character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    city character varying(50) NOT NULL,
    photo character varying(100) NOT NULL
);
    DROP TABLE public.account;
       public         heap    postgres    false            �            1259    41136    movie    TABLE     b  CREATE TABLE public.movie (
    idmovie integer NOT NULL,
    title character varying(50) NOT NULL,
    description character varying(500) NOT NULL,
    photo character varying(100) NOT NULL,
    releasedate date NOT NULL,
    runningtime smallint NOT NULL,
    price real NOT NULL,
    score real NOT NULL,
    user_id character varying(50) NOT NULL
);
    DROP TABLE public.movie;
       public         heap    postgres    false            �            1259    41134    movie_idmovie_seq    SEQUENCE     �   CREATE SEQUENCE public.movie_idmovie_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.movie_idmovie_seq;
       public          postgres    false    202            �           0    0    movie_idmovie_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.movie_idmovie_seq OWNED BY public.movie.idmovie;
          public          postgres    false    201            '           2604    41139    movie idmovie    DEFAULT     n   ALTER TABLE ONLY public.movie ALTER COLUMN idmovie SET DEFAULT nextval('public.movie_idmovie_seq'::regclass);
 <   ALTER TABLE public.movie ALTER COLUMN idmovie DROP DEFAULT;
       public          postgres    false    201    202    202            �          0    41129    account 
   TABLE DATA           X   COPY public.account (username, password, name, surname, email, city, photo) FROM stdin;
    public          postgres    false    200   $       �          0    41136    movie 
   TABLE DATA           t   COPY public.movie (idmovie, title, description, photo, releasedate, runningtime, price, score, user_id) FROM stdin;
    public          postgres    false    202   �       �           0    0    movie_idmovie_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.movie_idmovie_seq', 5, true);
          public          postgres    false    201            )           2606    41133    account account_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (username);
 >   ALTER TABLE ONLY public.account DROP CONSTRAINT account_pkey;
       public            postgres    false    200            +           2606    41144    movie movie_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (idmovie);
 :   ALTER TABLE ONLY public.movie DROP CONSTRAINT movie_pkey;
       public            postgres    false    202            ,           2606    41145    movie movie_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.account(username) ON UPDATE CASCADE ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.movie DROP CONSTRAINT movie_user_id_fkey;
       public          postgres    false    202    200    2857            �   �   x�m̻�0�����Z��	�*6$dB���R��?MP�,�t�}��,�wǾ���>µd]��I��m�̸ք<�y����M�⇝y&�Ҭc��7Y������kb��Jh��]Ž���%���ݡ��}�����A[��D����TJ� �c]      �     x�m�Oo�F�ϫO1�YTH�t���I��8��@1"��F���]J��[Jn}0@P�v8;�7o�R�]3pHҪo)��"Z��=����(�#i¤F���p��������%	��n����d����>!M�9�?!���!MN�-�xI�IB����cح)��eI�p�Ľ��i��OQ�wt�]�-o������[�OZ�)�͏�W�r�-�mQU��n��f����2��ڪ_7Gz`���=�[3}�AP�z�n���,�=�v�R�5��I�(h�V�ޒ�@N����ii�g�"b����)�EK+�������_�Wm�WTUE�W�m��M�v��U�N=��>O�`B�n��c����|a��o1w7&m�Sr�&q'1~�\.C�H�Ol�O���5�DvB{� �%����)G��yG�f��H�_���{�$V�>p;q|㰉�1j��p�*�L�q�	���qBM�/��L:��m��	u��U�+�{p�Dh��QO����~���l�P_�,�^<y/s�t�4 `6���a�����g��@s�@������������y}}�Cf	N���J9��;xqA��2���zʐ9_�����L�dv�z�HXv�����@�,�Cٳvq11F��o^�׍����_���
�V_�Q$X�{���D_�O�,/��`#�5��	�,,.2t�R;�gCޱ�/t>��^\uE{�Ų63@���juCo�
����]��Q�8$�yz���	���ެV����Z     