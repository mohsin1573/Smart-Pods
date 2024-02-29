class ChildrenController < ApplicationController
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

  private

  def child_params
    params.require(:child).permit(:name, :grade, :parent_id)
  end
end
