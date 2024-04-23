class Visitor
    attr_reader :name, 
                :height, 
                :spending_money, 
                :preferences

    def initialize(name, height, spending_money)
        @name = name
        @height = height
        @spending_money = spending_money
        @preferences = []
    end

    def add_preference(preference)
        @preferences << preference
    end

    def tall_enough?(height_min)
        @height >= height_min
    end

    def update_spending_money(amount)
        current_money = @spending_money.delete('$').to_i
        current_money -= amount
        @spending_money = "$#{current_money}"
    end
end