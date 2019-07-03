SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: bus_statut1; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.bus_statut1 AS ENUM (
    'disponible',
    'indisponible',
    'facture_livre',
    'en_commande'
);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: buses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.buses (
    id bigint NOT NULL,
    numero_chassis character varying,
    reference_usine character varying,
    designation_configuration character varying,
    bo_number character varying,
    date_debut_garantie date,
    kilometrage integer,
    date_kilometrage date,
    immatriculation character varying,
    statut2 character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    type_id bigint,
    ch_cb character varying,
    sept_neuf character varying,
    description_id bigint,
    option_contremarque character varying,
    option_commercial character varying,
    date_option date,
    prix_mini character varying,
    version character varying,
    implantation character varying,
    mention_garantie character varying,
    longueur character varying,
    nbr_places integer,
    volo_coach_line character varying,
    couleur character varying,
    note character varying,
    reference character varying,
    statut1 public.bus_statut1,
    marque character varying
);


--
-- Name: buses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.buses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: buses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.buses_id_seq OWNED BY public.buses.id;


--
-- Name: deliveries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.deliveries (
    id bigint NOT NULL,
    lieu_prepa character varying,
    date_livraison date,
    heure_livraison time without time zone,
    email_entree_bdc character varying,
    email_entree_bdc_date character varying,
    cdoc_envoye date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    place_id bigint,
    lieu_livraison character varying,
    date_facturation date,
    montant character varying,
    entitee character varying,
    pourcentage_buy_back character varying,
    duree_buy_back integer,
    demande_immat_envoye_cch boolean,
    date_demande_immat_envoye date,
    attestation_amenagement character varying,
    coc character varying,
    cpi character varying,
    "transmision_PV_DF_RCR" date,
    demande_changement_titulaire_cession date,
    cerfa_changement_titulaire character varying,
    cerfa_cession character varying,
    mail_original_ci character varying,
    enregistrement_cm boolean,
    enregistrement_vda boolean,
    envoi_double_cle boolean,
    transmission_bl_controlling boolean,
    "doc_originaux_envoyés_client" boolean,
    garantie_pep_tool boolean,
    telematique_demandee boolean,
    note text,
    bulletion_de_livraison character varying,
    cdoc character varying,
    attestation_ead character varying,
    attestation_limiteur_de_vitesse character varying,
    "photos_Vehicule" character varying,
    facture character varying,
    bon_de_commande character varying,
    offre_configuration_avec_plan_implantation character varying,
    information_peinture character varying,
    plan_vosp character varying,
    "Fiche_rcr" character varying,
    a_reception_envoi_papiers_originaux character varying,
    justificatif_financement character varying,
    financement_type character varying,
    contact_banque character varying,
    note_financement text,
    statut integer
);


--
-- Name: deliveries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.deliveries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: deliveries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.deliveries_id_seq OWNED BY public.deliveries.id;


