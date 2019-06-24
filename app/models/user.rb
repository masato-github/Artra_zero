class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: {message: 'を入力してください'}

# userはreviewを持っている
  has_many :reviews

  # いいね機能
  has_many :likes, dependent: :destroy
  has_many :like_stories, through: :likes, source: :review

end
