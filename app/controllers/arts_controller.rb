class ArtsController < ApplicationController


  # 検索画面
  def index
    @arts = Art.search(params[:search])
  end
  

  # 作品詳細画面
  def show
    @art = Art.find(params[:id])
  end

end
