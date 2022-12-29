class SnowBoardsController < ApplicationController
    skip_before_action :require_login

  def new
    @snow_board = SnowBoard.new
  end

  def create
    @snow_board = SnowBoard.new(board_params)
    if @snow_board.save
        redirect_to snow_boards_path
    else
      render :new
    end
  end

  def index
    @snow_boards = SnowBoard.all
  end

  private

  def board_params
    params.require(:snow_board).permit(:item_name, :item_information, :type)
  end
end
