require 'pry-byebug'

require 'dry-container'
require 'dry-auto_inject'

require_relative 'container'
require_relative 'game/game'
require_relative 'game/cell'
require_relative 'game/board'
require_relative 'game/player'
require_relative 'game/referee'
require_relative 'game/display'

class Main

    def play
        game = Container["game"]
        game.append_player(Player.new("Player 1", "\e[33m\u25cf\e[0m"))
        game.append_player(Player.new("Player 2", "\e[34m\u25cf\e[0m"))
        
        game.start
    end

end

if __FILE__ == $0
    loop do
        main = Main.new
        main.play

        play_again = ''

        loop do 
            puts "Do you want to play another game? [y/n]"
            play_again = gets.chomp
            break if play_again == 'y' || play_again == 'n'
        end
        break if play_again == 'n'
    end
end