class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name,        null: false, default: ''
      t.string :designation, null: false, default: ''
      t.string :ancestry

      t.timestamps null: false

      t.index [:name, :ancestry], unique: true
      t.index :ancestry
    end
  end
end
