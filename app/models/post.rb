class Post < ApplicationRecord
  has_one_attached :image   # or attachment :image
  belongs_to :user
  has_many :comments, dependent: :destroy

end
