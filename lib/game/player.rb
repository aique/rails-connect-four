class Player

    attr_reader :name
    attr_reader :mark
    attr_reader :cells

    def initialize(name, mark)
        @name = name
        @mark = mark
        @cells = Array.new(Board::HEIGHT) { Array.new(Board::WIDTH) { false } }
    end

    def append_cell(cell)
        @cells[cell[0]][cell[1]] = true
    end

    def has_winning_line?(length)
        for row in (Board::HEIGHT - 1).downto(length) do
            for column in 0..Board::WIDTH - length do
                if winning_horizontal_line(row, column, length)
                    return true
                end
            end
        end

        false
    end

    private def winning_horizontal_line(row, column, length)
        for i in column..column + length - 1 do
            if @cells[row][i] == false
                return false
            end
        end

        true
    end
end