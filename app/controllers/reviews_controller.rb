class ReviewsController < ApplicationController
  before_action :find_restaurant

  def index
    @reviews = Review.where(restaurant_id: @restaurant.id)
  end

  def new
    @review = Review.new
  end

  def create
    @review = @restaurant.reviews.build(review_params)
    @review.save
    redirect_to restaurant_path(@restaurant)
  end

  private

  def review_params
    params.require(:review).permit([:content, :rating])
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
