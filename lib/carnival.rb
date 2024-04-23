
class Carnival
    attr_reader :duration,
                :rides

    def initialize(duration)
        @duration = duration
        @rides = []
    end

    def add_ride(ride)
        @rides << ride
    end

    def most_popular_ride
        ride_totals = {}
        @rides.each do |ride|
            ride.rider_log.each do |rider, num_rides|
                ride_totals[ride] = 0
                ride_totals[ride] += num_rides
            end
        end
        sorted_rides = ride_totals.sort_by {|k, v| -v}
        sorted_rides.first[0]
    end

end