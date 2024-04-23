require "./spec/spec_helper"

RSpec.describe Ride do
    before(:each) do
        @visitor1 = Visitor.new('Bruce', 54, '$10')
        @visitor2 = Visitor.new('Tucker', 36, '$5')
        @visitor3 = Visitor.new('Penny', 64, '$15')
        @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
        @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
        @visitor1.add_preference(:gentle)
        @visitor2.add_preference(:gentle)
        @visitor2.add_preference(:thrilling)
        @visitor3.add_preference(:thrilling)
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

    describe "#board_rider" do
        it "will update total_revenue when rider is boarded" do
            @ride1.board_rider(@visitor1)
            @ride1.board_rider(@visitor2)

            expect(@ride1.total_revenue).to eq(2)
        end

        it "will update rider log" do
            @ride1.board_rider(@visitor1)
            @ride1.board_rider(@visitor1)
            @ride1.board_rider(@visitor2)

            expect(@ride1.rider_log).to eq({@visitor1 => 2, @visitor2 => 1})
        end

        it "will update visitor's spending money once boarded" do
            @ride1.board_rider(@visitor1)
            @ride1.board_rider(@visitor2)

            expect(@visitor1.spending_money).to eq(9)
            expect(@visitor2.spending_money).to eq(4)
        end

        it "won't board rider if any condition is not met" do
            @visitor4 = Visitor.new('James', 72, '$1')
            @visitor4.add_preference(:thrilling)
            @ride3.board_rider(@visitor2) #visitor not tall enough
            @ride3.board_rider(@visitor1) #ride not in visitor preferences
            @ride3.board_rider(@visitor4) #visitor doesn't have enough money

            expect(@ride3.rider_log).to eq({})
        end

    end
end