require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../brand')
require_relative('../ebike')

class BrandTest < MiniTest::Test

    def setup()
        @brand = Brand.new("Tern", "Taipei, Taiwan", 8885708376)
        @ebike = Ebike.new("Tern GSD", "Tern", 3995, 3295)
    end

    def test_brand_has_name()
        assert_equal("Tern", @brand.name)
    end

    def test_brand_has_contact_number()
        assert_equal(8885708376, @brand.contact_number)
    end

end
