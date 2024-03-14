class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  def index
    @teachers = Teacher.all
    @teachers = Teacher.page(params[:page]).per(9)
  end

  def show
  end

  def new
    @teacher = Teacher.new
    @teacher.pictures.build
  end

  def edit
    @teacher.pictures.build if @teacher.pictures.empty?
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to teachers_url, notice: "Teacher was successfully created."
    else
      render :new
    end
  end

  def update
    if @teacher.update(teacher_params)
      redirect_to @teacher, notice: 'Teacher was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @teacher.destroy
    redirect_to teachers_url, notice: 'Teacher was successfully deleted.'
  end

  private
  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:name, :bio, pictures_attributes: [:id, :image])
  end
end
