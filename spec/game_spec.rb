require 'pry-byebug'

require 'dry-container'
require 'dry-auto_inject'

require 'container'

require 'game/game'
require 'game/display'
require 'game/player'
require 'game/board'
require 'game/cell'

describe Game do
    
    context "given a new game" do
        game = Container["game"]

        it "should not be any winner" do
            expect(game.winner).to eq(nil)
        end
    end

    context "given a new game with one player" do
        before :each do
            @game = Container["game"]

            @player = Player.new('Player', 'x')
            @game.append_player(@player)
        end

        it "when a player almost makes a row from the left, should not be any winner" do
            @game.drop_token(@player, 0)
            @game.drop_token(@player, 1)
            @game.drop_token(@player, 2)

            expect(@game.winner).to eq(nil)
        end

        it "when a player makes a row from the left, the player should win" do
            @game.drop_token(@player, 0)
            @game.drop_token(@player, 1)
            @game.drop_token(@player, 2)
            @game.drop_token(@player, 3)

            expect(@game.winner).to eq(@player)
        end

        it "when a player makes a row in the middle, the player should win" do
            @game.drop_token(@player, 1)
            @game.drop_token(@player, 2)
            @game.drop_token(@player, 3)
            @game.drop_token(@player, 4)

            expect(@game.winner).to eq(@player)
        end

        it "when a player makes a row from the right, the player should win" do
            @game.drop_token(@player, 3)
            @game.drop_token(@player, 4)
            @game.drop_token(@player, 5)
            @game.drop_token(@player, 6)

            expect(@game.winner).to eq(@player)
        end

        it "when a player almost makes a row from the right, should not be any winner" do
            @game.drop_token(@player, 4)
            @game.drop_token(@player, 5)
            @game.drop_token(@player, 6)

            expect(@game.winner).to eq(nil)
        end
    end

end