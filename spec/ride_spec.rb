require "./spec/spec_helper"

RSpec.describe Ride do
  before(:each) do
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
    @visitor1.add_preference(:gentle)

    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor2.add_preference(:gentle)
    @visitor2.add_preference(:thrilling)

    @visitor3 = Visitor.new('Penny', 64, '$15')
    @visitor3.add_preference(:thrilling)
  end

  describe "#initialize" do
    it "exists" do
      expect(@ride1).to be_instance_of Ride
    end

    it "has a name" do
      expect(@ride1.name).to eq "Carousel"
    end

    it "has a min_height" do
      expect(@ride1.min_height).to eq 24
    end

    it "has an admission fee" do
      expect(@ride1.admission_fee).to eq 1
    end

    it "has an excitement level" do
      expect(@ride1.excitement).to eq :gentle
    end

    it "can track total revenue" do
      expect(@ride1.total_revenue).to eq 0
    end

    it "has a rider log" do
      # expect(@ride1.rider_log).to eq {}
    end
  end

  describe "#board_rider" do
    it "subtracts the rides admission fee from the Visitors spending money" do
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)

      expect(@visitor1.spending_money).to eq 8
      expect(@visitor2.spending_money).to eq 4
    end

    it "adds the Visitor object to the rider_log Hash as the key, number of times ridden as value" do
      # expect(@ride1.rider_log).to eq {}

      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)

      expected = {
        @visitor1 => 2,
        @visitor2 => 1
      }

      expect(@ride1.rider_log).to eq expected
    end

    it "adds the revenue to the total_revenue" do
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)

      expect(@ride1.total_revenue).to eq 3
    end

    it "only adds Visitor to rider log if they have are tall enough and have that preference of excitement" do
      @ride3.board_rider(@visitor1)
      @ride3.board_rider(@visitor2)
      @ride3.board_rider(@visitor3)

      expect(@ride3.min_height).to eq 54

      expect(@visitor1.height).to eq 54
      expect(@visitor1.preferences).to eq [:gentle]

      expect(@visitor2.height).to eq 36
      expect(@visitor2.preferences).to eq [:gentle, :thrilling]

      expect(@visitor3.height).to eq 64
      expect(@visitor3.preferences).to eq [:thrilling]

      expected = {
        @visitor3 => 1
      }

      expect(@ride3.rider_log).to eq expected
    end
  end
end