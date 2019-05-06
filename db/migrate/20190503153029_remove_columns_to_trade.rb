class RemoveColumnsToTrade < ActiveRecord::Migration[5.2]
  def change
    remove_column :trades, :fiche_RCR
    remove_column :trades, :demande_cession
    remove_column :trades, :cerfa
    remove_column :trades, :ci_barre
    remove_column :trades, :controle_technique
    remove_column :trades, :certif_non_gage
    remove_column :trades, :coc
    remove_column :trades, :attestation_amenagement
  end
end
