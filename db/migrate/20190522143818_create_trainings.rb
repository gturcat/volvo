class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
      t.date :date
      t.string :lieu
      t.string :formateur
      t.string :numero_bcd
      t.string :info_transmise
      t.references :line, foreign_key: true

      t.timestamps
    end
  end
end
