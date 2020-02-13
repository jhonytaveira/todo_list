class StepsController < ApplicationController
  before_action :set_step, only: %i[edit update]

  respond_to :html, :json

  def new
    @step = Step.new

    respond_modal_with @step
  end

  def edit
    respond_modal_with @step
  end

  def create
    @step = Step.new(step_params.merge(board_id: params[:board_id]))

    flash[:notice] = t('.messages.success') if @step.save
    respond_modal_with @step, location: -> { boards_path(id: @step.board.id) }
  end

  def update
    flash[:notice] = t('.messages.success') if @step.update(step_params)

    respond_modal_with @step, location: -> { boards_path(id: @step.board.id) }
  end

  private

  def set_step
    @step = Step.find(params[:id])
  end

  def step_params
    params.require(:step).permit(:name)
  end
end
