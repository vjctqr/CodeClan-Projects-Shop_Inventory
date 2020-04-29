require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/ebike')
require_relative('../models/type')
require_relative('../models/brand')
also_reload('models/*')

#New
get '/new' do
   @types = Type.all()
   @brands = Brand.all()
   erb(:'ebikes/new')
end

#Index
get '/ebikes' do
   @ebikes = Ebike.all()
  erb(:"ebikes/index")
end

#Create
get '/ebikes' do
  Ebike.new(params).save()
  redirect to '/ebikes'
 end

 #Show
 get '/ebikes/:id' do
   @ebikes = Ebike.find(params[:id].to_i)
   erb(:ebikes/show)
 end

 #Edit
 get '/ebikes/:id/edit' do
   @ebike = Ebike.find(params[:id].to_i)
   @brand = Brand.all()
   erb(:'ebikes/edit')
 end

#Update
post '/ebikes/:id' do
  Ebike.new(params).update()
  redirect to '/ebikes'
end

#Delete
post '/ebikes/:id/delete' do
  Ebike.find(params[:id].to_i).delete()
  redirect to '/ebikes'
end




