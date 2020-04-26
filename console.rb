require_relative('models/ebike')
require_relative('models/brand')
require_relative('models/stock_inventory')

require('pry')

StockInventory.delete_all()
Ebike.delete_all()
Brand.delete_all()


brand1 = Brand.new({'name' => 'Tern', 'address' => 'Taipei, Taiwan', 'contact_number' => 85708376})
brand1.save()
brand2 = Brand.new({'name' => 'Cube', 'address' => 'info@cube-bikes.nl', 'contact_number' => 03403500})
brand2.save()

ebike1 = Ebike.new({'name' => 'Tern GSD', 'brand_id' => brand1_id, 'retail_price' => 3995, 'cost' => 3295})
ebike1.save()
ebike2 = Ebike.new({'name' => 'Agree Hybrid C:62', 'brand_id' => brand2_id, 'retail_price' => 7300, 'cost' => 6400})
ebike2.save()

stock_inventory1 = StockInventory.new({'ebike_id' => ebike1.id, 'brand_id' => brand1.id})
stock_inventory2 = StockInventory.new({'ebike_id' => ebike2.id, 'brand_id' => brand2.id})
stock_inventory1.save()
stock_inventory2.save()

binding.pry
nil
