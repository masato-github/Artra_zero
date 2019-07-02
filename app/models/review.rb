class Review < ApplicationRecord
  has_one_attached :image

  # userに所属
  belongs_to :user
  belongs_to :art, optional: true


  # いいね機能
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

end
