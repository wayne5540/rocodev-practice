class TopicsController < ApplicationController
  before_action :find_board, :except => [:feed]
  before_action :login_required, :only => [:new, :create]
  
  def index
    @topics = @board.topics.all
  end

  def show
    @topic = @board.topics.find(params[:id])
    increment_topic_views_count
  end

  def new
    @topic = @board.topics.new
  end

  def create
    @topic = @board.topics.build(topic_params)
    @topic.author = current_user
    if @topic.save
      redirect_to board_topic_path(@board, @topic)
      flash[:success] = "create success!"
    else
      render :new
      flash[:warning] = "create failed"
    end
  end

  def feed
    @topics = Topic.all(:order => "created_at", :limit => 10)
    respond_to do |format|
      format.html
      format.rss { render :layout => false } #index.rss.builder
    end
  end

private
  
  def find_board
    @board = Board.find(params[:board_id])
  end

  def increment_topic_views_count
    @topic.increment!(:views_count)
  end

  def topic_params
    params.require(:topic).permit(:title, :content, :board_id, :user_id, :avatar, :remove_avatar)
  end


end
