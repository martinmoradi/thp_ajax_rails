class TasksController < ApplicationController
  # before_action :authenticate_user!
  def new
    @categories = Category.all
  end

  def create
    @task = Task.new(task_params)
    @category = Category.find(category_params)
    @task.category = @category
    if @task.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { flash[:notice] = "Task created AJAX" }
      end
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end

  def edit
    @task = Task.find(params[:id])
    @categories = Category.all
  end

  def index
    @tasks = Task.all
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { flash[:notice] = "Task deleted with AJAX" }
      end
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end

  private

  def task_params
    params.permit(:title, :deadline, :description, :status, :id)
  end

  def category_params
    params.require(:Category)
  end
end
