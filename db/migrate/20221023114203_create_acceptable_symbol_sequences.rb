class CreateAcceptableSymbolSequences < ActiveRecord::Migration[7.0]
  def change
    create_table :acceptable_symbol_sequences do |t|
      t.string :seq

      t.timestamps
    end
  end
end
