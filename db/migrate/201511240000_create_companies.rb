class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string  :short_name, null: false, default: ''
      t.string  :name,       null: false, default: ''
      t.string  :vat_number, null: false, default: ''
      t.string  :vat_prefix, null: false, default: ''
      t.string  :slug,       null: false

      t.timestamps null: false

      t.index :short_name, unique: true
      t.index :name,       unique: true
      t.index :vat_number, unique: true
      t.index :vat_prefix
      t.index :slug,       unique: true
    end
  end
end
