PGDMP      )                |           fosis    17rc1    17rc1 7               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    25309    fosis    DATABASE     x   CREATE DATABASE fosis WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Chile.1252';
    DROP DATABASE fosis;
                     postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                     pg_database_owner    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                        pg_database_owner    false    4            c           1247    25334    estado    DOMAIN     w  CREATE DOMAIN public.estado AS text
	CONSTRAINT check_nuevo_estado CHECK ((VALUE = ANY (ARRAY['Aceptado'::text, 'Rechazado'::text, 'Procesando'::text, 'En revisión'::text])))
	CONSTRAINT estado CHECK ((VALUE = ANY (ARRAY['Aceptado'::text, 'Rechazado'::text, 'Procesando'::text])))
	CONSTRAINT estado_check CHECK ((VALUE = ANY (ARRAY['Aceptado'::text, 'Rechazado'::text])));
    DROP DOMAIN public.estado;
       public               postgres    false    4            i           1247    25365    tipo_ejecutor    DOMAIN     �   CREATE DOMAIN public.tipo_ejecutor AS text
	CONSTRAINT tipo_ejecutor_check CHECK ((VALUE = ANY (ARRAY['Publico'::text, 'Privado'::text])));
 "   DROP DOMAIN public.tipo_ejecutor;
       public               postgres    false    4            \           1247    25320    tipo_postulante    DOMAIN     �   CREATE DOMAIN public.tipo_postulante AS text
	CONSTRAINT tipo_postulante_check CHECK ((VALUE = ANY (ARRAY['Persona'::text, 'Familia'::text, 'Comunidad'::text, 'Organizacion'::text])));
 $   DROP DOMAIN public.tipo_postulante;
       public               postgres    false    4            m           1247    25368    tipo_programa    DOMAIN     �   CREATE DOMAIN public.tipo_programa AS text
	CONSTRAINT tipo_programa_check CHECK ((VALUE = ANY (ARRAY['Autonomia Economica'::text, 'Cohesion Social'::text, 'Habitat Saludable'::text, 'Familias'::text])));
 "   DROP DOMAIN public.tipo_programa;
       public               postgres    false    4            �            1259    25370 
   administra    TABLE     n   CREATE TABLE public.administra (
    codigo_oficina integer NOT NULL,
    codigo_programa integer NOT NULL
);
    DROP TABLE public.administra;
       public         heap r       postgres    false    4            �            1259    25373    beneficiario    TABLE     �   CREATE TABLE public.beneficiario (
    rut integer NOT NULL,
    nombre character varying NOT NULL,
    direccion character varying NOT NULL,
    telefono integer NOT NULL,
    tipo public.tipo_postulante NOT NULL,
    id_postulacion integer NOT NULL
);
     DROP TABLE public.beneficiario;
       public         heap r       postgres    false    4    860            �            1259    25378 	   consultor    TABLE     �   CREATE TABLE public.consultor (
    rut integer NOT NULL,
    nombre character varying NOT NULL,
    domicilio character varying NOT NULL,
    web boolean NOT NULL
);
    DROP TABLE public.consultor;
       public         heap r       postgres    false    4            �            1259    25383    contrata    TABLE     �   CREATE TABLE public.contrata (
    codigo_oficina integer NOT NULL,
    fecha date NOT NULL,
    rut_ejecutor integer NOT NULL
);
    DROP TABLE public.contrata;
       public         heap r       postgres    false    4            �            1259    25386 	   ejecucion    TABLE     �   CREATE TABLE public.ejecucion (
    codigo_programa integer NOT NULL,
    fecha_inicio date NOT NULL,
    rut_ejecutor integer
);
    DROP TABLE public.ejecucion;
       public         heap r       postgres    false    4            �            1259    25389    ejecutor    TABLE     �   CREATE TABLE public.ejecutor (
    rut integer NOT NULL,
    nombre character varying NOT NULL,
    tipo public.tipo_ejecutor
);
    DROP TABLE public.ejecutor;
       public         heap r       postgres    false    873    4            �            1259    25394    empleado    TABLE     �   CREATE TABLE public.empleado (
    rut integer NOT NULL,
    nombre character varying NOT NULL,
    cargo character varying NOT NULL,
    codigo_oficina integer NOT NULL
);
    DROP TABLE public.empleado;
       public         heap r       postgres    false    4            �            1259    25399    oficinas regionales    TABLE     �   CREATE TABLE public."oficinas regionales" (
    codigo integer NOT NULL,
    ciudad character varying NOT NULL,
    direccion character varying NOT NULL,
    telefono character varying NOT NULL,
    horario character varying NOT NULL
);
 )   DROP TABLE public."oficinas regionales";
       public         heap r       postgres    false    4            �            1259    25404 	   participa    TABLE     l   CREATE TABLE public.participa (
    codigo_programa integer NOT NULL,
    rut_consultor integer NOT NULL
);
    DROP TABLE public.participa;
       public         heap r       postgres    false    4            �            1259    25328    postulacion    TABLE       CREATE TABLE public.postulacion (
    id integer NOT NULL,
    estado public.estado NOT NULL,
    region character varying NOT NULL,
    ciudad character varying NOT NULL,
    fecha date NOT NULL,
    rut_postulante integer NOT NULL,
    codigo_programa integer NOT NULL
);
    DROP TABLE public.postulacion;
       public         heap r       postgres    false    867    4            �            1259    25310 
   postulante    TABLE     �   CREATE TABLE public.postulante (
    rut integer NOT NULL,
    nombre character varying NOT NULL,
    telefono integer NOT NULL,
    direccion character varying NOT NULL,
    tipo public.tipo_postulante NOT NULL
);
    DROP TABLE public.postulante;
       public         heap r       postgres    false    860    4            �            1259    25407    programa    TABLE     �   CREATE TABLE public.programa (
    codigo integer NOT NULL,
    nombre character varying NOT NULL,
    tipo public.tipo_programa,
    fecha_inicio date NOT NULL,
    fecha_termino date
);
    DROP TABLE public.programa;
       public         heap r       postgres    false    4    877                      0    25370 
   administra 
   TABLE DATA           E   COPY public.administra (codigo_oficina, codigo_programa) FROM stdin;
    public               postgres    false    219   ?E                 0    25373    beneficiario 
   TABLE DATA           ^   COPY public.beneficiario (rut, nombre, direccion, telefono, tipo, id_postulacion) FROM stdin;
    public               postgres    false    220   \E                 0    25378 	   consultor 
   TABLE DATA           @   COPY public.consultor (rut, nombre, domicilio, web) FROM stdin;
    public               postgres    false    221   yE                 0    25383    contrata 
   TABLE DATA           G   COPY public.contrata (codigo_oficina, fecha, rut_ejecutor) FROM stdin;
    public               postgres    false    222   �E                 0    25386 	   ejecucion 
   TABLE DATA           P   COPY public.ejecucion (codigo_programa, fecha_inicio, rut_ejecutor) FROM stdin;
    public               postgres    false    223   �E                 0    25389    ejecutor 
   TABLE DATA           5   COPY public.ejecutor (rut, nombre, tipo) FROM stdin;
    public               postgres    false    224   �E                 0    25394    empleado 
   TABLE DATA           F   COPY public.empleado (rut, nombre, cargo, codigo_oficina) FROM stdin;
    public               postgres    false    225   �E                 0    25399    oficinas regionales 
   TABLE DATA           ]   COPY public."oficinas regionales" (codigo, ciudad, direccion, telefono, horario) FROM stdin;
    public               postgres    false    226   
