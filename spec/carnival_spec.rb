require './spec/spec_helper'

describe Carnival do
    before(:each) do
        @carnival = Carnival.new(7)

        @ride_1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        @ride_2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
        @ride_3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

        @visitor = Visitor.new('Bruce', 54, '$10')
        @visitor_2 = Visitor.new('Tucker', 36, '$5')
        @visitor_3 = Visitor.new('Penny', 64, '$15')
    end

    # use README.md to write test
    describe "#initialize" do
        it "creates a new carnival with a duration, rides, total_revenue" do
            expect(@carnival.duration).to eq(7)
            expect(@carnival.rides).to eq([])
            expect(@carnival.total_revenue).to eq(0)
        end
    end

    describe "#add_ride" do
        it "adds a ride to the carnival" do
            @carnival.add_ride(@ride_1)
            @carnival.add_ride(@ride_2)
            @carnival.add_ride(@ride_3)

            expect(@carnival.rides).to eq([@ride_1, @ride_2, @ride_3])
        end
    end

    describe "#most_popular_ride" do
        it "returns the ride with the most riders" do
            @visitor.add_preference(:gentle)
            @visitor_2.add_preference(:gentle)
            @visitor_3.add_preference(:thrilling)
            
            @carnival.add_ride(@ride_1)
            @carnival.add_ride(@ride_2)
            @carnival.add_ride(@ride_3)

            @ride_1.board_rider(@visitor)
            @ride_1.board_rider(@visitor_2)
            @ride_1.board_rider(@visitor)

            @ride_2.board_rider(@visitor_2)

            @ride_3.board_rider(@visitor_3)


            expect(@carnival.most_popular_ride).to eq(@ride_1)
        end
    end

    describe "#most_profitable_ride" do
        it "returns the ride with the most revenue" do
            @visitor.add_preference(:gentle)
            @visitor_2.add_preference(:gentle)
            @visitor_3.add_preference(:thrilling)
            
            @carnival.add_ride(@ride_1)
            @carnival.add_ride(@ride_2)
            @carnival.add_ride(@ride_3)

            @ride_1.board_rider(@visitor)
            @ride_1.board_rider(@visitor_2)
            @ride_1.board_rider(@visitor)

            @ride_2.board_rider(@visitor_2)

            @ride_3.board_rider(@visitor_3)

            expect(@carnival.most_profitable_ride).to eq(@ride_2)
        end
    end

    describe "#calculate_revenue" do
        it "returns the total revenue of the carnival rides" do
            @visitor.add_preference(:gentle)
            @visitor_2.add_preference(:gentle)
            @visitor_3.add_preference(:thrilling)
            
            @carnival.add_ride(@ride_1)
            @carnival.add_ride(@ride_2)
            @carnival.add_ride(@ride_3)

            @ride_1.board_rider(@visitor)
            @ride_1.board_rider(@visitor_2)
            @ride_1.board_rider(@visitor)

            @ride_2.board_rider(@visitor_2)

            @ride_3.board_rider(@visitor_3)

            expect(@carnival.calculate_revenue).to eq(10)
        end
    end
end