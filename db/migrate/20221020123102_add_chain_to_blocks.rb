class AddChainToBlocks < ActiveRecord::Migration[7.0]
  def change
    add_reference :blocks, :chain, null: false, foreign_key: true
  end
end
