<<<<<<< HEAD
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

 def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


 def input_to_index(input)
  input.to_i - 1
end

 def move(board, idx, token)
    board[idx] = token
end

 def position_taken?(board, idx)
  board[idx] == "X" || board[idx] == "O"
end

 def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

 def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

 def turn_count(board)
  count = 0
  board.each do |pos|
    if pos == "X" || pos == "O"
      count += 1
    end
  end
  count
end

 def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

 def won?(board)
  b_size = board.size - 1
  (0..b_size).each do |pos|
    if position_taken?(board, pos)
      marker = board[pos]
      WIN_COMBINATIONS.each do |combo|
        if combo[0] == pos
          if combo.all? {|i| board[i] == marker}
            return combo
          end
        end
      end
    end
  end
  false
end

 def full?(board)
  board.all? {|pos| pos == "X" || pos == "O"}
end

 def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
  false
end

 def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  end
  false
end

 def winner(board)
  win = won?(board)
  if win
    return board[win[0]]
  end
end

 def play(board)
  if !over?(board)
    turn(board)
    play(board)
  end
  if won?(board)
    winner = winner(board)
    puts "Congratulations #{winner}!"
  end
  if draw?(board)
    puts "Cat's Game!"
  end
end
=======
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
  ]
  
  
  
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player = "X")
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

def play(board)
  count = 0
  until count == 9
  turn(board)
  count += 1
end
end

def turn_count(board)
    turns = 0
    board.each do |tile|
      if tile == "X" || tile == "O"
        turns += 1
      end
    end
    turns
  end
  
  def current_player(board)
    if turn_count(board) % 2 == 0 
       "X"
    else
       "O"
    end
  end  
  
  def won?(board)
    winner = false
    WIN_COMBINATIONS.each do |wincombination|
      if board[wincombination[0]] == "X" && board[wincombination[1]] == "X" && board[wincombination[2]] == "X"
        winner = wincombination
      elsif board[wincombination[0]] == "O" && board[wincombination[1]] == "O" && board[wincombination[2]] == "O"
        winner = wincombination
      end
    end
    winner
  end
  
def full?(board)
  board.all? do |slot|
      slot == "X" || slot == "O"
    end
  end

def draw?(board)
    draw = false
    full = full?(board)
    won = won?(board)
    if full == true && won == false
      draw = true
    end
  end
  
def over?(board)
    over = false
    draw = draw?(board)
    full = full?(board)
    won = won?(board)
    if full == true || draw == true || won != false
      over = true
    end
  end
  
  def winner(board)
    if won?(board) == false
      nil
    elsif board[won?(board)[0]] == "X"
      "X"
    elsif board[won?(board)[1]] == "O"
      "O"
    end
  end
>>>>>>> 33e5ef699074bbf0da0d9decba628fae87fbbe55
