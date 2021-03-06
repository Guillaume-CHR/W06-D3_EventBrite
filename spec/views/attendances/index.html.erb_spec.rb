require 'rails_helper'

RSpec.describe "attendances/index", type: :view do
  before(:each) do
    assign(:attendances, [
      Attendance.create!(
        :guest => nil,
        :event => nil,
        :stripe_customer_id => "Stripe Customer"
      ),
      Attendance.create!(
        :guest => nil,
        :event => nil,
        :stripe_customer_id => "Stripe Customer"
      )
    ])
  end

  it "renders a list of attendances" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Stripe Customer".to_s, :count => 2
  end
end
