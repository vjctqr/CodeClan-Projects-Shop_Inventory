require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../ebike")

class TestPet < Minitest::Test
    def setup
        @ebike1 = Ebike.new("Tern GSD", "Tern", 3995, 3295 )
    end

    def test_ebike_has_name()
        assert_equal("Tern GSD", @ebike1.name)
    end

    def test_ebike_has_brand()
        assert_equal("Tern", @ebike1.brand)
    end

    def test_ebike_has_retail_price
        assert_equal(3995, @ebike1.retail_price)
    end

    def test_ebike_has_cost
        assert_equal(3295, @ebike1.cost)
    end

end

