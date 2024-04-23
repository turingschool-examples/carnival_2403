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

    describe "#carnival_results" do
        it "returns a hash of carnival results" do
            @visitor.add_preference(:gentle)
            @visitor_2.add_preference(:gentle)
            @visitor_3.add_preference(:thrilling)

            @carnival.add_visitor(@visitor)
            @carnival.add_visitor(@visitor_2)
            @carnival.add_visitor(@visitor_3)
            
            @carnival.add_ride(@ride_1)
            @carnival.add_ride(@ride_2)
            @carnival.add_ride(@ride_3)

            @ride_1.board_rider(@visitor)
            @ride_1.board_rider(@visitor_2)
            @ride_1.board_rider(@visitor)

            @ride_2.board_rider(@visitor_2)

            @ride_3.board_rider(@visitor_3)

            @carnival.calculate_revenue
            @carnival.generate_carnival_results

            expect(@carnival.carnival_results).to eq(
                {
                visitor_count: 3,
                revenue: 10,
                visitors: [
                    { 
                        visitor: @visitor,
                        favorite_ride: @ride_1,
                        total_money_spent: 2 
                    },
                    {
                        visitor: @visitor_2, 
                        favorite_ride: @ride_1 || @ride_2, # need logic to fix this situation
                        total_money_spent: 6 
                    },
                    {
                        visitor: @visitor_3, 
                        favorite_ride: @ride_3,
                        total_money_spent: 2 }
                ],
                rides: [
                    {
                        ride: @ride_1,
                        riders: { @visitor => 2, @visitor_2 => 1 },
                        total_revenue: 3
                    },
                    {
                        ride: @ride_2,
                        riders: { @visitor_2 => 1 },
                        total_revenue: 5
                    },
                    {
                        ride: @ride_3,
                        riders: { @visitor_3 => 1 },
                        total_revenue: 2
                    }
                ]
                
            }
            )
        end
        
    end

    describe "#add_visitor" do
        it "adds a visitor to the carnival" do
            @carnival.add_visitor(@visitor)
            @carnival.add_visitor(@visitor_2)
            @carnival.add_visitor(@visitor_3)

            expect(@carnival.visitors).to eq([@visitor, @visitor_2, @visitor_3])
        end
    end

    describe "#calculate_visitor_data" do
        it "returns an array of visitor data" do
            @visitor.add_preference(:gentle)
            @visitor_2.add_preference(:gentle)
            @visitor_3.add_preference(:thrilling)

            @carnival.add_visitor(@visitor)
            @carnival.add_visitor(@visitor_2)
            @carnival.add_visitor(@visitor_3)
            
            @carnival.add_ride(@ride_1)
            @carnival.add_ride(@ride_2)
            @carnival.add_ride(@ride_3)

            @ride_1.board_rider(@visitor)
            @ride_1.board_rider(@visitor_2)
            @ride_1.board_rider(@visitor)

            @ride_2.board_rider(@visitor_2)

            @ride_3.board_rider(@visitor_3)

            @carnival.calculate_revenue

            expect(@carnival.calculate_visitor_data).to eq([
                {
                    visitor: @visitor,
                    favorite_ride: @ride_1,
                    total_money_spent: 2
                },
                {
                    visitor: @visitor_2,
                    favorite_ride: @ride_1 || @ride_2,
                    total_money_spent: 6
                },
                {
                    visitor: @visitor_3,
                    favorite_ride: @ride_3,
                    total_money_spent: 2
                }
            ])
        end

        describe "#calculate_ride_data" do
            it "returns an array of ride data" do
                @visitor.add_preference(:gentle)
                @visitor_2.add_preference(:gentle)
                @visitor_3.add_preference(:thrilling)

                @carnival.add_visitor(@visitor)
                @carnival.add_visitor(@visitor_2)
                @carnival.add_visitor(@visitor_3)
                
                @carnival.add_ride(@ride_1)
                @carnival.add_ride(@ride_2)
                @carnival.add_ride(@ride_3)

                @ride_1.board_rider(@visitor)
                @ride_1.board_rider(@visitor_2)
                @ride_1.board_rider(@visitor)

                @ride_2.board_rider(@visitor_2)

                @ride_3.board_rider(@visitor_3)

                @carnival.calculate_revenue

                expect(@carnival.calculate_ride_data).to eq([
                    {
                        ride: @ride_1,
                        riders: { @visitor => 2, @visitor_2 => 1 },
                        total_revenue: 3
                    },
                    {
                        ride: @ride_2,
                        riders: { @visitor_2 => 1 },
                        total_revenue: 5
                    },
                    {
                        ride: @ride_3,
                        riders: { @visitor_3 => 1 },
                        total_revenue: 2
                    }
                ])
            end
        end

        describe "#find_favorite_ride" do
            it "returns the visitor's favorite ride" do
                @visitor.add_preference(:gentle)
                @visitor_2.add_preference(:gentle)
                @visitor_3.add_preference(:thrilling)

                @carnival.add_visitor(@visitor)
                @carnival.add_visitor(@visitor_2)
                @carnival.add_visitor(@visitor_3)
                
                @carnival.add_ride(@ride_1)
                @carnival.add_ride(@ride_2)
                @carnival.add_ride(@ride_3)

                @ride_1.board_rider(@visitor)
                @ride_1.board_rider(@visitor_2)
                @ride_1.board_rider(@visitor)

                @ride_2.board_rider(@visitor_2)

                @ride_3.board_rider(@visitor_3)

                @carnival.calculate_revenue

                expect(@carnival.find_favorite_ride(@visitor)).to eq(@ride_1)
                expect(@carnival.find_favorite_ride(@visitor_2)).to eq(@ride_1 || @ride_2) # need logic to fix this situation
                expect(@carnival.find_favorite_ride(@visitor_3)).to eq(@ride_3)
            end
        end

    end
end