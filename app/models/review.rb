class Review < ApplicationRecord
  has_one_attached :image

  # userに所属
  belongs_to :user
  belongs_to :art, optional: true


  validates :title, presence: { message: "は必ず入力して下さい" }
  validates :content, presence: {message: "は必ず入力して下さい"}
  validate :validate_image
  validates :art_id, presence: {message: "予期せぬエラー"}
  validates :user_id, presence: {message: "予期せぬエラー"}

  def validate_image
    if  !image.attached?
      image.purge
      errors[:base] << "画像は必ず選択して下さい"
    end
  end


# レビューはチャットを持っている
  has_many :chats


  # いいね機能
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

end
