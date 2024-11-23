class Post < ApplicationRecord

  has_many_attached :images
  belongs_to :user

  has_many :book_comments, dependent: :destroy
 #複数のBookComentと関連付ける
 #bookが消されたとき関連するBookComentも同時に消される

  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200}

# 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE?","#{word}")
    elsif search == "partial_match"
      @post = Post.where("title LIKE?","%#{word}%")
    else
      @book = Book.all
    end
  end


end
