class AddImmatColumnsToDelivery < ActiveRecord::Migration[5.2]
  def change
    add_column :deliveries, :demande_immat_envoye_cch, :boolean
    add_column :deliveries, :date_demande_immat_envoye, :date
    add_column :deliveries, :attestation_amenagement, :string
    add_column :deliveries, :coc, :string
    add_column :deliveries, :cpi, :string
    add_column :deliveries, :transmision_PV_DF_RCR, :date
    add_column :deliveries, :demande_changement_titulaire_cession, :date
    add_column :deliveries, :cerfa_changement_titulaire, :string
    add_column :deliveries, :cerfa_cession, :string
    add_column :deliveries, :mail_original_ci, :string
  end
end
