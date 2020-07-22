require('pry')
require_relative('../models/ebike')
require_relative('../models/brand')
require_relative('../models/type')

Type.delete_all
Brand.delete_all
Ebike.delete_all

brand1 = Brand.new({
                     'name' => 'Tern',
                     'address' => 'Taipei, Taiwan',
                     'contact_number' => '85708376'
                   })
brand1.save

brand2 = Brand.new({
                     'name' => 'Cube',
                     'address' => 'info@cube-bikes.nl',
                     'contact_number' => '03403500'
                   })
brand2.save

type1 = Type.new({
                   'name' => 'eCargo',
                   'motor' => 'Bosch Performance'
                 })
type1.save

type2 = Type.new({
                   'name' => 'eCommuter',
                   'motor' => 'Evation 1.0'
                 })
type2.save

ebike1 = Ebike.new({
                     'name' => 'Tern GSD',
                     'retail_price' => 3995,
                     'cost' => 3295,
                     'type_id' => type1.id,
                     'brand_id' => brand1.id,
                     'stock_count' => 5
                   })
ebike1.save

ebike2 = Ebike.new({
                     'name' => 'Agree Hybrid C:62',
                     'retail_price' => 7300,
                     'cost' => 6400,
                     'type_id' => type2.id,
                     'brand_id' => brand2.id,
                     'stock_count' => 1
                   })
ebike2.save

brands = Brand.all
types = Type.all
ebikes = Ebike.all

binding.pry
nil
