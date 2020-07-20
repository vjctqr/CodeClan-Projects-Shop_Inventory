require_relative('../db/sql_runner')
require_relative('ebike')

class Type
  attr_reader :id
  attr_accessor :name, :motor

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @motor = options['motor']
  end

  def print_name
    @name.to_s
  end

  def print_motor
    @motor.to_s
  end

  # Create
  def save
    sql = 'INSERT INTO types (name, motor) VALUES ($1, $2) RETURNING id'
    values = [@name, @motor]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  # Read
  def self.all
    sql = 'SELECT * FROM types'
    types_data = SqlRunner.run(sql)
    Type.map_items(types_data)
  end

  # Update
  def update
    sql = 'UPDATE types SET (name, motor) = ($1, $2) WHERE id = $3;'
    values = [@name, @motor, @id]
    SqlRunner.run(sql, values)
  end

  # Delete
  def delete
    sql = 'DELETE FROM types WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def ebikes
    sql = 'SELECT * FROM ebikes WHERE type_id = $1'
    values = [@id]
    ebikes_data = SqlRunner.run(sql, values)
    Ebike.map_items(ebikes_data)
  end

  def self.map_items(types_data)
    types_data.map { |type| Type.new(type) }
  end

  def self.delete_all
    sql = 'DELETE FROM types'
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = 'SELECT * FROM types WHERE id = $1'
    values = [id]
    type = SqlRunner.run(sql, values).first
    return Type.new(type) if type
  end
end
