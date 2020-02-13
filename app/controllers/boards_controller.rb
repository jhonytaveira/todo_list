class BoardsController < ApplicationController
  before_action :set_board, only: [:index]

  respond_to :html, :json

  def index
    @boards = Board.all
  end

  def new
    @board = Board.new

    respond_modal_with @board
  end

  def create
    @board = Board.create(board_params)

    flash[:notice] = t('.messages.success') if @board.save

    respond_modal_with @board, location: -> { boards_path(id: @board.id) }
  end

  private

  def set_board
    @board = Board.find_by(id: params[:id])
  end

  def board_params
    params.require(:board).permit(:name)
  end
end
