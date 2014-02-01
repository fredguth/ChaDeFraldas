class AddExpiresonToContribution < ActiveRecord::Migration
  def change
    add_column :contributions, :expires_on, :date
  end
end
