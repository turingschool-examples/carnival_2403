class Ride
    attr_reader :name, :min_height, :admission, :excitement

    def initialize(info)
        @name = info[:name]
        @min_height = info[:min_height]
        @admission = info[:admission]
        @excitement = info[:excitement]
    end
end