class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
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
    redirect_to boards_path
    flash[:success] = "Delete success!"
  end

private

  def board_params
    params.require(:board).permit(:name, :description)
  end
end
