require_relative('../db/sql_runner')
require_relative('ebike')

class Brand
  attr_reader :id
  attr_accessor :name, :address, :contact_number

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @address = options['address']
    @contact_number = options['contact_number']
  end

  def save
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
    brand = SqlRunner.run(sql, values).first
    @id = brand['id'].to_i
  end

  # Read
  def self.all
    sql = 'SELECT * FROM brands'
    brands_data = SqlRunner.run(sql)
    Brand.map_items(brands_data)
  end

  # Update
  def update
    sql = "UPDATE brands SET
        (name, address, contact_number) =
        $1, $2, $3
        WHERE id = $4;"
    values = [@name, @address, @contact_number, @id]
    SqlRunner.run(sql, values)
  end

  # Delete
  def delete
    sql = 'DELETE FROM brands where id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def ebikes
    sql = 'SELECT * FROM ebikes WHERE brand_id = $1 ORDER BY id'
    values = [@id]
    ebikes_data = SqlRunner.run(sql, values)
    Ebike.map_items(ebikes_data)
  end

  def self.map_items(brands_data)
    brands_data.map { |brand| Brand.new(brand) }
  end

  def self.delete_all
    SqlRunner.run('DELETE FROM brands;')
  end

  def self.find(id)
    sql = 'SELECT * FROM brands WHERE id = $1'
    values = [id]
    brand = SqlRunner.run(sql, values).first
    return Brand.new(brand) if brand
  end
end
