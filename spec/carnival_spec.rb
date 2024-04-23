require "./spec/spec_helper"

RSpec.describe Carnival do
  before(:each) do
    @carnival = Carnival.new(14)
  end

  describe "#initialize" do
    it "exists" do
      expect(@carnival).to be_instance_of Carnival
    end

    it "has a duration" do
      expect(@carnival.duration).to eq 14
    end

    it "has a list of rides" do
      expect(@carnival.rides).to eq []
    end
  end
end