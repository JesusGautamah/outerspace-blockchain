class AddUserAcceptableHashToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :user_acceptable_hash, :string
  end
end
