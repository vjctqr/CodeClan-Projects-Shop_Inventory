require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('models/ebike')
require_relative('models/type')
require_relative('models/brand')
also_reload('./models/*')

get '/ebike' do
    @ebikes = Ebike.all
    erb(:index)
end

