#terminal
createdb shop_inventory
psql -d shop inventory -f db/shop_inventory.sql
ruby db/seeds.rb
ruby app.rb

#browser
http://localhost:4567
