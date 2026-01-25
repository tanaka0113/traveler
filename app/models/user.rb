class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy 

  has_many :follower, class_name: "Relationship",
                       foreign_key: "follower_id",
                       dependent: :destroy

  has_many :followed, class_name: "Relationship",
                       foreign_key: "followed_id",
                       dependent: :destroy

  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower

  has_one_attached :profile_image

  # フォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # フォロー解除
  def unfollow(user_id)
    follower.find_by(followed_id: user_id)&.destroy
  end

  # フォローしているか？
  def following?(user)
    following_user.include?(user)
  end
end
