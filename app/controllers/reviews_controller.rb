class ReviewsController < ApplicationController
  before_action :login_check

  # トップページ(レビューと、そのランキングを表示)
  def index
    @reviews = Review.order("id DESC")
    @reviews_rank = Review.order("likes_count ASC")
  end

  # レビュー詳細画面(コメントができる)
  def show
    @review = Review.find(params[:id])
  end

  # レビューの投稿画面
  def new
    @review = Review.new
  end

  # レビューの保存ロジック
  def create
    @review = Review.create(title: review_params[:title], content: review_params[:content], image: review_params[:image], art_id: review_params[:art_id], user_id: current_user.id)
    redirect_to action: 'index'
  end

# ログインしていないとログイン画面しか行けない設定
  def login_check
    redirect_to  "/users/sign_in" unless user_signed_in?
  end


  # レビュー投稿のストロングパラメータ＾
  private
  def review_params
    #requireメソッドがデータのオブジェクト名(review)を定め、
    #permitメソッドで変更を加えられる（保存の処理ができる）キーを指定します。
    params.require(:review).permit(:title, :content, :image, :art_id) # POINT
  end
end
