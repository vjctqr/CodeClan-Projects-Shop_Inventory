require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../ebike")

class TestEbike < Minitest::Test

    def setup
        @ebike = Ebike.new({
            "name" => "Tern GSD", 
            "type_id" => "eCargo",
            "retail_price" => "3995", 
            "cost" => "3295", 
            "brand_id" => "Tern", 
            "stock_count" => "5"
        })
    end

    def test_ebike_has_name()
        assert_equal("Tern GSD", @ebike.name)
    end

    def test_ebike_has_type_id()
        assert_equal("eCargo", @ebike.type_id)

    def test_ebike_has_brand_id()
        assert_equal("Tern", @ebike.brand_id)
    end

    def test_ebike_has_retail_price
        assert_equal(3995, @ebike1.retail_price)
    end

    def test_ebike_has_cost
        assert_equal(3295, @ebike1.cost)
    end

    def test_ebike_has_stock_count()
        assert_equal(5, @ebike.stock_count)
    end


end