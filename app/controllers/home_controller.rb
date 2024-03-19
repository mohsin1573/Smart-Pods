class HomeController < ApplicationController
  def index
    @recent_pods = Pod.order(id: :desc).limit(6)
    @pods = Pod.all
    if params[:address_search].present?
      @pods = @pods.joins(:address).where("addresses.zipcode LIKE :search OR addresses.street LIKE :search OR addresses.city LIKE :search OR addresses.state LIKE :search", search: "%#{params[:address_search]}%")
    end
    @teachers = Teacher.order(created_at: :desc).limit(3)
  end
end
