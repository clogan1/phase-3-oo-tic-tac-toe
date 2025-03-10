class TicTacToe

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    attr_accessor :board

    def initialize
        @board = [" ", " ", " "," ", " ", " "," ", " ", " "]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, token="X")
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] != " "
    end

    def valid_move?(index)
        index >= 0 && index < 9 && !position_taken?(index)
    end
    
    def turn_count
        @board.filter {|n| n != " "}.size
    end

    def current_player
        if turn_count.even? 
            "X"
        else 
            "O"
        end
    end

    def turn
        puts "Select your move (pick number 1 - 9)"
        move = gets
        move_index = input_to_index(move)
        if valid_move?(move_index)
            move(move_index, current_player)
            self.display_board
        else 
            self.turn
        end
    end

    def won?
        WIN_COMBINATIONS.any? do |combo|
          if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
            return combo
          end
        end
      end

    def full?
        @board.all? {|n| n != " "}
    end

    def draw?
        if !self.won? && self.full? 
            true
        elsif self.won? 
            false
        end
    end

    def over?
        self.draw? || self.won?
    end

    def winner
        if combo = won?
            @board[combo[0]]
        end
    end

    def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end

end

# gets for input

