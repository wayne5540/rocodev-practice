module BoardsHelper

  def render_board_name(board)
    board.name 
  end

  def render_board_desc(board)
    board.description
  end

  def render_board_id(board)
    board.id
  end

end
