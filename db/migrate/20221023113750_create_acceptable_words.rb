class CreateAcceptableWords < ActiveRecord::Migration[7.0]
  def change
    create_table :acceptable_words do |t|
      t.string :word, unique: true, null: false

      t.timestamps
    end
  end
end