F                 0    25404 	   participa 
   TABLE DATA           C   COPY public.participa (codigo_programa, rut_consultor) FROM stdin;
    public               postgres    false    227   �H                 0    25328    postulacion 
   TABLE DATA           i   COPY public.postulacion (id, estado, region, ciudad, fecha, rut_postulante, codigo_programa) FROM stdin;
    public               postgres    false    218   �H                 0    25310 
   postulante 
   TABLE DATA           L   COPY public.postulante (rut, nombre, telefono, direccion, tipo) FROM stdin;
    public               postgres    false    217   �H                 0    25407    programa 
   TABLE DATA           U   COPY public.programa (codigo, nombre, tipo, fecha_inicio, fecha_termino) FROM stdin;
    public               postgres    false    228   I       c           2606    25413    beneficiario beneficiario_pk 
   CONSTRAINT     [   ALTER TABLE ONLY public.beneficiario
    ADD CONSTRAINT beneficiario_pk PRIMARY KEY (rut);
 F   ALTER TABLE ONLY public.beneficiario DROP CONSTRAINT beneficiario_pk;
       public                 postgres    false    220            e           2606    25415    consultor consultor_pk 
   CONSTRAINT     U   ALTER TABLE ONLY public.consultor
    ADD CONSTRAINT consultor_pk PRIMARY KEY (rut);
 @   ALTER TABLE ONLY public.consultor DROP CONSTRAINT consultor_pk;
       public                 postgres    false    221            g           2606    25417    contrata contrato_pk 
   CONSTRAINT     ^   ALTER TABLE ONLY public.contrata
    ADD CONSTRAINT contrato_pk PRIMARY KEY (codigo_oficina);
 >   ALTER TABLE ONLY public.contrata DROP CONSTRAINT contrato_pk;
       public                 postgres    false    222            i           2606    25419    ejecutor ejecutor_pk 
   CONSTRAINT     S   ALTER TABLE ONLY public.ejecutor
    ADD CONSTRAINT ejecutor_pk PRIMARY KEY (rut);
 >   ALTER TABLE ONLY public.ejecutor DROP CONSTRAINT ejecutor_pk;
       public                 postgres    false    224            k           2606    25421    empleado empleado_pk 
   CONSTRAINT     S   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pk PRIMARY KEY (rut);
 >   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_pk;
       public                 postgres    false    225            m           2606    25423 *   oficinas regionales oficinas_regionales_pk 
   CONSTRAINT     n   ALTER TABLE ONLY public."oficinas regionales"
    ADD CONSTRAINT oficinas_regionales_pk PRIMARY KEY (codigo);
 V   ALTER TABLE ONLY public."oficinas regionales" DROP CONSTRAINT oficinas_regionales_pk;
       public                 postgres    false    226            a           2606    25332    postulacion postulacion_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.postulacion
    ADD CONSTRAINT postulacion_pk PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.postulacion DROP CONSTRAINT postulacion_pk;
       public                 postgres    false    218            _           2606    25318    postulante postulante_pk 
   CONSTRAINT     W   ALTER TABLE ONLY public.postulante
    ADD CONSTRAINT postulante_pk PRIMARY KEY (rut);
 B   ALTER TABLE ONLY public.postulante DROP CONSTRAINT postulante_pk;
       public                 postgres    false    217            o           2606    25425    programa programa_pk 
   CONSTRAINT     V   ALTER TABLE ONLY public.programa
    ADD CONSTRAINT programa_pk PRIMARY KEY (codigo);
 >   ALTER TABLE ONLY public.programa DROP CONSTRAINT programa_pk;
       public                 postgres    false    228            r           2606    25426 ,   administra administra_oficinas_regionales_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.administra
    ADD CONSTRAINT administra_oficinas_regionales_fk FOREIGN KEY (codigo_oficina) REFERENCES public."oficinas regionales"(codigo);
 V   ALTER TABLE ONLY public.administra DROP CONSTRAINT administra_oficinas_regionales_fk;
       public               postgres    false    4717    226    219            s           2606    25431 !   administra administra_programa_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.administra
    ADD CONSTRAINT administra_programa_fk FOREIGN KEY (codigo_programa) REFERENCES public.programa(codigo);
 K   ALTER TABLE ONLY public.administra DROP CONSTRAINT administra_programa_fk;
       public               postgres    false    219    228    4719            t           2606    25436 (   beneficiario beneficiario_postulacion_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.beneficiario
    ADD CONSTRAINT beneficiario_postulacion_fk FOREIGN KEY (id_postulacion) REFERENCES public.postulacion(id);
 R   ALTER TABLE ONLY public.beneficiario DROP CONSTRAINT beneficiario_postulacion_fk;
       public               postgres    false    218    220    4705            u           2606    25441    contrata contrata_ejecutor_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.contrata
    ADD CONSTRAINT contrata_ejecutor_fk FOREIGN KEY (rut_ejecutor) REFERENCES public.ejecutor(rut);
 G   ALTER TABLE ONLY public.contrata DROP CONSTRAINT contrata_ejecutor_fk;
       public               postgres    false    4713    224    222            v           2606    25446 (   contrata contrata_oficinas_regionales_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.contrata
    ADD CONSTRAINT contrata_oficinas_regionales_fk FOREIGN KEY (codigo_oficina) REFERENCES public."oficinas regionales"(codigo);
 R   ALTER TABLE ONLY public.contrata DROP CONSTRAINT contrata_oficinas_regionales_fk;
       public               postgres    false    4717    226    222            w           2606    25451    ejecucion ejecucion_ejecutor_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ejecucion
    ADD CONSTRAINT ejecucion_ejecutor_fk FOREIGN KEY (rut_ejecutor) REFERENCES public.ejecutor(rut);
 I   ALTER TABLE ONLY public.ejecucion DROP CONSTRAINT ejecucion_ejecutor_fk;
       public               postgres    false    4713    224    223            x           2606    25456    ejecucion ejecucion_programa_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ejecucion
    ADD CONSTRAINT ejecucion_programa_fk FOREIGN KEY (codigo_programa) REFERENCES public.programa(codigo);
 I   ALTER TABLE ONLY public.ejecucion DROP CONSTRAINT ejecucion_programa_fk;
       public               postgres    false    223    228    4719            y           2606    25461 (   empleado empleado_oficinas_regionales_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_oficinas_regionales_fk FOREIGN KEY (codigo_oficina) REFERENCES public."oficinas regionales"(codigo);
 R   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_oficinas_regionales_fk;
       public               postgres    false    4717    225    226            z           2606    25466     participa participa_consultor_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.participa
    ADD CONSTRAINT participa_consultor_fk FOREIGN KEY (rut_consultor) REFERENCES public.consultor(rut);
 J   ALTER TABLE ONLY public.participa DROP CONSTRAINT participa_consultor_fk;
       public               postgres    false    221    227    4709            {           2606    25471    participa participa_programa_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.participa
    ADD CONSTRAINT participa_programa_fk FOREIGN KEY (codigo_programa) REFERENCES public.programa(codigo);
 I   ALTER TABLE ONLY public.participa DROP CONSTRAINT participa_programa_fk;
       public               postgres    false    228    227    4719            p           2606    25359 %   postulacion postulacion_postulante_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.postulacion
    ADD CONSTRAINT postulacion_postulante_fk FOREIGN KEY (rut_postulante) REFERENCES public.postulante(rut);
 O   ALTER TABLE ONLY public.postulacion DROP CONSTRAINT postulacion_postulante_fk;
       public               postgres    false    217    218    4703            q           2606    25476 #   postulacion postulacion_programa_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.postulacion
    ADD CONSTRAINT postulacion_programa_fk FOREIGN KEY (codigo_programa) REFERENCES public.programa(codigo);
 M   ALTER TABLE ONLY public.postulacion DROP CONSTRAINT postulacion_programa_fk;
       public               postgres    false    218    4719    228                  x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �         h  x����n�0�מ��K�O�8�M+U 1UE�JHl.3��(M�N<RY��)X�`��c�7�I��L�I��(��|>��cK��.����8�1�p�B�}�f��?_��B�Wڀ����ڌ��r��Յ����G�����،Wm}�slZd��7(�s5)9��5vK#4����������ᑦ-�U���%I�97��!q�ĀZAF�)���U~�p�U�0���D��ڴ��rC��	�H=b5{G,\��4`5�ʹNs���Cp�[�KΟ%���]��҄2)�7�L�{S1�"��3ȍ9{O
q�����n���TZj·H6��O*�ɍ/K
��jZ�Ʃ�*����Ճڶč�B�Kw�5����eRUї���j�\�iX���
˙_zd\��GjRj��Ĥ�����I٪T�<���0���eo�+�T6禧�D-@q~�ʧ�)��7�����<�K�� ��-`�w#�N�>G���>����1Y����q
lCٍ-��p��=���`�bJg�уv$K�6���^��ZyMq��RT�:���,��Zv�%mZguh�&����QEO���T�SP�n�ǔ�lA���Ϊ,�š��d}|=���s��            x������ � �            x������ � �         J   x�3246��407�tJ,.�L�SpN,*����4�074707�t,*J,U�M�KI�R0�4�H-*��K����� hJT            x������ � �     