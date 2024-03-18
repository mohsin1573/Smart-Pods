class HomeController < ApplicationController
  def index
    @recent_pods = Pod.order(id: :desc).limit(6)
    if params[:zipcode].present?
      @searched_pods = Pod.joins(:address).where(addresses: { zipcode: params[:zipcode] })
    end
    @teachers = Teacher.order(created_at: :desc).limit(3)
  end
end
