class ChatsController < ApplicationController

  def create
    @chat = Chat.create(text: chat_params[:text], user_id: current_user.id, review_id: chat_params[:review_id], art_id: chat_params[:art_id])
    redirect_to redirect_chat_path
  end

  private
  def chat_params
    params.permit(:text, :review_id, :art_id)
  end

end
