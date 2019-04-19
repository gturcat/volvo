class AddReferencesToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_reference :documents, :delivery, foreign_key: true
  end
end
