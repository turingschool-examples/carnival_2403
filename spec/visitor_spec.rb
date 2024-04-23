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
      expect(@visitor1.spending_money).to eq('$10')
    end

    it 'has an empty array of preferences' do
      expect(@visitor1.preferences).to eq([])
    end
  end
end