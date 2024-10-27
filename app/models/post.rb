class Post < ApplicationRecord

  has_many_attached :images
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 300}


end
