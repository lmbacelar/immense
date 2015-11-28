json.array!(@instruments) do |i|
  json.extract! i, :id, :reference, :designation, :manufacturer, :model, :part_number, :serial_number, :remarks
  json.url instrument_url(i, format: :json)
end
