class Ride
  attr_reader :name, 
              :min_height, 
              :admission_fee, 
              :excitement

  def initialize(ride_attributes)
    @name = ride_attributes[:name]
    @min_height = ride_attributes[:min_height]
    @admission_fee = ride_attributes[:admission_fee]
    @excitement = ride_attributes[:excitement]
  end
end