class ReviewsController < ApplicationController
  def index
    @reviews = Review.find(1)
  end

  def new
  end

  def create
    @review = Review.new(permit_params)
    @review.save!
    redirect_to action: 'index'
  end


  #プライベート
  private
    def permit_params
      params.permit(:title, :image, :text)
    end


  end
