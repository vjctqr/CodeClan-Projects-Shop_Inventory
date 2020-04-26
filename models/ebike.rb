require_relative("../db/sql_runner")

class Ebike 

    attr_reader :id
    attr_accessor :name, :retail_price, :cost, :type_id, :brand_id


    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @retail_price = options['retail_price'].to_i
        @cost = options['cost'].to_i
        @type_id = options['type_id']
        @brand_id = options['brand_id']
        
    end 

    def save()
        sql = "INSERT INTO ebikes 
        (
            name, 
            retail_price, 
            cost,
            type_id,
            brand_id
        ) 
        VALUES 
        (
            $1, $2, $3, $4, $5
        )
        RETURNING id"
        values = [@name, @retail_price, @cost, @type_id, @brand_id]
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