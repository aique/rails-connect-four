class Referee

    def winner(cells, length)
        winning_line_owner(cells, length)
    end

    def winning_line_owner(cells, length)
        height = cells.length
        width = cells[0].length

        height.times do |row|
            width
            .times do |column|
                owner = cells[row][column].owner

                next if owner == nil

                return owner if winning_horizontal_line?(cells, row, column, owner, length)
                return owner if winning_vertical_line?(cells, row, column, owner, length)
                return owner if winning_diagonal_line?(cells, row, column, owner, length)
            end
        end

        nil
    end

    private def winning_horizontal_line?(cells, row, column, owner, length)
        return false if column > length - 1

        length.times do |i|
            return false if cells[row][column + i].owner != owner
        end

        true
    end

    private def winning_vertical_line?(cells, row, column, owner, length)
        return false if row < length - 1

        length.times do |i|
            return false if cells[row - i][column].owner != owner
        end

        true
    end

    private def winning_diagonal_line?(cells, row, column, owner, length)
        winning_left_diagonal?(cells, row, column, owner, length) ||
        winning_right_diagonal?(cells, row, column, owner, length)
    end

    private def winning_right_diagonal?(cells, row, column, owner, length)
        return false if row < length - 1 || column > length - 1

        length.times do |i|
            return false if cells[row - i][column + i].owner != owner
        end
        
        true
    end

    private def winning_left_diagonal?(cells, row, column, owner, length)
        return false if row < length - 1 || column < length - 1

        length.times do |i|
            return false if cells[row - i][column - i].owner != owner
        end
        
        true
    end

end