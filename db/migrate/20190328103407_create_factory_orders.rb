class CreateFactoryOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :factory_orders do |t|
      t.string :envoiOF
      t.date :date_limit_modif_config
      t.string :reception_oc
      t.boolean :dispo_fr
      t.date :CDD
      t.string :lieu_depart_usine
      t.date :date_depart_usine
      t.string :lieu_arrivee_partenaire_volvo
      t.date :date_arrivee_partenaire_volvo
      t.boolean :partenaire_prevenu

      t.timestamps
    end
  end
end
