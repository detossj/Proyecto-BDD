PGDMP  ,    &        
        |           fosis    17rc1    17rc1 X    3           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            4           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            5           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            6           1262    25706    fosis    DATABASE     x   CREATE DATABASE fosis WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Chile.1252';
    DROP DATABASE fosis;
                     postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                     pg_database_owner    false            7           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                        pg_database_owner    false    4            `           1247    25708    regiones    DOMAIN     �   CREATE DOMAIN public.regiones AS text
	CONSTRAINT regiones_check CHECK ((VALUE = ANY (ARRAY['Bio Bio'::text, 'Ñuble'::text, 'Magallanes'::text, 'Metropolitana'::text, 'Arica y Parinacota'::text])));
    DROP DOMAIN public.regiones;
       public               postgres    false    4            d           1247    25711    tipo_ejecutor    DOMAIN     �   CREATE DOMAIN public.tipo_ejecutor AS text
	CONSTRAINT tipo_ejecutor_check CHECK ((VALUE = ANY (ARRAY['Publico'::text, 'Privado'::text])));
 "   DROP DOMAIN public.tipo_ejecutor;
       public               postgres    false    4            h           1247    25714    tipo_estado    DOMAIN     �   CREATE DOMAIN public.tipo_estado AS text
	CONSTRAINT tipo_estado_check CHECK ((VALUE = ANY (ARRAY['Aceptado'::text, 'Rechazado'::text, 'Procesando'::text])));
     DROP DOMAIN public.tipo_estado;
       public               postgres    false    4            l           1247    25717    tipo_postulante    DOMAIN     �   CREATE DOMAIN public.tipo_postulante AS text
	CONSTRAINT tipo_postulante_check CHECK ((VALUE = ANY (ARRAY['Persona'::text, 'Familia'::text, 'Comunidad'::text, 'Organizacion'::text])));
 $   DROP DOMAIN public.tipo_postulante;
       public               postgres    false    4            p           1247    25720    tipo_programa    DOMAIN     �   CREATE DOMAIN public.tipo_programa AS text
	CONSTRAINT tipo_programa_check CHECK ((VALUE = ANY (ARRAY['Habitat Saludable'::text, 'Familias'::text, 'Autonomia Economica'::text, 'Cohesion Social'::text])));
 "   DROP DOMAIN public.tipo_programa;
       public               postgres    false    4            �            1259    25722 
   administra    TABLE     n   CREATE TABLE public.administra (
    codigo_oficina integer NOT NULL,
    codigo_programa integer NOT NULL
);
    DROP TABLE public.administra;
       public         heap r       postgres    false    4            �            1259    25725    adminstra_codigo_oficina_seq    SEQUENCE     �   CREATE SEQUENCE public.adminstra_codigo_oficina_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.adminstra_codigo_oficina_seq;
       public               postgres    false    4    217            8           0    0    adminstra_codigo_oficina_seq    SEQUENCE OWNED BY     ^   ALTER SEQUENCE public.adminstra_codigo_oficina_seq OWNED BY public.administra.codigo_oficina;
          public               postgres    false    218            �            1259    25726    adminstra_codigo_programa_seq    SEQUENCE     �   CREATE SEQUENCE public.adminstra_codigo_programa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.adminstra_codigo_programa_seq;
       public               postgres    false    217    4            9           0    0    adminstra_codigo_programa_seq    SEQUENCE OWNED BY     `   ALTER SEQUENCE public.adminstra_codigo_programa_seq OWNED BY public.administra.codigo_programa;
          public               postgres    false    219            �            1259    25727 	   consultor    TABLE     �   CREATE TABLE public.consultor (
    rut character varying NOT NULL,
    nombre character varying NOT NULL,
    domicilio character varying NOT NULL,
    web boolean
);
    DROP TABLE public.consultor;
       public         heap r       postgres    false    4            �            1259    25732    contrata    TABLE     �   CREATE TABLE public.contrata (
    codigo_oficina integer NOT NULL,
    fecha date NOT NULL,
    rut_ejecutor character varying NOT NULL
);
    DROP TABLE public.contrata;
       public         heap r       postgres    false    4            �            1259    25737    contrata_codigo_oficina_seq    SEQUENCE     �   CREATE SEQUENCE public.contrata_codigo_oficina_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.contrata_codigo_oficina_seq;
       public               postgres    false    221    4            :           0    0    contrata_codigo_oficina_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.contrata_codigo_oficina_seq OWNED BY public.contrata.codigo_oficina;
          public               postgres    false    222            �            1259    25738 	   ejecucion    TABLE     �   CREATE TABLE public.ejecucion (
    codigo_programa integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_termino date,
    rut_ejecutor character varying DEFAULT 'No asignado'::character varying NOT NULL
);
    DROP TABLE public.ejecucion;
       public         heap r       postgres    false    4            �            1259    25743    ejecucion_codigo_programa_seq    SEQUENCE     �   CREATE SEQUENCE public.ejecucion_codigo_programa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.ejecucion_codigo_programa_seq;
       public               postgres    false    4    223            ;           0    0    ejecucion_codigo_programa_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.ejecucion_codigo_programa_seq OWNED BY public.ejecucion.codigo_programa;
          public               postgres    false    224            �            1259    25744    ejecutor    TABLE     �   CREATE TABLE public.ejecutor (
    rut character varying NOT NULL,
    nombre character varying NOT NULL,
    tipo public.tipo_ejecutor NOT NULL,
    ocupado boolean NOT NULL
);
    DROP TABLE public.ejecutor;
       public         heap r       postgres    false    868    4            �            1259    25749    oficina    TABLE     �   CREATE TABLE public.oficina (
    codigo integer NOT NULL,
    region public.regiones NOT NULL,
    direccion character varying NOT NULL,
    telefono character varying NOT NULL,
    horario character varying NOT NULL
);
    DROP TABLE public.oficina;
       public         heap r       postgres    false    4    864            �            1259    25754    oficina_codigo_seq    SEQUENCE     �   CREATE SEQUENCE public.oficina_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.oficina_codigo_seq;
       public               postgres    false    4    226            <           0    0    oficina_codigo_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.oficina_codigo_seq OWNED BY public.oficina.codigo;
          public               postgres    false    227            �            1259    25755 	   participa    TABLE     v   CREATE TABLE public.participa (
    codigo_programa integer NOT NULL,
    rut_consultor character varying NOT NULL
);
    DROP TABLE public.participa;
       public         heap r       postgres    false    4            �            1259    25760    participa_codigo_programa_seq    SEQUENCE     �   CREATE SEQUENCE public.participa_codigo_programa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.participa_codigo_programa_seq;
       public               postgres    false    4    228            =           0    0    participa_codigo_programa_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.participa_codigo_programa_seq OWNED BY public.participa.codigo_programa;
          public               postgres    false    229            �            1259    25761    postulacion    TABLE     k  CREATE TABLE public.postulacion (
    id integer NOT NULL,
    ciudad character varying NOT NULL,
    fecha date NOT NULL,
    estado public.tipo_estado DEFAULT 'Procesando'::text NOT NULL,
    rut_postulante character varying NOT NULL,
    codigo_programa integer NOT NULL,
    rut_ejecutor character varying DEFAULT 'No asignado'::character varying NOT NULL
);
    DROP TABLE public.postulacion;
       public         heap r       postgres    false    872    872    4            �            1259    25766    postulacion_codigo_programa_seq    SEQUENCE     �   CREATE SEQUENCE public.postulacion_codigo_programa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.postulacion_codigo_programa_seq;
       public               postgres    false    230    4            >           0    0    postulacion_codigo_programa_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.postulacion_codigo_programa_seq OWNED BY public.postulacion.codigo_programa;
          public               postgres    false    231            �            1259    25767    postulacion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.postulacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.postulacion_id_seq;
       public               postgres    false    4    230            ?           0    0    postulacion_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.postulacion_id_seq OWNED BY public.postulacion.id;
          public               postgres    false    232            �            1259    25768 
   postulante    TABLE     �   CREATE TABLE public.postulante (
    rut character varying NOT NULL,
    nombre character varying NOT NULL,
    telefono character varying NOT NULL,
    direccion character varying NOT NULL,
    tipo public.tipo_postulante NOT NULL
);
    DROP TABLE public.postulante;
       public         heap r       postgres    false    876    4            �            1259    25773    programa    TABLE     �   CREATE TABLE public.programa (
    codigo integer NOT NULL,
    nombre character varying NOT NULL,
    tipo public.tipo_programa NOT NULL,
    region public.regiones NOT NULL
);
    DROP TABLE public.programa;
       public         heap r       postgres    false    864    4    880            �            1259    25778    programa_codigo_seq    SEQUENCE     �   CREATE SEQUENCE public.programa_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.programa_codigo_seq;
       public               postgres    false    4    234            @           0    0    programa_codigo_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.programa_codigo_seq OWNED BY public.programa.codigo;
          public               postgres    false    235            a           2604    25779    administra codigo_oficina    DEFAULT     �   ALTER TABLE ONLY public.administra ALTER COLUMN codigo_oficina SET DEFAULT nextval('public.adminstra_codigo_oficina_seq'::regclass);
 H   ALTER TABLE public.administra ALTER COLUMN codigo_oficina DROP DEFAULT;
       public               postgres    false    218    217            b           2604    25780    administra codigo_programa    DEFAULT     �   ALTER TABLE ONLY public.administra ALTER COLUMN codigo_programa SET DEFAULT nextval('public.adminstra_codigo_programa_seq'::regclass);
 I   ALTER TABLE public.administra ALTER COLUMN codigo_programa DROP DEFAULT;
       public               postgres    false    219    217            c           2604    25781    contrata codigo_oficina    DEFAULT     �   ALTER TABLE ONLY public.contrata ALTER COLUMN codigo_oficina SET DEFAULT nextval('public.contrata_codigo_oficina_seq'::regclass);
 F   ALTER TABLE public.contrata ALTER COLUMN codigo_oficina DROP DEFAULT;
       public               postgres    false    222    221            d           2604    25782    ejecucion codigo_programa    DEFAULT     �   ALTER TABLE ONLY public.ejecucion ALTER COLUMN codigo_programa SET DEFAULT nextval('public.ejecucion_codigo_programa_seq'::regclass);
 H   ALTER TABLE public.ejecucion ALTER COLUMN codigo_programa DROP DEFAULT;
       public               postgres    false    224    223            f           2604    25783    oficina codigo    DEFAULT     p   ALTER TABLE ONLY public.oficina ALTER COLUMN codigo SET DEFAULT nextval('public.oficina_codigo_seq'::regclass);
 =   ALTER TABLE public.oficina ALTER COLUMN codigo DROP DEFAULT;
       public               postgres    false    227    226            g           2604    25784    participa codigo_programa    DEFAULT     �   ALTER TABLE ONLY public.participa ALTER COLUMN codigo_programa SET DEFAULT nextval('public.participa_codigo_programa_seq'::regclass);
 H   ALTER TABLE public.participa ALTER COLUMN codigo_programa DROP DEFAULT;
       public               postgres    false    229    228            h           2604    25785    postulacion id    DEFAULT     p   ALTER TABLE ONLY public.postulacion ALTER COLUMN id SET DEFAULT nextval('public.postulacion_id_seq'::regclass);
 =   ALTER TABLE public.postulacion ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    232    230            j           2604    25786    postulacion codigo_programa    DEFAULT     �   ALTER TABLE ONLY public.postulacion ALTER COLUMN codigo_programa SET DEFAULT nextval('public.postulacion_codigo_programa_seq'::regclass);
 J   ALTER TABLE public.postulacion ALTER COLUMN codigo_programa DROP DEFAULT;
       public               postgres    false    231    230            l           2604    25787    programa codigo    DEFAULT     r   ALTER TABLE ONLY public.programa ALTER COLUMN codigo SET DEFAULT nextval('public.programa_codigo_seq'::regclass);
 >   ALTER TABLE public.programa ALTER COLUMN codigo DROP DEFAULT;
       public               postgres    false    235    234                      0    25722 
   administra 
   TABLE DATA           E   COPY public.administra (codigo_oficina, codigo_programa) FROM stdin;
    public               postgres    false    217   �k       !          0    25727 	   consultor 
   TABLE DATA           @   COPY public.consultor (rut, nombre, domicilio, web) FROM stdin;
    public               postgres    false    220   �k       "          0    25732    contrata 
   TABLE DATA           G   COPY public.contrata (codigo_oficina, fecha, rut_ejecutor) FROM stdin;
    public               postgres    false    221   �l       $          0    25738 	   ejecucion 
   TABLE DATA           _   COPY public.ejecucion (codigo_programa, fecha_inicio, fecha_termino, rut_ejecutor) FROM stdin;
    public               postgres    false    223   �l       &          0    25744    ejecutor 
   TABLE DATA           >   COPY public.ejecutor (rut, nombre, tipo, ocupado) FROM stdin;
    public               postgres    false    225   �l       '          0    25749    oficina 
   TABLE DATA           O   COPY public.oficina (codigo, region, direccion, telefono, horario) FROM stdin;
    public               postgres    false    226   �m       )          0    25755 	   participa 
   TABLE DATA           C   COPY public.participa (codigo_programa, rut_consultor) FROM stdin;
    public               postgres    false    228   o       +          0    25761    postulacion 
   TABLE DATA           o   COPY public.postulacion (id, ciudad, fecha, estado, rut_postulante, codigo_programa, rut_ejecutor) FROM stdin;
    public               postgres    false    230   "o       .          0    25768 
   postulante 
   TABLE DATA           L   COPY public.postulante (rut, nombre, telefono, direccion, tipo) FROM stdin;
    public               postgres    false    233   �o       /          0    25773    programa 
   TABLE DATA           @   COPY public.programa (codigo, nombre, tipo, region) FROM stdin;
    public               postgres    false    234   0p       A           0    0    adminstra_codigo_oficina_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.adminstra_codigo_oficina_seq', 1, false);
          public               postgres    false    218            B           0    0    adminstra_codigo_programa_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.adminstra_codigo_programa_seq', 1, false);
          public               postgres    false    219            C           0    0    contrata_codigo_oficina_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.contrata_codigo_oficina_seq', 1, false);
          public               postgres    false    222            D           0    0    ejecucion_codigo_programa_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.ejecucion_codigo_programa_seq', 1, false);
          public               postgres    false    224            E           0    0    oficina_codigo_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.oficina_codigo_seq', 9, true);
          public               postgres    false    227            F           0    0    participa_codigo_programa_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.participa_codigo_programa_seq', 1, false);
          public               postgres    false    229            G           0    0    postulacion_codigo_programa_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.postulacion_codigo_programa_seq', 1, false);
          public               postgres    false    231            H           0    0    postulacion_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.postulacion_id_seq', 23, true);
          public               postgres    false    232            I           0    0    programa_codigo_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.programa_codigo_seq', 9, true);
          public               postgres    false    235            n           2606    25789    administra adminstra_pk 
   CONSTRAINT     r   ALTER TABLE ONLY public.administra
    ADD CONSTRAINT adminstra_pk PRIMARY KEY (codigo_oficina, codigo_programa);
 A   ALTER TABLE ONLY public.administra DROP CONSTRAINT adminstra_pk;
       public                 postgres    false    217    217            p           2606    25791    consultor consultor_pk 
   CONSTRAINT     U   ALTER TABLE ONLY public.consultor
    ADD CONSTRAINT consultor_pk PRIMARY KEY (rut);
 @   ALTER TABLE ONLY public.consultor DROP CONSTRAINT consultor_pk;
       public                 postgres    false    220            r           2606    25793    contrata contrata_pk 
   CONSTRAINT     l   ALTER TABLE ONLY public.contrata
    ADD CONSTRAINT contrata_pk PRIMARY KEY (codigo_oficina, rut_ejecutor);
 >   ALTER TABLE ONLY public.contrata DROP CONSTRAINT contrata_pk;
       public                 postgres    false    221    221            t           2606    25795    ejecucion ejecucion_pk 
   CONSTRAINT     o   ALTER TABLE ONLY public.ejecucion
    ADD CONSTRAINT ejecucion_pk PRIMARY KEY (codigo_programa, rut_ejecutor);
 @   ALTER TABLE ONLY public.ejecucion DROP CONSTRAINT ejecucion_pk;
       public                 postgres    false    223    223            v           2606    25797    ejecutor ejecutor_pk 
   CONSTRAINT     S   ALTER TABLE ONLY public.ejecutor
    ADD CONSTRAINT ejecutor_pk PRIMARY KEY (rut);
 >   ALTER TABLE ONLY public.ejecutor DROP CONSTRAINT ejecutor_pk;
       public                 postgres    false    225            x           2606    25799    oficina oficina_pk 
   CONSTRAINT     T   ALTER TABLE ONLY public.oficina
    ADD CONSTRAINT oficina_pk PRIMARY KEY (codigo);
 <   ALTER TABLE ONLY public.oficina DROP CONSTRAINT oficina_pk;
       public                 postgres    false    226            z           2606    25801    participa participa_pk 
   CONSTRAINT     p   ALTER TABLE ONLY public.participa
    ADD CONSTRAINT participa_pk PRIMARY KEY (codigo_programa, rut_consultor);
 @   ALTER TABLE ONLY public.participa DROP CONSTRAINT participa_pk;
       public                 postgres    false    228    228            |           2606    25803    postulacion postulacion_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.postulacion
    ADD CONSTRAINT postulacion_pk PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.postulacion DROP CONSTRAINT postulacion_pk;
       public                 postgres    false    230            ~           2606    25805    postulacion postulacion_unique 
   CONSTRAINT     a   ALTER TABLE ONLY public.postulacion
    ADD CONSTRAINT postulacion_unique UNIQUE (rut_ejecutor);
 H   ALTER TABLE ONLY public.postulacion DROP CONSTRAINT postulacion_unique;
       public                 postgres    false    230            �           2606    25807    postulante postulante_pk 
   CONSTRAINT     W   ALTER TABLE ONLY public.postulante
    ADD CONSTRAINT postulante_pk PRIMARY KEY (rut);
 B   ALTER TABLE ONLY public.postulante DROP CONSTRAINT postulante_pk;
       public                 postgres    false    233            �           2606    25809    programa programa_pk 
   CONSTRAINT     V   ALTER TABLE ONLY public.programa
    ADD CONSTRAINT programa_pk PRIMARY KEY (codigo);
 >   ALTER TABLE ONLY public.programa DROP CONSTRAINT programa_pk;
       public                 postgres    false    234            �           2606    25810    administra adminstra_oficina_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.administra
    ADD CONSTRAINT adminstra_oficina_fk FOREIGN KEY (codigo_oficina) REFERENCES public.oficina(codigo);
 I   ALTER TABLE ONLY public.administra DROP CONSTRAINT adminstra_oficina_fk;
       public               postgres    false    217    226    4728            �           2606    25815     administra adminstra_programa_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.administra
    ADD CONSTRAINT adminstra_programa_fk FOREIGN KEY (codigo_programa) REFERENCES public.programa(codigo);
 J   ALTER TABLE ONLY public.administra DROP CONSTRAINT adminstra_programa_fk;
       public               postgres    false    234    4738    217            �           2606    25820    contrata contrata_ejecutor_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.contrata
    ADD CONSTRAINT contrata_ejecutor_fk FOREIGN KEY (rut_ejecutor) REFERENCES public.ejecutor(rut);
 G   ALTER TABLE ONLY public.contrata DROP CONSTRAINT contrata_ejecutor_fk;
       public               postgres    false    225    4726    221            �           2606    25825    contrata contrata_oficina_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.contrata
    ADD CONSTRAINT contrata_oficina_fk FOREIGN KEY (codigo_oficina) REFERENCES public.oficina(codigo);
 F   ALTER TABLE ONLY public.contrata DROP CONSTRAINT contrata_oficina_fk;
       public               postgres    false    226    221    4728            �           2606    25830    ejecucion ejecucion_ejecutor_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ejecucion
    ADD CONSTRAINT ejecucion_ejecutor_fk FOREIGN KEY (rut_ejecutor) REFERENCES public.ejecutor(rut);
 I   ALTER TABLE ONLY public.ejecucion DROP CONSTRAINT ejecucion_ejecutor_fk;
       public               postgres    false    4726    225    223            �           2606    25835    ejecucion ejecucion_programa_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ejecucion
    ADD CONSTRAINT ejecucion_programa_fk FOREIGN KEY (codigo_programa) REFERENCES public.programa(codigo);
 I   ALTER TABLE ONLY public.ejecucion DROP CONSTRAINT ejecucion_programa_fk;
       public               postgres    false    4738    223    234            �           2606    25840     participa participa_consultor_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.participa
    ADD CONSTRAINT participa_consultor_fk FOREIGN KEY (rut_consultor) REFERENCES public.consultor(rut);
 J   ALTER TABLE ONLY public.participa DROP CONSTRAINT participa_consultor_fk;
       public               postgres    false    4720    220    228            �           2606    25845    participa participa_programa_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.participa
    ADD CONSTRAINT participa_programa_fk FOREIGN KEY (codigo_programa) REFERENCES public.programa(codigo);
 I   ALTER TABLE ONLY public.participa DROP CONSTRAINT participa_programa_fk;
       public               postgres    false    234    228    4738            �           2606    25850 $   postulacion postulacion_ejecucion_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.postulacion
    ADD CONSTRAINT postulacion_ejecucion_fk FOREIGN KEY (codigo_programa, rut_ejecutor) REFERENCES public.ejecucion(codigo_programa, rut_ejecutor);
 N   ALTER TABLE ONLY public.postulacion DROP CONSTRAINT postulacion_ejecucion_fk;
       public               postgres    false    223    230    230    4724    223            �           2606    25855 %   postulacion postulacion_postulante_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.postulacion
    ADD CONSTRAINT postulacion_postulante_fk FOREIGN KEY (rut_postulante) REFERENCES public.postulante(rut);
 O   ALTER TABLE ONLY public.postulacion DROP CONSTRAINT postulacion_postulante_fk;
       public               postgres    false    230    233    4736                  x������ � �      !   �   x�M��N�0Eg�+�ƒX�n�f�j���@bbyJ���>GN�!��ЉO���tbz�}�+�X��6u.�Iw�ë?�t�Co��ȶ���!���=��o�'6ry�>_�#�xE�y���3��O�3{��[c, W*�7�Ѣ��EY�M}�ԍ���4��-o_�N�&�਩K��.3�7�����=MHp0�)����'��3��CH33xG�c�x|�?��Q�      "      x������ � �      $   8   x�3�4202�54�54����44�373�31
