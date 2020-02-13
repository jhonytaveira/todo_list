class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  respond_to :html, :json

  def show
    respond_modal_with @task
  end

  def new
    @task = Task.new
    respond_modal_with @task
  end

  def edit
    respond_modal_with @task
  end

  def create
    @task = Task.new(attributes)

    flash[:notice] = t('.messages.success') if @task.save

    respond_modal_with @task, location: -> { boards_path(id: @task.board.id) }
  end

  def update
    flash[:notice] = t('.messages.success') if @task.update(task_params)

    respond_modal_with @task, location: -> { boards_path(id: @task.board.id) }
  end

  def destroy
    flash[:notice] = t('.messages.success') if @task.destroy

    respond_with @task, location: -> { boards_path(id: @task.board.id) }
  end

  private

  def attributes
    task_params.merge(
      board_id: params[:board_id], step_id: params[:step_id]
    )
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description)
  end
end
