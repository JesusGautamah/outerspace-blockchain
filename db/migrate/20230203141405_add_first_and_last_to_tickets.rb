class AddFirstAndLastToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :first_five, :string, null: false
    add_column :tickets, :last_five, :string, null: false
  end
end
