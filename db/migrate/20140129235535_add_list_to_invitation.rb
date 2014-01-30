class AddListToInvitation < ActiveRecord::Migration
  def change
    add_column :invitations, :list, :text
  end
end
