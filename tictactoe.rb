class TicTacToe
  attr_reader :player_1,:player_2
  @@winning_pos = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  def initialize
    @player_1 = Player.new('player1')
    @player_2 = Player.new('player2')
    @current_player = player_2
  end

  def play_game
    loop do
      @current_player = (@current_player == player_2) ? player_1 : player_2
      ask_player_place_piece(@current_player)
      print_board
      break if player_won?(@current_player)
      break if draw?
    end
    puts "Congrats #{@current_player.name} have a cake!"
  end

  def ask_player_place_piece(player)
    ans = nil
    loop do
      puts "Place your piece #{player.name}"
      break if !invalid?(ans = gets.chomp)
    end
    player.pos << ans.to_i
  end

  def invalid?(pos)
    begin
      pos = pos.to_i
    rescue
      false
    end
    if player_1.pos.include?(pos) || player_2.pos.include?(pos)
      true
    elsif (1..9).include?pos
      false
    else
      true
    end
  end

  def print_board
    3.times do |row|
      col = (row*3)+1
      (col..col+2).each do |pos|
        if player_1.pos.include? pos
          print 'X'
        elsif player_2.pos.include? pos
          print 'O'
        else
          print "#{pos}"
        end
        print '|'
      end
      puts "\n------"
    end
  end

  def player_won?(player)
    @@winning_pos.each do |pos|
      if pos.all? {|p| player.pos.include? p}
        return true
      end
    end
    false
  end

  def draw?
    if (1..9).all? {|pos| player_1.pos.include? pos || (player_2.pos.include? pos)}
      @current_player = 'Draw'
      true
    else
      false
    end
  end
end

class Player
  attr_accessor :pos
  attr_reader :name
  def initialize(name)
    @pos = []
    @name = name
  end
end

TicTacToe.new.play_game