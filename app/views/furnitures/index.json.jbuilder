json.array!(@furnitures) do |furniture|
  json.extract! furniture, :id, :style, :type
  json.url furniture_url(furniture, format: :json)
end
