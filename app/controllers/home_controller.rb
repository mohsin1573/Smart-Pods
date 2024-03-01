class HomeController < ApplicationController
  def index
    @pods = Pod.where(nil)
    @pods = @pods.where("title LIKE ? OR location LIKE ? OR grade LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    @pods = Pod.page(params[:page]).per(10)
  end
end
