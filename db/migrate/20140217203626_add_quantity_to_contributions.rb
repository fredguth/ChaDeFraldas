class AddQuantityToContributions < ActiveRecord::Migration
  def change
    add_column :contributions, :quantity, :integer, :null =>false, :default => 1
  end
end
