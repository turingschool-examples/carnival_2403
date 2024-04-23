require "./spec/spec_helper"

RSpec.describe Visitor do
  describe 'initialize' do
    it 'exists' do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      expect(visitor1).to be_a(Visitor)
    end

    it 'has a name' do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      expect(visitor1.name).to eq('Bruce')
    end

    it 'has a height' do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      expect(visitor1.height).to eq(54)
    end

    it 'has spending_money' do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      expect(visitor1.spending_money).to eq('$10')
    end
  end
 
  describe '#add_preference' do
    it 'has no preferences by default' do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      expect(visitor1.preferences).to eq([])
    end

    it 'can add preferences' do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor1.add_preference(:gentle)
      visitor1.add_preference(:thrilling)
      expect(visitor1.preferences).to eq([:gentle, :thrilling])
    end
  end
 end
 