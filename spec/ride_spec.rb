require "./spec/spec_helper"

describe Ride do
    before(:each) do
        @ride_1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

        @ride_2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })

        @ride_3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

        @visitor = Visitor.new('Bruce', 54, '$10')
        @visitor_2 = Visitor.new('Tucker', 36, '$5')
        @visitor_3 = Visitor.new('Penny', 64, '$15')
    end

    describe "#initialize" do
        it "creates a new ride with a name, minimum height, admission fee, and excitement level, total_revenue" do
            expect(@ride_1.name).to eq('Carousel')
            expect(@ride_1.min_height).to eq(24)
            expect(@ride_1.admission_fee).to eq(1)
            expect(@ride_1.excitement).to eq(:gentle)
            expect(@ride_1.total_revenue).to eq(0)
            expect(@ride_1.rider_log).to eq({})
        end
    end

    describe "#board_rider" do
        it "adds a rider to the ride and subtracts ride fee from spending money" do
            @visitor.add_preference(:gentle)
            @visitor_2.add_preference(:gentle)

            @ride_1.board_rider(@visitor)
            @ride_1.board_rider(@visitor_2)
            @ride_1.board_rider(@visitor)

            expect(@ride_1.rider_log).to eq({ @visitor => 2, @visitor_2 => 1 })
            expect(@visitor.spending_money).to eq('$8')
            expect(@visitor_2.spending_money).to eq('$4')
        end
    end

    describe "#rider_log" do
        it "returns a hash of riders on the ride with amount of time they ride it" do
            @visitor.add_preference(:gentle)
            @visitor_2.add_preference(:gentle)

            @ride_1.board_rider(@visitor)
            @ride_1.board_rider(@visitor_2)
            @ride_1.board_rider(@visitor)

            expect(@ride_1.rider_log).to eq({ @visitor => 2, @visitor_2 => 1 })
        end
    end

    describe "#total_revenue" do
        it "returns the total revenue of the ride" do
            @visitor.add_preference(:gentle)
            @visitor_2.add_preference(:gentle)

            @ride_1.board_rider(@visitor)
            @ride_1.board_rider(@visitor_2)

            expect(@ride_1.total_revenue).to eq(2)
        end
    end
end