json.array!(@events) do |event|
  json.extract! event, :id, :name, :welcome_message, :thankyou_message, :is_open, :user_id
  json.url event_url(event, format: :json)
end
