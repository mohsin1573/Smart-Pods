class ChildrenController < ApplicationController
  before_action :set_child, only: [:show, :edit, :update, :destroy]

  def index
    @children = Child.all
    @children = Child.page(params[:page]).per(10)
  end

  def new
    @child = Child.new
    @child.pictures.build
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
    @child.pictures.build if @child.pictures.empty?
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
    params.require(:child).permit(:name, :grade, :age, :dob, :parent_id, pictures_attributes: [:id, :image], address_attributes: [:id, :street, :city, :state, :zipcode, :country])
  end
end
