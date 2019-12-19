class Anime < ApplicationRecord
  validates :message, presence: true, length: {maximum: 140}

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :bads,  dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  has_many :bad_users, through: :bads, source: :user
  
  def like(user)
    likes.create(user_id:user.id)
  end
  
  def unlike(user)
    likes.find_by(user_id:user.id).destroy
  end
  
  def liked?(user)
    like_users.include?(user)
  end
  
  def bad(user)
    bads.create(user_id:user.id)
  end
  
  def unbad(user)
    bads.find_by(user_id:user.id).destroy
  end
  
  def bad?(user)
    bad_users.include?(user)
  end
end