p�K��YZ�뙙��s��qqq n;      &   �   x�U�=�0��=E/�/��hLt�Ġ�K�ǐ@k
8p��z1a��ɛ�%�� �b�Q66=�]����	]�g�՘G+	�3���]eI~���c�1\ƠtB:yc��/�?���z,�D/T
����a6$7]����A�
��Kq��������)H�.R�֐���7��?>IE      '   9  x�}��N1���Sx�B���v+���*���k�Z��*������#� L<½	O�S�?1Dv,����-n�9���8$��x��Q�f��'�E�{qV7L�j@5�n�1@8��9[[�ͥ�J�s܅�}��"R�p+��	��`=�n0˷�U&�3J�����(�?J�qA��U�z&'p��u\^��Y�b�@����2���;_}FVP���Z��i2緵���;g���p���;rn|�?�L�?�|+9������(�G�Rč�Jͮ���!��m@ky������V�j����oϋ�xP��,      )      x������ � �      +   c   x��˻�0�X�E?��i�HC@b3P%\cw��.M������id�������^����>���P�����_t �����t���yQf�+�!       .   �   x�u˽
�0���)�K%_~���UP��˵	������E7�~,�Kι�ұ�G��v+�4څ>E��&Fr�ׇ�d�s^��E��ֺ��`�ٛO?��N��ιUJ�38�π7=b�@'iE�����@)�<�~��WJ�r�2�      /   �   x�m�KJA��U��	|�ಕ](����UE��4�Xx���b�}0��$���'�4����=�Tz(}A4Co�%1h�s|�S����	48�ǏLO┹��PY2��X�g̈9T{��c�U8kr�B��h/���WB"{���%�"��v{Z���&^Io��F#b��;�Pԏ��s3�4�3����!r
���3�f=�QO�ϟ^6��O�f{-     