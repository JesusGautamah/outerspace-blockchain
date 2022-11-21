class AddApiKeysToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :api_key, :string
    add_column :users, :api_secret, :string
  end
end
