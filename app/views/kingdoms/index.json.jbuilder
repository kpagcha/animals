json.array!(@kingdoms) do |kingdom|
  json.extract! kingdom, :id, :name
  json.url kingdom_url(kingdom, format: :json)
end
