class AddSearchIndexToInstruments < ActiveRecord::Migration
  def up
    execute "create index instruments_reference     on instruments using gin(to_tsvector('english', reference))"
    execute "create index instruments_designation   on instruments using gin(to_tsvector('english', designation))"
    execute "create index instruments_manufacturer  on instruments using gin(to_tsvector('english', manufacturer))"
    execute "create index instruments_model         on instruments using gin(to_tsvector('english', model))"
    execute "create index instruments_serial_number on instruments using gin(to_tsvector('english', serial_number))"
  end
  def down
    execute "drop index instruments_reference"
    execute "drop index instruments_designation"
    execute "drop index instruments_manufacturer"
    execute "drop index instruments_model"
    execute "drop index instruments_serial_number"
  end
end
