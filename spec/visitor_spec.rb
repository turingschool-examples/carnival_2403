require "./spec/spec_helper"

describe Visitor do
    describe "initialization" do
        it "can create a new Visitor" do
            visitor1 = Visitor.new("Bruce", 54, "$10")
            expect(visitor1.name).to eq("Bruce")
            expect(visitor1.height).to eq(54)
            expect(visitor1.spending_money).to eq(10)
        end
    end

    describe "add_preference" do
        it "can add a preference" do
            visitor1 = Visitor.new("Bruce", 54, "$10")
            visitor1.add_preference(:gentle)
            visitor1.add_preference(:thrilling)
            expect(visitor1.preferences).to eq([:gentle, :thrilling])
        end
    end

    describe "tall_enough?" do
        it "returns whether the visitor is tall enough" do
            visitor1 = Visitor.new("Bruce", 54, "$10")
            visitor2 = Visitor.new("Tucker", 36, '$5')
            expect(visitor1.tall_enough?(54)).to eq(true)
            expect(visitor2.tall_enough?(54)).to eq(false)
        end
    end
end