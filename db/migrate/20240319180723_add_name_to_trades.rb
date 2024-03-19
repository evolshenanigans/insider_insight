class AddNameToTrades < ActiveRecord::Migration[7.0]
  def change
    add_column :trades, :name, :string
  end
end
