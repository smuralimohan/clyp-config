

-- DROP DATABASE IF EXISTS clyp;
-- DROP ROLE IF EXISTS clyp;

-- CREATE ROLE clyp WITH
--   NOLOGIN
--   NOSUPERUSER
--   INHERIT
--   NOCREATEDB
--   NOCREATEROLE
--   NOREPLICATION;



-- CREATE DATABASE clyp
--     WITH 
--     OWNER = clyp
--     ENCODING = 'UTF8'
--     LC_COLLATE = 'English_India.1252'
--     LC_CTYPE = 'English_India.1252'
--     TABLESPACE = pg_default
--     CONNECTION LIMIT = -1;

------------------------------------------------------------------------------
--Begin of Tables--
------------------------------------------------------------------------------

DROP TABLE IF EXISTS public.business_owner_entity;  
DROP TABLE IF EXISTS public.business_owner_entity_audit;

DROP TABLE IF EXISTS public.invoice_line_item;  
DROP TABLE IF EXISTS public.invoice_line_item_audit;

DROP TABLE IF EXISTS public.kot;
DROP TABLE IF EXISTS public.kot_audit;

DROP TABLE IF EXISTS public.bot;
DROP TABLE IF EXISTS public.bot_audit;

DROP TABLE IF EXISTS public.session_customer;

DROP TABLE IF EXISTS public.memories;  
DROP TABLE IF EXISTS public.memories_audit;

DROP TABLE IF EXISTS public.session_group;

DROP TABLE IF EXISTS public.invoice;  
DROP TABLE IF EXISTS public.invoice_audit;

DROP TABLE IF EXISTS public.session;  
DROP TABLE IF EXISTS public.session_audit;

DROP TABLE IF EXISTS public.booking;  
DROP TABLE IF EXISTS public.booking_audit;
DROP TABLE IF EXISTS public.booking_history;

DROP TABLE IF EXISTS public.promotion;  
DROP TABLE IF EXISTS public.promotion_audit;

DROP TABLE IF EXISTS public.staff;  
DROP TABLE IF EXISTS public.staff_audit;

DROP TABLE IF EXISTS public.dining_table;  
DROP TABLE IF EXISTS public.dining_table_audit;

DROP TABLE IF EXISTS public.establishment_layout;  
DROP TABLE IF EXISTS public.establishment_layout_audit;

DROP TABLE IF EXISTS public.review;  
DROP TABLE IF EXISTS public.review_audit;

DROP TABLE IF EXISTS public.bar_menu_item;  
DROP TABLE IF EXISTS public.bar_menu_item_audit;

DROP TABLE IF EXISTS public.bar_menu;  
DROP TABLE IF EXISTS public.bar_menu_audit;

DROP TABLE IF EXISTS public.kitchen_menu_item;  
DROP TABLE IF EXISTS public.kitchen_menu_item_audit;

DROP TABLE IF EXISTS public.kitchen_menu;  
DROP TABLE IF EXISTS public.kitchen_menu_audit;

DROP TABLE IF EXISTS public.establishment;  
DROP TABLE IF EXISTS public.establishment_audit;

DROP TABLE IF EXISTS public.sysuser;
DROP TABLE IF EXISTS public.sysuser_audit;

DROP TABLE IF EXISTS public.business_owner;
DROP TABLE IF EXISTS public.business_owner_audit;  

DROP TABLE IF EXISTS public.layout;
DROP TABLE IF EXISTS public.layout_audit;  

DROP TABLE IF EXISTS public.customer;
DROP TABLE IF EXISTS public.customer_audit;

DROP TABLE IF EXISTS public.tax_entity;
DROP TABLE IF EXISTS public.tax_entity_audit;

DROP TABLE IF EXISTS public.tax_component;
DROP TABLE IF EXISTS public.tax_component_audit;

DROP TABLE IF EXISTS public.tax;
DROP TABLE IF EXISTS public.tax_audit;

DROP TABLE IF EXISTS public.discount;
DROP TABLE IF EXISTS public.discount_audit;

DROP TABLE IF EXISTS public.sysconfig_custom;
DROP TABLE IF EXISTS public.sysconfig_custom_audit;

DROP TABLE IF EXISTS public.sysconfig_arr_custom;
DROP TABLE IF EXISTS public.sysconfig_arr_custom_audit;

DROP TABLE IF EXISTS public.entity;  
DROP TABLE IF EXISTS public.entity_audit;

DROP TABLE IF EXISTS public.country;

DROP TABLE IF EXISTS public.currency;

DROP TABLE IF EXISTS public.role;

DROP TABLE IF EXISTS public.rating_scale;


DROP TABLE IF EXISTS public.sysconfig;
DROP TABLE IF EXISTS public.sysconfig_audit;

DROP TABLE IF EXISTS public.sysconfig_arr;
DROP TABLE IF EXISTS public.sysconfig_arr_audit;

------------------------------------------------------------------------------

DROP DOMAIN IF EXISTS public.promotion_type;
CREATE DOMAIN promotion_type AS TEXT
CHECK(   
   VALUE = 'CASHBACK'
OR VALUE = 'DISCOUNT'
OR VALUE = 'CHANGES TO MENU'
OR VALUE = 'NEW BRANCH' 
);
ALTER DOMAIN promotion_type OWNER TO clyp;

------------------------------------------------------------------------------

DROP DOMAIN IF EXISTS public.promotion_frequency;
CREATE DOMAIN promotion_frequency AS TEXT
CHECK(   
   VALUE = 'DAILY'
OR VALUE = 'WEEKLY'
OR VALUE = 'MONTHLY'
OR VALUE = 'QUARTERLY'
OR VALUE = 'HALF_YEARLY'
OR VALUE = 'YEARLY' 
);
ALTER DOMAIN promotion_frequency OWNER TO clyp;

------------------------------------------------------------------------------

DROP DOMAIN IF EXISTS public.booking_status;
CREATE DOMAIN booking_status AS TEXT
CHECK(   
   VALUE = 'WAITLIST'
OR VALUE = 'CANCELLED'
OR VALUE = 'BOOKED'
OR VALUE = 'COMPLETED' 
);
ALTER DOMAIN booking_status OWNER TO clyp;

------------------------------------------------------------------------------

DROP DOMAIN IF EXISTS public.sharing_type;
CREATE DOMAIN sharing_type AS TEXT
CHECK(   
   VALUE = 'NONE'
OR VALUE = 'GROUP'
OR VALUE = 'WORLD' 
);
ALTER DOMAIN sharing_type OWNER TO clyp;

------------------------------------------------------------------------------

DROP DOMAIN IF EXISTS public.customer_fun_foodie_type;
CREATE DOMAIN customer_fun_foodie_type AS TEXT
CHECK(   
   VALUE = 'Continental Craver'
OR VALUE = 'Die for Dosa'
OR VALUE = 'Chaat Chaat ke Chaat' 
);
ALTER DOMAIN customer_fun_foodie_type OWNER TO clyp;

------------------------------------------------------------------------------

DROP DOMAIN IF EXISTS public.discount_type;
CREATE DOMAIN discount_type AS TEXT
CHECK(   
   VALUE = 'PERCENT'
OR VALUE = 'ABSOLUTE'
OR VALUE = 'RULE' -- Need to create a table called discount_rule to implement this.
);
ALTER DOMAIN discount_type OWNER TO clyp;

