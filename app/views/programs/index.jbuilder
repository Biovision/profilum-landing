json.data @collection do |entity|
  json.id entity.id
  json.type entity.class.table_name
  json.attributes do
    json.(entity, :name, :price, :lead, :ages, :url)
  end
  unless entity.image.blank?
    json.image do
      json.small_2x entity.image.medium.url
      json.small entity.image.small.url
    end
  end
  json.relationships do
    json.center do
      json.name entity.center.name
      json.url entity.center.url
      json.place entity.center.place
    end
  end
  json.html_preview render(partial: 'programs/preview', formats: [:html], locals: { entity: entity })
end
unless @collection.next_page.blank?
  json.meta do
    json.next_page @collection.next_page
  end
end
json.partial! 'shared/pagination', locals: { collection: @collection }