require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_mov_pos = prev_move_pos
    @empty_spaces = []
  end

  def find_empty_spaces
    board.each_with_index do |row, rdx|
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
    current_move = self
    if current_move.next_mover_mark == :x
      next_mark = :o
    else
      next_mark =:x
    end
    while moves.length < @empty_spaces.length
      if @prev_mov_pos == nil
        moves << TicTacToeNode.new(board.dup, next_mark, current_move).children
      end
      moves
  end
end
