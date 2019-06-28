class ReviewsController < ApplicationController
  before_action :login_check, except: :index
  def index
    @reviews = Review.order("id DESC")
    @reviews_rank = Review.order("likes_count ASC")
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(title: review_params[:title], content: review_params[:content], image: review_params[:image], user_id: current_user.id)
    redirect_to action: 'index'
  end


  def login_check
    redirect_to action: :index unless user_signed_in?
  end


  private
  def review_params
    #requireメソッドがデータのオブジェクト名(review)を定め、
    #permitメソッドで変更を加えられる（保存の処理ができる）キーを指定します。
    params.require(:review).permit(:title, :content, :image, :user_id ) # POINT
  end
end
