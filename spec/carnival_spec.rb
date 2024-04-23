require "./spec/spec_helper"

RSpec.describe Carnival do
  before do
    @carnival1 = Carnival.new("Boulder Carnival", 14)
  end

  describe 'initialize' do
    it 'can create a carnival object' do
      expect(@carnival1).to be_a(Carnival)
    end

    it 'has attributes' do
      expect(@carnival1.name).to eq("Boulder Carnival")
      expect(@carnival1.duration).to eq(14)
      expect(@carnival1.rides).to eq([])
    end
  end
end