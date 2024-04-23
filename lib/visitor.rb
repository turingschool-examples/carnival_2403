class Visitor
  attr_reader :name,
              :height,
              :spending_money,
              :preferences

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money.delete("$").to_f
    @preferences = []
  end

  def add_preference(preference)
    @preferences << preference
  end

  def tall_enough?(height_limit)
    @height >= height_limit
  end

  def pay_admission(admission)
    @spending_money -= admission
  end
end