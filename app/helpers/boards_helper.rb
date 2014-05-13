module BoardsHelper

  def render_board_name(board)
    board.name 
  end

  def render_board_desc(board)
    board.description
  end

  def render_board_name_path(board)
    link_to(board.name, board_path(board)) 
  end

  def render_edit_admin_board_path(board)
    link_to("edit", edit_admin_board_path(board), :class => "btn btn-default") 
  end

  def render_destroy_admin_board_path(board)
    link_to("delete", admin_board_path(board), :class => "btn btn-default", :method => :delete, :confirm => "Are you sure?")
  end

end
