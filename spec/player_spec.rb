require './lib/player.rb'

describe Player do
    describe '#initialize' do
        context 'when using default initialization' do
            subject(:default_player) { Player.new('🟡') }

            it 'has a name of Player' do
                expect(default_player.name).to eq('Player')
            end

            it 'has a symbol of 🟡' do
                expect(default_player.piece).to eq('🟡')
            end

        end

        context 'when using custom inititalization' do
             subject(:custom_player) {Player.new('Boston', '🟡')}

             it 'has a name of Boston' do
                expect(custom_player.name).to eq('Boston')
             end
        end
    end    
end
 