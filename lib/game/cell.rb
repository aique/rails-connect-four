class Cell
    
    EMPTY_VALUE = " "

    attr_accessor :value

    def initialize
        @value = EMPTY_VALUE
    end

    def empty?
        @value == EMPTY_VALUE
    end
end