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
    ride_count = Hash.new
    @rides.each do |ride|
      count = ride.rider_log.sum {|k, v| v}
      ride_count[ride] = count
    end
    highest_ridden = ride_count.max_by {|k, v| v}
    highest_ridden[0]
  end

  def most_profitable_ride
    @rides.max_by {|ride| ride.total_revenue}
  end

  def total_revenue
    @rides.sum {|ride| ride.total_revenue}
  end
end