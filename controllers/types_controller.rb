require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/type')
also_reload('models/*')

#Index
get '/types' do
    @types = Type.all()
    erb(:'types/index')
end

#Show
get '/types' do
    @type = Type.find(params[:id].to_i)
    @ebikes = @type.ebikes()
    erb(:"types/show")
end


