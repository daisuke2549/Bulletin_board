class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :account, null: false
      t.string :nickname
      t.text :introduction
      t.integer :gender
      t.date :birthday
      t.booleamn :subscribed, default: false
      t.timestamps
    end
  end
end
