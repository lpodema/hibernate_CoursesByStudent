
    CREATE SEQUENCE public.student_seq
            INCREMENT 1
            START 1
            MINVALUE 1
            MAXVALUE 9223372036854775807
            CACHE 1;

        ALTER SEQUENCE public.student_seq
            OWNER TO dummy;

    CREATE TABLE public.student
        (
        st_id integer NOT NULL,
        st_name character varying(50) NOT NULL,
        st_lastName character varying(50) NOT NULL,
        st_dni integer NOT NULL,
        st_birthDate DATE,
        st_email character varying(50),
        st_phone character varying(50),
        st_address integer NOT NULL,

        CONSTRAINT student_pkey PRIMARY KEY (st_id)
    )
    WITH (
        OIDS = FALSE
    )
    TABLESPACE pg_default;


    /*DESPUES DE CREADA ADDRESS*/
    ALTER TABLE public.student
         ADD CONSTRAINT st_fk FOREIGN KEY (st_address)
                REFERENCES public.address (st_id) MATCH SIMPLE
                ON UPDATE NO ACTION
                ON DELETE NO ACTION,
         OWNER to dummy;

///////////////////////////////////////////////////////////////
/*
CREATE SEQUENCE public.address_seq
            INCREMENT 1
            START 1
            MINVALUE 1
            MAXVALUE 9223372036854775807
            CACHE 1;

        ALTER SEQUENCE public.address_seq
            OWNER TO dummy;
*/
    CREATE TABLE public.address
        (
        st_id integer NOT NULL,
        ad_street character varying(50) NOT NULL,
        ad_number SMALLINT NOT NULL,
        ad_postal character varying(20) NOT NULL,
        ad_province integer NOT NULL,

        CONSTRAINT address_pkey PRIMARY KEY (st_id),
        CONSTRAINT ad_fk1 FOREIGN KEY (st_id)
          REFERENCES public.student (st_id) MATCH SIMPLE
            ON UPDATE NO ACTION
            ON DELETE NO ACTION,
        CONSTRAINT ad_fk2 FOREIGN KEY (ad_province)
            REFERENCES public.province (pr_id) MATCH SIMPLE
            ON UPDATE NO ACTION
            ON DELETE NO ACTION
    )
    WITH (
        OIDS = FALSE
    )
    TABLESPACE pg_default;

    ALTER TABLE public.address
        OWNER to dummy;

///////////////////////////////////////////////////////////////

/*CREATE TYPE public.prov AS ENUM ('Ciudad Autonoma de Buenos Aires','Buenos Aires', 'Catamarca', 'Chaco', 'Chubut', 'Cordoba','Corrientes','Entre Rios',
'Formosa','Jujuy','La Pampa','La Rioja','Mendoza','Misiones','Neuquén','Rio Negro','Salta','San Juan','Santa Cruz',
'Santa Fe','Santiago del Estero','Tierra del Fuego','Tucuman')

ALTER TYPE public.schedule
    OWNER to dummy;

    */
    CREATE SEQUENCE public.province_seq
                INCREMENT 1
                START 1
                MINVALUE 1
                MAXVALUE 9223372036854775807
                CACHE 1;

            ALTER SEQUENCE public.province_seq
                OWNER TO dummy;

    CREATE TABLE public.province
        (
        pr_id integer NOT NULL,
        pr_name character varying(50) NOT NULL,

        CONSTRAINT province_pkey PRIMARY KEY (pr_id)
    )
    WITH (
        OIDS = FALSE
    )
    TABLESPACE pg_default;

    ALTER TABLE public.province
        OWNER to dummy;
///////////////////////////////////////////////////////////////

    CREATE SEQUENCE public.course_seq
                INCREMENT 1
                START 1
                MINVALUE 1
                MAXVALUE 9223372036854775807
                CACHE 1;

            ALTER SEQUENCE public.course_seq
                OWNER TO dummy;

    CREATE TABLE public.course
        (
        course_id integer NOT NULL,
        course_name character varying(80) NOT NULL,
        course_description character varying(200),
        /*course_classes ---  classes (Collecion (Classes)) -> (* -> *),*/
        CONSTRAINT course_pkey PRIMARY KEY (course_id)
    )
    WITH (
        OIDS = FALSE
    )
    TABLESPACE pg_default;

    ALTER TABLE public.course
        OWNER to dummy;

