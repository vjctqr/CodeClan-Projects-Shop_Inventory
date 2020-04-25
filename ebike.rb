class Ebike 

    attr_reader :name, :brand, :quantity, :retail_price, :cost

    def initialize(name, brand, quantity, retail_price, cost)
        @name = name
        @brand = brand
        @quantity = quantity
        @retail_price = retail_price
        @cost = cost
    end 
end