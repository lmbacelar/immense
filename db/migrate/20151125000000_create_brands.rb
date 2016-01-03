class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string  :name, null: false, default: ''

      t.timestamps null: false

      t.index :name, unique: true
    end
  end
end
