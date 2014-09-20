json.array!(@wishpond_tests) do |wishpond_test|
  json.extract! wishpond_test, :id, :first_name, :last_name, :bio, :email
  json.url wishpond_test_url(wishpond_test, format: :json)
end
