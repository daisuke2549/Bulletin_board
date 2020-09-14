class Post < ApplicationRecord
    has_one_attached :image
    has_many :likes, dependent: :destroy
    belongs_to :account
end
