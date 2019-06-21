class RemoveSensToFerry < ActiveRecord::Migration[5.2]
  def change
    remove_column :ferries, :sens
  end
end
