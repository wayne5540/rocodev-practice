class CommentsController < ApplicationController
  before_action :login_required, :only => [:create]
  def index
    #@commentable =  set_commentable
    #@comments = Comment.where(:commentable => @commentable)

    #TODO: user comments page
    flash[:warning] = "No Such Page"
    redirect_to root_path
  end

  def create
    @commentable = set_commentable
    @comment = @commentable.comments.build(comment_params)
    if @comment.save
      flash[:notice] = "Successfully saved comment."
      redirect_to :back
    else
      render :back
    end
  end

  # TODO: user destroy and update

  protected

  def set_commentable
    if params[:topic_id]
      @commentable = Topic.find(params[:topic_id])
    elsif params[:board_id]
      @commentable = Board.find(params[:board_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type)
  end

  

end
