require "./spec/spec_helper"

RSpec.describe Visitor do
  before do
    @visitor1 = Visitor.new('Bruce', 54, '$10')
  end

  describe 'initialize' do
    it 'can create a visitor object' do
      expect(@visitor1).to be_a(Visitor)
    end

    it 'has attributes' do
      expect(@visitor1.name).to eq('Bruce')
      expect(@visitor1.height).to eq(54)
      expect(@visitor1.spending_money).to eq(10)
    end

    it 'has an empty array of preferences' do
      expect(@visitor1.preferences).to eq([])
    end
  end

  describe 'preferences' do
    it 'can add preferences to the preferences array' do
      @visitor1.add_preference(:gentle)
      @visitor1.add_preference(:thrilling)

      expect(@visitor1.preferences).to eq([:gentle, :thrilling])
    end
  end

  describe 'height check' do
    it 'can check to see if a visitor is tall enough for a ride' do
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')

      expect(@visitor1.tall_enough(54)).to be(true)
      expect(visitor2.tall_enough(54)).to be(false)
      expect(visitor3.tall_enough(54)).to be(true)
      expect(@visitor1.tall_enough(64)).to be(false)
    end
  end
end