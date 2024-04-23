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
      expect(visitor1.spending_money).to eq(10)
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

  describe '#tall_enough?' do
    it 'can check if tall enough for provided height' do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')

      expect(visitor1.tall_enough?(54)).to be true
      expect(visitor2.tall_enough?(54)).to be false
      expect(visitor3.tall_enough?(54)).to be true
      expect(visitor1.tall_enough?(64)).to be false
    end
  end

 end
 