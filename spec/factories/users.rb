FactoryBot.define do
  factory :user do
    first_name { "Guillaume" }
    last_name { "CHRISTE" }
    username { "guillaumeCHR" }
    email { Faker::Internet.email }
    password { "emualliug" }
    description { "Love is a fine art" }
  end
end
