# memory.rb - Julie Lollis

require_relative 'card'
gem 'lolize'
require "lolize"

class Memory
  IMAGE = %i(ℵ ‡ ≈ ¥ ♠ ฿ ☯ ★)

  attr_accessor :grid, :game_over, :pick1, :pick2, :end_screen

  def initialize(board = nil)
    @board = board || Array.new(16, " ")
    # @board = board || " _ " * 16
    @cards = generate_cards
    @cards.shuffle!
    @game_over = false
  end

  def play
    clear
    populate_board
    start_screen
    sleep (2)
    until game_over? == true
      take_turn
    end
    end_screen
    sleep (60)
  end

  def game_over?
    @game_over = true if Card.print_count().zero?
    @game_over
  end

  def generate_cards
    cards = []
    8.times do |i|
      cards.shuffle!
      2.times do |j|
        cards.shuffle!
        cards.push(Card.new(IMAGE[i]))
      end
    end
    cards

  end

  def populate_board
    # puts @cards[0].image
    (0..9).each do |i|
      @board[i] = @cards[i].image
      @board[i] = " #{i} "
    end
    (10...16).each do |i|
      @board[i] = " #{i}"
    end
  end

  def render_board
    # top = "    ╔═════╦═════╦═════╦═════╗"
    # bar = "    ╠═════╬═════╬═════╬═════╣"
    # btm = "    ╚═════╩═════╩═════╩═════╝"
    #
    # puts top
    # (0..4).each do |i|
    #   puts"║ #{@board[i]} "
    # end

    puts "    ╔═════╦═════╦═════╦═════╗"
    puts "    ║ #{@board[0]} ║ #{@board[1]} ║ #{@board[2]} ║ #{@board[3]} ║"
    puts "    ╠═════╬═════╬═════╬═════╣"
    puts "    ║ #{@board[4]} ║ #{@board[5]} ║ #{@board[6]} ║ #{@board[7]} ║"
    puts "    ╠═════╬═════╬═════╬═════╣"
    puts "    ║ #{@board[8]} ║ #{@board[9]} ║ #{@board[10]} ║ #{@board[11]} ║"
    puts "    ╠═════╬═════╬═════╬═════╣"
    puts "    ║ #{@board[12]} ║ #{@board[13]} ║ #{@board[14]} ║ #{@board[15]} ║"
    puts "    ╚═════╩═════╩═════╩═════╝"
    puts
  end

  def reveal
    # puts @cards[0].image
    (0...16).each do |i|
      # puts @cards[i].image
      @board[i] = " #{@cards[i].image} "
    end
  end


  def take_turn
    clear
    render_board
    print "Pick a card: "
    @pick1 = gets.chomp.to_i
    @board[@pick1] = " #{@cards[pick1].image} "
    clear
    render_board
    puts "You chose: #{@board[@pick1]}"

    print"Pick another card: "
    @pick2 = gets.chomp.to_i
    @board[@pick2] = " #{@cards[@pick2].image} "
    clear
    render_board
    if @cards[@pick1].image == @cards[@pick2].image
      puts "You have a match!"
      puts
      Card.decrement_count
      puts "Card count is: #{Card.print_count()}"
      sleep(2)
      @board[@pick1] = " #{@cards[@pick1].image} "
      @board[@pick2] = " #{@cards[@pick2].image} "
    else
      puts "No match"
      sleep(3)
      reset_card(@pick1)
      reset_card(@pick2)
    end
  end

  def reset_card(square)
    if square <= 9
      @board[square] = " #{square} "
    else
      @board[square] = " #{square}"
    end

  end

  def clear
    # multi-platform clear
    system "clear"
    puts "\e[H\e[2J"
    system ("cls")
    system('cls')
  end

  def end_screen
    colorizer = Lolize::Colorizer.new
    congrats = "


               You are a Match 2 GOD!
                                   .''.
       .''.      .        *''*    :_\\/_:     .
      :_\\/_:   _\\(/_  .:.*_\\/_*   : /\\ :  .'.:.'.
  .''.: /\\ :   ./)\\   ':'* /\\ * :  '..'.  -=:o:=-
 :_\\/_:'.:::.    ' *''*    * '.\\'/.' _\\(/_'.':'.'
 : /\\ : :::::     *_\\/_*     -= o =-  /)\\    '  *
  '..'  ':::'     * /\\ *     .'/.\\'.   '
      *            *..*         :
      *
      . YOU BEAT THIS SWEET GAME HARDER THAN
              A TEN DOLLAR IKEA RUG!!!

"
    colorizer.write "#{congrats}"

  end

  def start_screen
    colorizer = Lolize::Colorizer.new
    splash = "

                  _       _     ___
                 | |     | |   |__ \\
  _ __ ___   __ _| |_ ___| |__    ) |
 | '_ ` _ \\ / _` | __/ __| '_ \\  / /
 | | | | | | (_| | || (__| | | |/ /_
 |_| |_| |_|\\__,_|\\__\\___|_| |_|____|

 ℵ    ‡    ≈    ¥    ♠    ฿    ☯    ★


"
    colorizer.write "#{splash}"
  end
end


if __FILE__ == $PROGRAM_NAME
  t = Memory.new
  t.play
end

  # t = Memory.new
  # t.play
