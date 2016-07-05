require('sinatra')
require('pry-byebug')
require('sinatra/contrib/all')
require_relative('../models/merchant')

get '/merchants' do
  @merchants = Merchant.all()
  erb(:'merchant_views/index')
end

get '/merchants/new' do
  erb(:'merchant_views/new')
end

post '/merchants' do
  @merchant = Merchant.new( params )
  @merchant.save
  redirect to ('/merchants')
end

get '/merchants/:id' do
  @merchant = Merchant.find(params['id'])
  erb(:'merchant_views/show')
end

post '/merchants/:id/delete' do
  Merchant.delete(params[:id])
  redirect to("/merchants")
end