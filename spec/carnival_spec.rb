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

    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
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

  describe "#most_popular_ride" do
    it "returns the Ride object that has been ridden the most" do
      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride2)
      @carnival.add_ride(@ride3)

      @visitor1.add_preference(:gentle)
      @visitor3.add_preference(:thrilling)

      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor1)

      @ride3.board_rider(@visitor3)

      expect(@carnival.most_popular_ride).to eq @ride1
    end
  end

  # describe "#most_profitable_ride" do
  #   it "returns the Ride object that has earned the most" do
  #     @carnival.add_ride(@ride1)
  #     @carnival.add_ride(@ride2)
  #     @carnival.add_ride(@ride3)

  #     @visitor1.add_preference(:gentle)
  #     @visitor2.add_preference(:gentle)

  #     @ride1.board_rider(@visitor1)
  #     @ride1.board_rider(@visitor1)
  #     @ride1.board_rider(@visitor1)
  #     @ride1.board_rider(@visitor1)

  #     @ride2.board_rider(@visitor2)

  #     expect(@carnival.most_profitable_ride).to eq @ride2
  #   end
  # end

  describe "#total_revenue" do
    it "calculates the total revenue earned from all rides" do
      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride2)
      @carnival.add_ride(@ride3)

      @visitor1.add_preference(:gentle)
      @visitor2.add_preference(:gentle)
      @visitor3.add_preference(:thrilling)

      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor1)

      @ride2.board_rider(@visitor2)

      @ride3.board_rider(@visitor3)

      expect(@carnival.total_revenue).to eq 10
    end
  end
end