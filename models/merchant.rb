require('pg')
require_relative('../db/sql_runner')

class Merchant

  attr_reader(:id, :name)

  def initialize ( options )
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO merchants (name) VALUES ('#{@name}') RETURNING *"
    merchant = run_sql(sql).first
    return Merchant.new(merchant)
  end

  def self.map_items( sql )
    merchant = run_sql( sql )
    result = merchant.map { |merchant| Merchant.new(merchant) }
    return result
  end

  def self.map_item( sql )
    result = Merchant.map_items(sql)
    return result.first
  end

  def self.all()
    sql = "SELECT * FROM merchants"
    return Merchant.map_items(sql)
  end
    
  def self.find( id )
    sql = "SELECT * FROM merchants WHERE id = #{id}"
    return Merchant.map_item(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM merchants WHERE id=#{id}"
    run_sql(sql)
  end

end