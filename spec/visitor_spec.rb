require "./spec/spec_helper"

describe Visitor do
    before(:each) do
        @visitor = Visitor.new('Bruce', 54, '$10')
        @visitor_2 = Visitor.new('Tucker', 36, '$5')
        @visitor_3 = Visitor.new('Penny', 64, '$15')
    end

    describe "#initialize" do
        it "creates a new visitor with a name, height, and spending money" do
            expect(@visitor.name).to eq('Bruce')
            expect(@visitor.height).to eq(54)
            expect(@visitor.spending_money).to eq('$10')
            expect(@visitor.preferences).to eq([])
        end
    end

    describe "#add_preference" do
        it "adds a preference to the visitor" do
            @visitor.add_preference(:gentle)
            @visitor.add_preference(:thrilling)
            
            expect(@visitor.preferences).to eq([:gentle, :thrilling])
        end
    end

    describe "#tall_enough?" do
        it "returns true if the visitor is tall enough" do
            expect(@visitor.tall_enough?(54)).to eq(true)
            expect(@visitor_3.tall_enough?(54)).to eq(true)
        end

        it "returns false if the visitor is not tall enough" do
            expect(@visitor_2.tall_enough?(54)).to eq(false)
            expect(@visitor_2.tall_enough?(64)).to eq(false)
        end
    end
end