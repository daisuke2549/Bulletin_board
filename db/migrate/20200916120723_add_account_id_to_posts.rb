class AddAccountIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :account
    validates :content, presence: true
  end
end
