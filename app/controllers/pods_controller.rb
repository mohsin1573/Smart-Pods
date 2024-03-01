class PodsController < ApplicationController
  def new
    @pod = Pod.new
  end

  def create
    @pod = Pod.new(pod_params)
    if @pod.save
      redirect_to pods_url, notice: "Pod was successfully created."
    else
      render :new
    end
  end

  private

  def pod_params
    params.require(:pod).permit(:title, :description, :location, :grade, :teacher_id, images: [])
  end
end
