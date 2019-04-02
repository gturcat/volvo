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

ActiveRecord::Schema.define(version: 2019_03_29_141255) do

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
    t.index ["factory_order_id"], name: "index_documents_on_factory_order_id"
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

  create_table "sales_advisors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "buses", "descriptions"
  add_foreign_key "buses", "types"
  add_foreign_key "documents", "factory_orders"
  add_foreign_key "factory_orders", "buses"
  add_foreign_key "lines", "buses"
  add_foreign_key "lines", "order_books"
end
