class Board
    attr_accessor :board

    def initialize
        @board = [
        ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
        ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
        ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
        ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
        ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',],
        ['⚫','⚫','⚫','⚫','⚫','⚫','⚫',]]
    end

    def verify_input()
        puts 'Enter a column number 0-6'
        i = gets.chomp
        input = Integer(i) rescue false
        if input
            input
        else
            puts 'invalid input, try again'
            verify_input
        end
    end

    def get_place
        col = verify_input()
        if col
            return col
        end
    end

    def place_piece(player)
        col = verify_input
        5.downto(0) do |i|
            if @board[i][col] != '⚫' and i == 0
                puts "Choose a different Column, that one is full"
                place_piece(player)
            elsif @board[i][col] != '⚫'
                next
            else
                @board[i][col] = player.piece
                return
            end
        end
        
    end
end 