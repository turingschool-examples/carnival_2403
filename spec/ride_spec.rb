require "./spec/spec_helper"

RSpec.describe Ride do
  before(:each) do
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
    @visitor3.add_preference(:thrilling)
  end
  it 'can initialize' do

    expect(@ride1.name).to eq "Carousel"
    expect(@ride1.min_height).to eq 24
    expect(@ride1.admission_fee).to eq 1
    expect(@ride1.excitement).to eq :gentle
    expect(@ride1.total_revenue).to eq 0
  end

  it 'can board_rider' do
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor1)

    expect(@ride1.rider_log).to eq ({@visitor1 => 2, @visitor2 => 1})
  end

  it "charges admission from visitor when boarding" do
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor1)

    expect(@visitor1.spending_money).to eq 8
    expect(@visitor2.spending_money).to eq 4
  end

  it "collects revenue from visitor when boarding" do
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor1)

    expect(@ride1.total_revenue).to eq 3
  end

  it 'can board only if they have enough money' do
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride2.board_rider(@visitor1)
    @ride2.board_rider(@visitor2)

    expect(@ride1.total_revenue).to eq 2
    expect(@ride1.rider_log).to eq ({@visitor1 => 1, @visitor2 => 1})
    expect(@ride2.total_revenue).to eq 5
    expect(@ride2.rider_log).to eq ({@visitor1 => 1})
  end

  it "can board only if they are tall enough" do
    @ride3.board_rider(@visitor2)
    @ride3.board_rider(@visitor3)

    expect(@visitor2.spending_money).to eq 5
    expect(@visitor3.spending_money).to eq 13
    expect(@ride3.rider_log).to eq ({@visitor3 => 1})
    expect(@ride3.total_revenue).to eq 2
  end

  it "can board only if they have the preference" do
    @ride3.board_rider(@visitor1)
    @ride3.board_rider(@visitor3)
    
    expect(@visitor1.spending_money).to eq 10
    expect(@visitor3.spending_money).to eq 13
    expect(@ride3.rider_log).to eq ({@visitor3 => 1})
    expect(@ride3.total_revenue).to eq 2
    
    @visitor1.add_preference(:thrilling)
    @ride3.board_rider(@visitor1)

    expect(@visitor1.spending_money).to eq 8
    expect(@ride3.rider_log).to eq ({@visitor3 => 1, @visitor1 => 1})
    expect(@ride3.total_revenue).to eq 4
  end
end