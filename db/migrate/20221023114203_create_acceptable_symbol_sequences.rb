class CreateAcceptableSymbolSequences < ActiveRecord::Migration[7.0]
  def change
    create_table :acceptable_symbol_sequences do |t|
      t.string :seq, unique: true, null: false

      t.timestamps
    end
  end
end
