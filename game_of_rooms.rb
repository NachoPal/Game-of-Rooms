
class Game
	def initialize

		@room = []
		@room[0] = RoomDark.new(0, {'N'=>1})
		@room[1] = RoomLight.new(1, {'S'=>0, 'E'=>2})
		@room[2] = Room.new(2, {'W'=> 1, 'N'=> 3, 'E'=> 4 })
		@room[3] = Room.new(3, {'S'=> 2})
		@room[4] = RoomEnd.new(4, {'W'=> 3})

		@map = Map.new

		@room.each do |r|
			@map.add_room(r)
		end
	end

	def start

		index = 0

		while index < 5 do

			@room[index].describe_itself

			index = @map.ask(index)	
		end
	end
end

class Map

	def initialize
		@room_array = []
	end

	def add_room(room)
		@room_array << room
	end

	def ask(index)
		print ">"
		direction = gets.chomp

		@room_array[index].doors_array[direction]
	end

	def change_room()
		@room_array[]
	end
end

class Room

	attr_accessor :doors_array

	def initialize(index, doors_array, *items)
		@doors_array = doors_array
		@index = index
	end

	def describe_itself

		puts "\nYou are in the room #{@index}"
		puts "There are #{@doors_array.size} door(s): "

		@doors_array.each do |key, value|
			print "#{key} \n"
		end

		message
	end

	def message

		puts "I am a standard room"
	end
end

class RoomDark < Room

	def message

		puts "I am a Dark room"
	end
end

class RoomLight < Room

	def message

		puts "I am a Light room"
	end
end

class RoomEnd < Room

	def message

		puts "THE END"
	end
end

#====================================
game = Game.new

game.start






















