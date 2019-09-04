class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  # GET /todos
  def index
    @todos = Todo.all.order("created_at DESC")
    render json: todos
  end

  # GET /todos/:id
  def show
    @todo = Todo.find(params[:id])
    render json: todo
  end

  def new
    @todo = Todo.new(todo_params)
  end

  def edit
  end

  # POST /todos/:id
  def create
    @todo = Todo.create(todo_params)
    render json: todo
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update_attributes(todo_params)
    render json: todo
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    
  end

  private   
    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit(:title, :body)
    end
end
