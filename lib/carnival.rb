
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

    def count_visitors
        get_all_visitors.count
    end

    def summary
        {visitor_count: count_visitors,
        revenue_earned: total_revenue,
        visitors: get_all_visitors.map {|visitor| visitor_subhash(visitor)},
        rides: @rides.map {|ride_obj| ride_subhhash(ride_obj)}}
    end

    def get_all_visitors
        riders = []
        @rides.each do |ride|
            riders << ride.rider_log.keys
        end
        riders.uniq
    end

    def visitor_subhash(visitor_obj)
        {visitor: visitor_obj,
        favorite_ride: get_favorite(visitor_obj),
        total_money_spent: money_spent(visitor_obj)}
    end

    def get_visitor_rides(visitor_obj)
        visitor_rides = {}
        @rides.each do |ride|
            if ride.rider_log.keys.include?(visitor_obj)
                visitor_rides[ride] = ride.rider_log[visitor_obj]
            end
        end
        visitor_rides
    end

    def get_favorite(visitor_obj)
        sorted_rides = get_visitor_rides(visitor_obj).sort_by {|k, v| -v}
        sorted_rides.first[0]
    end

    def money_spent(visitor_obj)
        money_per_ride = []
        get_visitor_rides(visitor_obj).each do |key, value|
            money_per_ride << value * key.admission_fee
        end
        money_per_ride.sum
    end

    def ride_subhhash(ride_obj)
        {ride: ride_obj,
        riders: ride_obj.rider_log.keys,
        total_revenue: ride_revenue(ride_obj)}
    end

    def ride_revenue(ride_obj)
        total_rides = ride_obj.rider_log.values.sum
        total_rides * ride_obj.admission_fee
    end


end