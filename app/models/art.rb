class Art < ApplicationRecord
  has_one_attached :image

  has_many :reviews


  validate :validate_image

  def validate_image
    if image.attached?
      if image.blob.byte_size > 10.megabytes
        image.purge
        errors.add(:image, I18n.t('errors.messages.file_too_large'))
      end
    else
      errors.add(:image, :presence)
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
