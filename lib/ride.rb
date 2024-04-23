class Ride
  attr_reader :name, 
              :min_height, 
              :admission_fee, 
              :excitement,
              :total_revenue,
              :rider_log

  def initialize(ride_attributes)
    @name = ride_attributes[:name]
    @min_height = ride_attributes[:min_height]
    @admission_fee = ride_attributes[:admission_fee]
    @excitement = ride_attributes[:excitement]
    @total_revenue = 0
    @rider_log = Hash.new(0)
  end

  def board_rider(rider)
    if rider.spending_money > @admission_fee && rider.tall_enough(@min_height) && rider.preferences.include?(@excitement)
      
      rider.spending_money -= @admission_fee
      @total_revenue += @admission_fee
      @rider_log[rider] += 1 
    end
  end
end