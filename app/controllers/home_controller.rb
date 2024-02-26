class HomeController < ApplicationController
  def index
    @pods = Pod.where(nil)
    @pods = @pods.where("LOWER(title) LIKE ?", "%#{params[:title].downcase}%") if params[:title].present?
    @pods = @pods.where("LOWER(location) LIKE ?", "%#{params[:location].downcase}%") if params[:location].present?
    @pods = @pods.where(grade: params[:grade]) if params[:grade].present?
  end
end
