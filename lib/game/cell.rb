class Cell
    
    attr_accessor :owner

    def initialize
        @owner = nil
    end

    def empty?
        @owner == nil
    end
end