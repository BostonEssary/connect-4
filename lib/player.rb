class Player
    attr_reader :name, :piece


    def initialize(name = 'Player', piece)
        @name = name
        @piece = piece
    end
end