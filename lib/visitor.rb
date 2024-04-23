class Visitor

    attr_reader :name, :height, :spending_money, :preferences
    attr_accessor :spending_money

    def initialize(name, height, spending_money)
        @name = name
        @height = height
        @spending_money = parse_spending_money(spending_money)
        @preferences = []
    end

    def add_preference(preference)
        @preferences << preference
    end

    def tall_enough?(height_limit)
        if @height >= height_limit
            true
        else
            false
        end
    end

    def parse_spending_money(money)
        if money.is_a?(String) && money.include?('$')
            money.delete('$').to_i
        elsif money.is_a?(String) && money =~ /^\d+$/
            money.to_i
        elsif money.is_a?(Integer)
            money
        else
            raise ArgumentError, "Invalid format for spending money."
        end
    end

end
