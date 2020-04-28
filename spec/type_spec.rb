require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../type')

class TypeTest < MiniTest::Test

    def setup()
        @type = Type.new({"name" => "Ecargo", "motor" => "Bosch Performance")
    end

    def test_type_has_name()
      assert_equal("Ecargo", @type.name)
    end

    def test_type_has_motor()
        assert_equal("Bosch Performance", @type.motor)
    end

    def test_show_name()
        assert_equal("Ecargo", @type.show_name)
    end

    def test_show_motor()
        assert_equal("Bosch Perfomance", @type.show_motor)
    end

    def test_can_change_name()
        assert_equal("Ecargo", @type.show_name)
    end

    def test_can_change_motor()
        assert_equal("Bosch Perfomance", @type.show_motor)
    end

end

