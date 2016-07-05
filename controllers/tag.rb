require('sinatra')
require('pry-byebug')
require('sinatra/contrib/all')
require_relative('../models/tag')

get '/tags' do
  @tags = Tag.all()
  erb(:'tag_views/index')
end

get '/tags/new' do
  erb(:'tag_views/new')
end

post '/tags' do
  @tag = Tag.new( params )
  @tag.save
  redirect to ('/tags')
end

get '/tags/:id' do
  @tag = Tag.find(params['id'])
  erb(:'tag_views/show')
end

post '/tags/:id/delete' do
  Tag.delete(params[:id])
  redirect to("/tags")
end