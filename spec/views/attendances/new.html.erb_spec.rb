require 'rails_helper'

RSpec.describe "attendances/new", type: :view do
  before(:each) do
    assign(:attendance, Attendance.new(
      :guest => nil,
      :event => nil,
      :stripe_customer_id => "MyString"
    ))
  end

  it "renders new attendance form" do
    render

    assert_select "form[action=?][method=?]", attendances_path, "post" do

      assert_select "input[name=?]", "attendance[guest_id]"

      assert_select "input[name=?]", "attendance[event_id]"

      assert_select "input[name=?]", "attendance[stripe_customer_id]"
    end
  end
end