------------------------------------------------------------------------------

DROP DOMAIN IF EXISTS public.tax_component_type;
CREATE DOMAIN tax_component_type AS TEXT
CHECK(   
   VALUE = 'PERCENT'
OR VALUE = 'ABSOLUTE'
OR VALUE = 'RULE' -- Need to create a table called tax_rule to implement this.
);
ALTER DOMAIN tax_component_type OWNER TO clyp;

------------------------------------------------------------------------------

DROP DOMAIN IF EXISTS public.kitchen_menu_type;
CREATE DOMAIN kitchen_menu_type AS TEXT
CHECK(   
   VALUE = 'Food'
OR VALUE = 'Beverages'
OR VALUE = 'Vegetarian'
OR VALUE = 'Non-Vegetarian'
);
ALTER DOMAIN kitchen_menu_type OWNER TO clyp;

------------------------------------------------------------------------------

DROP DOMAIN IF EXISTS public.kitchen_menu_item_type;
CREATE DOMAIN kitchen_menu_item_type AS TEXT
CHECK(   
   VALUE = 'Chinese'
OR VALUE = 'North Indian'
OR VALUE = 'South Indian'
OR VALUE = 'Chettinad'
OR VALUE = 'Chaat'
OR VALUE = 'Dessert'
OR VALUE = 'Beverages'
OR VALUE = 'Mughlai'
);

ALTER DOMAIN kitchen_menu_item_type OWNER TO clyp;

------------------------------------------------------------------------------
DROP DOMAIN IF EXISTS public.kitchen_menu_item_subtype;
CREATE DOMAIN kitchen_menu_item_subtype AS TEXT
CHECK(   
   VALUE = 'Dairy Foods'
OR VALUE = 'Protien Foods'
OR VALUE = 'Fruits'
OR VALUE = 'Vegetables'
OR VALUE = 'Fruits/Vegetables'
);

ALTER DOMAIN kitchen_menu_item_subtype OWNER TO clyp;

------------------------------------------------------------------------------

DROP DOMAIN IF EXISTS public.bar_menu_type;
CREATE DOMAIN bar_menu_type AS TEXT
CHECK(   
   VALUE = 'Wines'
OR VALUE = 'Whiskies'
OR VALUE = 'Champagne'
OR VALUE = 'Beers'
OR VALUE = 'Cocktails'
);
ALTER DOMAIN bar_menu_type OWNER TO clyp;

------------------------------------------------------------------------------

DROP DOMAIN IF EXISTS public.bar_menu_item_type;
CREATE DOMAIN bar_menu_item_type AS TEXT
CHECK(   
   VALUE = 'Wines'
OR VALUE = 'Whiskies'
OR VALUE = 'Champagne'
OR VALUE = 'Snacks'
OR VALUE = 'Beers'
OR VALUE = 'Starters'
OR VALUE = 'Specials'
OR VALUE = 'Entrees'
);

ALTER DOMAIN bar_menu_item_type OWNER TO clyp;

------------------------------------------------------------------------------
DROP DOMAIN IF EXISTS public.bar_menu_item_subtype;
CREATE DOMAIN bar_menu_item_subtype AS TEXT
CHECK(   
   VALUE = 'Imported'
OR VALUE = 'Domestic'
);

ALTER DOMAIN bar_menu_item_subtype OWNER TO clyp;

------------------------------------------------------------------------------

DROP DOMAIN IF EXISTS public.est_type;
CREATE DOMAIN est_type AS TEXT
CHECK(   
   VALUE = 'Restaurant'
OR VALUE = 'Bar'
OR VALUE = 'Bar-and-Grill'
OR VALUE = 'Pub'
OR VALUE = 'Resto pub'
);
ALTER DOMAIN est_type OWNER TO clyp;

------------------------------------------------------------------------------

DROP DOMAIN IF EXISTS public.attraction;
CREATE DOMAIN attraction AS TEXT
CHECK(   
   VALUE = 'Rooftop'
OR VALUE = 'Poolside'
OR VALUE = 'Live Music'
OR VALUE = 'Dance'
OR VALUE = 'Smoking Zone'
);
ALTER DOMAIN attraction OWNER TO clyp;

------------------------------------------------------------------------------

DROP DOMAIN IF EXISTS public.cuisine;
CREATE DOMAIN cuisine AS TEXT
CHECK(   
   VALUE = 'Andhra'
OR VALUE = 'Assamese'
OR VALUE = 'Awadhi'
OR VALUE = 'Bengali'
OR VALUE = 'Bihari'
OR VALUE = 'Chinese'
OR VALUE = 'Continental'
OR VALUE = 'Gharwali'
OR VALUE = 'Goan'
OR VALUE = 'Gujarati'
OR VALUE = 'Himachali'
OR VALUE = 'Italian'
OR VALUE = 'Karnataka'
OR VALUE = 'Kashmiri'
OR VALUE = 'Kerala'
OR VALUE = 'Lebanese'
OR VALUE = 'Maharashtrian'
OR VALUE = 'Marwari'
OR VALUE = 'Mexican'
OR VALUE = 'Naga'
OR VALUE = 'Nepali'
OR VALUE = 'Punjabi'
OR VALUE = 'Rajasthani'
OR VALUE = 'South indian'
OR VALUE = 'Tamil'
OR VALUE = 'Thai'
);
ALTER DOMAIN cuisine OWNER TO clyp;

------------------------------------------------------------------------------

DROP DOMAIN IF EXISTS public.session_status;
CREATE DOMAIN session_status AS TEXT
CHECK(
   VALUE = 'STARTED'
OR VALUE = 'ENDED'
);
ALTER DOMAIN session_status OWNER TO clyp;

------------------------------------------------------------------------------

CREATE TABLE currency (
  name   character varying NOT NULL,
  code   character(3) NOT NULL,
  symbol character varying NOT NULL,
  CONSTRAINT currency_pk PRIMARY KEY (code)
);

------------------------------------------------------------------------------

CREATE TABLE public.country (
	iso bpchar(2) NOT NULL,
	name varchar NOT NULL,
	iso3 bpchar(3) NULL DEFAULT NULL::bpchar,
	phone_code int4 NOT NULL,
  CONSTRAINT country_pk PRIMARY KEY (iso)
);

ALTER TABLE public.country OWNER TO clyp;

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.role_id_seq;
CREATE SEQUENCE public.role_id_seq INCREMENT 1;
ALTER TABLE public.role_id_seq OWNER TO clyp;

CREATE TABLE public.role
(
	id bigint NOT NULL DEFAULT nextval('role_id_seq'::regclass),
	role_name character varying NOT NULL,
	permissions bigint,
	CONSTRAINT role_pk PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);
ALTER TABLE public.role
  OWNER TO clyp;

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.rating_scale_id_seq;
CREATE SEQUENCE public.rating_scale_id_seq INCREMENT 1;
ALTER TABLE public.rating_scale_id_seq OWNER TO clyp;

