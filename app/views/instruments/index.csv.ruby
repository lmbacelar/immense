CSV.generate do |csv|
  csv << Instrument::EXPORT_ATTRS
  @instruments.each do |instrument|
    csv << Instrument::EXPORT_ATTRS.map { |attr| instrument.send attr }
  end
end
