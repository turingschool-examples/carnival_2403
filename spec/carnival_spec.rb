require "./spec/spec_helper"

RSpec.describe Carnival do 

    it 'initializes' do
        carnival_A = Carnival.new(14)

        expect(carnival_A).to be_an_instance_of Carnival
    end
end