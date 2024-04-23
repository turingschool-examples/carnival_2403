

class Carnival
    attr_reader :duration, :rides

    def initialize(duration)
        @duration = duration
        @rides = []
    end

    def add_ride(ride)
        @rides << ride
    end

    def total_revenue
        all_revenue = 0

        @rides.each do |ride|
            all_revenue += ride.total_revenue
        end

        all_revenue
    end

    def most_profitable_ride
        most_profitable_ride = @rides.max_by(&:total_revenue)
    end
end