CREATE TABLE public.rating_scale
(
	id int NOT NULL DEFAULT nextval('rating_scale_id_seq'::regClass),
	name character varying NOT NULL,
	value int4,
  description character varying,
	CONSTRAINT rating_scale_pk PRIMARY KEY (id)
) WITH (OIDS = FALSE);

ALTER TABLE public.rating_scale OWNER TO clyp;

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.sysconfig_id_seq;
CREATE SEQUENCE public.sysconfig_id_seq INCREMENT 1;
ALTER TABLE public.sysconfig_id_seq OWNER TO clyp;

CREATE TABLE public.sysconfig
(
	id int NOT NULL DEFAULT nextval('sysconfig_id_seq'::regClass),
	name character varying NOT NULL,
	bool_value boolean,
  int_value int,
  char_value character varying,
	real_value real,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_by bigint,
  CONSTRAINT sysconfig_pk PRIMARY KEY (id)
) WITH (OIDS = FALSE);

ALTER TABLE public.sysconfig OWNER TO clyp;

CREATE TABLE public.sysconfig_audit
(
  action char(1),	
  id bigint NOT NULL,
  name character varying NOT NULL,
  bool_value boolean,
	int_value int,
  char_value character varying,
	real_value real,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_by bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.sysconfig_audit OWNER TO clyp;
  
CREATE OR REPLACE FUNCTION process_sysconfig_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO sysconfig_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO sysconfig_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO sysconfig_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER sysconfig_audit AFTER INSERT OR UPDATE OR DELETE ON sysconfig FOR EACH ROW EXECUTE PROCEDURE process_sysconfig_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.sysconfig_arr_id_seq;
CREATE SEQUENCE public.sysconfig_arr_id_seq INCREMENT 1;
ALTER TABLE public.sysconfig_arr_id_seq OWNER TO clyp;

CREATE TABLE public.sysconfig_arr
(
	id int NOT NULL DEFAULT nextval('sysconfig_arr_id_seq'::regClass),
	name character varying NOT NULL,
  bool_value boolean[],
	int_value int[],
  char_value character varying[],
	real_value real[],
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_by bigint,
  CONSTRAINT sysconfig_arr_pk PRIMARY KEY (id)
) WITH (OIDS = FALSE);

ALTER TABLE public.sysconfig_arr OWNER TO clyp;

CREATE TABLE public.sysconfig_arr_audit
(
  action char(1),	
  id bigint NOT NULL,
  name character varying NOT NULL,
  bool_value boolean[],
	int_value int[],
  char_value character varying[],
	real_value real[],
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_by bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.sysconfig_arr_audit OWNER TO clyp;
  
CREATE OR REPLACE FUNCTION process_sysconfig_arr_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO sysconfig_arr_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO sysconfig_arr_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO sysconfig_arr_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER sysconfig_arr_audit AFTER INSERT OR UPDATE OR DELETE ON sysconfig_arr FOR EACH ROW EXECUTE PROCEDURE process_sysconfig_arr_audit();

------------------------------------------------------------------------------


DROP SEQUENCE IF EXISTS public.sysuser_id_seq;

CREATE SEQUENCE public.sysuser_id_seq INCREMENT 1;
ALTER TABLE public.sysuser_id_seq OWNER TO clyp;

CREATE TABLE public.sysuser
(
  id bigint NOT NULL DEFAULT nextval('sysuser_id_seq'::regclass),
  username character varying,
  passhash character varying,
  first_name character varying,
  last_name character varying,
  surname character varying,
  address character varying,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_by bigint,
  CONSTRAINT sysuser_pk PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.sysuser
  OWNER TO clyp;

CREATE TABLE public.sysuser_audit
(
  action char(1),	
  id bigint NOT NULL,
  username character varying,
  passhash character varying,
  first_name character varying,
  last_name character varying,
  surname character varying,
  address character varying,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_by bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.sysuser_audit
  OWNER TO clyp;
  
CREATE OR REPLACE FUNCTION process_sysuser_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO sysuser_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO sysuser_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO sysuser_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER sysuser_audit AFTER INSERT OR UPDATE OR DELETE ON sysuser FOR EACH ROW EXECUTE PROCEDURE process_sysuser_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.business_owner_id_seq;

CREATE SEQUENCE public.business_owner_id_seq INCREMENT 1;
ALTER TABLE public.business_owner_id_seq OWNER TO clyp;

CREATE TABLE public.business_owner
(
  id bigint NOT NULL DEFAULT nextval('business_owner_id_seq'::regclass),
  username character varying,
  passhash character varying,
  first_name character varying,
  last_name character varying,
  address character varying,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT business_owner_pk PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.business_owner
  OWNER TO clyp;


CREATE TABLE public.business_owner_audit
(
  id bigint NOT NULL,
  username character varying,
  passhash character varying,
  first_name character varying,
  last_name character varying,
  address character varying,
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.business_owner_audit
  OWNER TO clyp;
  
CREATE OR REPLACE FUNCTION process_business_owner_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO business_owner_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO business_owner_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO business_owner_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER business_owner_audit AFTER INSERT OR UPDATE OR DELETE ON business_owner FOR EACH ROW EXECUTE PROCEDURE process_business_owner_audit();
  
------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.entity_id_seq;

CREATE SEQUENCE public.entity_id_seq INCREMENT 1;
ALTER TABLE public.entity_id_seq OWNER TO clyp;

  
CREATE TABLE public.entity
(
  id bigint NOT NULL DEFAULT nextval('entity_id_seq'::regclass),
  name character varying,
  reg_no character varying,
  rating_scale_id bigint,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT entity_pk PRIMARY KEY (id),
  CONSTRAINT entity_rating_scale_fk FOREIGN KEY (rating_scale_id)
  REFERENCES public.rating_scale (id) MATCH SIMPLE ON UPDATE NO ACTION 
  ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.entity
  OWNER TO clyp;

  
CREATE TABLE public.entity_audit
(
  action char(1),
  id bigint NOT NULL,
  name character varying,
  reg_no character varying,
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.entity_audit
  OWNER TO clyp;
  
CREATE OR REPLACE FUNCTION process_entity_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO entity_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO entity_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO entity_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER entity_audit AFTER INSERT OR UPDATE OR DELETE ON entity FOR EACH ROW EXECUTE PROCEDURE process_entity_audit();

------------------------------------------------------------------------------
 
CREATE TABLE public.business_owner_entity
(
  entity_id bigint NOT NULL,
  owner_id bigint NOT NULL,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT owner_fk FOREIGN KEY (owner_id)
      REFERENCES public.business_owner (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT entity_fk FOREIGN KEY (entity_id)
      REFERENCES public.entity (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION  
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.business_owner_entity
  OWNER TO clyp;
  
CREATE TABLE public.business_owner_entity_audit
(
  action char(1),
  entity_id bigint NOT NULL,
  owner_id bigint NOT NULL,
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.business_owner_entity_audit OWNER TO clyp; 

CREATE OR REPLACE FUNCTION process_business_owner_entity_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO business_owner_entity_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO business_owner_entity_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO business_owner_entity_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER business_owner_entity_audit AFTER INSERT OR UPDATE OR DELETE ON business_owner_entity 
FOR EACH ROW EXECUTE PROCEDURE process_business_owner_entity_audit();

DROP SEQUENCE IF EXISTS public.sysconfig_custom_id_seq;
CREATE SEQUENCE public.sysconfig_custom_id_seq INCREMENT 1;
ALTER TABLE public.sysconfig_custom_id_seq OWNER TO clyp;

CREATE TABLE public.sysconfig_custom
(
	id int NOT NULL DEFAULT nextval('sysconfig_custom_id_seq'::regClass),
  entity_id bigint,
  sysconfig_id bigint,
	name character varying NOT NULL,
	bool_value boolean,
  int_value int,
  char_value character varying,
	real_value real,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_by bigint,
  CONSTRAINT sysconfig_custom_pk PRIMARY KEY (id),
  CONSTRAINT sysconfig_custom_entity_fk FOREIGN KEY (entity_id)
  REFERENCES entity (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT sysconfig_custom_sysconfig_fk FOREIGN KEY (sysconfig_id)
  REFERENCES sysconfig (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
) WITH (OIDS = FALSE);

ALTER TABLE public.sysconfig_custom OWNER TO clyp;

CREATE TABLE public.sysconfig_custom_audit
(
  action char(1),	
  id bigint NOT NULL,
  entity_id bigint,
  sysconfig_id bigint,
  name character varying NOT NULL,
  bool_value boolean,
	int_value int,
  char_value character varying,
	real_value real,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_by bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.sysconfig_custom_audit OWNER TO clyp;
  
CREATE OR REPLACE FUNCTION process_sysconfig_custom_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO sysconfig_custom_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO sysconfig_custom_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO sysconfig_custom_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER sysconfig_custom_audit AFTER INSERT OR UPDATE OR DELETE ON sysconfig_custom FOR EACH ROW EXECUTE PROCEDURE process_sysconfig_custom_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.sysconfig_arr_custom_id_seq;
CREATE SEQUENCE public.sysconfig_arr_custom_id_seq INCREMENT 1;
ALTER TABLE public.sysconfig_arr_custom_id_seq OWNER TO clyp;

CREATE TABLE public.sysconfig_arr_custom
(
	id int NOT NULL DEFAULT nextval('sysconfig_arr_custom_id_seq'::regClass),
	name character varying NOT NULL,
  entity_id bigint,
  sysconfig_arr_id bigint,
  bool_value boolean[],
	int_value int[],
  char_value character varying[],
	real_value real[],
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_by bigint,
  CONSTRAINT sysconfig_arr_custom_pk PRIMARY KEY (id),
  CONSTRAINT sysconfig_arr_custom_entity_fk FOREIGN KEY (entity_id)
  REFERENCES entity (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT sysconfig_arr_custom_sysconfig_arr_fk FOREIGN KEY (sysconfig_arr_id)
  REFERENCES sysconfig_arr (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
) WITH (OIDS = FALSE);

ALTER TABLE public.sysconfig_arr_custom OWNER TO clyp;

CREATE TABLE public.sysconfig_arr_custom_audit
(
  action char(1),	
  id bigint NOT NULL,
  name character varying NOT NULL,
  bool_value boolean[],
	int_value int[],
  char_value character varying[],
	real_value real[],
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_by bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.sysconfig_arr_custom_audit OWNER TO clyp;
  
CREATE OR REPLACE FUNCTION process_sysconfig_arr_custom_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO sysconfig_arr_custom_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO sysconfig_arr_custom_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO sysconfig_arr_custom_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER sysconfig_arr_custom_audit AFTER INSERT OR UPDATE OR DELETE ON sysconfig_arr_custom FOR EACH ROW EXECUTE PROCEDURE process_sysconfig_arr_custom_audit();

------------------------------------------------------------------------------

------------------------------------------------------------------------------
DROP SEQUENCE IF EXISTS public.layout_id_seq;

CREATE SEQUENCE public.layout_id_seq INCREMENT 1;
ALTER TABLE public.layout_id_seq OWNER TO clyp;

CREATE TABLE public.layout
(
  id bigint NOT NULL DEFAULT nextval('layout_id_seq'::regclass),
  name character varying,
  image bytea,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT layout_pk PRIMARY KEY (id)  
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.layout
  OWNER TO clyp;

CREATE TABLE public.layout_audit
(
  action char(1),
  id bigint NOT NULL,
  name character varying,
  image bytea,
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.layout_audit
  OWNER TO clyp;
  
CREATE OR REPLACE FUNCTION process_layout_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO layout_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO layout_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO layout_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER layout_audit AFTER INSERT OR UPDATE OR DELETE ON layout FOR EACH ROW EXECUTE PROCEDURE process_layout_audit();

------------------------------------------------------------------------------
DROP SEQUENCE IF EXISTS public.establishment_id_seq;

CREATE SEQUENCE public.establishment_id_seq INCREMENT 1;
ALTER TABLE public.establishment_id_seq OWNER TO clyp;

CREATE TABLE public.establishment
(
  id bigint NOT NULL DEFAULT nextval('establishment_id_seq'::regclass),
  entity_id bigint,
  establishment_no int,
  address character varying,
  location geography,
  cuisine_types cuisine[],
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT establishment_pk PRIMARY KEY (id),
  CONSTRAINT establishment_entity_fk FOREIGN KEY (entity_id)
      REFERENCES public.entity (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.establishment
  OWNER TO clyp;
  
CREATE TABLE public.establishment_audit
(
  action char(1),
  id bigint NOT NULL,
  entity_id bigint,
  establishment_no int,
  address character varying,
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.establishment_audit
  OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_establishment_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO establishment_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO establishment_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO establishment_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER establishment_audit AFTER INSERT OR UPDATE OR DELETE ON establishment 
FOR EACH ROW EXECUTE PROCEDURE process_establishment_audit();

------------------------------------------------------------------------------

CREATE TABLE public.establishment_layout
(
  layout_id bigint,
  establishment_id bigint,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT establishment_layout_establishment_fk FOREIGN KEY (establishment_id)
      REFERENCES public.establishment (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT establishment_layout_layout_fk FOREIGN KEY (layout_id)
      REFERENCES public.layout(id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.establishment_layout
  OWNER TO clyp;
  
CREATE TABLE public.establishment_layout_audit
(
  action char(1),
  layout_id bigint,
  establishment_id bigint,
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH (
  OIDS=FALSE
);

ALTER TABLE public.establishment_layout_audit
  OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_establishment_layout_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO establishment_layout_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO establishment_layout_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO establishment_layout_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER establishment_layout_audit AFTER INSERT OR UPDATE OR DELETE ON establishment_layout 
FOR EACH ROW EXECUTE PROCEDURE process_establishment_layout_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.staff_id_seq;
CREATE SEQUENCE public.staff_id_seq INCREMENT 1;
ALTER TABLE public.staff_id_seq OWNER TO clyp;

CREATE TABLE public.staff
(
  id bigint NOT NULL DEFAULT nextval('staff_id_seq'::regclass),
  username character varying,
  passhash character varying,
  first_name character varying,
  last_name character varying,
  address character varying,
  establishment_id bigint NOT NULL,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT staff_pk PRIMARY KEY (id),
  CONSTRAINT establishment_fk FOREIGN KEY (establishment_id)
      REFERENCES public.establishment (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.staff OWNER TO clyp;

CREATE TABLE public.staff_audit
(
  action char(1),
  id bigint NOT NULL,
  username character varying,
  passhash character varying,
  first_name character varying,
  last_name character varying,
  address character varying,
  establishment_id bigint NOT NULL,
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.staff_audit OWNER TO clyp;
  
CREATE OR REPLACE FUNCTION process_staff_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO staff_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO staff_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO staff_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER staff_audit AFTER INSERT OR UPDATE OR DELETE ON staff FOR EACH ROW EXECUTE PROCEDURE process_staff_audit();
  
------------------------------------------------------------------------------
DROP SEQUENCE IF EXISTS public.dining_table_id_seq;

CREATE SEQUENCE public.dining_table_id_seq INCREMENT 1;
ALTER TABLE public.dining_table_id_seq OWNER TO clyp;

CREATE TABLE public.dining_table
(
  id bigint NOT NULL DEFAULT nextval('dining_table_id_seq'::regclass),
  type character varying,
  x int,
  y int,
  width int,
  height int,
  radius int,
  s_angle real,
  e_angle real,
  layout_id int,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT dining_table_pk PRIMARY KEY (id),
  CONSTRAINT dining_table_layout_fk FOREIGN KEY (layout_id)
      REFERENCES public.layout (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.dining_table
  OWNER TO clyp;


CREATE TABLE public.dining_table_audit
(
  action char(1),
  id bigint NOT NULL,
  type character varying,
  x int,
  y int,
  width int,
  height int,
  radius int,
  s_angle real,
  e_angle real,
  layout_id int,
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.dining_table_audit
  OWNER TO clyp;
  
CREATE OR REPLACE FUNCTION process_dining_table_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO dining_table_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO dining_table_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO dining_table_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER dining_table_audit AFTER INSERT OR UPDATE OR DELETE ON dining_table FOR EACH ROW EXECUTE PROCEDURE process_dining_table_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.customer_id_seq;
CREATE SEQUENCE public.customer_id_seq INCREMENT 1;
ALTER TABLE public.customer_id_seq OWNER TO clyp;

CREATE TABLE public.customer
(
  id bigint NOT NULL DEFAULT nextval('customer_id_seq'::regclass),
  username character varying,
  mobile_no int,
  email character varying,
  passhash character varying,
  first_name character varying,
  last_name character varying,
  address character varying,
  foodie_type customer_fun_foodie_type[],
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT customer_pk PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.customer
  OWNER TO clyp;


CREATE TABLE public.customer_audit
(
  action char(1),
  id bigint,
  username character varying,
  mobile_no int,
  email character varying,
  passhash character varying,
  first_name character varying,
  last_name character varying,
  address character varying,
  tags character varying[],
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.customer_audit
  OWNER TO clyp;
  
CREATE OR REPLACE FUNCTION process_customer_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO customer_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO customer_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO customer_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER customer_audit AFTER INSERT OR UPDATE OR DELETE ON customer FOR EACH ROW EXECUTE PROCEDURE process_customer_audit();  

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.booking_id_seq;
CREATE SEQUENCE public.booking_id_seq INCREMENT 1;
ALTER TABLE public.booking_id_seq OWNER TO clyp;

CREATE TABLE public.booking
(
  id bigint NOT NULL DEFAULT nextval('booking_id_seq'::regClass),
  customer_id bigint,
  dining_table_id bigint,
  actual_dining_table_id bigint,
  booking_date date,
  booking_time time,
  booking_duration smallint,
  spend_limit real,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT booking_pk PRIMARY KEY (id),
  CONSTRAINT booking_customer_fk FOREIGN KEY (customer_id)
      REFERENCES public.customer (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION    
)
WITH ( OIDS=FALSE );

ALTER TABLE public.booking OWNER TO clyp;
 
CREATE TABLE public.booking_audit
(
  action char(1),
  id bigint,
  customer_id bigint,
  dining_table_id bigint,
  actual_dining_table_id bigint,
  booking_date date,
  booking_time time,
  booking_duration smallint,
  spend_limit real,
  updated_at TIMESTAMPTZ,
  updated_by bigint    
)
WITH ( OIDS=FALSE );

ALTER TABLE public.booking_audit OWNER TO clyp;


CREATE OR REPLACE FUNCTION process_booking_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO booking_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO booking_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO booking_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER booking_audit AFTER INSERT OR UPDATE OR DELETE ON booking FOR EACH ROW EXECUTE PROCEDURE process_booking_audit();

CREATE TABLE public.booking_history -- Change this to view.
(
  id bigint,
  customer_id bigint,
  dining_table_id bigint,
  actual_dining_table_id bigint,
  booking_date date,
  booking_time time,
  booking_duration smallint,
  spend_limit real,
  updated_at TIMESTAMPTZ,
  updated_by bigint    
)
WITH ( OIDS=FALSE );

ALTER TABLE public.booking_history OWNER TO postgres;

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.session_id_seq;
CREATE SEQUENCE public.session_id_seq INCREMENT 1;
ALTER TABLE public.session_id_seq OWNER TO clyp;

CREATE TABLE public.session (
  id bigint NOT NULL DEFAULT nextval('session_id_seq'::regClass),
  booking_id bigint,
  start_time TIMESTAMPTZ,
  end_time TIMESTAMPTZ,
  dining_table_id bigint NOT NULL,
  spend_limit real,
  status session_status,
  staff_id bigint,
  tags character varying[],
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT session_pk PRIMARY KEY (id),
  CONSTRAINT session_dining_table_fk FOREIGN KEY (dining_table_id)
    REFERENCES dining_table (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT session_staff_fk FOREIGN KEY (staff_id)
    REFERENCES staff (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT session_booking_fk FOREIGN KEY (booking_id)
    REFERENCES booking (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION   
 ) WITH (OIDS=FALSE);

ALTER TABLE public.session OWNER TO clyp;

CREATE TABLE public.session_audit (
  action char(1),
  id bigint NOT NULL,
  booking_id bigint,
  start_time TIMESTAMPTZ,
  end_time TIMESTAMPTZ,
  dining_table_id bigint NOT NULL,
  spend_limit real,
  status session_status,
  tags character varying[],
  updated_at TIMESTAMPTZ,
  updated_by bigint
 ) WITH (OIDS=FALSE);

ALTER TABLE public.session_audit OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_session_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO session_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO session_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO session_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER session_audit AFTER INSERT OR UPDATE OR DELETE ON session FOR EACH ROW EXECUTE PROCEDURE process_session_audit();  

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.session_group_id_seq;
CREATE SEQUENCE public.session_group_id_seq INCREMENT 1;
ALTER TABLE public.session_group_id_seq OWNER TO clyp;

CREATE TABLE public.session_group (
  id bigint NOT NULL DEFAULT nextval('session_group_id_seq'::regClass),
  session_id bigint[],
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT session_group_pk PRIMARY KEY (id)
  ) WITH (OIDS=FALSE);

ALTER TABLE public.session_group OWNER TO clyp;

------------------------------------------------------------------------------

CREATE TABLE public.session_customer (
  session_id bigint NOT NULL,
  customer_id bigint NOT NULL,
  is_payer boolean,
  CONSTRAINT session_customer_customer_fk FOREIGN KEY (customer_id)
    REFERENCES customer (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT session_customer_session_fk FOREIGN KEY (session_id)
    REFERENCES session (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
 ) WITH (OIDS=FALSE);

ALTER TABLE public.session_customer OWNER TO clyp;

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.memories_id_seq;
CREATE SEQUENCE public.memories_id_seq INCREMENT 1;
ALTER TABLE public.memories_id_seq OWNER TO clyp;

CREATE TABLE public.memories (
  id bigint NOT NULL DEFAULT nextval('memories_id_seq'::regClass),
  time TIMESTAMPTZ,
  customer_id bigint NOT NULL,
  session_id bigint,
  session_group_id bigint,
  image bytea,
  url character varying,
  share_with_others sharing_type,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT memories_pk PRIMARY KEY (id),
  CONSTRAINT memories_customer_fk FOREIGN KEY (customer_id)
    REFERENCES public.customer (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
   CONSTRAINT memories_session_fk FOREIGN KEY (session_id)
    REFERENCES public.session (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
   CONSTRAINT memories_session_group_fk FOREIGN KEY (session_group_id)
    REFERENCES public.session_group (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION      
 ) WITH (OIDS=FALSE);

ALTER TABLE public.memories OWNER TO clyp;

CREATE TABLE public.memories_audit (
  action char(1),
  id bigint NOT NULL,
  time TIMESTAMPTZ,
  customer_id bigint NOT NULL,
  session_id bigint,
  session_group_id bigint,
  image bytea,
  url character varying,
  share_with_others sharing_type,
  updated_at TIMESTAMPTZ,
  updated_by bigint
 ) WITH (OIDS=FALSE);

ALTER TABLE public.memories_audit OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_memories_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO memories_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO memories_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO memories_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER memories_audit AFTER INSERT OR UPDATE OR DELETE ON memories FOR EACH ROW EXECUTE PROCEDURE process_memories_audit();  

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.kitchen_menu_id_seq;
CREATE SEQUENCE public.kitchen_menu_id_seq INCREMENT 1;
ALTER TABLE public.kitchen_menu_id_seq OWNER TO clyp;

CREATE TABLE public.kitchen_menu
(
  id bigint NOT NULL DEFAULT nextval('kitchen_menu_id_seq'::regClass),
  establishment_id bigint,
  name character varying,
  type kitchen_menu_type, 
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT kitchen_menu_pk PRIMARY KEY (id),
  CONSTRAINT kitchen_menu_establishment_fk FOREIGN KEY (establishment_id)
      REFERENCES public.establishment (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.kitchen_menu
  OWNER TO clyp;
  
CREATE TABLE public.kitchen_menu_audit
(
  action char(1),
  id bigint,
  establishment_id bigint,
  name character varying,
  type kitchen_menu_type, 
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH (
  OIDS=FALSE
);

ALTER TABLE public.kitchen_menu_audit
  OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_kitchen_menu_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO kitchen_menu_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO kitchen_menu_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO kitchen_menu_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER kitchen_menu_audit AFTER INSERT OR UPDATE OR DELETE ON kitchen_menu FOR EACH ROW EXECUTE PROCEDURE process_kitchen_menu_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.kitchen_menu_item_id_seq;
CREATE SEQUENCE public.kitchen_menu_item_id_seq INCREMENT 1;
ALTER TABLE public.kitchen_menu_item_id_seq OWNER TO clyp;

CREATE TABLE public.kitchen_menu_item
(
  id bigint NOT NULL DEFAULT nextval('kitchen_menu_item_id_seq'::regClass),
  menu_id bigint,
  name character varying,
  price float,
  currency character(3),
  calories int,
  serves int,
  spicy_rating int,
  description character varying,
  item_type kitchen_menu_item_type,
  item_subtype kitchen_menu_item_subtype,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT kitchen_menu_item_pk PRIMARY KEY (id),
  CONSTRAINT kitchen_menu_item_kitchen_menu_fk FOREIGN KEY (menu_id)
      REFERENCES public.kitchen_menu (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT kitchen_menu_item_currency_fk FOREIGN KEY (currency)
      REFERENCES public.currency (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH ( OIDS=FALSE );

ALTER TABLE public.kitchen_menu_item OWNER TO clyp;
  
CREATE TABLE public.kitchen_menu_item_audit
(
  action char(1),
  id bigint,
  menu_id bigint,
  name character varying,
  price float,
  currency character(3),
  calories int,
  serves int,
  spicy_rating int,
  description character varying,
  item_type kitchen_menu_item_type,
  item_subtype kitchen_menu_item_subtype,
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH ( OIDS=FALSE );

ALTER TABLE public.kitchen_menu_item_audit OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_kitchen_menu_item_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO kitchen_menu_item_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO kitchen_menu_item_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO kitchen_menu_item_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER kitchen_menu_item_audit AFTER INSERT OR UPDATE OR DELETE ON kitchen_menu_item FOR EACH ROW EXECUTE PROCEDURE process_kitchen_menu_item_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.bar_menu_id_seq;
CREATE SEQUENCE public.bar_menu_id_seq INCREMENT 1;
ALTER TABLE public.bar_menu_id_seq OWNER TO clyp;

CREATE TABLE public.bar_menu
(
  id bigint NOT NULL DEFAULT nextval('bar_menu_id_seq'::regClass),
  establishment_id bigint,
  name character varying,
  type bar_menu_type, 
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT bar_menu_pk PRIMARY KEY (id),
  CONSTRAINT bar_menu_establishment_fk FOREIGN KEY (establishment_id)
      REFERENCES public.establishment (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.bar_menu OWNER TO clyp;
  
CREATE TABLE public.bar_menu_audit
(
  action char(1),
  id bigint,
  establishment_id bigint,
  name character varying,
  type bar_menu_type, 
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH (
  OIDS=FALSE
);

ALTER TABLE public.bar_menu_audit OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_bar_menu_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO bar_menu_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO bar_menu_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO bar_menu_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER bar_menu_audit AFTER INSERT OR UPDATE OR DELETE ON bar_menu FOR EACH ROW EXECUTE PROCEDURE process_bar_menu_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.bar_menu_item_id_seq;
CREATE SEQUENCE public.bar_menu_item_id_seq INCREMENT 1;
ALTER TABLE public.bar_menu_item_id_seq OWNER TO clyp;

CREATE TABLE public.bar_menu_item
(
  id bigint NOT NULL DEFAULT nextval('bar_menu_item_id_seq'::regClass),
  menu_id bigint,
  name character varying,
  currency character(3),
  price character varying[], -- key(quantity):value(price) pair of strings.
  description character varying,
  item_type bar_menu_item_type,
  item_subtype bar_menu_item_subtype,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT bar_menu_item_pk PRIMARY KEY (id),
  CONSTRAINT bar_menu_item_bar_menu_fk FOREIGN KEY (menu_id)
      REFERENCES public.bar_menu (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT bar_menu_item_currency_fk FOREIGN KEY (currency)
      REFERENCES public.currency (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH ( OIDS=FALSE );

ALTER TABLE public.bar_menu_item OWNER TO clyp;
  
CREATE TABLE public.bar_menu_item_audit
(
  action char(1),
  id bigint,
  menu_id bigint,
  name character varying,
  currency character(3),
  price character varying[], -- key(quantity):value(price) pair of strings. 
  description character varying,
  item_type bar_menu_item_type,
  item_subtype bar_menu_item_subtype,
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH ( OIDS=FALSE );

ALTER TABLE public.bar_menu_item_audit OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_bar_menu_item_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO bar_menu_item_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO bar_menu_item_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO bar_menu_item_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER bar_menu_item_audit AFTER INSERT OR UPDATE OR DELETE ON bar_menu_item FOR EACH ROW EXECUTE PROCEDURE process_bar_menu_item_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.kot_id_seq;
CREATE SEQUENCE public.kot_id_seq INCREMENT 1;
ALTER TABLE public.kot_id_seq OWNER TO clyp;

CREATE TABLE public.kot
(
  id bigint NOT NULL DEFAULT nextval('kot_id_seq'::regClass),
  session_id bigint,
  menu_item_id bigint,
  qty int,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT kot_pk PRIMARY KEY (id),
  CONSTRAINT kot_kitchen_menu_item_fk FOREIGN KEY (menu_item_id)
      REFERENCES public.kot (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT kot_session_fk FOREIGN KEY (session_id)
      REFERENCES public.session (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH ( OIDS=FALSE );

ALTER TABLE public.kot OWNER TO clyp;
  
CREATE TABLE public.kot_audit
(
  action char(1),
  id bigint,
  session_id bigint,
  menu_item_id bigint,
  qty int,
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH ( OIDS=FALSE );

ALTER TABLE public.kot_audit OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_kot_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO kot_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO kot_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO kot_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER kot_audit AFTER INSERT OR UPDATE OR DELETE ON kot FOR EACH ROW EXECUTE PROCEDURE process_kot_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.bot_id_seq;
CREATE SEQUENCE public.bot_id_seq INCREMENT 1;
ALTER TABLE public.bot_id_seq OWNER TO clyp;

CREATE TABLE public.bot
(
  id bigint NOT NULL DEFAULT nextval('bot_id_seq'::regClass),
  session_id bigint,
  menu_item_id bigint,
  qty character varying,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT bot_pk PRIMARY KEY (id),
  CONSTRAINT bot_bar_menu_item_fk FOREIGN KEY (menu_item_id)
      REFERENCES public.bar_menu_item (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT bot_session_fk FOREIGN KEY (session_id)
      REFERENCES public.session (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH ( OIDS=FALSE );

ALTER TABLE public.bot OWNER TO clyp;
  
CREATE TABLE public.bot_audit
(
  action char(1),
  id bigint,
  session_id bigint,
  menu_item_id bigint,
  qty character varying,
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH ( OIDS=FALSE );

ALTER TABLE public.bot_audit OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_bot_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO bot_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO bot_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO bot_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER bot_audit AFTER INSERT OR UPDATE OR DELETE ON bot FOR EACH ROW EXECUTE PROCEDURE process_bot_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.invoice_id_seq;
CREATE SEQUENCE public.invoice_id_seq INCREMENT 1;
ALTER TABLE public.invoice_id_seq OWNER TO clyp;

CREATE TABLE public.invoice
(
  id bigint NOT NULL DEFAULT nextval('invoice_id_seq'::regClass),
  session_id bigint,
  subtotal real,
  taxes real,
  discounts real,
  total real,
  paid real,
  due real,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT invoice_pk PRIMARY KEY (id),
  CONSTRAINT invoice_session_fk FOREIGN KEY (session_id)
      REFERENCES public.session (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH ( OIDS=FALSE );

ALTER TABLE public.invoice OWNER TO clyp;
 
CREATE TABLE public.invoice_audit
(
  action char(1),
  id bigint,
  session_id bigint,
  subtotal real,
  taxes real,
  discounts real,
  total real,
  paid real,
  due real,
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH ( OIDS=FALSE );

ALTER TABLE public.invoice_audit OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_invoice_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO invoice_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO invoice_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO invoice_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER invoice_audit AFTER INSERT OR UPDATE OR DELETE ON invoice FOR EACH ROW EXECUTE PROCEDURE process_invoice_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.invoice_line_item_id_seq;
CREATE SEQUENCE public.invoice_line_item_id_seq INCREMENT 1;
ALTER TABLE public.invoice_line_item_id_seq OWNER TO clyp;

CREATE TABLE public.invoice_line_item
(
  id bigint NOT NULL DEFAULT nextval('invoice_line_item_id_seq'::regClass),
  invoice_id bigint,
  kot_id bigint,
  bot_id bigint,
  price float,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT invoice_line_item_pk PRIMARY KEY (id),
  CONSTRAINT invoice_line_item_invoice_fk FOREIGN KEY (invoice_id)
      REFERENCES public.invoice (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT invoice_line_item_kot_fk FOREIGN KEY (kot_id)
      REFERENCES public.kot (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT invoice_line_item_bot_fk FOREIGN KEY (bot_id)
      REFERENCES public.bot (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION    
)
WITH ( OIDS=FALSE );

ALTER TABLE public.invoice_line_item OWNER TO clyp;
 
CREATE TABLE public.invoice_line_item_audit
(
  action char(1),
  id bigint,
  invoice_id bigint,
  kot_id bigint,
  bot_id bigint,
  price float,
  updated_at TIMESTAMPTZ,
  updated_by bigint    
)
WITH ( OIDS=FALSE );

ALTER TABLE public.invoice_line_item_audit OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_invoice_line_item_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO invoice_line_item_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO invoice_line_item_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO invoice_line_item_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER invoice_line_item_audit AFTER INSERT OR UPDATE OR DELETE ON invoice_line_item FOR EACH ROW EXECUTE PROCEDURE process_invoice_line_item_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.tax_id_seq;
CREATE SEQUENCE public.tax_id_seq INCREMENT 1;
ALTER TABLE public.tax_id_seq OWNER TO clyp;

CREATE TABLE public.tax
(
  id bigint NOT NULL DEFAULT nextval('tax_id_seq'::regClass),
  country_id char(2),
  state_id character varying DEFAULT NULL,
  name character varying,
  start_date date,
  end_date date,
  is_active boolean,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT tax_pk PRIMARY KEY (id),
  CONSTRAINT tax_country_fk FOREIGN KEY (country_id)
      REFERENCES public.country (iso) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION    
)
WITH ( OIDS=FALSE );

ALTER TABLE public.tax OWNER TO clyp;
 
CREATE TABLE public.tax_audit
(
  action char(1),
  id bigint,
  country_id char(2),
  state_id character varying DEFAULT NULL,
  name character varying,
  start_date date,
  end_date date,
  is_active boolean DEFAULT TRUE,
  updated_at TIMESTAMPTZ,
  updated_by bigint    
)
WITH ( OIDS=FALSE );

ALTER TABLE public.tax_audit OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_tax_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO tax_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO tax_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO tax_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER tax_audit AFTER INSERT OR UPDATE OR DELETE ON tax FOR EACH ROW EXECUTE PROCEDURE process_tax_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.tax_component_id_seq;
CREATE SEQUENCE public.tax_component_id_seq INCREMENT 1;
ALTER TABLE public.tax_component_id_seq OWNER TO clyp;

CREATE TABLE public.tax_component
(
  id bigint NOT NULL DEFAULT nextval('tax_component_id_seq'::regClass),
  tax_id bigint,
  name character varying,
  type tax_component_type,
  value real,
  start_date date,
  end_date date,
  is_active boolean DEFAULT TRUE,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT tax_component_pk PRIMARY KEY (id),
  CONSTRAINT tax_component_tax_fk FOREIGN KEY (tax_id)
      REFERENCES public.tax (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION    
)
WITH ( OIDS=FALSE );

ALTER TABLE public.tax_component OWNER TO clyp;
 
CREATE TABLE public.tax_component_audit
(
  action char(1),
  id bigint,
  tax_id bigint,
  name character varying,
  type tax_component_type,
  value real,
  start_date date,
  end_date date,
  is_active boolean DEFAULT TRUE,
  updated_at TIMESTAMPTZ,
  updated_by bigint    
)
WITH ( OIDS=FALSE );

ALTER TABLE public.tax_component_audit OWNER TO clyp;


CREATE OR REPLACE FUNCTION process_tax_component_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO tax_component_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO tax_component_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO tax_component_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER tax_component_audit AFTER INSERT OR UPDATE OR DELETE ON tax_component FOR EACH ROW EXECUTE PROCEDURE process_tax_component_audit();

------------------------------------------------------------------------------

CREATE TABLE public.tax_entity
(
  tax_id bigint,
  entity_id bigint,
  start_date date,
  end_date date,
  is_active boolean DEFAULT TRUE,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT tax_entity_tax_fk FOREIGN KEY (tax_id)
      REFERENCES public.tax (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT tax_entity_entity_fk FOREIGN KEY (entity_id)
      REFERENCES public.entity (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION        
)
WITH ( OIDS=FALSE );

ALTER TABLE public.tax_entity OWNER TO clyp;
 
CREATE TABLE public.tax_entity_audit
(
  action char(1),
  tax_id bigint,
  entity_id bigint,
  start_date date,
  end_date date,
  is_active boolean DEFAULT TRUE,
  updated_at TIMESTAMPTZ,
  updated_by bigint    
)
WITH ( OIDS=FALSE );

ALTER TABLE public.tax_entity_audit OWNER TO clyp;


CREATE OR REPLACE FUNCTION process_tax_entity_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO tax_entity_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO tax_entity_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO tax_entity_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER tax_entity_audit AFTER INSERT OR UPDATE OR DELETE ON tax_entity FOR EACH ROW EXECUTE PROCEDURE process_tax_entity_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.discount_id_seq;
CREATE SEQUENCE public.discount_id_seq INCREMENT 1;
ALTER TABLE public.discount_id_seq OWNER TO clyp;

CREATE TABLE public.discount
(
  id bigint NOT NULL DEFAULT nextval('discount_id_seq'::regClass),
  entity_id bigint,
  name character varying,
  start_date date,
  end_date date,
  type discount_type,
  value real, 
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT discount_pk PRIMARY KEY (id),
  CONSTRAINT discount_entity_fk FOREIGN KEY (entity_id)
      REFERENCES public.entity (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION    
)
WITH ( OIDS=FALSE );

ALTER TABLE public.discount OWNER TO clyp;
 
CREATE TABLE public.discount_audit
(
  action char(1),
  id bigint,
  entity_id bigint,
  name character varying,
  start_date date,
  end_date date,
  type discount_type,
  value real, 
  updated_at TIMESTAMPTZ,
  updated_by bigint    
)
WITH ( OIDS=FALSE );

ALTER TABLE public.discount_audit OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_discount_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO discount_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO discount_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO discount_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER discount_audit AFTER INSERT OR UPDATE OR DELETE ON discount FOR EACH ROW EXECUTE PROCEDURE process_discount_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.review_id_seq;
CREATE SEQUENCE public.review_id_seq INCREMENT 1;
ALTER TABLE public.review_id_seq OWNER TO clyp;

CREATE TABLE public.review
(
  id bigint NOT NULL DEFAULT nextval('review_id_seq'::regClass),
  establishment_id bigint NOT NULL,
  kitchen_menu_item_id bigint,
  bar_menu_item_id bigint,
  customer_id bigint NOT NULL,
  comments character varying,
  rating int, 
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT review_pk PRIMARY KEY (id),
  CONSTRAINT review_establishment_fk FOREIGN KEY (establishment_id)
      REFERENCES public.establishment (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT review_kitchen_menu_item_fk FOREIGN KEY (kitchen_menu_item_id)
      REFERENCES public.kitchen_menu_item (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT review_bar_menu_item_fk FOREIGN KEY (bar_menu_item_id)
      REFERENCES public.bar_menu_item (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,    
  CONSTRAINT review_customer_fk FOREIGN KEY (customer_id)
      REFERENCES public.customer (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION            
)
WITH ( OIDS=FALSE );

ALTER TABLE public.review OWNER TO clyp;
 
CREATE TABLE public.review_audit
(
  action char(1),
  id bigint,
  establishment_id bigint,
  menu_item_id bigint,
  customer_id bigint,
  comments character varying,
  rating int, 
  updated_at TIMESTAMPTZ,
  updated_by bigint    
)
WITH ( OIDS=FALSE );

ALTER TABLE public.review_audit OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_review_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO review_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO review_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO review_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER review_audit AFTER INSERT OR UPDATE OR DELETE ON review FOR EACH ROW EXECUTE PROCEDURE process_review_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.promotion_id_seq;
CREATE SEQUENCE public.promotion_id_seq INCREMENT 1;
ALTER TABLE public.promotion_id_seq OWNER TO clyp;

CREATE TABLE public.promotion
(
  id bigint NOT NULL DEFAULT nextval('promotion_id_seq'::regClass),
  entity_id bigint NOT NULL,
  staff_id bigint,
  message character varying,
  image bytea,
  start_datetime TIMESTAMP,
  end_datetime TIMESTAMP,
  is_active boolean,
  type promotion_type,
  frequency promotion_frequency,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT promotion_pk PRIMARY KEY (id),
  CONSTRAINT promotion_entity_fk FOREIGN KEY (entity_id)
      REFERENCES public.entity (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT promotion_staff_fk FOREIGN KEY (staff_id)
      REFERENCES public.staff (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION            
)
WITH ( OIDS=FALSE );

ALTER TABLE public.promotion OWNER TO clyp;
 
CREATE TABLE public.promotion_audit
(
  action char(1),
  id bigint,
  entity_id bigint NOT NULL,
  staff_id bigint,
  message character varying,
  image bytea,
  start_datetime TIMESTAMP,
  end_datetime TIMESTAMP,
  is_active boolean,
  type promotion_type,
  frequency promotion_frequency,
  updated_at TIMESTAMPTZ,
  updated_by bigint    
)
WITH ( OIDS=FALSE );

ALTER TABLE public.promotion_audit OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_promotion_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO promotion_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO promotion_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO promotion_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER promotion_audit AFTER INSERT OR UPDATE OR DELETE ON promotion FOR EACH ROW EXECUTE PROCEDURE process_promotion_audit();

------------------------------------------------------------------------------
