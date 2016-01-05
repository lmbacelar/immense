json.array!(@companies) do |company|
  json.extract! company, :id, :short_name, :name, :vat_prefix, :vat_number
  json.url company_url(company, format: :json)
end
