class Account::TopicsController < ApplicationController

  before_action :login_required

  def index
    @topics = current_user.topics.all
  end

  def edit
    @topic = current_user.topics.find(params[:id])
  end

  def update
    @topic = current_user.topics.find(params[:id])
    if @topic.update(topic_parems)
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


private
  
  def topic_parems
    params.require(:topic).permit(:title, :content, :board_id, :user_id, :avatar, :remove_avatar)
  end

end
