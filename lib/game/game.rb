class Game
    
    WINNING_LINE_LENGTH = 4

    def initialize(board, referee, display)
        @board = board
        @referee = referee
        @display = display
        @players = []
    end

    def append_player(player)
        @players << player
    end

    def start
        winner = nil
        active_player_index = 0

        loop do

            @display.show(@board)
            
            active_player = @players[active_player_index]
            
            column = ask_to_move(active_player)
            drop_token(active_player, column)

            active_player_index = (active_player_index + 1) % @players.length
            winner = winner()

            break if winner || @board.full?
        end

        @display.show(@board)
        @display.winner(winner)
    end

    def ask_to_move(player)
        column = 0

        loop do
            column = @display.ask_to_move(player)
            break if valid_column?(column) && available_column?(column)
        end

        column.to_i - 1
    end

    def valid_column?(column)
        match = /^\d+$/.match(column)
        
        return false if !match

        column = column.to_i
        column > 0 && column <= @board.cells[0].length
    end

    def available_column?(column)
        @board.available_column?(column.to_i - 1)
    end

    def drop_token(player, column)
        @board.insert_in_column(player, column)
    end

    def winner
        @referee.winner(@board.cells, WINNING_LINE_LENGTH)
    end

end