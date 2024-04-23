require "./spec/spec_helper"

RSpec.describe Carnival do
  describe 'initialize' do
    it 'exists' do
      carnival = Carnival.new(10)
      expect(carnival).to be_a(Carnival)
    end

    it 'has duration' do
      carnival = Carnival.new(10)
      expect(carnival.duration).to eq 10
    end
  end
 
  describe '#add_ride(ride)' do
    it 'can add rides' do 
      carnival = Carnival.new(10)
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })      
      carnival.add_ride(ride1)
      expect(carnival.rides).to eq ([ride1])

      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      carnival.add_ride(ride2)
      expect(carnival.rides).to eq ([ride1, ride2])
    end
  end

  describe '#most_popular_ride' do
    it 'can compare ride logs to see the highest' do
      carnival = Carnival.new(10)
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
      carnival.add_ride(ride1)
      carnival.add_ride(ride2)
      carnival.add_ride(ride3)
      expect(carnival.rides).to eq ([ride1, ride2, ride3])

      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      visitor3.add_preference(:thrilling)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor1)
      expect(ride1.rider_log).to eq({visitor1 => 2, visitor2 => 1})

      ride3.board_rider(visitor3)
      ride3.board_rider(visitor3)
      ride3.board_rider(visitor3)
      ride3.board_rider(visitor3)
      expect(ride3.rider_log).to eq({visitor3 => 4})

      expect(carnival.most_popular_ride).to eq(ride3)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor1)
      ride1.board_rider(visitor1)

      expect(carnival.most_popular_ride).to eq(ride1)
    end
  end

  describe '#most_profitable_ride' do
    it 'can compare total revenue to see the highest' do
      carnival = Carnival.new(10)
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
      carnival.add_ride(ride1)
      carnival.add_ride(ride3)
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      visitor3.add_preference(:thrilling)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor1)
      expect(ride1.rider_log).to eq({visitor1 => 2, visitor2 => 1})
      expect(ride1.total_revenue).to eq(3)
      
      ride3.board_rider(visitor3)
      ride3.board_rider(visitor3)
      ride3.board_rider(visitor3)
      expect(ride3.rider_log).to eq({visitor3 => 3})
      expect(ride3.total_revenue).to eq(6)

      expect(carnival.most_profitable_ride).to eq(ride3)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor1)
      ride1.board_rider(visitor1)
      ride1.board_rider(visitor1)

      expect(carnival.most_profitable_ride).to eq(ride1)
    end
  end

  describe '#total_revenue' do
    it 'can sum total_revenue of all rides' do
      carnival = Carnival.new(10)
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
      carnival.add_ride(ride1)
      carnival.add_ride(ride3)
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      visitor3.add_preference(:thrilling)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor1)
      expect(ride1.total_revenue).to eq(3)
      
      ride3.board_rider(visitor3)
      ride3.board_rider(visitor3)
      ride3.board_rider(visitor3)
      expect(ride3.total_revenue).to eq(6)

      expect(carnival.total_revenue).to eq(9)
    end
  end
 end
 