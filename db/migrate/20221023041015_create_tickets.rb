class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :pool, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
