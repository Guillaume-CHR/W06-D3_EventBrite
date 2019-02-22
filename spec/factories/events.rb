FactoryBot.define do
  factory :event do
    start_date { "2020-02-17 14:45:09" }
    duration { 30 }
    title { "Title: Event title" }
    description { "Description: This event takes place in the heart of Toulouse. " }
    price { 10 }
    location { "Foirail" }
    admin { FactoryBot.create(:user) }
  end
end
