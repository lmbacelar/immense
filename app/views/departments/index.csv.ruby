CSV.generate do |csv|
  csv << Department::EXPORT_ATTRS
  @departments.each do |department|
    csv << Department::EXPORT_ATTRS.map { |attr| department.send attr }
  end
end
