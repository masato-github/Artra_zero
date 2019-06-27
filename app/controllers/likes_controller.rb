class LikesController < ApplicationController
# ・set_variablesで変数を定義しています。@id_nameは非同期の時に使います。
  before_action :set_variables

  def like
# Userモデルの呼び出しをcurrent_userで行うことで、自動的にuser_idにcurrent_user.idが指定されます。
# likesテーブルの「user_id」と「review_id」を保存する
    like = current_user.likes.new(review_id: @review.id)
    like.save
  end

  def unlike
# likesテーブルの「user_id」と「review_id」を削除する
    like = current_user.likes.find_by(review_id: @review.id)
    like.destroy
  end

  private

  def set_variables
    @review = Review.find(params[:review_id])
    @id_name = "#like-link-#{@review.id}"
  end

end
