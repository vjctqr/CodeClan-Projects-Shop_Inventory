require('sinatra')
require('sinatra/contrib/all') if development?
require( 'pry' )

require_relative('models/ebike')
# require_relative('models/type')
# require_relative('models/brand')
also_reload('./models/*')

get '/ebikes' do
    @ebikes = Ebike.all
    erb(:index)
end

