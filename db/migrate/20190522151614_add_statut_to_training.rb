class AddStatutToTraining < ActiveRecord::Migration[5.2]
  def change
    add_column :trainings, :statut, :boolean
  end
end
