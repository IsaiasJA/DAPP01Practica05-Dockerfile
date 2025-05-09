CREATE USER myuser;
ALTER USER myuser WITH PASSWORD '123';
CREATE DATABASE dto;
GRANT ALL PRIVILEGES ON DATABASE dto TO myuser;

\connect dto;

CREATE SEQUENCE client_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

CREATE TABLE IF NOT EXISTS clients (
    id bigint NOT NULL DEFAULT nextval('client_id_seq'),
    name character varying(255),
    CONSTRAINT clients_pkey PRIMARY KEY (id)
);

CREATE SEQUENCE products_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

CREATE TABLE IF NOT EXISTS products (
    id bigint NOT NULL DEFAULT nextval('products_id_seq'),
    name character varying(255),
    price numeric(9,6),
    CONSTRAINT products_pkey PRIMARY KEY (id)
);

CREATE SEQUENCE sales_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

CREATE TABLE IF NOT EXISTS sales (
    id bigint NOT NULL DEFAULT nextval('sales_id_seq'),
    amount numeric(9,6),
    date date,
    client_id bigint,
    CONSTRAINT sales_pkey PRIMARY KEY (id),
    CONSTRAINT client_fk FOREIGN KEY (client_id) REFERENCES clients(id)
);

CREATE SEQUENCE sales_detail_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

CREATE TABLE IF NOT EXISTS sales_detail (
    row_id bigint NOT NULL DEFAULT nextval('sales_detail_id_seq'),
    description character varying(255),
    price numeric(9,6),
    quantity integer,
    product_id bigint NOT NULL,
    sale_id bigint,
    CONSTRAINT sales_detail_pkey PRIMARY KEY (row_id),
    CONSTRAINT sales_fkey FOREIGN KEY (sale_id) REFERENCES sales(id),
    CONSTRAINT product_fkey FOREIGN KEY (product_id) REFERENCES products(id)
);
