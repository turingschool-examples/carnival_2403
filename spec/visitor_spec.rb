require "./spec/spec_helper"

RSpec.describe Visitor do
    before(:all) do 
        @visitor1 = Visitor.new('Bruce', 54, '$10')
        @visitor2 = Visitor.new('Tucker', 36, '$5')
        @visitor3 = Visitor.new('Penny', 64, '$15')
    end

    describe "#initialize" do
        it "can initialize" do
            expect(@visitor1).to be_an_instance_of (Visitor)
        end

        it "can initialize wtih a name" do
            expect(@visitor1.name).to eq('Bruce')
        end

        it "can initialize wtih a height" do
            expect(@visitor1.height).to eq(54)
        end

        it "can initialize wtih spending money" do
            expect(@visitor1.spending_money).to eq(10)
        end

        it "can initialize wtih preferences" do
            expect(@visitor1.preferences).to eq([])
        end
    end

    describe "#add_preferences" do
        it "can add a preference" do
            expect(@visitor1.preferences).to eq([])

            @visitor1.add_preference(:gentle)
            expect(@visitor1.preferences).to eq([:gentle])

            @visitor1.add_preference(:thrilling)
            expect(@visitor1.preferences).to eq([:gentle, :thrilling])
        end
    end
    
    describe "#tall_enough?" do
        it "can add determine if visitor is tall enough" do
            expect(@visitor1.tall_enough?(54)).to be true

            expect(@visitor2.tall_enough?(54)).to be false

            expect(@visitor3.tall_enough?(54)).to be true

            expect(@visitor1.tall_enough?(64)).to be false
        end
    end
    #  visitor1.tall_enough?(54)
    # #=> true

    #  visitor2.tall_enough?(54)
    # #=> false

    #  visitor3.tall_enough?(54)
    # #=> true

    #  visitor1.tall_enough?(64)
end