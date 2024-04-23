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

    def total_revenue
        popular_rides = []
        @rides.map do |ride|
            popular_rides << ride.total_revenue
        end
        popular_rides.sum
    end
end