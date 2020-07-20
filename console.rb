require_relative('models/ebike')
require_relative('models/brand')
require_relative('models/type')

require('pry')

Ebike.delete_all
Type.delete_all
Brand.delete_all

brand1 = Brand.new({
                     'name' => 'Tern',
                     'address' => 'Taipei, Taiwan',
                     'contact_number' => 85_708_376
                   })
brand1.save

brand2 = Brand.new({
                     'name' => 'Cube',
                     'address' => 'info@cube-bikes.nl',
                     'contact_number' => 0o3403500
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
                     'brand_id' => brand1.id
                   })
ebike1.save

ebike2 = Ebike.new({
                     'name' => 'Agree Hybrid C:62',
                     'retail_price' => 7300,
                     'cost' => 6400,
                     'type_id' => type2.id,
                     'brand_id' => brand2.id
                   })
ebike2.save

binding.pry
nil
