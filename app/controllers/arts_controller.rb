class ArtsController < ApplicationController
before_action :login_check

  # 検索画面
  def index
    @arts = Art.search(params[:search])
  end


  # 作品詳細画面
  def show
    @art = Art.find(params[:id])
  end

  def create

  end

  def new

  end

  def update

  end

  def edit

  end


  def login_check
    redirect_to  "/users/sign_in" unless user_signed_in?
  end

end
