class Display

    def show(board)
        system "clear"

        board.cells.each do |row|

            row.length.times do
                print "+---+"
            end

            print "\n"

            row.each do |cell|
                print "| #{cell.owner ? cell.owner.mark : " "} |"
            end

            print "\n"
        end

        board.cells[0].length.times do
            print "+---+"
        end

        print "\n\n"
    end

    def ask_to_move(player)
        puts "Please #{player.name}, insert a valid column"
        gets.chomp
    end

    def winner(player)
        if player
            puts "#{player.name} wins! \n\n"
        else
            puts "Draw!"
        end
    end

end