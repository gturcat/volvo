class AddDocOriginauxEnvoyeClientToDelivery < ActiveRecord::Migration[5.2]
  def change
    add_column :deliveries, :doc_originaux_envoyés_client, :boolean
  end
end
