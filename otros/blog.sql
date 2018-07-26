-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.0
-- PostgreSQL version: 9.6
-- Project Site: pgmodeler.com.br
-- Model Author: ---

-- object: dan | type: ROLE --
-- DROP ROLE IF EXISTS dan;
CREATE ROLE dan WITH 
	INHERIT
	LOGIN
	ENCRYPTED PASSWORD '********';
-- ddl-end --


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: blog | type: DATABASE --
-- -- DROP DATABASE IF EXISTS blog;
-- CREATE DATABASE blog
-- 	ENCODING = 'UTF8'
-- 	LC_COLLATE = 'es_PE.UTF-8'
-- 	LC_CTYPE = 'es_PE.UTF-8'
-- 	TABLESPACE = pg_default
-- 	OWNER = dan
-- ;
-- -- ddl-end --
-- 

-- object: public.users | type: TABLE --
-- DROP TABLE IF EXISTS public.users CASCADE;
CREATE TABLE public.users(
	id integer NOT NULL,
	role character varying(100),
	name character varying(100),
	surname character varying(100),
	email character varying(100),
	password character varying,
	image bytea,
	sys_timrow timestamp,
	CONSTRAINT users_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.users OWNER TO postgres;
-- ddl-end --

-- object: public.categories | type: TABLE --
-- DROP TABLE IF EXISTS public.categories CASCADE;
CREATE TABLE public.categories(
	id integer NOT NULL,
	name character varying(100),
	description character varying(100),
	CONSTRAINT categories_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.categories OWNER TO postgres;
-- ddl-end --

-- object: public.tags | type: TABLE --
-- DROP TABLE IF EXISTS public.tags CASCADE;
CREATE TABLE public.tags(
	id integer NOT NULL,
	nombre character varying(100),
	description character varying(100),
	CONSTRAINT tags_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.tags OWNER TO postgres;
-- ddl-end --

-- object: public.entries | type: TABLE --
-- DROP TABLE IF EXISTS public.entries CASCADE;
CREATE TABLE public.entries(
	id integer,
	user_id integer,
	cotegory_id integer,
	title character varying(100),
	content character varying(100),
	status character varying,
	image bytea
);
-- ddl-end --
ALTER TABLE public.entries OWNER TO postgres;
-- ddl-end --

-- object: public.entry_tag | type: TABLE --
-- DROP TABLE IF EXISTS public.entry_tag CASCADE;
CREATE TABLE public.entry_tag(
	id integer NOT NULL,
	entry_id integer,
	tag_id integer,
	CONSTRAINT entry_tag_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.entry_tag OWNER TO postgres;
-- ddl-end --

-- object: "FK_entries_users" | type: CONSTRAINT --
-- ALTER TABLE public.entries DROP CONSTRAINT IF EXISTS "FK_entries_users" CASCADE;
ALTER TABLE public.entries ADD CONSTRAINT "FK_entries_users" FOREIGN KEY (user_id)
REFERENCES public.users (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "FK_entries_categories" | type: CONSTRAINT --
-- ALTER TABLE public.entries DROP CONSTRAINT IF EXISTS "FK_entries_categories" CASCADE;
ALTER TABLE public.entries ADD CONSTRAINT "FK_entries_categories" FOREIGN KEY (cotegory_id)
REFERENCES public.categories (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "FK_entry_tag_tag" | type: CONSTRAINT --
-- ALTER TABLE public.entry_tag DROP CONSTRAINT IF EXISTS "FK_entry_tag_tag" CASCADE;
ALTER TABLE public.entry_tag ADD CONSTRAINT "FK_entry_tag_tag" FOREIGN KEY (tag_id)
REFERENCES public.tags (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "FK_entry_tag_entries" | type: CONSTRAINT --
-- ALTER TABLE public.entry_tag DROP CONSTRAINT IF EXISTS "FK_entry_tag_entries" CASCADE;
ALTER TABLE public.entry_tag ADD CONSTRAINT "FK_entry_tag_entries" FOREIGN KEY (id)
REFERENCES public.entries (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


