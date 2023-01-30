require_relative 'tic_tac_toe'
require "byebug"

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    # debugger
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_mov_pos = prev_move_pos
    self.find_empty_spaces
    
  end

  def find_empty_spaces
    @empty_spaces = []
    # debugger
    board.rows.each_with_index do |row, rdx|
      row.each_with_index do |el, idx|
        if board.empty?([rdx,idx])
          @empty_spaces << [rdx,idx]
        end
      end
    end


  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    moves = []
    current_move = self.prev_move_pos
    if self.next_mover_mark == :x
      next_mark = :o
    else
      next_mark =:x
    end

    # debugger
    
    @empty_spaces.each do |space|
      next_board = board.dup
      next_board[space] = self.next_mover_mark
      

      moves << TicTacToeNode.new(next_board, next_mark, space)
                        
    end
    return moves

  end

end
