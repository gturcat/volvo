# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_05_06_131739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buses", force: :cascade do |t|
    t.string "numero_chassis"
    t.string "reference_usine"
    t.string "designation_configuration"
    t.string "bo_number"
    t.date "date_debut_garantie"
    t.integer "kilometrage"
    t.date "date_kilometrage"
    t.string "immatriculation"
    t.string "status1"
    t.string "status2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "type_id"
    t.string "ch_cb"
    t.string "sept_neuf"
    t.bigint "description_id"
    t.index ["description_id"], name: "index_buses_on_description_id"
    t.index ["type_id"], name: "index_buses_on_type_id"
  end

  create_table "deliveries", force: :cascade do |t|
    t.string "lieu_prepa"
    t.date "date_livraison"
    t.time "heure_livraison"
    t.string "bon_de_commande"
    t.string "plan_implantation"
    t.string "info_peinture"
    t.string "info_pneu"
    t.string "plan_vocp_exl"
    t.string "fiche_rcr"
    t.string "email_entree_bdc"
    t.string "email_entree_bdc_date"
    t.string "photos"
    t.string "bl_recu"
    t.string "attestation_ead"
    t.string "attestation_limiteur_vitesse"
    t.string "dcok_recu"
    t.date "cdoc_envoye"
    t.string "enregistrement_cm"
    t.string "enregistrement_vda"
    t.bigint "bus_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "place_id"
    t.string "lieu_livraison"
    t.date "date_facturation"
    t.string "montant"
    t.string "entitee"
    t.string "pourcentage_buy_back"
    t.integer "duree_buy_back"
    t.boolean "demande_immat_envoye_cch"
    t.date "date_demande_immat_envoye"
    t.string "attestation_amenagement"
    t.string "coc"
    t.string "cpi"
    t.date "transmision_PV_DF_RCR"
    t.date "demande_changement_titulaire_cession"
    t.string "cerfa_changement_titulaire"
    t.string "cerfa_cession"
    t.string "mail_original_ci"
    t.index ["bus_id"], name: "index_deliveries_on_bus_id"
    t.index ["place_id"], name: "index_deliveries_on_place_id"
  end

  create_table "descriptions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.text "pdf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "factory_order_id"
    t.bigint "delivery_id"
    t.bigint "trade_id"
    t.index ["delivery_id"], name: "index_documents_on_delivery_id"
    t.index ["factory_order_id"], name: "index_documents_on_factory_order_id"
    t.index ["trade_id"], name: "index_documents_on_trade_id"
  end

  create_table "factory_orders", force: :cascade do |t|
    t.string "envoiOF"
    t.date "date_limit_modif_config"
    t.string "reception_oc"
    t.boolean "dispo_fr"
    t.date "CDD"
    t.string "lieu_depart_usine"
    t.date "date_depart_usine"
    t.string "lieu_arrivee_partenaire_volvo"
    t.date "date_arrivee_partenaire_volvo"
    t.boolean "partenaire_prevenu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bus_id"
    t.index ["bus_id"], name: "index_factory_orders_on_bus_id"
  end

  create_table "ferries", force: :cascade do |t|
    t.date "date_convoyage"
    t.string "depart"
    t.string "arrivee"
    t.string "sens"
    t.string "site"
    t.string "numero_bdc"
    t.string "note"
    t.bigint "bus_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_id"], name: "index_ferries_on_bus_id"
  end

  create_table "lines", force: :cascade do |t|
    t.date "delai_previsionnel"
    t.date "date_livraison_bdc"
    t.string "couleur_ext_vehicule"
    t.string "financement_type"
    t.string "mention_garantie"
    t.string "mention_telematique"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bus_id"
    t.bigint "order_book_id"
    t.boolean "garantie_pep_tool"
    t.string "telematique_demandee"
    t.boolean "reprise"
    t.index ["bus_id"], name: "index_lines_on_bus_id"
    t.index ["order_book_id"], name: "index_lines_on_order_book_id"
    t.index ["order_id"], name: "index_lines_on_order_id"
  end

  create_table "order_books", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "client"
    t.string "numero_bon_de_commande"
    t.date "date"
    t.bigint "sales_advisor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sales_advisor_id"], name: "index_orders_on_sales_advisor_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "city"
    t.string "adress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales_advisors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "description"
    t.bigint "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["work_id"], name: "index_tasks_on_work_id"
  end

  create_table "trades", force: :cascade do |t|
    t.string "prix_achat"
    t.date "date_rentree_bdc"
    t.date "date_rentree"
    t.time "heure_rentree"
    t.string "lieu_conservation_papier"
    t.string "travaux_previsionnels"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bus_id"
    t.bigint "line_id"
    t.boolean "status"
    t.index ["bus_id"], name: "index_trades_on_bus_id"
    t.index ["line_id"], name: "index_trades_on_line_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "works", force: :cascade do |t|
    t.string "nature_travaux"
    t.date "demande_preparation"
    t.string "devis_travaux"
    t.string "bon_de_commande_travaux"
    t.date "date_previsionnelle_fin_travaux"
    t.string "facture_travaux"
    t.string "facture_montant"
    t.bigint "delivery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "files"
    t.string "devis"
    t.index ["delivery_id"], name: "index_works_on_delivery_id"
  end

  add_foreign_key "buses", "descriptions"
  add_foreign_key "buses", "types"
  add_foreign_key "deliveries", "buses"
  add_foreign_key "documents", "deliveries"
  add_foreign_key "documents", "factory_orders"
  add_foreign_key "documents", "trades"
  add_foreign_key "factory_orders", "buses"
  add_foreign_key "ferries", "buses"
  add_foreign_key "lines", "buses"
  add_foreign_key "lines", "order_books"
  add_foreign_key "tasks", "works"
  add_foreign_key "trades", "buses"
  add_foreign_key "trades", "lines"
  add_foreign_key "works", "deliveries"
end
