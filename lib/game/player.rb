class Player

    attr_reader :name
    attr_reader :mark
    attr_reader :positions

    def initialize(name, mark)
        @name = name
        @mark = mark
        @positions = []
    end

    def append_position(position)
        @positions << position
    end
end