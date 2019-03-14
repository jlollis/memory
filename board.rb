require_relative "card"

class Board

  # prints out a representation of the Board's current state
  def render
    puts "     0   1   2   3  ".light_black
    puts "   ╔═══╦═══╦═══╦═══╗".light_black
    puts " 0 ║ #{@board[0]} ║ #{@board[1]} ║ #{@board[2]} ║ #{@board[3]} ║"
    puts "   ╠═══╬═══╬═══╬═══╣"
    puts " 1 ║ #{@board[4]} ║ #{@board[5]} ║ #{@board[6]} ║ #{@board[7]} ║"
    puts "   ╠═══╬═══╬═══╬═══╣"
    puts " 2 ║ #{@board[8]} ║ #{@board[9]} ║ #{@board[10]} ║ #{@board[11]} ║"
    puts "   ╠═══╬═══╬═══╬═══╣"
    puts " 3 ║ #{@board[12]} ║ #{@board[13]} ║ #{@board[14]} ║ #{@board[15]} ║"
    puts "   ╚═══╩═══╩═══╩═══╝"
    puts
    puts "     0   1   2   3  ".light_black
    puts "  ╔═══╦═══╦═══╦═══╦═══╗"
    puts "║  #@assigntile ║ #{@board[1]} ║ #{@board[2]} ║ #{@board[3]} ║ #{@board[4]} ║"
    puts "╠═══╬═══╬═══╬═══╬═══╣"
    puts "║ #{@board[5]} ║ #{@board[6]} ║ #{@board[7]} ║ #{@board[8]} ║ #{@board[9]} ║"
    puts "╠═══╬═══╬═══╬═══╬═══╣"
    puts "║ #{@board[10]} ║ #{@board[11]} ║ #{@board[12]} ║ #{@board[13]} ║ #{@board[14]} ║"
    puts "╠═══╬═══╬═══╬═══╬═══╣"
    puts "║ #{@board[15]} ║ #{@board[16]} ║ #{@board[17]} ║ #{@board[18]} ║ #{@board[19]} ║"
    puts "╠═══╬═══╬═══╬═══╬═══╣"
    puts "║ #{@board[20]} ║ #{@board[21]} ║ #{@board[22]} ║ #{@board[23]} ║ #{@board[24]} ║"
    puts "╚═══╩═══╩═══╩═══╩═══╝"
    puts

  end

  # fill the board with a set of shuffled Card pairs
  def populate

  end

  # returns true if all cards have been revealed.
  def won?

  end

  # reveals a Card at guessed_pos
  def reveal

  end


end