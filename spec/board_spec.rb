require 'dry-container'
require 'dry-auto_inject'

require 'container'

require 'game/board'
require 'game/cell'

describe Board do

    context "given an empty board" do
        before :each do
            @board = Container["board"]
        end

        it "should not be full" do
            expect(@board.full?).to eq(false)
        end
        
        it "you should insert in any column" do
            for i in 0..Board::WIDTH - 1
                expect(@board.insert_in_column('x', i)).to eq(true)
            end
        end

        it "all columns should be availavle" do
            for i in 0..Board::WIDTH - 1
                expect(@board.insert_in_column('x', i)).to eq(true)
            end
        end
    end

    context "given a full column" do
        board = Container["board"]
        
        for i in 0..Board::HEIGHT - 1
            board.insert_in_column('x', 0)
        end

        it "should be unavailable" do
            expect(board.available_column?(0)).to eq(false)
        end

        it "you should not be able to insert" do
            expect(board.insert_in_column('x', 0)).to eq(false)
        end
    end

end