class TopicsController < ApplicationController
  before_action :find_board
  
  def index
    @topics = @board.topics.all
  end

  def show
    @topic = @board.topics.find(params[:id])
  end

private
  def find_board
    @board = Board.find(params[:board_id])
  end

end
