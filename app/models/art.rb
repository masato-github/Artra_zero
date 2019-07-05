class Art < ApplicationRecord
  has_one_attached :image
  
  has_many :reviews

  validates :title, presence: { message: "(タイトル)" }
  validates :description, presence: {message: "(説明)"}
  validates :image, presence: {message: "(画像)"}


# 作品検索ロジック
  def self.search(search) #ここでのself.はArt.を意味する
    if search
      where(['title LIKE ?', "%#{search}%"]) #検索とtitleの部分一致を表示。Art.は省略
    else
      all #全て表示。Art.は省略
    end
  end

end
