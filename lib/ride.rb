class Ride
    attr_reader :name, 
                :min_height, 
                :admission_fee, 
                :excitement,
                :total_revenue,
                :rider_log

    def initialize(data)
        @name = data[:name]
        @min_height = data[:min_height]
        @admission_fee = data[:admission_fee]
        @excitement = data[:excitement]
        @rider_log = Hash.new(0)
        @total_revenue = 0
    end

    def board_rider(visitor)
        if can_they_ride?(visitor) == true && visitor.tall_enough?(min_height) == true
            @rider_log[visitor] = @rider_log[visitor] += 1
            add_revenue
            spend_money(visitor)
        end
    end

    def spend_money(visitor)
        adjusted_spending_money = visitor.spending_money -= @admission_fee
        adjusted_spending_money
    end

    def add_revenue
        @total_revenue += @admission_fee
    end

    def can_they_ride?(visitor)
        visitor.preferences.include?(@excitement)
    end

end