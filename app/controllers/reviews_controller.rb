class ReviewsController < ApplicationController
  before_action :login_check, except: :index
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @comment = Review.create params.require(:review).permit(:title, :content, :image) # POINT
    redirect_to action: 'index'
  end


  def login_check
    redirect_to action: :index unless user_signed_in?
  end

end
