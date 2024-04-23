class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :total_revenue
              
  def initialize(details)
    @name = details[:name]
    @min_height = details[:min_height]
    @admission_fee = details[:admission_fee]
    @excitement = details[:excitement]
    @total_revenue = 0
  end
end