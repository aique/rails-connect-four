require 'pry-byebug'

require 'dry-container'
require 'dry-auto_inject'

require 'container'

require 'game/game'
require 'game/display'
require 'game/referee'
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

    context "given a new game with two players" do
        before :each do
            @game = Container["game"]

            @player1 = Player.new('Player 1', 'x')
            @player2 = Player.new('Player 2', '0')

            @game.append_player(@player1)
            @game.append_player(@player2)
        end

        it "when a player almost makes a row from the left, should not be any winner" do
            @game.drop_token(@player1, 0)
            @game.drop_token(@player1, 1)
            @game.drop_token(@player1, 2)

            expect(@game.winner).to eq(nil)
        end

        it "when a player makes a row from the left, player should win" do
            @game.drop_token(@player1, 0)
            @game.drop_token(@player1, 1)
            @game.drop_token(@player1, 2)
            @game.drop_token(@player1, 3)

            expect(@game.winner).to eq(@player1)
        end

        it "when a player makes a row from the left middle, player should win" do
            @game.drop_token(@player2, 0)
            @game.drop_token(@player1, 1)
            @game.drop_token(@player2, 2)
            @game.drop_token(@player1, 3)
            @game.drop_token(@player1, 0)
            @game.drop_token(@player1, 1)
            @game.drop_token(@player1, 2)
            @game.drop_token(@player1, 3)

            expect(@game.winner).to eq(@player1)
        end

        it "when a player makes a row at the middle, player should win" do
            @game.drop_token(@player1, 1)
            @game.drop_token(@player1, 2)
            @game.drop_token(@player1, 3)
            @game.drop_token(@player1, 4)

            expect(@game.winner).to eq(@player1)
        end

        it "when a player makes a row from the right, player should win" do
            @game.drop_token(@player1, 3)
            @game.drop_token(@player1, 4)
            @game.drop_token(@player1, 5)
            @game.drop_token(@player1, 6)

            expect(@game.winner).to eq(@player1)
        end

        it "when a player almost makes a row from the right, should not be any winner" do
            @game.drop_token(@player1, 4)
            @game.drop_token(@player1, 5)
            @game.drop_token(@player1, 6)
            
            expect(@game.winner).to eq(nil)
        end

        it "when a player almost makes a column at the bottom left, should not be any winner" do
            @game.drop_token(@player1, 0)
            @game.drop_token(@player1, 0)
            @game.drop_token(@player1, 0)
            
            expect(@game.winner).to eq(nil)
        end

        it "when a player makes a column at the bottom left, player should win" do
            @game.drop_token(@player1, 0)
            @game.drop_token(@player1, 0)
            @game.drop_token(@player1, 0)
            @game.drop_token(@player1, 0)
            
            expect(@game.winner).to eq(@player1)
        end

        it "when a player makes a column at the bottom middle, player should win" do
            @game.drop_token(@player1, 5)
            @game.drop_token(@player1, 5)
            @game.drop_token(@player1, 5)
            @game.drop_token(@player1, 5)

            expect(@game.winner).to eq(@player1)
        end

        it "when a player almost makes a column at the middle left, should not be any winner" do
            @game.drop_token(@player2, 0)
            @game.drop_token(@player1, 0)
            @game.drop_token(@player1, 0)
            @game.drop_token(@player1, 0)
            
            expect(@game.winner).to eq(nil)
        end

        it "when a player makes a column at the middle left, player should win" do
            @game.drop_token(@player2, 0)
            @game.drop_token(@player1, 0)
            @game.drop_token(@player1, 0)
            @game.drop_token(@player1, 0)
            @game.drop_token(@player1, 0)
            
            expect(@game.winner).to eq(@player1)
        end

        it "when a player almost makes a column at the top left, should not be any winner" do
            @game.drop_token(@player2, 0)
            @game.drop_token(@player2, 0)
            @game.drop_token(@player2, 0)
            @game.drop_token(@player1, 0)
            @game.drop_token(@player1, 0)
            @game.drop_token(@player1, 0)
            
            expect(@game.winner).to eq(nil)
        end

        it "when a player makes a column at the top left, player should win" do
            @game.drop_token(@player2, 0)
            @game.drop_token(@player2, 0)
            @game.drop_token(@player1, 0)
            @game.drop_token(@player1, 0)
            @game.drop_token(@player1, 0)
            @game.drop_token(@player1, 0)

            expect(@game.winner).to eq(@player1)
        end

        it "when a player almost makes a column at the bottom right, should not be any winner" do
            @game.drop_token(@player1, 6)
            @game.drop_token(@player1, 6)
            @game.drop_token(@player1, 6)
            
            expect(@game.winner).to eq(nil)
        end

        it "when a player makes a column at the bottom right, player should win" do
            @game.drop_token(@player1, 6)
            @game.drop_token(@player1, 6)
            @game.drop_token(@player1, 6)
            @game.drop_token(@player1, 6)
            
            expect(@game.winner).to eq(@player1)
        end

        it "when a player makes a column at the top right, player should win" do
            @game.drop_token(@player2, 6)
            @game.drop_token(@player2, 6)
            @game.drop_token(@player1, 6)
            @game.drop_token(@player1, 6)
            @game.drop_token(@player1, 6)
            @game.drop_token(@player1, 6)

            expect(@game.winner).to eq(@player1)
        end

        it "when a player makes a diagonal from the left bottom, player should win" do
            @game.drop_token(@player1, 0)
            @game.drop_token(@player2, 1)
            @game.drop_token(@player1, 1)
            @game.drop_token(@player2, 2)
            @game.drop_token(@player2, 2)
            @game.drop_token(@player1, 2)
            @game.drop_token(@player2, 3)
            @game.drop_token(@player2, 3)
            @game.drop_token(@player2, 3)
            @game.drop_token(@player1, 3)

            expect(@game.winner).to eq(@player1)
        end

        it "when a player makes a diagonal from the right bottom, player should win" do
            @game.drop_token(@player1, 6)
            @game.drop_token(@player2, 5)
            @game.drop_token(@player1, 5)
            @game.drop_token(@player2, 4)
            @game.drop_token(@player2, 4)
            @game.drop_token(@player1, 4)
            @game.drop_token(@player2, 3)
            @game.drop_token(@player2, 3)
            @game.drop_token(@player2, 3)
            @game.drop_token(@player1, 3)

            expect(@game.winner).to eq(@player1)
        end

        it "when a player makes a diagonal from the left top, player should win" do
            @game.drop_token(@player2, 0)
            @game.drop_token(@player2, 0)
            @game.drop_token(@player2, 0)
            @game.drop_token(@player2, 0)
            @game.drop_token(@player2, 0)
            @game.drop_token(@player1, 0)

            @game.drop_token(@player2, 1)
            @game.drop_token(@player2, 1)
            @game.drop_token(@player2, 1)
            @game.drop_token(@player2, 1)
            @game.drop_token(@player1, 1)

            @game.drop_token(@player2, 2)
            @game.drop_token(@player2, 2)
            @game.drop_token(@player2, 2)
            @game.drop_token(@player1, 2)

            @game.drop_token(@player2, 3)
            @game.drop_token(@player2, 3)
            @game.drop_token(@player1, 3)

            expect(@game.winner).to eq(@player1)
        end

        it "when a player makes a diagonal from the right top, player should win" do
            @game.drop_token(@player2, 6)
            @game.drop_token(@player2, 6)
            @game.drop_token(@player2, 6)
            @game.drop_token(@player2, 6)
            @game.drop_token(@player2, 6)
            @game.drop_token(@player1, 6)

            @game.drop_token(@player2, 5)
            @game.drop_token(@player2, 5)
            @game.drop_token(@player2, 5)
            @game.drop_token(@player2, 5)
            @game.drop_token(@player1, 5)

            @game.drop_token(@player2, 4)
            @game.drop_token(@player2, 4)
            @game.drop_token(@player2, 4)
            @game.drop_token(@player1, 4)

            @game.drop_token(@player2, 3)
            @game.drop_token(@player2, 3)
            @game.drop_token(@player1, 3)

            expect(@game.winner).to eq(@player1)
        end
    end

end