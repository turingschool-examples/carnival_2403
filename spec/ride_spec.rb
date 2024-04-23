require "./spec/spec_helper"
require 'pry'

describe Ride do
    let(:visitor1) {Visitor.new("Bruce", 54, "10")}
    let(:visitor2) {Visitor.new('Tucker', 36, '$5')}
    let(:visitor3) {Visitor.new('Penny', 64, '$15')}
    let(:visitor4) {Visitor.new('Jenny', 22, '$10')}

    describe "initialization" do
        it "can create a new ride with info" do
            ride1 = Ride.new({name: "Carousel", min_height: 24, admission: 1, excitement: :gentle})
            expect(ride1.name).to eq("Carousel")
            expect(ride1.min_height).to eq(24)
            expect(ride1.admission).to eq(1)
            expect(ride1.excitement).to eq(:gentle)
        end
    end
    
    describe "boarding" do
        it "can board a visitor that passes the info" do
            ride1 = Ride.new({name: "Carousel", min_height: 24, admission: 1, excitement: :gentle})
            visitor1.add_preference(:gentle)
            visitor2.add_preference(:gentle)
            ride1.board_rider(visitor1)
            ride1.board_rider(visitor2)
            expect(ride1.rider_log).to eq({visitor1 => 1, visitor2 => 1})
        end
        
        it "stops someone not tall enough from boarding" do
            ride1 = Ride.new({name: "Carousel", min_height: 24, admission: 1, excitement: :gentle})
            ride1.board_rider(visitor2)
            expect(ride1.rider_log).to eq({visitor2 => 1})
            ride1.board_rider(visitor4)
            expect(ride1.rider_log).to eq({visitor2 => 1})
        end
        
        it "stops someone who can't afford boarding" do
            ride = Ride.new({ name: 'Carousel', min_height: 24, admission: 11, excitement: :gentle })
            ride.board_rider(visitor1)
            expect(ride.rider_log).to eq({})
            expect(visitor1.spending_money).to eq(10)
        end

        it "stops someone who doesn't have the preferences" do
            
        end
    end
end