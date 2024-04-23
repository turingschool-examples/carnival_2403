class Ride
    attr_reader :name, 
                :min_height, 
                :admission_fee, 
                :excitement, 
                :total_revenue, 
                :rider_log

    def initialize(ride_info)
        @name = ride_info[:name]
        @min_height = ride_info[:min_height]
        @admission_fee = ride_info[:admission_fee]
        @excitement = ride_info[:excitement]
        @total_revenue = 0
        @rider_log = Hash.new(0)
    end

    def board_rider(visitor)
        if visitor.tall_enough?(@min_height) # && visitor.preferences.include?(@excitement) might need that later
            visitor.update_spending_money(@admission_fee)
            @rider_log[visitor] += 1
            @total_revenue += @admission_fee
        end
    end

end