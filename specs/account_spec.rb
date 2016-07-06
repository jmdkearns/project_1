require( 'minitest/autorun' )
require_relative( '../models/account' )

class TestAccount < MiniTest::Test

  def setup()
    transaction1 = Transaction.new({
      'tag_id' => 1, 
      'merchant_id' => 1, 
      'type' => 'Debit', 
      'amount' => 32.99, 
      'date_trans' => '2016-07-04'
      })
    transaction2 = Transaction.new({
      'tag_id' => 1, 
      'merchant_id' => 1, 
      'type' => 'Debit', 
      'amount' => 18.99, 
      'date_trans' => '2016-07-04'
      })
    transaction3 = Transaction.new({
      'tag_id' => 2, 
      'merchant_id' => 1, 
      'type' => 'Debit', 
      'amount' => 72.43, 
      'date_trans' => '2016-07-04'
      })

    @account = Account.new( [transaction1, transaction2, transaction3] )
  end

  def test_total_expenditure
    assert_equal("124.41", @account.total_expenditure)
  end

  def test_total_expenditure_by_tag
    assert_equal("51.98", @account.total_expenditure_by_tag(1))
  end

end 