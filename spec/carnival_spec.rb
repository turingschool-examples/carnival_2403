require "./spec/spec_helper"

RSpec.describe Carnival do
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
        @carnival1 = Carnival.new(14)
    end

    describe "#initialize" do
        it "exists" do
            expect(@carnival1).to be_a(Carnival)
        end

        it "has a duration" do
            expect(@carnival1.duration).to eq(14)
        end

        it "defaults rides as an empty array" do
            expect(@carnival1.rides).to eq([])
        end
    end

    describe "#add_ride" do
        it "can add ride objects to @rides" do
            @carnival1.add_ride(@ride1)
            @carnival1.add_ride(@ride2)

            expect(@carnival1.rides).to eq([@ride1, @ride2])
        end
    end

    describe "#most_popular_ride" do
        it "can return most popular ride" do
            @carnival1.add_ride(@ride1)
            @carnival1.add_ride(@ride2)
            @carnival1.add_ride(@ride3)

            @ride1.board_rider(@visitor1)
            @ride1.board_rider(@visitor2)
            @ride2.board_rider(@visitor2)
            @ride3.board_rider(@visitor3)

            expect(@carnival1.most_popular_ride).to eq(@ride1)
        end
    end

    describe "#most_profitable_ride" do
        it "can return most profitable ride" do
            @carnival1.add_ride(@ride1)
            @carnival1.add_ride(@ride2)
            @carnival1.add_ride(@ride3)

            @ride1.board_rider(@visitor1)
            @ride1.board_rider(@visitor1)
            @ride2.board_rider(@visitor2)
            @ride3.board_rider(@visitor3)

            expect(@carnival1.most_profitable_ride).to eq(@ride2)
        end
    end

    describe "#total_revenue" do
        it "can return total revenue of all rides" do
            @carnival1.add_ride(@ride1)
            @carnival1.add_ride(@ride2)
            @carnival1.add_ride(@ride3)

            @ride1.board_rider(@visitor1)
            @ride1.board_rider(@visitor1)
            @ride2.board_rider(@visitor2)
            @ride3.board_rider(@visitor3)

            expect(@carnival1.total_revenue).to eq(9)
        end
    end

    describe "#summary" do
        it "can create summary hash" do
            @carnival1.add_ride(@ride1)
            @carnival1.add_ride(@ride2)
            @carnival1.add_ride(@ride3)

            @ride1.board_rider(@visitor1)
            @ride1.board_rider(@visitor1)
            @ride2.board_rider(@visitor2)
            @ride3.board_rider(@visitor3)

            expected_hash = {visitor_count: 3,
                            revenue_earned: 9,
                            visitors: [{visitor: @visitor1,
                                        favorite_ride: @ride1,
                                        total_money_spent: 2},
                                        {visitor: @vistor2,
                                        favorite_ride: @ride2,
                                        total_money_spent: 5},
                                        {visitor: @visitor3,
                                        favorite_ride: @ride3,
                                        total_money_spent: 2}],
                            rides: [{ride: @ride1,
                                    riders: @visitor1,
                                    total_revenue: 2},
                                    {ride: @ride2,
                                    riders: @visitor2,
                                    total_revenue: 5},
                                    {ride: @ride3,
                                    riders: @visitor3,
                                    total_revenue: 2}]}
            
            expect(@carnival1.summary).to eq(expected_hash)
        end
    end

end