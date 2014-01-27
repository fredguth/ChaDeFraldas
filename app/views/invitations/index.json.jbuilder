json.array!(@invitations) do |invitation|
  json.extract! invitation, :id, :user_id
  json.url invitation_url(invitation, format: :json)
end
