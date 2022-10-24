class AddMasterHashToBlocks < ActiveRecord::Migration[7.0]
  def change
    add_column :blocks, :master_hash, :string, length: 64
  end
end
