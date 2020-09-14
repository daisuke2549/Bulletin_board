class Profile < ApplicationRecord
    enum gender: { male: 0, female: 1, other: 2 }
    belongs_to :account
    has_one_attached :avatar

end
