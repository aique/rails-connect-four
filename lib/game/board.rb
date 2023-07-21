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
            current_cell = @cells[row_index][column]

            if current_cell.empty?
                current_cell.owner = player
                return true
            end
        end

        false
    end

    def available_column?(column)
        @cells[0][column].empty?
    end

    def full?
        WIDTH.times do |column|
            return false if available_column?(column)
        end

        true
    end

end