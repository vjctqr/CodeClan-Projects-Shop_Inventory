require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../whereWithAl')

class WhereWithAlTest < Minitest::Test
  def test_in_pounds__positive
    assert_equal('3445', WhereWithAl.in_pounds(4879))
  end
end
