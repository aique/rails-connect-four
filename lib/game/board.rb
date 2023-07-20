class Board

    WIDTH = 7
    HEIGHT = 6

    attr_reader :cells
    
    def initialize
        @cells = Array.new(HEIGHT) { Array.new(WIDTH) { Cell.new } }
    end

    def insert_in_column(mark, column)
        row_length = HEIGHT - 1

        for i in 0..row_length
            row_index = row_length - i

            if @cells[row_index][column].empty?
                @cells[row_index][column].value = mark
                
                return true
            end
        end

        false
    end

    def available_column?(column)
        return @cells[0][column].empty?
    end

    def full?()
        for i in 0..HEIGHT
            if available_column?(i)
                return false
            end
        end

        true
    end

end