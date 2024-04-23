
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

    def most_profitable_ride
        ride_profits = {}
        @rides.each do |ride|
            ride_profits[ride] = ride.total_revenue
        end
        sorted_profits = ride_profits.sort_by {|k, v| -v}
        sorted_profits.first[0]
    end

    def total_revenue
        revenues = @rides.map do |ride|
            ride.total_revenue
        end
        revenues.sum
    end

end