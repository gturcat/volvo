class ChangeTrainingColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :trainings, :email_volvo_driver, :date
    add_column :trainings, :info_transmise_rcr_client, :date
    remove_column :trainings, :statut
    remove_column :trainings, :info_transmise
  end
end
