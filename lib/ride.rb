class Ride

  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :rider_log,
              :total_revenue

  def initialize(attributes)
    @name = attributes[:name]
    @min_height = attributes[:min_height]
    @admission_fee = attributes[:admission_fee]
    @excitement = attributes[:excitement]
    @rider_log = Hash.new(0)
    @total_revenue = 0
  end

  def rider_admitted?(visitor)
    visitor.tall_enough?(@min_height) &&
    visitor.preferences.include?(@excitement) &&
    visitor.spending_money >= @admission_fee
  end

  def update_visitor_spending_money(visitor)
    visitor.update_spending_money(admission_fee)
  end
  
  def board_rider(visitor)
    if rider_admitted?(visitor)
      rider_log[visitor] += 1
      @total_revenue += @admission_fee
      update_visitor_spending_money(visitor)
    end
    rider_log
  end
end

