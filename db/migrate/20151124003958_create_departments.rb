class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string  :name,        null: false, default: ''
      t.string  :designation, null: false, default: ''
      t.string  :slug,        null: false

      t.timestamps            null: false

      t.references :company,  null: false, index: true
      t.references :parent,                index: true

      t.index :name, unique: true
      t.index :slug, unique: true
    end
    add_foreign_key :departments, :companies
    add_foreign_key :departments, :departments, column: :parent_id
  end
end
