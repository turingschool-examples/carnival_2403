require 'pry'
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
        return unless can_board?(visitor)
        @rider_log[visitor] ||= 0
        @rider_log[visitor] += 1
        visitor.take_money(@admission)
    end

    def can_board?(visitor)
        visitor.height >= @min_height &&
        visitor.spending_money >= @admission &&
        visitor.preferences.include?(@excitement)
    end

    def total_revenue
        @rider_log.values.sum * @admission
    end
end