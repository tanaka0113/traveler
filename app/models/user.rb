class User < ApplicationRecord
  # devise の設定（これはそのまま）
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ★ここを追加する
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
