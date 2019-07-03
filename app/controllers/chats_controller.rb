class ChatsController < ApplicationController

  def create
    # チャットのフォームで入力された(テキスト、ログインしているユーザーのid、reviewのid,作品のidを保存する)
    @chat = Chat.create(text: chat_params[:text], user_id: current_user.id, review_id: chat_params[:review_id], art_id: chat_params[:art_id])
    # チャットのフォームの送信ボタンを押した後、リダイレクト('/arts/:art_id/reviews/:review_id/:review_id')
    redirect_to redirect_chat_path
  end

  private
  def chat_params
    params.permit(:text, :review_id, :art_id)
  end

end
