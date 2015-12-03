CSV.generate do |csv|
  csv << Instrument::IMPORT_ATTRS
  @instruments.each do |instrument|
    csv << Instrument::IMPORT_ATTRS.map { |attr| instrument.send attr }
  end
end
