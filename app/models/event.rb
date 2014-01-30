class Event < ActiveRecord::Base
  belongs_to :user
  has_many :contributions
  has_many :contributors, :through => :contributions,  :class_name => "User"
  has_many :invitations
  has_many :invitees, :through => :invitations, :class_name => "User"
  has_many :selections
  has_many :products, :through => :selections
  validates :name,:welcome_message,:thankyou_message, :presence => true
  
    
  def contribution_sum
  	sum =0
  	self.contributions.each do |c|
  		sum+=c.product.value	
  	end
  	return sum
  end

def self.text_search(query)
    if query.present?
      where("name @@ :q or user @@ :q or welcome_message @@ :q", q: query)
    else
      scoped
    end
  end
end
