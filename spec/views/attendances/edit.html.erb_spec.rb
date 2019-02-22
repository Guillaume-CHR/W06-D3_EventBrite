require 'rails_helper'

RSpec.describe "attendances/edit", type: :view do
  before(:each) do
    @attendance = assign(:attendance, Attendance.create!(
      :guest => nil,
      :event => nil,
      :stripe_customer_id => "MyString"
    ))
  end

  it "renders the edit attendance form" do
    render

    assert_select "form[action=?][method=?]", attendance_path(@attendance), "post" do

      assert_select "input[name=?]", "attendance[guest_id]"

      assert_select "input[name=?]", "attendance[event_id]"

      assert_select "input[name=?]", "attendance[stripe_customer_id]"
    end
  end
end
