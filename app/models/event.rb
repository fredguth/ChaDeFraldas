class Event < ActiveRecord::Base
  belongs_to :user
  has_many :contributions
  has_many :contributors, :through => :contributions,  :class_name => "User"
  has_many :invitations
  has_many :invitees, :through => :invitations, :class_name => "User"
  has_many :options, :class_name =>"Products"
end
