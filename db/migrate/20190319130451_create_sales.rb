class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.date :date_facturation
      t.integer :montant
      t.string :entite
      t.references :line
      t.references :bus

      t.timestamps
    end
  end
end