--
-- Name: descriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.descriptions (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: descriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.descriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: descriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.descriptions_id_seq OWNED BY public.descriptions.id;


--
-- Name: documents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.documents (
    id bigint NOT NULL,
    name character varying,
    pdf text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    factory_order_id bigint,
    delivery_id bigint,
    trade_id bigint
);


--
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.documents_id_seq OWNED BY public.documents.id;


--
-- Name: factory_orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.factory_orders (
    id bigint NOT NULL,
    "envoiOF" character varying,
    date_limit_modif_config date,
    reception_oc character varying,
    dispo_fr boolean,
    "CDD" date,
    lieu_depart_usine character varying,
    date_depart_usine date,
    lieu_arrivee_partenaire_volvo character varying,
    date_arrivee_partenaire_volvo date,
    partenaire_prevenu boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    bus_id bigint,
    document_de_transport character varying,
    delivery_note character varying,
    vcr character varying,
    photos_livraison character varying,
    photos_envoyees_usine boolean,
    avarie boolean,
    details_avarie text,
    statut integer
);


--
-- Name: factory_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.factory_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: factory_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.factory_orders_id_seq OWNED BY public.factory_orders.id;


--
-- Name: ferries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ferries (
    id bigint NOT NULL,
    date_convoyage date,
    depart character varying,
    arrivee character varying,
    note character varying,
    bus_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    site boolean,
    numero_bdc boolean
);


--
-- Name: ferries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ferries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ferries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ferries_id_seq OWNED BY public.ferries.id;


--
-- Name: lines; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lines (
    id bigint NOT NULL,
    delai_previsionnel date,
    date_livraison_bdc date,
    couleur_ext_vehicule character varying,
    mention_garantie character varying,
    mention_telematique character varying,
    order_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    bus_id bigint,
    order_book_id bigint,
    reprise boolean,
    delivery_id bigint
);


--
-- Name: lines_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lines_id_seq OWNED BY public.lines.id;


--
-- Name: order_books; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_books (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: order_books_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.order_books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: order_books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.order_books_id_seq OWNED BY public.order_books.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    client character varying,
    numero_bon_de_commande character varying,
    date date,
    sales_advisor_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    departement character varying,
    statut integer
);


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: places; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.places (
    id bigint NOT NULL,
    city character varying,
    adress character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: places_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.places_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: places_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.places_id_seq OWNED BY public.places.id;


--
-- Name: sales_advisors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sales_advisors (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sales_advisors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sales_advisors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sales_advisors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sales_advisors_id_seq OWNED BY public.sales_advisors.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tasks (
    id bigint NOT NULL,
    description character varying,
    work_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- Name: trades; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trades (
    id bigint NOT NULL,
    prix_achat character varying,
    date_rentree_bdc date,
    date_rentree date,
    heure_rentree time without time zone,
    lieu_conservation_papier character varying,
    travaux_previsionnels character varying,
    note character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    bus_id bigint,
    line_id bigint,
    status boolean
);


--
-- Name: trades_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trades_id_seq OWNED BY public.trades.id;


--
-- Name: trainings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trainings (
    id bigint NOT NULL,
    date date,
    lieu character varying,
    formateur character varying,
    numero_bcd character varying,
    line_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email_volvo_driver date,
    info_transmise_rcr_client date
);


--
-- Name: trainings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trainings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trainings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trainings_id_seq OWNED BY public.trainings.id;


--
-- Name: types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.types (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.types_id_seq OWNED BY public.types.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: works; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.works (
    id bigint NOT NULL,
    nature_travaux character varying,
    demande_preparation date,
    devis_travaux character varying,
    bon_de_commande_travaux character varying,
    date_previsionnelle_fin_travaux date,
    facture_travaux character varying,
    facture_montant character varying,
    delivery_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    files json,
    devis character varying,
    bdc_envoye boolean,
    date_previsionelle_fin_travaux date,
    note text
);


--
-- Name: works_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.works_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: works_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.works_id_seq OWNED BY public.works.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: buses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.buses ALTER COLUMN id SET DEFAULT nextval('public.buses_id_seq'::regclass);


--
-- Name: deliveries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deliveries ALTER COLUMN id SET DEFAULT nextval('public.deliveries_id_seq'::regclass);


--
-- Name: descriptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.descriptions ALTER COLUMN id SET DEFAULT nextval('public.descriptions_id_seq'::regclass);


--
-- Name: documents id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documents ALTER COLUMN id SET DEFAULT nextval('public.documents_id_seq'::regclass);


--
-- Name: factory_orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_orders ALTER COLUMN id SET DEFAULT nextval('public.factory_orders_id_seq'::regclass);


--
-- Name: ferries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ferries ALTER COLUMN id SET DEFAULT nextval('public.ferries_id_seq'::regclass);


--
-- Name: lines id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lines ALTER COLUMN id SET DEFAULT nextval('public.lines_id_seq'::regclass);


--
-- Name: order_books id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_books ALTER COLUMN id SET DEFAULT nextval('public.order_books_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: places id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.places ALTER COLUMN id SET DEFAULT nextval('public.places_id_seq'::regclass);


--
-- Name: sales_advisors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_advisors ALTER COLUMN id SET DEFAULT nextval('public.sales_advisors_id_seq'::regclass);


--
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- Name: trades id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trades ALTER COLUMN id SET DEFAULT nextval('public.trades_id_seq'::regclass);


--
-- Name: trainings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trainings ALTER COLUMN id SET DEFAULT nextval('public.trainings_id_seq'::regclass);


--
-- Name: types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.types ALTER COLUMN id SET DEFAULT nextval('public.types_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: works id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.works ALTER COLUMN id SET DEFAULT nextval('public.works_id_seq'::regclass);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: buses buses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.buses
    ADD CONSTRAINT buses_pkey PRIMARY KEY (id);


--
-- Name: deliveries deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_pkey PRIMARY KEY (id);


--
-- Name: descriptions descriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.descriptions
    ADD CONSTRAINT descriptions_pkey PRIMARY KEY (id);


--
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: factory_orders factory_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_orders
    ADD CONSTRAINT factory_orders_pkey PRIMARY KEY (id);


--
-- Name: ferries ferries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ferries
    ADD CONSTRAINT ferries_pkey PRIMARY KEY (id);


--
-- Name: lines lines_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lines
    ADD CONSTRAINT lines_pkey PRIMARY KEY (id);


--
-- Name: order_books order_books_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_books
    ADD CONSTRAINT order_books_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: places places_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.places
    ADD CONSTRAINT places_pkey PRIMARY KEY (id);


--
-- Name: sales_advisors sales_advisors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_advisors
    ADD CONSTRAINT sales_advisors_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: trades trades_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trades
    ADD CONSTRAINT trades_pkey PRIMARY KEY (id);


--
-- Name: trainings trainings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trainings
    ADD CONSTRAINT trainings_pkey PRIMARY KEY (id);


--
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: works works_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.works
    ADD CONSTRAINT works_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_buses_on_description_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_buses_on_description_id ON public.buses USING btree (description_id);


--
-- Name: index_buses_on_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_buses_on_type_id ON public.buses USING btree (type_id);


--
-- Name: index_deliveries_on_place_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_deliveries_on_place_id ON public.deliveries USING btree (place_id);


--
-- Name: index_documents_on_delivery_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_documents_on_delivery_id ON public.documents USING btree (delivery_id);


--
-- Name: index_documents_on_factory_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_documents_on_factory_order_id ON public.documents USING btree (factory_order_id);


--
-- Name: index_documents_on_trade_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_documents_on_trade_id ON public.documents USING btree (trade_id);


--
-- Name: index_factory_orders_on_bus_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_orders_on_bus_id ON public.factory_orders USING btree (bus_id);


--
-- Name: index_ferries_on_bus_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ferries_on_bus_id ON public.ferries USING btree (bus_id);


--
-- Name: index_lines_on_bus_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lines_on_bus_id ON public.lines USING btree (bus_id);


--
-- Name: index_lines_on_delivery_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lines_on_delivery_id ON public.lines USING btree (delivery_id);


--
-- Name: index_lines_on_order_book_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lines_on_order_book_id ON public.lines USING btree (order_book_id);


--
-- Name: index_lines_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lines_on_order_id ON public.lines USING btree (order_id);


--
-- Name: index_orders_on_sales_advisor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_sales_advisor_id ON public.orders USING btree (sales_advisor_id);


--
-- Name: index_tasks_on_work_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tasks_on_work_id ON public.tasks USING btree (work_id);


--
-- Name: index_trades_on_bus_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trades_on_bus_id ON public.trades USING btree (bus_id);


--
-- Name: index_trades_on_line_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trades_on_line_id ON public.trades USING btree (line_id);


--
-- Name: index_trainings_on_line_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trainings_on_line_id ON public.trainings USING btree (line_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_works_on_delivery_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_works_on_delivery_id ON public.works USING btree (delivery_id);


--
-- Name: lines fk_rails_0064582fb0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lines
    ADD CONSTRAINT fk_rails_0064582fb0 FOREIGN KEY (order_book_id) REFERENCES public.order_books(id);


--
-- Name: trades fk_rails_025042b258; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trades
    ADD CONSTRAINT fk_rails_025042b258 FOREIGN KEY (bus_id) REFERENCES public.buses(id);


--
-- Name: lines fk_rails_0ba56648b8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lines
    ADD CONSTRAINT fk_rails_0ba56648b8 FOREIGN KEY (delivery_id) REFERENCES public.deliveries(id);


--
-- Name: trainings fk_rails_0ccbb30aa0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trainings
    ADD CONSTRAINT fk_rails_0ccbb30aa0 FOREIGN KEY (line_id) REFERENCES public.lines(id);


--
-- Name: trades fk_rails_2832aae8b5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trades
    ADD CONSTRAINT fk_rails_2832aae8b5 FOREIGN KEY (line_id) REFERENCES public.lines(id);


--
-- Name: tasks fk_rails_30cb31adce; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT fk_rails_30cb31adce FOREIGN KEY (work_id) REFERENCES public.works(id);


--
-- Name: documents fk_rails_3269a8fba8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT fk_rails_3269a8fba8 FOREIGN KEY (trade_id) REFERENCES public.trades(id);


--
-- Name: factory_orders fk_rails_581ccb2058; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_orders
    ADD CONSTRAINT fk_rails_581ccb2058 FOREIGN KEY (bus_id) REFERENCES public.buses(id);


--
-- Name: works fk_rails_8de578e4d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.works
    ADD CONSTRAINT fk_rails_8de578e4d9 FOREIGN KEY (delivery_id) REFERENCES public.deliveries(id);


--
-- Name: buses fk_rails_a183e9ed64; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.buses
    ADD CONSTRAINT fk_rails_a183e9ed64 FOREIGN KEY (type_id) REFERENCES public.types(id);


--
-- Name: lines fk_rails_b82afdd991; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lines
    ADD CONSTRAINT fk_rails_b82afdd991 FOREIGN KEY (bus_id) REFERENCES public.buses(id);


--
-- Name: documents fk_rails_ce2b4e37f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT fk_rails_ce2b4e37f9 FOREIGN KEY (factory_order_id) REFERENCES public.factory_orders(id);


--
-- Name: buses fk_rails_d4dd414898; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.buses
    ADD CONSTRAINT fk_rails_d4dd414898 FOREIGN KEY (description_id) REFERENCES public.descriptions(id);


--
-- Name: documents fk_rails_e2d6320952; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT fk_rails_e2d6320952 FOREIGN KEY (delivery_id) REFERENCES public.deliveries(id);


--
-- Name: ferries fk_rails_ea16b5f77e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ferries
    ADD CONSTRAINT fk_rails_ea16b5f77e FOREIGN KEY (bus_id) REFERENCES public.buses(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20190318160759'),
('20190319124556'),
('20190319124803'),
('20190319125207'),
('20190319125711'),
('20190319125751'),
('20190319130158'),
('20190319130451'),
('20190319133828'),
('20190319134244'),
('20190319141527'),
('20190319154442'),
('20190319154705'),
('20190319190321'),
('20190325131657'),
('20190326094505'),
('20190326094726'),
('20190328103407'),
('20190328103745'),
('20190329111449'),
('20190329123352'),
('20190329123610'),
('20190329133403'),
('20190329141133'),
('20190329141255'),
('20190402192738'),
('20190416142118'),
('20190416143212'),
('20190416143449'),
('20190416143800'),
('20190418083603'),
('20190418140522'),
('20190418141315'),
('20190418141658'),
('20190418153457'),
('20190419154156'),
('20190420133147'),
('20190420134830'),
('20190425095501'),
('20190425101900'),
('20190429150002'),
('20190429190617'),
('20190430100552'),
('20190430123710'),
('20190430125652'),
('20190430134848'),
('20190503105848'),
('20190503153029'),
('20190503153824'),
('20190506131739'),
('20190507072510'),
('20190507081351'),
('20190507105413'),
('20190507112313'),
('20190509074215'),
('20190509195204'),
('20190509200150'),
('20190510093053'),
('20190510094633'),
('20190510094955'),
('20190521145950'),
('20190521150630'),
('20190522143818'),
('20190522151614'),
('20190523132514'),
('20190613141415'),
('20190614102251'),
('20190620064831'),
('20190620073237'),
('20190620075437'),
('20190620152655'),
('20190620154324'),
('20190620154906'),
('20190620163558'),
('20190620164555'),
('20190621075937'),
('20190621101928'),
('20190624085916'),
('20190624091914'),
('20190625184943'),
('20190625190144'),
('20190627134357'),
('20190702122524'),
('20190702133620'),
('20190702144229'),
('20190703135640'),
('20190703143159');


