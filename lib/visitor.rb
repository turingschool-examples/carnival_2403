require 'pry'

class Visitor
    attr_reader :name, :height, :spending_money, :preferences

    def initialize(name, height, spending_money)
        @name = name
        @height = height
        @spending_money = spending_money.delete("$").to_i
        @preferences = []
    end

    def add_preference(new_preference)
        @preferences << new_preference
    end

    def tall_enough?(required_height)
        required_height <= @height
    end

    def subtract_spending_money(amount)
        @spending_money -= amount
    end
end

