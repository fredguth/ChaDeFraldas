class Event < ActiveRecord::Base
  belongs_to :user
  has_many :contributions
  has_many :contributors, :through => :contributions,  :class_name => "User"
  has_many :invitations
  has_many :invitees, :through => :invitations, :class_name => "User"
  has_many :selections
  has_many :products, :through => :selections
  #has_and_belongs_to_many :products, :as =>:options
  validates :name,:welcome_message,:thankyou_message, :presence => true
  
    
  

end
