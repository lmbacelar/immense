class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string  :name,        null: false, default: ''

      t.timestamps null: false

      t.references :brand, null: false, index: true

      t.index [:name, :brand_id], unique: true
    end
    add_foreign_key :models, :brands
  end
end
