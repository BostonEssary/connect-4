require './lib/board.rb'

describe Board do
    describe '#initialize' do
        context 'when using default initialization' do
            subject(:board) {Board.new()}

            it 'displays a blank board' do
                expect(board.board).to eq([
                ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
                ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
                ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
                ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
                ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
                ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',]])
            end
        end
    end

    describe '#verify_input' do
        context 'when provided an integer as a string' do
            subject(:board) {Board.new()}

            it 'returns the int string as an int' do
                allow($stdin).to receive(:gets).and_return('3')
                expect(board.verify_input()).to eq(3)
            end
        end

        context 'when provided a string that can not be converted to an int' do
            subject(:board) {Board.new()}
                
            it 'will return `invalid input, try again`' do
                expect(board.verify_input()).to eq("invalid input, try again")
            end
        end
    end

    describe '#get_place' do
        context 'when called and provided valid inputs' do
            subject(:board) {Board.new()}
            
            it 'will return the inputs provided' do
                allow(board).to receive(:gets).and_return("0")
                expect(board.get_place).to eq(0)
            end
        end
    end

    describe '#place_piece'do
        context 'when called with a player as an arguement' do
            subject(:board) {Board.new()}
            it 'will place the player`s piece on the board' do
                player = instance_double("Player", :name => 'Boston', :piece => '🟡')
                allow(board).to receive(:gets).and_return("0")
                board.place_piece(player)
                expect(board.board).to eq([
                    ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
                    ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
                    ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
                    ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
                    ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
                    ['🟡','⚫','⚫','⚫','⚫','⚫','⚫',]])
            end
        end

    end
end