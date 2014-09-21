json.array!(@wishpond_tests) do |wishpond_test|
  json.extract! wishpond_test, :id, :first-name, :last-name, :bio, :email
  json.url wishpond_test_url(wishpond_test, format: :json)
end
