json.array!(@events) do |event|
  json.extract! event, :id, :name, :image_path, :description, :age_restriction, :description, :start_time, :end_time, :location_id
  json.url event_url(event, format: :json)
end
