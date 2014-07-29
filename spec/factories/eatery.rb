FactoryGirl.define do 

  factory :eatery do 

    sequence(:name)        { |n| "#{Faker::Company.bs} - #{n}" }
    sequence(:address)     { |n| "#{Faker::Address.street_address} - #{n}" }
    sequence(:description) { |n| "#{Faker::Lorem.paragraph} - #{n}" }

  end

end