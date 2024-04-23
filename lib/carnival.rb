class Carnival

  @@carnivals = []

  attr_reader :name,
              :duration,
              :rides

  def initialize(name, duration)
    @name = name
    @duration = duration
    @rides = []
    @@carnivals << self
  end

  def add_ride(ride)
    @rides << ride
  end

  def total_revenue
    @rides.sum do |ride| 
      ride.total_revenue 
    end
  end

  def most_popular_ride
    @rides.max_by do |ride|
      ride.total_revenue / ride.admission_fee
    end
  end

  def most_profitable_ride
    @rides.max_by do |ride|
      ride.total_revenue
    end
  end

  def self.all_carnivals
    @@carnivals
  end
end