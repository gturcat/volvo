class AddColumnsDescriptionsToBuse < ActiveRecord::Migration[5.2]
  def change
    add_column :buses, :longueur, :string
    add_column :buses, :nbr_places, :integer
    add_column :buses, :volo_coach_line, :string
    add_column :buses, :couleur, :string
    add_column :buses, :note, :string
    add_column :buses, :reference, :string
  end
end
