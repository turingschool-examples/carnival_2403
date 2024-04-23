require 'pry'
require './lib/visitor'

class Ride
    attr_reader :name, :min_height, :admission_fee, :excitement, :rider_log, :total_revenue

    def initialize(params)
        @name = params[:name]
        @min_height = params[:min_height]
        @admission_fee = params[:admission_fee]
        @excitement = params[:excitement]
        @rider_log = {}
        @total_revenue = 0 
    end

    def board_rider(visitor)
        if visitor.preferences.include?(@excitement) && visitor.height >= @min_height && visitor.spending_money >= @admission_fee
            @rider_log[visitor] ||= 0 
            @rider_log[visitor] += 1
            visitor.subtract_spending_money(@admission_fee)
            @total_revenue += @admission_fee 
        end
    end
end