Import = Dry::AutoInject(Container)

class Game
    
    def initialize(board, display)
        @board = board
        @display = display
        @players = [Player.new("Player 1", "x"), Player.new("Player 2", "o")]
    end

    def start
        winner = nil
        active_player_index = 0

        loop do
            @display.show(@board)
            
            active_player = @players[active_player_index]
            
            column = ask_to_move(active_player)
            @board.insert_in_column(active_player.mark, column)
            # active_player.append_position(position)

            active_player_index = (active_player_index + 1) % @players.length
            winner = winner

            break if winner || @board.full?
        end

        @display.show(@board)
        @display.winner(winner)
    end

    def ask_to_move(player)
        column = 0

        loop do
            column = @display.ask_to_move(player)
            break if column.match(/[1-#{Board::WIDTH}]/) && @board.available_column?(column.to_i - 1)
        end

        column.to_i - 1
    end

    def winner
        nil
    end

end