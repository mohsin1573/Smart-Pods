class HomeController < ApplicationController
  def index
    @pods = if params[:search].present?
      Pod.where("name LIKE ? OR zipcode LIKE ? OR grade LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      Pod.last(6)
    end
    @teachers = Teacher.order(created_at: :desc).limit(3)
  end
end
