class Post < ApplicationRecord

  has_many_attached :images
  belongs_to :user

  has_many :post_comments, dependent: :destroy
 #複数のPostComentと関連付ける
 #Postが消されたとき関連するPostComentも同時に消される

 has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200}

# 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE?","#{word}")
    elsif search == "partial_match"
      @post = Post.where("title LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end

  def favorited_by?(user)
   favorites.exists?(user_id: user.id)
  end


end
