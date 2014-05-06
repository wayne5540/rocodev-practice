class TopicsController < ApplicationController

  #to xdite: 
  #topic controller same as board's controller
  #just switch to practice2 => RESTful topics

  def index
    @topic = Topic.all
  end

  def show
  end

  def edit
  end

  def new
  end

private
  
  def topic_parems
    params.require(:topic).permit(:title, :content, :board_id, :user_id)
  end

  def find_board
    @board = Board.find(params[:id])
  end

end
