json.data @collection do |entity|
  json.id entity.id
  json.type entity.class.table_name
  json.attributes do
    json.(entity, :name, :url, :latitude, :longitude)
  end
end
