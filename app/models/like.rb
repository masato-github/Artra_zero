class Like < ApplicationRecord
  belongs_to :review, counter_cache: :likes_count
  # リレーションされているlikeの数の値をリレーション先のlikes_countというカラムの値に入れます
  # likes_countカラム=>review_tableに追加OK
  belongs_to :user
end
