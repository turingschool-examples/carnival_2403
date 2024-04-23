class Carnival
    attr_reader :duration, 
                :rides,
                :total_revenue,
                :visitors

    def initialize(duration)
        @duration = duration
        @rides = []
        @total_revenue = 0
        @visitors = []
    end

    def add_visitor(visitor)
        @visitors << visitor
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
        results = {
            visitor_count: @visitors.length,
            revenue: @total_revenue,
            visitors: calculate_visitor_data,
            rides: calculate_ride_data
        }
    end

    def calculate_visitor_data
        @visitors.map do |object|
            {
                visitor: object,
                favorite_ride: find_favorite_ride(object),
                total_money_spent: object.total_money_spent
            }
        end
    end

    def find_favorite_ride(visitor)
        favorite_ride = nil
        times_ridden = 0

        @rides.rider_log.each do |ride, count|
            if count > times_ridden
                favorite_ride = ride
                times_ridden = count
            end
        end
        favorite_ride
    end

    def calculate_ride_data
        @rides.map do |ride|
            {
                ride: ride,
                riders: ride.rider_log,
                total_revenue: ride.total_revenue
            }
        end
    end
end