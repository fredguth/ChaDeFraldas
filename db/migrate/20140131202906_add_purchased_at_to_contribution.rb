class AddPurchasedAtToContribution < ActiveRecord::Migration
  def change
    add_column :contributions, :purchased_at, :date
  end
end
