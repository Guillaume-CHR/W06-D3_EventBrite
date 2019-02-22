require 'rails_helper'

RSpec.describe Event, type: :model do
  
    before(:each) do 
    @event = FactoryBot.create(:event)    
  end

  it "has a valid factory" do
    expect(build(:event)).to be_valid
  end
  
  context "validation" do

    it "is valid with valid attributes" do
      expect(@event).to be_a(Event)
    end

    describe "#start_date" do
      it { expect(@event).to validate_presence_of(:start_date) }  
    end

    describe "#duration" do
      it { is_expected.to allow_value(25).for(:duration) }
      it { is_expected.to_not allow_value(2.5).for(:duration) }
      it { is_expected.to_not allow_value(-5).for(:duration) }
      it { is_expected.to_not allow_value(0).for(:duration) }   
    end

    describe "#title" do
      it { expect(@event).to validate_presence_of(:title) }
    end

    describe "#description" do
      it { expect(@event).to validate_presence_of(:description) } 
    end

    describe "#location" do
      it { expect(@event).to validate_presence_of(:location) }    
    end

    describe "#price" do
      it { expect(@event).to validate_presence_of(:price) } 
    end

  end

  context "associations" do
    it { expect(@event).to have_many(:attendances) }
    it { expect(@event).to belong_to(:admin) }
  end
end