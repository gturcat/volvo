class CreatePartners < ActiveRecord::Migration[5.2]
  def change
    create_table :partners do |t|
      t.string :nom
      t.string :place
      t.string :dpt
      t.string :adresse
      t.string :tel
      t.timestamps
    end
  end
end
