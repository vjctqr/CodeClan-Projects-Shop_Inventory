require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/brand')
also_reload('../models/*')

# New
get '/brands/new' do
  erb(:"brands/new")
end

# Create
post '/brands' do
  Brand.new(param).save
  redirect to '/brands'
end

# Index
get '/brands' do
  @brands = Brand.all
  erb(:"brands/index")
end

# Show
get '/brands/:id' do
  @brand = Brand.find(params[:id].to_i)
  @brands = @brand.ebikes
  erb(:"brands/show")
end

# Edit
get '/brands/:id/edit' do
  @brand = Brand.find(params[:id].to_i)
  erb(:"brands/edit")
end

# Update
post '/brands/:id' do
  Brands.new(params).update
  redirect to '/brands'
end

# Delete
post '/brands/:id/delete' do
  Brands.find(params[:id].to_i).delete
  redirect to '/brands'
end
