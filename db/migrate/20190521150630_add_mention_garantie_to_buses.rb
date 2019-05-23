class AddMentionGarantieToBuses < ActiveRecord::Migration[5.2]
  def change
    add_column :buses, :mention_garantie, :string
  end
end
