json.array!(@raccoons) do |raccoon|
  json.extract! raccoon, :id, :name, :claw_ferocity, :disposition, :avatar_url, :avatar_thumb
  json.url raccoon_url(raccoon, format: :json)
end
