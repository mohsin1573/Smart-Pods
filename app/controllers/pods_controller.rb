class PodsController < ApplicationController
  before_action :set_pod, only: [:show, :edit, :update, :destroy]

  def index
    @pods = Pod.all
    @pods = Pod.page(params[:page]).per(10)
  end

    def show
      @pod = Pod.find(params[:id])
      @review = Review.new
    end

  def new
    @pod = Pod.new
    @pod.pictures.build
    @review = Review.new
  end

  def edit
    @pod.pictures.build if @pod.pictures.empty?
  end

  def create
    @pod = Pod.new(pod_params)

    if @pod.save
      redirect_to @pod, notice: 'Pod was successfully created.'
    else
      render :new
    end
  end

  def update
    if @pod.update(pod_params)
      redirect_to @pod, notice: 'Pod was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @pod.destroy
    redirect_to pods_url, notice: 'Pod was successfully destroyed.'
  end

  private
    def set_pod
      @pod = Pod.find(params[:id])
    end

    def pod_params
      params.require(:pod).permit(:title, :description, :location, :grade, :teacher_id, pictures_attributes: [:id, :image])
    end
end
