class AddColumnToTrade < ActiveRecord::Migration[5.2]
  def change
    add_column :trades, :status, :boolean
  end
end
