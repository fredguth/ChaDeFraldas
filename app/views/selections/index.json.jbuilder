json.array!(@selections) do |selection|
  json.extract! selection, :id, :event_id, :product_id
  json.url selection_url(selection, format: :json)
end
