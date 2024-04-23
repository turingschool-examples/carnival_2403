class Carnival

  attr_reader :duration,
              :rides

  def initialize(days)
    @duration = days
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def ride_and_log
    hash = Hash.new
    @rides.each do |ride|
      hash[ride] = ride.rider_log.values.sum
    end
    hash
  end

  def most_popular_ride
    popular_ride = ride_and_log.max_by {|ride, number| number}
    popular_ride[0]
  end

  def most_profitable_ride
    hash = Hash.new
    @rides.each do |ride|
      hash[ride] = ride.total_revenue
    end
    profitable_ride = hash.max_by {|ride, revenue| revenue}
    profitable_ride[0]
  end

  def total_revenue
    revenue = 0
    @rides.each do |ride|
      revenue += ride.total_revenue
    end
    revenue
  end

  def visitor_count
    ride_and_log.values.sum
  end
end