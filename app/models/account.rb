class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one :profile, dependent: :destroy
  delegate :birthday, :age, :gender, to: :profile, allow_nil: true

  has_many :following_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :followings, through: :following_relationships, source: :following
  has_many :follower_relationships, foreign_key: 'following_id', class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower


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
  
  def follow!(account)
    account_id = get_account_id(account)
    following_relationships.create!(following_id: account_id)
  end


  def unfollow!(account)
    account_id = get_account_id(account)
    relation = following_relationships.find_by!(following_id: account_id)
    relation.destroy!
  end

  def has_followed?(account)
    following_relationships.exists?(following_id: account.id)
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
