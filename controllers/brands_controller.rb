require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/brand')
also_reload('models/*')

#Index
get '/brands' do
    @brands = Brand.all()
    erb(:'brands/index')
end

#Show
get '/brands/:id' do
    @brand = Brand.find(params[:id].to_i)
    @brands = @brand.ebikes()
    erb(:"brands/show")
ends