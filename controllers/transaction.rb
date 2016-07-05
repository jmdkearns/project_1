require('sinatra')
require('pry-byebug')
require('sinatra/contrib/all')
require_relative('../models/tag')
require_relative('../models/merchant')
require_relative('../models/transaction')
require_relative('../models/account')

get '/transactions' do
  @tags = Tag.all()
  @merchants = Merchant.all()
  @transactions = Transaction.all()
  @account = Account.new(@transactions)
  erb(:'transaction_views/index')
end

get '/transactions/new' do
  @tags = Tag.all()
  @merchants = Merchant.all()
  @transactions = Transaction.all()
  erb(:'transaction_views/new')
end

post '/transactions' do
  @transaction = Transaction.new( params )
  @transaction.save
  redirect to ('/transactions')
end