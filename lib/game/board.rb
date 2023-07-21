class Board

    WIDTH = 7
    HEIGHT = 6

    attr_reader :cells
    
    def initialize
        @cells = Array.new(HEIGHT) { Array.new(WIDTH) { Cell.new } }
    end

    def insert_in_column(player, column)
        HEIGHT.times do |i|
            row_index = HEIGHT - 1 - i

            if @cells[row_index][column].empty?
                @cells[row_index][column].owner = player
                return true
            end
        end

        false
    end

    def available_column?(column)
        return @cells[0][column].empty?
    end

    def full?
        WIDTH.times do |column|
            if available_column?(column)
                return false
            end
        end

        true
    end

end