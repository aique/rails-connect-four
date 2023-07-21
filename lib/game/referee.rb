class Referee

    def has_winning_line?(cells, length)
        Board::HEIGHT.times do |row|
            Board::WIDTH.times do |column|
                if winning_horizontal_line?(cells, row, column, length)
                    return true
                end

                if winning_vertical_line?(cells, row, column, length)
                    return true
                end

                if winning_diagonal_line?(cells, row, column, length)
                    return true
                end
            end
        end

        false
    end

    private def winning_horizontal_line?(cells, row, column, length)
        if column > length - 1
            return false
        end

        length.times do |i|
            if cells[row][column + i] == false
                return false
            end
        end

        true
    end

    private def winning_vertical_line?(cells, row, column, length)
        if row < length - 1
            return false
        end

        length.times do |i|
            if cells[row - i][column] == false
                return false
            end
        end

        true
    end

    private def winning_diagonal_line?(cells, row, column, length)
        winning_left_diagonal?(cells, row, column, length) ||
        winning_right_diagonal?(cells, row, column, length)
    end

    private def winning_right_diagonal?(cells, row, column, length)
        if row < length - 1 || column > length - 1
            return false
        end

        length.times do |i|
            if cells[row - i][column + i] == false
                return false
            end
        end
        
        true
    end

    private def winning_left_diagonal?(cells, row, column, length)
        if row < length - 1 || column < length - 1
            return false
        end

        length.times do |i|
            if cells[row - i][column - i] == false
                return false
            end
        end
        
        true
    end

end