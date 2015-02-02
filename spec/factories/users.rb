FactoryGirl.define do
  factory :user do |f|
    f.email     { Faker::Internet.email }
    f.password  { Faker::Internet.password(8) }

    factory :user_with_instruments do |f|
      f.instruments { %w{Drums Guitar Bass} }
    end
  end
end
