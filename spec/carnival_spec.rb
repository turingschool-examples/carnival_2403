require "./spec/spec_helper"

RSpec.describe Carnival do
  before(:each) do
    @carnival = Carnival.new(14)
  end

  it "exists" do
    expect(@carnival).to be_instance_of Carnival
  end
end