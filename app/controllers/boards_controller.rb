class BoardsController < ApplicationController
  def index
    @board = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = Board.new
  end

  def create
    
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    
  end

  def destroy
    
  end

private

  def board_params
    params.require(:board).permit(:name, :description)
  end
end
