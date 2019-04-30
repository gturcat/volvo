class AddReferncesToTrade < ActiveRecord::Migration[5.2]
  def change
    add_reference :trades, :bus, foreign_key: true
    add_reference :trades, :line, foreign_key: true
  end
end
