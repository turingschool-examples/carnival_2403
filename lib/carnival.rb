class Carnival

    attr_reader :duration, :rides

    def initialize(duration)
        @duration = duration
        @rides = []
    end

    def add_ride(ride)
        @rides <<ride
    end

    def most_popular_ride
        ride_count = Hash.new(0)
        @rides.each do |ride|
            ride_count[ride] += ride.rider_log.count
        end
        ride_count.max_by do |ride, count|
            count
        end.first
    end
end