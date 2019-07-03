class AddMarqueToBuses < ActiveRecord::Migration[5.2]
  def change
      add_column :buses, :marque, :string
  end
end
