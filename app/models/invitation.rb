class Invitation < ActiveRecord::Base
  belongs_to :user
  has_many :invitees, :class_name => "User"
end
