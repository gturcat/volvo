class CreateEmployeePartners < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_partners do |t|
      t.string :nom
      t.string :tel
      t.string :email
      t.string :role
      t.references  :partner, foreign_key: true
      t.timestamps
    end
  end
end
