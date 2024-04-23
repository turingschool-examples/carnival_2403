require "./spec/spec_helper"

RSpec.describe Carnival do
  before do
    carnival1 = Carnival.new("Boulder Carnival")
  end

  describe 'initialize' do
    it 'can create a carnival object' do
      expect(carnival1).to be_a(Carnival)
    end
  end
end