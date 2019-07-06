class ReviewsController < ApplicationController
  before_action :login_check

  # トップページ(レビューと、そのランキングを表示)
  def index
    @reviews = Review.order("id DESC")
    @reviews_rank = Review.order("likes_count ASC")
  end

  # レビュー詳細画面(コメントができる)
  def show
    # チャットのフォームから送信した場合、パラメーターのkeyが通常の(id)から(review_id)となるため、if文を仕様している
    if params[:id] then
      @review = Review.find(params[:id])
    elsif params[:review_id] then
     @review = Review.find(params[:review_id])
    end
    # チャットへ投稿内容を表示するため、chatsのインスタンス変数を定義している
    @chats = @review.chats
  end

  # レビューの投稿画面
  def new
    @review = Review.new
  end

  # レビューの保存ロジック
  def create
    @review = Review.new(title: review_params[:title], content: review_params[:content], image: review_params[:image], art_id: params[:art_id], user_id: current_user.id)
    @review.save

    if @review.save
      # artsコントローラーのshowアクションに飛ぶがidが渡せないので付与
      redirect_to action: 'index'
   else
     render :new
   end

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
    params.require(:review).permit(:title, :content, :image) # POINT
  end
end
