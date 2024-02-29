class TeachersController < ApplicationController
  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to teachers_url, notice: "Teacher was successfully created."
    else
      render :new
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :bio)
  end
end
