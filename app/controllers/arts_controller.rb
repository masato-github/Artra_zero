class ArtsController < ApplicationController
before_action :login_check

  # 検索画面
  def index
    @arts = Art.search(params[:search])
  end


  # 作品詳細画面
  def show
    @art = Art.find(params[:id])
    # 作品に関するレビューをいいね順で取得
    @reviews = @art.reviews.order("likes_count ASC")
  end

  def new
    @art = Art.new
  end

  def create
    @art = Art.create(art_params)
    # artsコントローラーのshowアクションに飛ぶがidが渡せないので付与
    redirect_to art_path(id: @art.id)
  end

  def edit
    @art = Art.find(params[:id])
  end

  def update
    @art = Art.update(art_params)

     redirect_to art_path
  end

  private
  def art_params
    #requireメソッドがデータのオブジェクト名(review)を定め、
    #permitメソッドで変更を加えられる（保存の処理ができる）キーを指定します。
    params.require(:art).permit(:title, :description, :image) # POINT
  end


  def login_check
    redirect_to  "/users/sign_in" unless user_signed_in?
  end

end
