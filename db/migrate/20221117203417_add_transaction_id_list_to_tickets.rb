class AddTransactionIdListToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :transaction_id_list, :text, array: true, default: []
  end
end
