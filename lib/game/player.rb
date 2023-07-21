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

end