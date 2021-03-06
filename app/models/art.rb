class Art < ApplicationRecord
  # Active Storage の画像を保存する記述
  has_one_attached :image

  # artとreviewのアソシエーション
  has_many :reviews

  # バリデーション　「タイトル」「説明」「画像」存在の有無のみ
  validates :title, presence: { message: "は必ず入力して下さい" }
  validates :description, presence: {message: "は必ず入力して下さい"}
  validate :validate_image


  def validate_image
    if  !image.attached?
      image.purge
      errors[:base] << "画像は必ず選択して下さい"
    end
  end



# 作品検索ロジック
  def self.search(search) #ここでのself.はArt.を意味する
    if search
      where(['title LIKE ?', "%#{search}%"]) #検索とtitleの部分一致を表示。Art.は省略
    else
      all #全て表示。Art.は省略
    end
  end

end
