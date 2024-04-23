require "./spec/spec_helper"

RSpec.describe Ride do

    it 'initializes' do
        ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

        expect(ride1).to be_an_instance_of(Ride)
    end

    it 'can board riders and reflect it in the log' do
        ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        visitor1 = Visitor.new('Bruce', 54, '$10')
        visitor2 = Visitor.new('Tucker', 36, '$5')
        visitor3 = Visitor.new('Penny', 64, '$15')

        visitor1.add_preference(:gentle)
        visitor2.add_preference(:gentle)

        ride1.board_rider(visitor1)
        ride1.board_rider(visitor2)
        ride1.board_rider(visitor1)

        expected = {visitor1 => 2,
                    visitor2 => 1}

        expect(ride1.rider_log).to eq expected
        expect(ride1.total_revenue).to eq 3
    end
end