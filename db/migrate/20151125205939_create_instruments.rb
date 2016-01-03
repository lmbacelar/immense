class CreateInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
      t.string  :reference,     null: false, default: ''
      t.string  :designation,   null: false, default: ''
      t.string  :part_number,   null: false, default: ''
      t.string  :serial_number, null: false, default: ''
      t.text    :remarks,       null: false, default: ''
      t.string  :slug,          null: false
      t.timestamps              null: false

      t.references :model,        null: false, index: true
      t.references :department,   null: false, index: true

      t.index :reference, unique: true
      t.index :slug     , unique: true
    end
    add_foreign_key :instruments, :models
    add_foreign_key :instruments, :departments
  end
end
