class BoardsController < ApplicationController

  before_action :admin_required, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = current_user.boards.new
  end

  def create
    @board = current_user.boards.new(board_params)
    if @board.save
      redirect_to board_path(@board)
      flash[:success] = "Board created!"
    else
      render :new
      flash[:warning] = "Failed to build Board"
    end
  end

  def edit
    @board = current_user.boards.find(params[:id])
  end

  def update
    @board = current_user.boards.find(params[:id])
    if @board.update(board_params)
      redirect_to board_path(@board)
      flash[:success] = "Update success!"
    else
      render :edit
      flash[:warning] = "Update failed!"
    end
  end

  def destroy
    @board = current_user.boards.find(params[:id])
    @board.destroy
    redirect_to boards_path
    flash[:success] = "Delete success!"
  end

private

  def board_params
    params.require(:board).permit(:name, :description, :user_id)
  end
end
