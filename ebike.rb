class Ebike 

    attr_reader :name, :brand, :retail_price, :cost

    def initialize(name, brand, retail_price, cost)
        @name = name
        @brand = brand
        @retail_price = retail_price
        @cost = cost
    end 
end