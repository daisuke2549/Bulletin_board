class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :following, null: false, foregin_key: { to_table: :accounts }
      t.references :follower, null: false, foregin_key: { to_table: :accounts }
      t.timestamps
    end
  end
end
