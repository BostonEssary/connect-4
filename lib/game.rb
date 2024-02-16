require './lib/player'
require './lib/board'
class Game 

    attr_accessor :player1, :player2, :round, :current_player, :board, :game_won

    def initialize()
        @round = 1
        @current_player = nil
        @player1 = nil
        @player2 = nil
        @board = Board.new()
        @game_won = false
    end
    
    def set_player1
        puts "Enter a name for Player 1"
        @player1 = Player.new(gets.chomp, '🔴')
    end

    def set_player2
        puts "Enter a name for Player 2"
        @player2 = Player.new(gets.chomp, '🟡')
    end

    def set_current_player
        if round % 2 == 1
            @current_player = @player1
        else
            @current_player = @player2
        end
    end


    def play_round
        set_current_player
        puts "#{@current_player.name}'s turn"
        print_board
        @board.place_piece(@current_player)
        find_back_slash_winner
        find_horizontal_winner
        find_forward_slash_winner
        find_vertical_winner
        @round = @round + 1
    end

    def find_back_slash_winner
        current_piece = @current_player.piece
        case @board.board
        in [*pre,
            [*pre, ^current_piece,*post],
            [*pre, String,^current_piece,*post],
            [*pre, String,String,^current_piece,*post],
            [*pre, String,String,String,^current_piece,*post], *post] then @game_won = true
        else
            ""
        end
    end


    def find_forward_slash_winner
        current_piece = @current_player.piece
        case @board.board
        in [*pre,
            [*pre, String,String,String,^current_piece,*post],
            [*pre, String,String,^current_piece,*post],
            [*pre, String,^current_piece,*post],
            [*pre, ^current_piece,*post],
             *post] then @game_won = true
        else
            ""
        end
        
    end

    def find_horizontal_winner
        current_piece = @current_player.piece
        case @board.board
            in [*pre,[*pre, ^current_piece, ^current_piece, ^current_piece, 
                ^current_piece, *post], *post] then @game_won = true
            else ''
        end
    end

    def find_vertical_winner(board = @board.board, new_arr = [], prev = '')
        board.each_with_index do |_, i|
            board[i].each_with_index do |_, j|
                if j > 5
                    next
                end
                curr = board[j][i]
                next if curr == '⚫'
                curr == prev ? new_arr << curr : new_arr.clear.push(curr)
                prev = curr
                if new_arr.length == 4
                @game_won = true
              end
            end
            prev = ''
          end
    end

    def print_board
        @board.board.each {|row| print row 
        print "\n"}
    end
    def start_game
        set_player1
        set_player2
        until @game_won == true
            play_round
        end
        print_board
        puts "Congrats #{current_player.name}"
    end

end
