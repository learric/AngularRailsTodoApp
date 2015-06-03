class TodosController < ApplicationController
	before_action :set_todo, only: :destroy

  def index
    @todos = Todo.all
    render 'todos/index.json'
  end

  def create
    @todo = Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to '/', notice: 'Todo was successfully created.' }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { render 'todos/index.json', notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # private methods
  private
    def set_todo
      @todo = Todo.find_by(id: params[:id])
    end

    def todo_params
      params.require(:todo).permit(:item)
    end
end
