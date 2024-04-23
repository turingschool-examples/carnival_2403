require "./spec/spec_helper"

RSpec.describe Carnival do
    it 'exists' do
        carnival1 = Carnival.new('6 hours')
        expect(carnival1).to be_a Carnival
    end

end