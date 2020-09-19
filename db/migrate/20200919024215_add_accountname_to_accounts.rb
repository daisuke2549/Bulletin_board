class AddAccountnameToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :accountname, :string
  end
end
