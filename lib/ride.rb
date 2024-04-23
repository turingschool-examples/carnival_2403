class Ride

  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement

  def initialize(attributes)
    @name = attributes[:name]
    @min_height = attributes[:min_height]
    @admission_fee = attributes[:admission_fee]
    @excitement = attributes[:excitement]
  end
end