require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/house'
require './lib/room'
require 'pry'

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

  def test_rooms_from_category
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)

    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(room_3)
    @house.add_room(room_4)

    assert @house.rooms_from_category(:bedroom).include?(@room_1)
    assert @house.rooms_from_category(:bedroom).include?(@room_2)
  end

  def test_house_area
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)

    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(room_3)
    @house.add_room(room_4)

    assert_equal 1900, @house.area
  end

  def test_price_per_square_foot
  room_3 = Room.new(:living_room, 25, 15)
  room_4 = Room.new(:basement, 30, 41)

  @house.add_room(@room_1)
  @house.add_room(@room_2)
  @house.add_room(room_3)
  @house.add_room(room_4)

  assert_equal 210.53, @house.price_per_square_foot

  end
end
