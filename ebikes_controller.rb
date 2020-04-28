require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/ebike')
# require_relative('../models/type')
# require_relative('../models/brand')
also_reload('./models/*')

#READ
 #Index - list all ebikes.
 get '/ebikes' do
    @ebikes = Ebike.all()
    erb(:index)
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


