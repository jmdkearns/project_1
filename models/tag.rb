require('pg')
require_relative('../db/sql_runner')

class Tag

  attr_reader(:id, :name)

  def initialize ( options )
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO tags (name) VALUES ('#{@name}') RETURNING *"
    tag = run_sql(sql).first
    return Tag.new(tag)
  end

  def self.map_items( sql )
    tag = run_sql( sql )
    result = tag.map { |tag| Tag.new(tag) }
    return result
  end

  def self.map_item( sql )
    result = Tag.map_items(sql)
    return result.first
  end

  def self.all()
    sql = "SELECT * FROM tags"
    return Tag.map_items(sql)
  end

  def self.find( id )
    sql = "SELECT * FROM tags WHERE id = #{id}"
    return Tag.map_item(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM tags"
    run(sql)
  end
    
end