class RemoveAccountIdFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :account_id, :bigint
  end
end
