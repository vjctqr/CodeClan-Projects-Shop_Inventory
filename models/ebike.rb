require_relative("../db/sql_runner")

class Ebike 

    attr_reader :id
    attr_accessor :name, :brand_id, :retail_price, :cost

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @brand_id = options['brand_id'].to_i
        @retail_price = options['retail_price'].to_i
        @cost = options['cost'].to_i
    end 

    def save()
        sql = "INSERT INTO ebikes 
        (
            name, 
            brand_id, 
            retail_price, 
            cost
        ) 
        VALUES 
        (
            $1, $2, $3, $4
        )
        RETURNING id"
        values = [@name, @brand_id, @retail_price, @cost]
        ebike = SqlRunner.run(sql,values).first
        @id = ebike['id'].to_i
    end

    def self.all()
        sql = "SELECT * FROM ebikes"
        ebikes = SqlRunner.run(sql)
        result = ebikes.map { |ebike| Ebike.new( ebike ) }
        return result
    end

    def self.delete_all()
        sql = "DELETE FROM ebikes"
        SqlRunner.run(sql)
    end

end