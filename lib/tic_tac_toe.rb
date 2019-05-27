WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
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

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts 'Please enter 1-9:'
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end


def turn_count(board)
  counter = 0
  board.each do |count|
    if count == "X" || count == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  x = turn_count(board)
  if x.even?
    return "X"
  elsif x.odd?
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |i|
   board[i[0]] == "X" && board[i[1]] == "X" && board[i[2]] == "X" || board[i[0]] == "O" && board[i[1]] == "O" && board[i[2]] == "O"
 end
end

def full?(board)
  board.all? {|i| i == "X" || i == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  WIN_COMBINATIONS.detect do |i|
   if board[i[0]] == "X" && board[i[1]] == "X" && board[i[2]] == "X"
     return "X"
   elsif
     board[i[0]] == "O" && board[i[1]] == "O" && board[i[2]] == "O"
     return "O"
   end
 end
end

def play(board)
  turn(board) until over?(board)
  if won?(board)
    if winner(board) == "X"
      puts "Congratulations X!"
    else
      puts "Congratulations O!"
    end
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
