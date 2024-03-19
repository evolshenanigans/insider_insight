class AddNameToOfficials < ActiveRecord::Migration[7.0]
  def change
    add_column :officials, :name, :string
  end
end
