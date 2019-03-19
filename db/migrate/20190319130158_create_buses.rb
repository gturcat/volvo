class CreateBuses < ActiveRecord::Migration[5.2]
  def change
    create_table :buses do |t|
      t.string :numero_chassis
      t.string :reference_usine
      t.string :designation_configuration
      t.string :bo_number
      t.date :date_debut_garantie
      t.integer :kilometrage
      t.date :date_kilometrage
      t.string :immatriculation
      t.string :status1
      t.string :status2

      t.timestamps
    end
  end
end
