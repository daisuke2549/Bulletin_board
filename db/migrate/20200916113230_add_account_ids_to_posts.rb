class AddAccountIdsToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :account_id, :bigint
  end
end
