json.array!(@registrations) do |registration|
  json.extract! registration, :id, :firstName, :lastName, :email, :shirtSize, :year
  json.url registration_url(registration, format: :json)
end
