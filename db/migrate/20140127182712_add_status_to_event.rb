class AddStatusToEvent < ActiveRecord::Migration
  def up
    add_column :events, :status, :string
  end

  def down
    remove_column :events, :status
  end
end
