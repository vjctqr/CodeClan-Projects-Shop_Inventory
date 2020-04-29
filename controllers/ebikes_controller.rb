require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/ebike')
require_relative('../models/type')
require_relative('../models/brand')
also_reload('models/*')

# get '/new' do
#    @types = Type.all()
#    @brands = Brand.all()
#    erb(:'ebikes/new')
# end

#Index
 get '/ebikes' do
    @ebikes = Ebike.all()
    erb(:'ebikes/index')
 end

 #Show
 get '/ebikes/:id' do
   @ebikes = Ebike.find(params[:id].to_i)
   erb(:'ebikes/show')
 end



 #Show - display a single ebike.
#  get '/ebikes/:id' do
#    @ebike = Ebike.find(prams[:id].to_i)
#    erb(:show)
#  end

#CREATE
 #New - display form to enter order information.
 #Create - submit new order details.

#UPDATE
 #Edit - display form to edit details.
 #Update - submit amended details.

#DELETE 
 #Delete/Destroy - remove ebike from database.


