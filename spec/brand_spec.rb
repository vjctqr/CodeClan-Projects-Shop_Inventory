require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../brand')

class BrandTest < MiniTest::Test

    def setup()
        @brand = Brand.new({
            "name" => "Tern", 
            "address" => "Taipei, Taiwan", 
            "contact_number" => "8885708376"
        })
    end

    def test_brand_has_name()
        assert_equal("Tern", @brand.name)
    end

    def test_brand_has_address()
        assert_equal("Taipei, Taiwan", @brand.address)

    def test_brand_has_contact_number()
        assert_equal(8885708376, @brand.contact_number)
    end

    def test_can_change_name()
        @brand.name = "Cube"
        assert_equal("Cube", @brand.name)
    end

    def test_can_change_address()
        @brand.address = "Cubeville, Cuba"
        assert_equal("Cubeville", @brand.address)
    end

    def test_can_change_contact_number()
        @brand.contact_number = "667788"
        assert_equal("667788", @brand.contact_number)
    end
        

end
