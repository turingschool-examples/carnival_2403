class Ride
    attr_reader :name, :min_height, :admission, :excitement, :rider_log

    def initialize(info)
        @name = info[:name]
        @min_height = info[:min_height]
        @admission = info[:admission]
        @excitement = info[:excitement]
        @rider_log = {}
    end

    def board_rider(visitor)
        @rider_log[visitor] ||= 0
        @rider_log[visitor] += 1
    end
end