class BoardsController < ApplicationController

  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
    @topics = @board.topics.sort_by_views_count
  end

  def feed
    @board = Board.find(params[:id])
    @topics = @board.topics(:order => "created_at", :limit => 10)
    respond_to do |format|
      format.html
      format.rss { render :layout => false }
    end
  end

end
