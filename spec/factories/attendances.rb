FactoryBot.define do
  factory :attendance do
    guest { FactoryBot.create(:guest) }
    event { FactoryBot.create(:event) }
    stripe_customer_id { "MyString" }
  end
end
