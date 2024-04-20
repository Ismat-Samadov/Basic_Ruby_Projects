class Board
  def initialize
    @board = Array.new(3) { Array.new(3, " ") }
  end

  def display
    @board.each { |row| puts row.join(" | ") }
  end

  def mark(row, col, marker)
    if @board[row][col] == " "
      @board[row][col] = marker
      true
    else
      false
    end
  end

  def win?(marker)
    # Check rows and columns
    3.times do |i|
      return true if @board[i].all? { |cell| cell == marker } ||
                     @board.transpose[i].all? { |cell| cell == marker }
    end

    # Check diagonals
    return true if (0..2).all? { |i| @board[i][i] == marker } ||
                   (0..2).all? { |i| @board[i][2 - i] == marker }

    false
  end

  def full?
    @board.all? { |row| row.none? { |cell| cell == " " } }
  end
end

class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end

class Game
  def initialize
    @board = Board.new
    @player1 = Player.new("Player 1", "X")
    @player2 = Player.new("Player 2", "O")
    @current_player = @player1
  end

  def play
    loop do
      @board.display
      puts "#{@current_player.name}'s turn"
      print "Enter row and column (e.g., 1 2): "
      row, col = gets.chomp.split.map(&:to_i)
      if valid_move?(row, col)
        if @board.win?(@current_player.marker)
          @board.display
          puts "#{@current_player} wins!"
          break
        elsif @board.full?
          @board.display
          puts "It's a tie!"
          break
        else
          switch_players
        end
      else
        puts "Invalid move. Please try again."
      end
    end
  end

  private

  def valid_move?(row, col)
    begin
      raise ArgumentError, "Invalid input" unless row && col
      return row.between?(0, 2) && col.between?(0, 2) &&
             @board.mark(row, col, @current_player.marker)
    rescue ArgumentError => e
      puts e.message
      return false
    end
  end

  def switch_players
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end
end

# Start the game
Game.new.play
