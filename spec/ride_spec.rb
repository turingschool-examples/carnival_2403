require "./spec/spec_helper"

RSpec.describe Ride do
    before(:each) do
        @visitor1 = Visitor.new('Bruce', 54, '$10')
        @visitor2 = Visitor.new('Tucker', 36, '$5')
        @visitor3 = Visitor.new('Penny', 64, '$15')
        @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
        @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
    end
    describe "#initialize" do
        it "exists" do
            expect(@ride1).to be_a(Ride)
        end

        it "has attributes" do
            expect(@ride1.name).to eq("Carousel")
            expect(@ride1.min_height).to eq(24)
            expect(@ride1.admission_fee).to eq(1)
            expect(@ride1.excitement).to eq(:gentle)
            expect(@ride1.rider_log).to eq({})
        end
    end
end