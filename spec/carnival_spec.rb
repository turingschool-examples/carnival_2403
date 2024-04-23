require "./spec/spec_helper"

RSpec.describe Carnival do
  before(:each) do
    @carnival = Carnival.new(14)

    @ride1 = Ride.new({ name: 'Carousel', 
      min_height: 24, 
      admission_fee: 1, 
      excitement: :gentle })
    
    @ride2 = Ride.new({ name: 'Ferris Wheel', 
      min_height: 36, 
      admission_fee: 5, 
      excitement: :gentle })
    
    @ride3 = Ride.new({ name: 'Roller Coaster', 
      min_height: 54, 
      admission_fee: 2, 
      excitement: :thrilling })
  end

  describe "#initialize" do
    it "exists" do
      expect(@carnival).to be_instance_of Carnival
    end

    it "has a duration" do
      expect(@carnival.duration).to eq 14
    end

    it "has a list of rides" do
      expect(@carnival.rides).to eq []
    end
  end

  describe "#add_ride" do
    it "can add Ride objects to list" do
      expect(@carnival.rides).to eq []

      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride2)
      @carnival.add_ride(@ride3)

      expect(@carnival.rides).to eq [@ride1, @ride2, @ride3]
    end
  end
end