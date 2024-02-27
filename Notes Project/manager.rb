require './database'

class Manager
    def initialize
        @database = Database.new
    end

    def store(note)
        @database.store(note)
    end

    def delete(note)
        @database.delete(note)
    end

    def show_all
        entries = @database.get_all
        if entries.empty?
            p "No Entries Found".center(50, "-")
        end
        entries.each_with_index do |item,index|
        end
    end

    def get_all
        @database.get_all
    end
end