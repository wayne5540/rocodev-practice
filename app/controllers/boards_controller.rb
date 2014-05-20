class BoardsController < ApplicationController

  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
    #oh my god so dirty...
    set_topic_for_show
    @tags = Tag.all
  end

  def feed
    @board = Board.find(params[:id])
    @topics = @board.topics.recent.limit(5)
    respond_to do |format|
      format.html
      format.rss { render :layout => false }
    end
  end

  protected

  def set_topic_for_show
    if params[:tag].blank?
      @topics = @board.topics.sort_by_views_count
    else
      @topics = @board.topics.in_tag(params[:tag]).sort_by_views_count
    end
  end

end
