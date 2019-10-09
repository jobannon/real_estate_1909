require 'pry'

class House
    attr_reader :price, :address, :rooms

  def initialize (price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(category)
    sorted_room = @rooms.find_all do |room|
      room.category == category
    end
  end

  def area
    #brain was not working here
    total_house = 0
    @rooms.map do |room|
      total_house += room.area
    end
    total_house
  # total_area each do |area|

  end
end
