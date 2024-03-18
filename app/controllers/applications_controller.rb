class ApplicationsController < ApplicationController
  def index
    @applications = current_parent.applications.includes(:pod, :child).order(created_at: :desc)
    @application = Application.new
  end

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

  def destroy
    @application = current_parent.applications.find(params[:id])
    @application.destroy
    redirect_to applications_path, notice: "Application deleted successfully."
  end

  private

  def application_params
    params.require(:application).permit(:parent_id, :pod_id, :child_id, :status)
  end
end
