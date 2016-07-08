class TodosController < ApplicationController
  before_action :set_todo, only: [:update, :destroy]
  # GET /todos
  def index
    render json: Todo.order(:description)
  end

  # POST /todos
  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      render json: @todo, status: :created, location: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # PUT /todos/1
  def update
    if @todo.update(todo_params)
      render json: @todo, status: :ok, location: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
    head :no_content
  end

  private
    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit(:description, :completed)
    end

end
