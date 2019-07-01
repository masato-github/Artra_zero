class Art < ApplicationRecord

  has_many :reviews



# 作品検索ロジック
  def self.search(search) #ここでのself.はArt.を意味する
    if search
      where(['title LIKE ?', "%#{search}%"]) #検索とtitleの部分一致を表示。Art.は省略
    else
      all #全て表示。Art.は省略
    end
  end

end
