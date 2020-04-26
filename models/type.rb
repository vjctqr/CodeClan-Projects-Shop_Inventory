require_relative("../db/sql_runner")

class Type

    attr_reader :id
    attr_accessor :name, :motor

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @motor = options['motor']
    end

    def save()
        sql = "INSERT INTO types (name, motor) VALUES ($1, $2) RETURNING id"
        values = [@name, @motor]
        type = SqlRunner.run(sql, values).first
        @id = type['id'].to_i
    end

    def self.all()
        sql = "SELECT * FROM types"
        types = SqlRunner.run(sql)
        result = types.map { |type| Type.new( type ) }
        return result
    end

    def self.delete_all()
        sql = "DELETE FROM types"
        SqlRunner.run(sql)
    end


end