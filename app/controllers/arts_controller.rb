class ArtsController < ApplicationController


  def show
    @art = Art.find(params[:id])

  end

end
