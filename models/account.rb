require( 'pry-byebug' )
require_relative( './transaction')

class Account

  def initialize( transactions )
    @transactions = transactions
  end

  def total_expenditure()
    total = 0
    @transactions.each { |transaction| total += transaction.amount if transaction.type.downcase == 'debit'}
    return '%.2f' % total
  end

  def total_expenditure_by_tag(tag)
    total = 0
    @transactions.each { |transaction| total += transaction.amount if transaction.type.downcase == 'debit' && transaction.tag_id == tag}
    return '%.2f' % total
  end

end 