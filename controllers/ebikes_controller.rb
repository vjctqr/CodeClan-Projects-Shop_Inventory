require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/ebike.rb')
require_relative('../models/type.rb')
require_relative('../models/brand.rb')
also_reload('../models/*')

# New
get '/ebikes/new' do
  @types = Type.all
  @brands = Brand.all
  erb(:"ebikes/new")
end

# Index
get '/ebikes' do
  @ebikes = Ebike.all
  erb(:"ebikes/index")
end

# Create
post '/ebikes' do
  params[:buy_cost] = WhereWithAl.in_pounds(params[:buy_cost])
  params[:sell_cost] = WhereWithAl.in_pounds(params[:sell_price])
  Ebike.new(params).save
  redirect to '/ebikes'
end

# Show
get '/ebikes/:id' do
  @ebikes = Ebike.find(params[:id].to_i)
  erb(:"ebikes/show")
end

# Edit
get '/ebikes/:id/edit' do
  @ebike = Ebike.find(params[:id].to_i)
  @brand = Brand.all
  erb(:"ebikes/edit")
end

# Update
post '/ebikes/:id' do
  params[:buy_cost] = WhereWithAl.in_pound(params[:buy_cost])
  params[:sell_cost] = WhereWithAl.in_pounds(params[:sell_price])
  Ebike.new(params).update
  redirect to '/ebikes'
end

# Delete
post '/ebikes/:id/delete' do
  Ebike.find(params[:id].to_i).delete
  redirect to '/ebikes'
end

post '/ebikes/:id/buy' do
  ebike = Ebike.find(params[:id].to_i)
  ebike.buy_from_manufacturer(params[:bikes].to_i)
  redirect to "/ebikes/#{params[:id]}"
end

post '/books/:id/sell' do
  ebike = Ebike.find(params[:id].to_i)
  ebike.sell_from_manufacturer(params[:bikes].to_i)
  redirect to "/ebikes/#{params[:id]}"
end

get '/ebikes/filter/:genre' do
  @type = params[:type]
  @ebike = Ebike.filter_by_type(@type)
  erb(:"ebikes/index")
end

get '/ebikes/:column' do
  @column = params[:column]
  @ebike = Ebike.all(@column)
  erb(:"ebikes/index")
end
