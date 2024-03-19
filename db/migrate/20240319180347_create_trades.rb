class CreateTrades < ActiveRecord::Migration[7.0]
  def change
    create_table :trades do |t|
      t.references :official, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true
      t.integer :transaction_type
      t.integer :transaction_count
      t.references :user, null: false, foreign_key: true
      t.string :security_type

      t.timestamps
    end
  end
end
