class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @comment = Review.create params.require(:review).permit(:title, :content, :image) # POINT
    redirect_to action: 'index'
  end


end
