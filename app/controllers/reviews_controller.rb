class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @pod = Pod.find(params[:pod_id])
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to root_path, notice: "Review submitted successfully."
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :parent_id, :pod_id)
  end
end
