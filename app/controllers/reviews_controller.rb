class ReviewsController < ApplicationController
  def create
      @review = current_parent.reviews.new(review_params)
      if !@review.save
          flash[:notice] = @review.errors.full_messages.to_sentence
      end

      redirect_to pod_path(params[:pod_id])
  end


  private

    def review_params
      params.require(:review).permit(:content, :rating).merge(pod_id: params[:pod_id])
     end
end
