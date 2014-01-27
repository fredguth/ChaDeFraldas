class AddDefaultValueToIsOpen < ActiveRecord::Migration
  def up
    change_column :events, :is_open, :boolean, :default => true
end

def down
    change_column :events, :is_open, :boolean, :default => nil
end
end
