class AddInvitationToEvents < ActiveRecord::Migration
  def change
    add_column :events, :invitation, :text
  end
end
