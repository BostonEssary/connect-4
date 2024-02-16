require './lib/game.rb'
require './lib/board.rb'

describe Game do 
    describe '#initialize' do
        context 'when using default initialization' do
            subject(:game) {Game.new()}

            it 'returns an object of type Game' do
                expect(game.class).to  eq(Game)
            end
        end
    end

    describe '#set_player1' do
        context 'when calling this method with default args' do
            subject(:game) {Game.new()}

            it 'sets the player1 to the given name' do
                allow(game).to receive(:gets).and_return("Boston")
                game.set_player1
                expect(game.player1.name).to eq('Boston')
            end

            it 'sets the player1 piece to 🔴' do
                game.set_player1
                expect(game.player1.piece).to eq('🔴')
            end
        end
    end

    describe '#set_player2' do
        context 'when calling this method with default args' do
            subject(:game) {Game.new()}

            it 'sets the player2 to the given name' do
                allow(game).to receive(:gets).and_return("Cassie")
                game.set_player2
                expect(game.player2.name).to eq('Cassie')
            end

            it 'sets the player2 piece to 🟡' do
                game.set_player2
                expect(game.player2.piece).to eq('🟡')
            end
        end
    end

    describe '#set_current_player' do
        context 'when calling this method on round one' do
            subject(:game) {Game.new()}

            it 'will set the current player as player 1' do
                allow(game).to receive(:gets).and_return("Boston", "Cassie")
                game.set_player1
                game.set_player2
                game.set_current_player
                expect(game.current_player.name).to eq('Boston')
            end
        end
    end

    describe 'play_round' do
        context 'when calling this method on round 1' do
            subject(:game) {Game.new()}

            it 'will get player1`s desired spot and place their piece' do
                allow(game).to receive(:gets).and_return("Boston", "Cassie")
                allow(game.board).to receive(:gets).and_return("0", "0")
                game.set_player1
                game.set_player2
                game.set_current_player
                game.play_round
                expect(game.board.board).to eq([
                    ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
                    ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
                    ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
                    ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
                    ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
                    ['🔴','⚫','⚫','⚫','⚫','⚫','⚫',]])
            end
        end
        context 'when calling this method on round 2' do
            subject(:game) {Game.new()}

            it 'will get player2`s desired spot and place their piece' do
                allow(game).to receive(:gets).and_return("Boston", "Cassie")
                allow(game.board).to receive(:gets).and_return("0", "0")
                game.round = 2
                game.set_player1
                game.set_player2
                game.set_current_player
                game.play_round
                expect(game.board.board).to eq([
                    ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
                    ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
                    ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
                    ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
                    ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
                    ['🟡','⚫','⚫','⚫','⚫','⚫','⚫',]])
            end
        end
    end

    describe '#find_back_slash_winner' do 
        context 'When a back slash connect 4 is on the board' do
            subject(:game){Game.new()}
            

            it 'will change @game_won to true' do
                game.board = Board.new()
                game.board.board = [
                    ['🔴','⚫','⚫','⚫','⚫','⚫','⚫',],
                    ['⚫','🔴','⚫','⚫','⚫','⚫','⚫',],
                    ['⚫','⚫','🔴','⚫','⚫','⚫','⚫',],
                    ['⚫','⚫','⚫','🔴','⚫','⚫','⚫',],
                    ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
                    ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',]]
                allow(game).to receive(:gets).and_return("Boston", "Cassie")
                allow(game.board).to receive(:gets).and_return("0", "0")
                game.set_player1
                game.set_player2
                game.set_current_player
                game.find_back_slash_winner
                expect(game.game_won).to eq(true)
            end
        end
    end

    describe "#find_forward_slash_winner" do
        context 'When a forward slash connect 4 is on the board' do
            subject(:game){Game.new()}
            

            it 'will change @game_won to true' do
                game.board = Board.new
                game.board.board = [
                    ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
                    ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
                    ['⚫','⚫','⚫','⚫','⚫','⚫','🔴',],
                    ['⚫','⚫','⚫','⚫','⚫','🔴','⚫',],
                    ['⚫','⚫','⚫','⚫','🔴','⚫','⚫',],
                    ['⚫','⚫','⚫','🔴','⚫','⚫','⚫',]]
                allow(game).to receive(:gets).and_return("Boston", "Cassie")
                allow(game.board).to receive(:gets).and_return("0", "0")
                game.set_player1
                game.set_player2
                game.set_current_player
                game.find_forward_slash_winner
                expect(game.game_won).to eq(true)
            end
        end
    end

    describe "#find_horizontal_winner" do
        context 'When a horizontal connect 4 is on the board' do
            subject(:game){Game.new()}
            

            it 'will change @game_won to true' do
                game.board = Board.new
                game.board.board =[
                    ['🔴','🔴','🔴','🔴','⚫','⚫','⚫',],
                    ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
                    ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
                    ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
                    ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
                    ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',]]
                allow(game).to receive(:gets).and_return("Boston", "Cassie")
                allow(game.board).to receive(:gets).and_return("0", "0")
                game.set_player1
                game.set_player2
                game.set_current_player
                game.find_horizontal_winner
                expect(game.game_won).to eq(true)
            end
        end
    end
end
