require_relative("../db/sql_runner")

class StockInventory

    attr_reader :id
    attr_accessor :ebike_id, :brand_id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @ebike_id = options['ebike_id'].to_i
        @brand_id =options['brand_id'].to_i
    end

    def save()
        sql = "INSERT INTO stock_inventory (ebike_id, brand_id) VALUES ($1, $2) RETURNING id"
        values = [@ebike_id, @brand_id]
        stock_inventory = SqlRunner.run(sql, values).first
        @id = stock_inventory['id'].to_i
    end

    def self.all()
        sql = "SELECT * FROM stock_inventory"
        stock_inventory = SqlRunner.run(sql)
        result = stock_inventory.map { |stock_inventory| StockInventory.new( stock_inventory)}
        return result
    end

    def self.delete_all()
        sql = "DELETE FROM stock_inventory"
        SqlRunner.run(sql)
    end


end