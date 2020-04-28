require_relative("../db/sql_runner")

class Brand

    attr_reader :id
    attr_accessor :name, :address, :contact_number
    
    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @address = options['address']
        @contact_number = options['contact_number']
    end

    def save()
        sql = "INSERT INTO brands 
        (
            name, 
            address, 
            contact_number
        ) 
            VALUES 
        (
            $1, $2, $3
        ) 
            RETURNING id"
        values = [@name, @address, @contact_number]
        brand = SqlRunner.run( sql, values ).first
        @id = brand['id'].to_i
    end

    def update()
        sql ="UPDATE brands SET 
        (name, address, contact_number) = 
        $1, $2, $3 
        WHERE id = $4 "
        values = [@name, @address, @contact_number, @id]
        SqlRunner.run(sql, values)
    end

    def delete()
        sql = "DELETE FROM brands where id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def ebikes()
        sql = "SELECT * FROM ebikes where brand_id = $1"
        values = [@id]
        ebike_data = SqlRunner.run(sql, values)
        return ebike_data.map{|ebike| Ebike.new(ebike)}
    end



    #Self Method.
    def self.all()
        sql = "SELECT * FROM brands"
        brands = SqlRunner.run(sql)
        return Brand.map_items(brands)
    end

    def self.delete_all
        sql = "DELETE FROM brands"
        SqlRunner.run(sql)
    end

    def self.map_items(brand_data)
        result = brand_data.map { |brand| Brand.new(brand)}
        return result
    end

end