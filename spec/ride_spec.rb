require "./spec/spec_helper"

describe Ride do
    let(:visitor1) {Visitor.new("Bruce", 54, "10")}
    let(:visitor2) {Visitor.new('Tucker', 36, '$5')}
    let(:visitor3) {Visitor.new('Penny', 64, '$15')}

    describe "initialization" do
        it "can create a new ride with info" do
            ride1 = Ride.new({name: "Carousel", min_height: 24, admission: 1, excitement: :gentle})
            expect(ride1.name).to eq("Carousel")
            expect(ride1.min_height).to eq(24)
            expect(ride1.admission).to eq(1)
            expect(ride1.excitement).to eq(:gentle)
        end
    end
end