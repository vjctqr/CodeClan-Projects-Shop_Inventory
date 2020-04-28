require('sinatra')
require('sinatra/contrib/all') if development?
# require( 'pry' )
require_relative('./models/ebike')
also_reload('./models/*')

#READ
 #Index - list all ebikes.
 get '/ebikes' do
    @ebikes = Ebike.all()
    erb(:index)
 end

 #Show - display a single ebike.

#CREATE
 #New - display form to enter order information.
 #Create - submit new order details.

#UPDATE
 #Edit - display form to edit details.
 #Update - submit amended details.

#DELETE 
 #Delete/Destroy - remove ebike from database.


