require "./spec/spec_helper"
require "pry"

RSpec.describe Carnival do
    before(:all) do 
        @carnival1 = Carnival.new(14)
        @carnival2 = Carnival.new(7)
        @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
        @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
        @visitor1 = Visitor.new('Bruce', 54, '$10')
        @visitor2 = Visitor.new('Tucker', 36, '$5')
        @visitor3 = Visitor.new('Penny', 64, '$15')
    end

    describe "#initialize" do
        it "can initialize" do
            expect(@carnival1).to be_an_instance_of (Carnival)
        end

        it "can initialize with a duration" do
            expect(@carnival1.duration).to eq (14)
        end

        it "can initialize with all rides" do
            expect(@carnival1.rides).to eq ([])
        end
    end

    describe "#add_ride" do
        it "can add rides to a carnvial" do
            expect(@carnival1.rides).to eq ([])

            @carnival1.add_ride(@ride1)
            expect(@carnival1.rides).to eq ([@ride1])

            @carnival1.add_ride(@ride3)
            expect(@carnival1.rides).to eq ([@ride1, @ride3])

            @carnival2.add_ride(@ride3)
            expect(@carnival2.rides).to eq ([@ride3])

            expect(@carnival1.rides).to eq ([@ride1, @ride3])
        end
    end

    describe "#total_revenue" do
        it "can calculate the total revenue for a carnival" do
            expect(@ride1.rider_log).to eq({})
            expect(@ride1.total_revenue).to eq (0)

            @visitor1.add_preference(:gentle)
            @visitor2.add_preference(:gentle)

            @ride1.board_rider(@visitor1)
            @ride1.board_rider(@visitor2)
            @ride1.board_rider(@visitor1)

            expect(@ride1.rider_log).to eq({@visitor1 => 2, @visitor2 => 1})

            expect(@visitor1.spending_money).to eq (8)
            expect(@visitor2.spending_money).to eq (4)

            expect(@ride1.total_revenue).to eq (3)
            
            @visitor2.add_preference(:thrilling)
            @visitor3.add_preference(:thrilling)

            @ride3.board_rider(@visitor1)
            @ride3.board_rider(@visitor2)
            @ride3.board_rider(@visitor3)

            expect(@visitor1.spending_money).to eq (8)
            expect(@visitor2.spending_money).to eq (4)
            expect(@visitor3.spending_money).to eq (13)

            expect(@ride3.total_revenue).to eq (2)
            expect(@ride3.rider_log).to eq({@visitor3 => 1})
            
            expect(@carnival1.total_revenue).to eq (5)
            expect(@carnival2.total_revenue).to eq (2)
        end
    end

    describe "#most_profitiable_ride" do
        it "can calculate the most profitiable ride in a given carnival" do
            expect(@carnival1.most_profitable_ride).to eq(@ride1)
        end
    end


end