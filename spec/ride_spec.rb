require "./spec/spec_helper"

RSpec.describe Ride do
    before(:all) do 
        @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        @visitor1 = Visitor.new('Bruce', 54, '$10')
        @visitor2 = Visitor.new('Tucker', 36, '$5')
        @visitor3 = Visitor.new('Penny', 64, '$15')
    end

    describe "#initialize" do
        it "can initialize" do
            expect(@ride1).to be_an_instance_of (Ride)
        end

        it "can initialize wtih a name" do
            expect(@ride1.name).to eq('Carousel')
        end

        it "can initialize wtih a minimum height" do
            expect(@ride1.min_height).to eq(24)
        end

        it "can initialize wtih an admission fee" do
            expect(@ride1.admission_fee).to eq(1)
        end

        it "can initialize wtih excitement level" do
            expect(@ride1.excitement).to eq(:gentle)
        end
        
        it "can initialize wtih history of riders" do
            expect(@ride1.rider_log).to eq({})
        end

        it "can return total_revenue" do
            expect(@ride1.total_revenue).to eq (0)
        end
        
    end

    describe "#board_rider" do
        it "can board elgible riders" do
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
        end
    end
end
