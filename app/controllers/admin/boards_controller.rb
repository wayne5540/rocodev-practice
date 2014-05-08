class Admin::BoardsController < ApplicationController
  before_action :admin_required

  def index
    @boards = Board.all
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
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    if @board.update(board_params)
      redirect_to board_path(@board)
      flash[:success] = "Update success!"
    else
      render :edit
      flash[:warning] = "Update failed!"
    end
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to admin_boards_path
    flash[:success] = "Delete success!"
  end

private

  def board_params
    params.require(:board).permit(:name, :description, :user_id)
  end

end
