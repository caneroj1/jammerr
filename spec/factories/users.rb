FactoryGirl.define do
  factory :user do |f|
    f.email       { Faker::Internet.email }
    f.password    { Faker::Internet.password(8) }
    f.first_name  { Faker::Name.first_name }
    f.last_name   { Faker::Name.last_name }

    factory :user_with_instruments do |f|
      f.instruments { %w{Drums Guitar Bass} }
    end

    factory :user_with_location do |f|
      f.address   { Faker::Address.street_address }
      f.city      { Faker::Address.city }
      f.state     { Faker::Address.state }
    end
  end
end
