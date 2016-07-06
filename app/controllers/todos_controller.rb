class TodosController < ApplicationController

  # GET /todos
  def index
    @todos = Todo.all
    render json: @todos
  end

  # POST /todos
  def create
    @todo = Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.json { render :show, status: :created, location: @todo}
      else
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /todos/1
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.json { render :show, status: :ok, location: @todo }
      else
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

    def todo_params
      params.require(:todo).permit(:description, :completed)
    end

end
