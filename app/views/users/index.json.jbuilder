json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :email, :date_of_birth, :loyalty_status, :last_login, :login_count, :role
  json.url user_url(user, format: :json)
end
