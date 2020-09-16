class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one :profile, dependent: :destroy
  delegate :birthday, :age, :gender, to: :profile, allow_nil: true




  def has_written?(post)
    posts.exists?(id: post.id)
  end

  def has_liked?(post)
    likes.exists?(id: post.id)
  end

  def display_name
    profile&.nickname || self.email.split('@').first
  end

  def prepare_profile
    profile || build_profile
  end 
  
  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'default-avatar.png'
    end
  end

  private
  def get_account_id(account)
    if account.is_a?(Account)
      account.id
    else
      account  
    end
  end

end
