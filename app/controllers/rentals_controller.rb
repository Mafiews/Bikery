class RentalsController < ApplicationController
  def create
    raise
  end

  def review
    @review = Review.new(review_params)
    @review.rental = @rental
    if @review.save
      redirect_to rental_path(@rental)
    else
      render "review_form"
    end
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
