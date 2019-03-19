rails class AddColumnToBuses < ActiveRecord::Migration[5.2]
  def change
    add_column :buses, :ch_cb, :string
    add_column :buses, :sept_neuf, :string
  end
end
