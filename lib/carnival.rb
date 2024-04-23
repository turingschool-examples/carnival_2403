class Carnival
  attr_reader :duration, :rides

  def initialize(duration)
    @duration = duration
    @rides = []
  end
  
  def add_ride(ride)
    @rides << ride
  end

  def most_popular_ride
    @rides.find do |ride|
      ride.rider_log.max_by { |visitor, count| count }.first
    end
  end

  # def most_profitable_ride
  #   # count of times ridden * @admission_fee
  #   @rides.find do |ride|
  #     ride.rider_log.max_by { |visitor, count| ride.admission_fee * count}.first
  #   end
  # end

  def total_revenue
    @rides.sum do |ride|
      ride.total_revenue
    end
  end
end