require "./spec/spec_helper"
require "./lib/visitor.rb"

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Visitor do

    it 'Initializes' do
        visitor1 = Visitor.new('Bruce', 54, '$10')
        visitor2 = Visitor.new('Tucker', 36, '$5')
        visitor3 = Visitor.new('Penny', 64, '$15')

        expect(visitor1).to be_an_instance_of(Visitor)
    end

    it 'can add preferences' do
        visitor1 = Visitor.new('Bruce', 54, '$10')
        visitor2 = Visitor.new('Tucker', 36, '$5')
        visitor3 = Visitor.new('Penny', 64, '$15')

        visitor1.add_preference(:gentle)
        visitor1.add_preference(:thrilling)

        expect(visitor1.preferences).to eq([:gentle, :thrilling])
    end

    it 'can check that it is tall enough' do
        visitor1 = Visitor.new('Bruce', 54, '$10')
        visitor2 = Visitor.new('Tucker', 36, '$5')
        visitor3 = Visitor.new('Penny', 64, '$15')

        expect(visitor1.tall_enough?(54)).to eq(true)
        expect(visitor2.tall_enough?(54)).to eq(false)
        expect(visitor3.tall_enough?(54)).to eq(true)
    end
end