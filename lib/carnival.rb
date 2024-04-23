class Carnival
    attr_accessor :duration, :rides, :total_revenue

    def initialize(duration)
        @duration = duration
        @rides = []
        @total_revenue = 0
    end

    def add_ride(ride)
        @rides << ride
    end

    def most_popular_ride
        @rides.max_by do |ride|
            ride.rider_log.length
        end
    end

    def most_profitable_ride
        @rides.max_by do |ride|
            ride.total_revenue
        end
    end

    def calculate_revenue
        rides_total = @rides.sum do |ride|
            ride.total_revenue
        end

        @total_revenue = rides_total
    end
end