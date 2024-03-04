class HomeController < ApplicationController
  def index
    @pods = if params[:search].present?
      Pod.where("title LIKE ? OR location LIKE ? OR grade LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      Pod.last(3)
    end
  end
end
