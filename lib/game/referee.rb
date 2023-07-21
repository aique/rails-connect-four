class Referee

    def has_winning_line?(cells, length)
        for row in (Board::HEIGHT - 1).downto(0) do
            for column in 0..Board::WIDTH - 1 do
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

        for i in 0..length - 1 do
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

        for i in 0..length - 1 do
            if cells[row - i][column] == false
                return false
            end
        end

        true
    end

    private def winning_diagonal_line?(cells, row, column, length)
        winning_top_right_diagonal?(cells, row, column, length) ||
        winning_top_left_diagonal?(cells, row, column, length) ||
        winning_bottom_right_diagonal?(cells, row, column, length) ||
        winning_bottom_left_diagonal?(cells, row, column, length)
    end

    private def winning_top_right_diagonal?(cells, row, column, length)
        if row < length - 1 || column > length - 1
            return false
        end

        for i in 0..length - 1 do
            if cells[row - i][column + i] == false
                return false
            end
        end
        
        true
    end

    private def winning_top_left_diagonal?(cells, row, column, length)
        if row < length - 1 || column < length - 1
            return false
        end

        for i in 0..length - 1 do
            if cells[row - i][column - i] == false
                return false
            end
        end
        
        true
    end

    private def winning_bottom_right_diagonal?(cells, row, column, length)
        if row > length - 1 || column > length - 1
            return false
        end

        for i in 0..length - 1 do
            if cells[row + i][column + i] == false
                return false
            end
        end
        
        true
    end

    private def winning_bottom_left_diagonal?(cells, row, column, length)
        if row > length - 1 || column < length - 1
            return false
        end

        for i in 0..length - 1 do
            if cells[row + i][column - i] == false
                return false
            end
        end
        
        true
    end

end