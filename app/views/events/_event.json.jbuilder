json.extract! event, :id, :start_date, :duration, :title, :description, :price, :location, :created_at, :updated_at, :creator
json.url event_url(event, format: :json)
