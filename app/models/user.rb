class User < ApplicationRecord
  validates :uid, presence: true, uniqueness: true
#  validates :pass, presence: true, length: {minimum: 4}
  validates :password, presence: true, confirmation: true  
  
  has_many :animes, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :bads, dependent: :destroy
  has_many :like_animes, through: :likes, source: :anime
  has_many :bad_animes, through: :bads, source: :anime

  attr_accessor :password, :password_confirmation

  mount_uploader :image, ImageUploader

  def password=(val)
    if val.present?
      self.pass = BCrypt::Password.create(val)
    end
    @password= val
  end
  
  def self.authenticate(uid, pass)
    user = User.find_by(uid: uid)

    if user and BCrypt::Password.new(user.pass) == pass
      user
    else
      nil
    end
  end

end
