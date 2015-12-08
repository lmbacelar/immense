json.array!(@departments) do |department|
  json.extract! department, :id, :name, :full_name, :designation, :parent_id
  json.url department_url(department, format: :json)
end
