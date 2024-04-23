require 'pry'

class Ride
    attr_reader :name, :min_height, :admission_fee, :excitement, :rider_log

    def initialize(params)
        @name = params[:name]
        @min_height = params[:min_height]
        @admission_fee = params[:admission_fee]
        @excitement = params[:excitement]
        @rider_log = {}
    end

end