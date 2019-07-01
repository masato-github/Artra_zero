class ArtsController < ApplicationController

  def show
    @reviews = Art.where('id','art_id')
  end

end
