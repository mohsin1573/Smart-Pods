class ReviewsController < ApplicationController
  before_action :authenticate_parent!, except: [:index, :show]
  before_action :set_review, only: [:edit, :update, :destroy]

  def new
    @review = Review.new
    @pod = Pod.find(params[:pod_id])
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to @review.pod, notice: "Review submitted successfully."
    else
      render :new
    end
  end

  def edit
    @pod = Pod.find(params[:pod_id])
  end

  def update
    if @review.update(review_params)
      redirect_to @review.pod, notice: "Review was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to @review.pod, notice: "Review was successfully deleted."
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :parent_id, :pod_id)
  end
end
