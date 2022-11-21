class AddContractsCountToBlock < ActiveRecord::Migration[7.0]
  def change
    add_column :blocks, :contracts_count, :integer, default: 0, null: false
    add_column :blocks, :contracts_limit, :integer, default: 0, null: false
  end
end
