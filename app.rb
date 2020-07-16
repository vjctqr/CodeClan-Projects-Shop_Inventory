require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/ebikes_controller')
require_relative('controllers/brands_controller')
require_relative('controllers/types_controller')

get '/' do
  redirect to '/ebikes'
end
