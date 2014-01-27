class Event < ActiveRecord::Base
  belongs_to :user
  has_many :contributions
  has_many :contributors, :through => :contributions,  :class_name => "User"
  has_many :invitations
  has_many :invitees, :through => :invitations, :class_name => "User"
  has_many :options, :class_name =>"Product"
  validates_presence_of :name, :if => :inform?
  validates_presence_of :welcome_message, :if => :choose?
  validates_presence_of :thankyou_message, :if => :invite?
  attr_writer :current_step
  
  def current_step
    @current_step || steps.first
  end
  
  def steps
    %w[inform choose invite]
  end
  
  def next_step
  self.current_step = steps[steps.index(current_step)+1]
  end
  def last_step?
   current_step == steps.last
  end
  def inform?
    current_step == "inform"
  end
  def choose?
    current_step == "choose"
  end
  def invite?
    current_step == "invite"
  end
  def all_valid?
	  steps.all? do |step|
	    self.current_step = step
	    valid?
	  end
  end
end
