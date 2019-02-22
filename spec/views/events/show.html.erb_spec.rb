require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :duration => 2,
      :title => "Title",
      :description => "MyText",
      :price => 3,
      :location => "Location",
      :admin => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(//)
  end
end
