class AddFilesToWork < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :files, :json
  end
end
