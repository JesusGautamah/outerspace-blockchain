class AddTransactionsCountToBlocks < ActiveRecord::Migration[7.0]
  def change
    add_column :blocks, :transactions_count, :integer, default: 0, null: false
  end
end
