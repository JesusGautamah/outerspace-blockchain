class AddBlockToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_reference :transactions, :block, null: false, foreign_key: true
  end
end
