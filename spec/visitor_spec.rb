require "./spec/spec_helper"

RSpec.describe Visitor do
  before do
    @visitor1 = Visitor.new('Bruce', 54, '$10')
  end

  describe 'initialize' do
    it 'can create a visitor object' do
      expect(@visitor1).to be_a(Visitor)
    end
  end
end