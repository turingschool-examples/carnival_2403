require "./spec/spec_helper"

RSpec.describe Ride do
    before(:all) do 
        @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
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
        
    end
    
    describe "#total_revenue" do
        it "can return total_revenue" do
            expect(@ride1.total_revenue).to eq (0)
        end
    end
end
