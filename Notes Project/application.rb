require './manager'
require './note'

module Application
    def self.run
        menu = Menu.new
        begin
            p " Simples Note Application ".center(50,"#")
            p "a) Add"
            p "b) Edit"
            p "c) Delete"
            p "d) Show All"
            p "q) Quit"
            print "Select: "
            choice = gets.chomp.downcase

            case choice
            when 'a' then menu.add
            when 'b' then menu.edit
            when 'c' then menu.delete
            when 'd' then menu.show_all
            end
        end while choice != 'q'
    end

    class Menu
        def initialize
          @manager = Manager.new
        end

        def add
            print "Note: "
            text = gets.chomp
            note = Note.new(text)
            @manager.store(note)
        end

        def delete
            begin
              @manager.show_all
              entries = @manager.get_all
              if entries.length >  0
                entries.each_with_index do |note, index|
                  puts "#{index +  1}".center(50, "-")
                  puts note.to_s
                  puts "".center(50, "-")
                end
                print "Enter index number to Edit: "
                index = gets.chomp.to_i
                if index.between?(1, entries.length)
                  note = entries[index -  1]                  
                  @manager.delete(note)
                  puts " Entry Deleted! ".center(50, "*")
                else
                  puts "Invalid index! Please enter a valid index number.".center(50, "-")
                end
              else
                puts "No entries found."
              end
            rescue Exception => e
              puts "An error occurred: #{e.message}".center(50, "-")
            end
        end

        def edit
            begin
                @manager.show_all
                entries = @manager.get_all
                if entries.length >  0
                    entries.each_with_index do |note, index|
                    puts "#{index +  1}".center(50, "-")
                    puts note.to_s
                    puts "".center(50, "-")
                    end
                    print "Enter index number to Delete: "
                    index = gets.chomp.to_i
                    if index.between?(1, entries.length)
                    note = entries[index -  1]
                    print "Note: "
                    text = gets.chomp
                    note.set_text(text)
                    @manager.store(note)
                    puts " Entry Updated! ".center(50, "*")
                    else
                    puts "Invalid index! Please enter a valid index number.".center(50, "-")
                    end
                else
                    puts "No entries found."
                end
                rescue Exception => e
                puts "An error occurred: #{e.message}".center(50, "-")
                end
        end
          

        def show_all
            @manager.show_all
            entries = @manager.get_all
            if entries.length >  0
                entries.each_with_index do |note, index|
                puts "#{index +  1}".center(50, "-")
                puts note.to_s
                puts "".center(50, "-")
                end
            end
        end        
    end
end