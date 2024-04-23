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
        # add visitor to rider log
        @rider_log[visitor] = @rider_log[visitor] += 1
        # require 'pry'; binding.pry
    end

end