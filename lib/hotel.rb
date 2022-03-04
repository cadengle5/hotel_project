require_relative "room"

class Hotel
    def initialize(name, capacities)
        @name = name
        @rooms = {}

        capacities.each do |room_name, capacity|
            @rooms[room_name] = Room.new(capacity)
        end
    end

    def name
        new_arr = []
        word_arr = @name.split(" ")
        word_arr.each { |word| new_arr << word.capitalize }
        return new_arr.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        @rooms.include?(room_name)
    end

    def check_in(person, room_name)
        if self.room_exists?(room_name)
           if @rooms[room_name].add_occupant(person) == true
            puts "check in successful"
           else
            puts "sorry, room is full"
           end
        else
            puts "sorry, room does not exist."            
        end
    end

    def has_vacancy?
        @rooms.values.any? { |room| room.available_space > 0 }
    end

    def list_rooms
        @rooms.each do |room, capacity|
            puts "#{room} : #{capacity.available_space}"
        end
    end
end
