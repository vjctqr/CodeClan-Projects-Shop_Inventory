class StockInventory

    attr_reader :name

    def initialize(name, ebikes)
        @name = name
        @ebikes = ebikes
    end

    def stock_count()
        return @ebikes.size()
    end

end