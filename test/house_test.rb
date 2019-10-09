require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/house'
require './lib/room'

class HouseTest < Minitest::Test
  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, 13)
    @room_2 = Room.new(:bedroom, 11, 15)
  end

  def test_it_exists
    assert_equal "$400000", @house.price
    assert_equal "123 sugar lane", @house.address
    assert_equal 0, @house.rooms.length
  end

  def test_add_room
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    assert @house.rooms.include?(@room_1)
    assert @house.rooms.include?(@room_2)
    refute @house.rooms.length == 3
  end

end
