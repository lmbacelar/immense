class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string  :name,        null: false, default: ''

      t.timestamps null: false

      t.references :manufacturer, null: false, index: true

      t.index [:name, :manufacturer_id], unique: true
    end
    add_foreign_key :models, :manufacturers
  end
end
