class CreateManufacturers < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
      t.string  :name,        null: false, default: ''

      t.timestamps null: false

      t.index :name, unique: true
    end
  end
end
