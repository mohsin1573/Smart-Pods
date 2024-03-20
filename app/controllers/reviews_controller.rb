class ReviewsController < ApplicationController

  def create
    @pod = Pod.find(params[:pod_id])
    @review = @pod.reviews.create(review_params)
    respond_to do |format|
      if @review.save
        format.turbo_stream
      else
        format.html { render 'pods/show', status: :unprocessable_entity }
      end
    end
  end

  private

    def review_params
      params.require(:review).permit(:content, :rating)
    end
end
