require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./controllers/merchant')
require_relative('./controllers/tag')
require_relative('./controllers/transaction')

get '/' do
end