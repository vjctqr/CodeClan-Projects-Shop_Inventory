require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../ebike')
require_relative('../brand')
require_relative('../stock_inventory')

class StockInventoryTest < MiniTest::Test

    def setup()
        @ebike1 = Ebike.new("Tern GSD", "Tern", 3995, 3295)
        @ebike2 = Ebike.new("Cube Acid Hybrid One 500", "Cube", 1999, 1200)

        @ebikes = [@ebike1, @ebike2]

        @stock_inventory = StockInventory.new("Edinburgh eBikes", @ebikes)
    end

    def test_stock_inventory_has_name()
      assert_equal("Edinburgh eBikes", @stock_inventory.name)
    end

    def test_stock_inventory_stock_count()
        assert_equal(2, @stock_inventory.stock_count())
    end


end

