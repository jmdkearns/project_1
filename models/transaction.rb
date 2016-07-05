require('pry-byebug')
require_relative('../db/sql_runner')
require_relative('./merchant')
require_relative('./tag')

class Transaction

  attr_reader(:id, :tag_id, :merchant_id, :type, :amount, :date_trans)

  def initialize( options )
    @id = options['id'].to_i
    @tag_id = options['tag_id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @type = options['type']
    @amount = options['amount'].to_f
    @date_trans = options['date_trans']
  end

  def save()
    sql = "INSERT INTO transactions (
      tag_id, 
      merchant_id, 
      type, 
      amount, 
      date_trans
      ) VALUES (
      '#{@tag_id}',
      '#{@merchant_id}',
      '#{@type}',
      '#{@amount}',
      '#{@date_trans}'
      ) RETURNING *"
    transaction_data = run_sql(sql)
    @id = transaction_data.first['id'].to_i
  end

  def self.map_items( sql )
    transaction = run_sql( sql )
    result = transaction.map { |transaction| Transaction.new(transaction) }
    return result
  end

  def self.map_item( sql )
    result = Transaction.map_items(sql)
    return result.first
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    return Transaction.map_items(sql)
  end

  def merchant()
    sql = "SELECT name FROM merchants WHERE id = #{ @merchant_id }"
    return Merchant.map_item(sql)
  end

  def tag()
    sql = "SELECT name FROM tags WHERE id = #{ @tag_id }"
    return Tag.map_item(sql)
  end

end