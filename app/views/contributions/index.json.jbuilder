json.array!(@contributions) do |contribution|
  json.extract! contribution, :id, :user_id, :event_id
  json.url contribution_url(contribution, format: :json)
end
