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

end