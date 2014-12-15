json.array!(@animals) do |animal|
  json.extract! animal, :id, :common_name, :subspecie, :kingdom_id
  json.url animal_url(animal, format: :json)
end
