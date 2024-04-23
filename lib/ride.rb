class Ride 

    attr_reader :name, 
                :min_height, 
                :admission_fee,
                :excitement,
                :total_revenue,
                :rider_log

    def initialize(ride_details)
        @name = ride_details[:name]
        @min_height = ride_details[:min_height]
        @admission_fee = ride_details[:admission_fee]
        @excitement = ride_details[:excitement]
        @total_revenue = 0
        @rider_log = {}
    end

    def board_rider(visitor)
        if visitor.spending_money >= 1 && visitor.preferences.include?(@excitement)
            visitor.spending_money -= @admission_fee
            @total_revenue += 1
            if @rider_log[visitor]
                @rider_log[visitor] += 1
            else
                @rider_log[visitor] = 1
            end 
            
        end
    end
end