class ApplicationsController < ApplicationController
  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)
    if @application.save
      redirect_to root_path, notice: "Application submitted successfully."
    else
      render :new
    end
  end

  private

  def application_params
    params.require(:application).permit(:parent_id, :pod_id, :child_id, :status)
  end
end