///////////////////////////////////////////////////////////////

    CREATE SEQUENCE public.class_seq
                INCREMENT 1
                START 1
                MINVALUE 1
                MAXVALUE 9223372036854775807
                CACHE 1;

            ALTER SEQUENCE public.class_seq
                OWNER TO dummy;

    CREATE TABLE public.classInfo
        (
        cl_id integer NOT NULL,
        cl_name character varying(80) NOT NULL,
        cl_description character varying(200),
        cl_topic character varying(200),
        /*cl_course /* course (Collection (Courses)) -> (* -> *)*/
        CONSTRAINT classInfo_pkey PRIMARY KEY (cl_id)
    )
    WITH (
        OIDS = FALSE
    )
    TABLESPACE pg_default;

    ALTER TABLE public.classInfo
        OWNER to dummy;


//////////////////////////////////////

    CREATE TABLE public.classByCourse
    (
        course_id integer NOT NULL,
        cl_id integer NOT NULL,
        CONSTRAINT classByCourse_pkey PRIMARY KEY (course_id, cl_id),
        CONSTRAINT cbc_fk FOREIGN KEY (course_id)
            REFERENCES public.course (course_id) MATCH SIMPLE
            ON UPDATE NO ACTION
            ON DELETE NO ACTION,
        CONSTRAINT cbc_fk2 FOREIGN KEY (cl_id)
            REFERENCES public.classInfo (cl_id) MATCH SIMPLE
            ON UPDATE NO ACTION
            ON DELETE NO ACTION
    )
    WITH (
        OIDS = FALSE
    )
    TABLESPACE pg_default;

    ALTER TABLE public.classByCourse
        OWNER to dummy;
///////////////////////////////////////////////////////////////

    CREATE TYPE public.schedule AS ENUM ('Morning', 'Afternoon', 'Evening');

    ALTER TYPE public.schedule
        OWNER to dummy;

    CREATE SEQUENCE public.courses_seq
                INCREMENT 1
                START 1
                MINVALUE 1
                MAXVALUE 9223372036854775807
                CACHE 1;

            ALTER SEQUENCE public.courses_seq
                OWNER TO dummy;

    CREATE TABLE public.courses
        (
        c_id integer NOT NULL,
        c_course integer NOT NULL,
        c_init DATE,
        c_end DATE,
        c_schedule schedule,
        c_start TIME,
        CONSTRAINT courses_pkey PRIMARY KEY (c_id),
        CONSTRAINT c_fk1 FOREIGN KEY (c_course)
            REFERENCES public.course (course_id) MATCH SIMPLE
            ON UPDATE NO ACTION
            ON DELETE NO ACTION
    )
    WITH (
        OIDS = FALSE
    )
    TABLESPACE pg_default;

    ALTER TABLE public.courses
        OWNER to dummy;


///////////////////////////////////////////////////////////////
    CREATE TABLE public.coursesByStudent
    (
        st_id integer NOT NULL,
        c_id integer NOT NULL,
        CONSTRAINT coursesByStudent_pkey PRIMARY KEY (st_id, c_id),
        CONSTRAINT cbs_fk FOREIGN KEY (st_id)
            REFERENCES public.student (st_id) MATCH SIMPLE
            ON UPDATE NO ACTION
            ON DELETE NO ACTION,
        CONSTRAINT cbs_fk2 FOREIGN KEY (c_id)
            REFERENCES public.courses (c_id) MATCH SIMPLE
            ON UPDATE NO ACTION
            ON DELETE NO ACTION
    )
    WITH (
        OIDS = FALSE
    )
    TABLESPACE pg_default;

    ALTER TABLE public.coursesByStudent
        OWNER to dummy;

///////////////////////////////////////////////////////////////
