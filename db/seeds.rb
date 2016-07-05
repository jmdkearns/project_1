require('pry-byebug')
require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')

tag1 = Tag.new({ 'name' => 'Clothes' }).save()
tag2 = Tag.new({ 'name' => 'Food' }).save()

merchant1 = Merchant.new({ 'name' => 'Zara' }).save()
merchant2 = Merchant.new({ 'name' => 'Sainsburys' }).save()

transaction1 = Transaction.new({
  'tag_id' => tag1.id, 
  'merchant_id' => merchant1.id, 
  'type' => 'Debit', 
  'amount' => 32.99, 
  'date_trans' => '2016-07-04'
  }).save()
transaction2 = Transaction.new({
  'tag_id' => tag1.id, 
  'merchant_id' => merchant1.id, 
  'type' => 'Debit', 
  'amount' => 18.99, 
  'date_trans' => '2016-07-04'
  }).save()
transaction3 = Transaction.new({
  'tag_id' => tag2.id, 
  'merchant_id' => merchant2.id, 
  'type' => 'Debit', 
  'amount' =>72.43, 
  'date_trans' => '2016-07-04'
  }).save()

binding.pry
nil

