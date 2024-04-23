class Carnival
    attr_reader :duration, 
                :rides,
                :total_revenue,
                :visitor_count

    def initialize(duration)
        @duration = duration
        @rides = []
        @total_revenue = 0
        @visitor_count = 0
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

    def generate_carnival_results
        
end