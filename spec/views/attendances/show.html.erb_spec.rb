require 'rails_helper'

RSpec.describe "attendances/show", type: :view do
  before(:each) do
    @attendance = assign(:attendance, Attendance.create!(
      :guest => nil,
      :event => nil,
      :stripe_customer_id => "Stripe Customer"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Stripe Customer/)
  end
end
