require_relative("../db/sql_runner")

class Ebike 

    attr_reader :id
    attr_accessor :name, :type_id, :brand_id :retail_price, :cost, :stock_count, ebikes_sold

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @type_id = options['type_id'].to_i
        @brand_id = options['brand_id'].to_i
        @retail_price = options['retail_price'].to_i
        @cost = options['cost'].to_i
        @stock_count = options["stock_count"].to_i   
        @ebikes_sold = options["ebikes_sold"].to_i 
    end 

    def type()
        return Type.find(@type_id)
    end

    def brand()  
        return Brand.find(@brand_id)
    end

    def buy_from_manufacturer(ebikes)
        if (ebikes > 0)
            @stock_count += ebikes
            update()
        end
    end

    def stock_status()
        return "green" if @stock_count >= 5
        return "red" if @stock_count == 0
        return "amber"
    end

    # (C)reate
    def save()
        sql = "INSERT INTO ebikes 
        (
            name, 
            retail_price, 
            cost,
            type_id,
            brand_id,
            stock_count
        ) 
        VALUES 
        (
            $1, $2, $3, $4, $5, $6
        )
        RETURNING id"
        values = [@name, @retail_price, @cost, @type_id, @brand_id, @stock_count]
        ebike = SqlRunner.run(sql,values).first
        @id = ebike['id'].to_i
    end

    def self.all()
        sql = "SELECT * FROM ebikes"
        ebikes_data = SqlRunner.run(sql)
        return Ebike.map_items(ebikes_data)
    end

    #(U)pdate
    def update()
        sql = "UPDATE ebikes SET (
            name, 
            retail_price, 
            cost, 
            type_id, 
            brand_id, 
            stock_count
            ) = ($1, $2, $3, $4, $5, $6) WHERE id = $7;"
        values = [@name, @retail_price, @cost, @type_id, @brand_id, @stock_count]
        SqlRunner.run(sql, values)
    end

    #(D)elete
    def delete()
        sql = "DELETE FROM ebikes WHERE id = $1";
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.map_items(ebikes_data)
        return ebikes_data.map { |ebike| Ebike.new(ebike)}
    end

    def self.delete_all()
        sql = "DELETE FROM ebikes"
        SqlRunner.run(sql)
    end

    def self.find(id)
        sql = "SELECT * FROM ebikes WHERE id = $1"
        values = [id]
        ebike = SqlRunner.run(sql, values).first
        return Ebike.new(ebike) if ebike 
    end


end