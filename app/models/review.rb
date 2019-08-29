class Review < ApplicationRecord
  # Active Storage の画像を保存する記述
  has_one_attached :image

  # userに所属
  belongs_to :user
  belongs_to :art, optional: true


  # レビューはチャットを所持
  has_many :chats


  # いいね機能のアソシエーション
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  # バリデーション　「タイトル」「レビュー内容」「画像」とアソシエーションで使用するartとuserのidの存在の有無のみ
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

end
