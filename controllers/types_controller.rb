require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/type.rb')
also_reload('../models/*')


#New
get '/types/new' do
    erb(:'types/new')
end

#Create
post '/types' do
    Type.new(params).save()
    redirect to "/types"
end

#Index
get '/types' do
    @types = Type.all()
    erb(:"types/index")
end

#Show
get '/types/:id' do
    @type = Type.find(params[:id].to_i)
    @ebikes = @type.ebikes()
    erb(:"types/show")
end

#Edit
get '/types/:id/edit' do
    @type = Type(params[:id].to_i)
    erb(:"types/edit")
end

#Update
post '/types/:id/delete' do
    Type.find(params[:id].to_i).delete()
    redirect to "/types"
end




