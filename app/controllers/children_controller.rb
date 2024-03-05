class ChildrenController < ApplicationController
  before_action :set_child, only: [:show, :edit, :update, :destroy]

  def index
    @children = Child.all
  end

  def new
    @child = Child.new
  end

  def create
    @child = Child.new(child_params)
    if @child.save
      redirect_to root_path, notice: "Child was successfully added."
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @child.update(child_params)
      redirect_to @child, notice: 'Child was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @child.destroy
    redirect_to children_url, notice: 'Child was successfully destroyed.'
  end

  private

  def set_child
    @child = Child.find(params[:id])
  end

  def child_params
    params.require(:child).permit(:name, :grade, :parent_id)
  end
end
