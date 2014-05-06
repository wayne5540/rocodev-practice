class TopicsController < ApplicationController

  before_action :find_board
  before_action :login_required, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @topics = @board.topics.all
  end

  def show
    @topic = @board.topics.find(params[:id])
  end

  def edit
    @topic = @board.topics.find(params[:id])
  end

  def update
    @topic = @board.topics.find(params[:id])
    if @topic.update(topic_parems)
      redirect_to board_topic_path(@board, @topic)
      flash[:success] = "update success!"
    else
      render :edit
      flash[:warning] = "update failed"
    end
  end

  def new
    @topic = @board.topics.new
  end

  def create
    @topic = @board.topics.new(topic_parems)
    if @topic.save
      redirect_to board_topic_path(@board, @topic)
      flash[:success] = "create success!"
    else
      render :new
      flash[:warning] = "create failed"
    end
  end

  def destroy
    @topic = @board.topics.find(params[:id])
    @topic.destroy
    redirect_to board_topics_path
    flash[:success] = "Delete success!"
  end

private
  
  def topic_parems
    params.require(:topic).permit(:title, :content, :board_id, :user_id)
  end

  def find_board
    @board = Board.find(params[:board_id])
  end

end
