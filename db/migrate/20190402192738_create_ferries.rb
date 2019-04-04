class CreateFerries < ActiveRecord::Migration[5.2]
  def change
    create_table :ferries do |t|
      t.date :date_convoyage
      t.string :depart
      t.string :arrivee
      t.string :sens
      t.string :site
      t.string :numero_bdc
      t.string :note
      t.references :bus, foreign_key: true

      t.timestamps
    end
  end
end
