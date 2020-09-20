class Post < ApplicationRecord
    has_one_attached :image
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    belongs_to :account, optional: true  

    def display_created_at
        I18n.l(self.created_at, format: :default)
    end
end
