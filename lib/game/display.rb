class Display

    def show(board)
        system "clear"

        board.cells.each do |row|

            for i in 1..row.length do
                print "+---+"
            end

            print "\n"

            row.each do |cell|
                print "| #{cell.value} |"
            end

            print "\n"
        end

        for i in 1..board.cells[0].length do
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