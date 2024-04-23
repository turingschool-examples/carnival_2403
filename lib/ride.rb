
class Ride
    attr_reader :name,
                :min_height,
                :admission_fee,
                :excitement,
                :rider_log,
                :total_revenue

    def initialize(ride_info)
        @name = ride_info[:name]
        @min_height = ride_info[:min_height]
        @admission_fee = ride_info[:admission_fee]
        @excitement = ride_info[:excitement]
        @rider_log = {}
        @total_revenue = 0
    end

    def board_rider(visitor)
        if visitor.tall_enough?(@min_height) && visitor.preferences.include?(@excitement) && visitor.spending_money >= @admission_fee
            @total_revenue += @admission_fee
            update_rider_log(visitor)
            visitor.spending_money -= @admission_fee
        end
    end

    def update_rider_log(visitor)
        if @rider_log[visitor] != nil
            @rider_log[visitor] += 1
        else
            @rider_log[visitor] = 1
        end
    end
            
end