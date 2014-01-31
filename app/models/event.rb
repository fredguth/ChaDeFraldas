class Event < ActiveRecord::Base
  belongs_to :user
  has_many :contributions
  has_many :contributors, :through => :contributions,  :class_name => "User"
  has_many :selections
  has_many :products, :through => :selections
  

  validates :name,:welcome_message,:thankyou_message, :presence => true
  
  
  def invitees #return a set of uids
    $redis.smembers("evt:#{self.id}")
  end
  
  def self.uids_by_event_id(event_id)
    $redis.smembers("evt:#{event_id}")
  end

  def self.event_ids_by_uid(uid)
    $redis.smembers("uid:#{uid}")
  end


  def invite (uid) 
      $redis.multi do
        $redis.sadd("evt:#{self.id}", uid)
        $redis.sadd("uid:#{uid}", self.id)
      end  
      $redis.BGSAVE
  end

  def invite (*array)#array of users uids
     $redis.multi do
        puts "oi"
        $redis.sadd("evt:#{self.id}", array)
        array.each do |uid|
          $redis.sadd("uid:#{uid}", self.id)
        end
      end
      $redis.BGSAVE 
  end
    

   def contribution_sum
  	sum = 0
  	 self.contributions.each do |c|
  		  sum+=c.product.value if c.product	
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
