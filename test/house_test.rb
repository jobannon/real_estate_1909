require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/house'
require './lib/room'

class HouseTest < Minitest::Test
  def setup
    @house = House.new("$400000", "123 sugar lane")
  end

  def test_it_exists
    assert_equal "$400000", @house.price
    assert_equal "123 sugar lane", @house.address

  end
end
