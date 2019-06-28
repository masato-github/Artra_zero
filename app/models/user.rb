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
  # 削除時に指定したモデルに対してdestroyが実行されるようになります。=>ユーザーが消えたらいいねも消える

  has_many :like_reviews, through: :likes, source: :review


end
