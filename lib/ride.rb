class Ride
    attr_reader :name, :min_height, :admission_fee, :excitement

    def initialize(data)
        @name = data[:name]
        @min_height = data[:min_height]
        @admission_fee = data[:admission_fee]
        @excitement = data[:excitement]
        @rider_log = {}
    end

end