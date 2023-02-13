class AddUserAcceptableHashToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :user_acceptable_hash, :string
    add_column :tickets, :confirmation_hash, :string, null: false
    add_column :tickets, :block_hash, :string, null: false
  end
end
