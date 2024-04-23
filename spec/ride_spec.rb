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
    
    @visitor3 = Visitor.new('Penny', 64, '$15')
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
  end
end