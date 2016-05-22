json.array!(@organizations) do |organization|
  json.extract! organization, :id, :name, :description, :is_premium, :active
  json.url organization_url(organization, format: :json)
end
