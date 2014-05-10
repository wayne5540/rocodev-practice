class Account::TopicsController < ApplicationController
  #before_action :find_board, :except => [:index, :edit, :update, :destroy] 
  before_action :login_required

  def index
    @topics = current_user.topics.all
  end

  def edit
    @topic = current_user.topics.find(params[:id])
  end

  def update
    @topic = current_user.topics.find(params[:id])
    if @topic.update(topic_params)
      redirect_to account_topics_path
      flash[:success] = "update success!"
    else
      render :edit
      flash[:warning] = "update failed"
    end
  end

  def destroy
    @topic = current_user.topics.find(params[:id])
    @topic.destroy
    redirect_to account_topics_path
    flash[:success] = "Delete success!"
  end

  def new
    @topic = current_user.topics.new
    @board = params[:board_id]
  end

  def create
    @topic = current_user.topics.new(topic_params)
    @board = topic_params[:board_id]
    if @topic.save
      redirect_to board_topic_path(@topic.board_id, @topic)
      flash[:success] = "create success!"
    else
      flash[:warning] = "create failed"
    end
  end

private
  
  def topic_params
    params.require(:topic).permit(:title, :content, :board_id, :user_id, :avatar, :remove_avatar)
  end

  def find_board
    @board = Board.find(params[:board_id])
  end

end
