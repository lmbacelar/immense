class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string  :line1,            null: false, default: ''
      t.string  :line2,            null: false, default: ''
      t.string  :city,             null: false, default: ''
      t.string  :zip,              null: false, default: ''
      t.string  :state,            null: false, default: ''
      t.string  :country,          null: false, default: ''
      t.float   :latitude
      t.float   :longitude
      t.integer :addressable_id,   null: false
      t.string  :addressable_type, null: false

      t.timestamps null: false
    end
    add_index :addresses, [:addressable_id, :addressable_type]
  end
end
