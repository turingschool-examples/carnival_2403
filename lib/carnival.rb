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

    def most_profitable_ride
        ride_revenue = Hash.new(0)
        @rides.each do |ride|
            ride_revenue[ride] = ride.total_revenue
        end
        ride_revenue.max_by do |ride, rev|
            rev 
        end.first
    end

    def total_revenue
        park_rev = 0
        @rides.each do |ride|
            park_rev += ride.total_revenue
        end
        park_rev
    end

    def visitor_count
        visitors = []
        @rides.each do |ride|

            ride.rider_log.each do | visitor, log|
                visitors << visitor
            end
            #check that the visitor wasn't counted already
            #if he wasn't counted increase count by one
        end

        visitors.uniq.count
    end
end