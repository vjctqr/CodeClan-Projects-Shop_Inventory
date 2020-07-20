require('pg')

class SqlRunner
  def self.run(sql, values = [])
    begin
      db = PG.connect({ dbname: 'shop_inventory', host: 'localhost' })
      db.prepare('query', sql)
      result = db.exec_prepared('query', values)
    ensure
      db&.close
    end
    result
  end
end
