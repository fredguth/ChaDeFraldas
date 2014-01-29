class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  validates_presence_of :email
  validates_uniqueness_of :email
  has_many :events
  attr_accessible :get_friends_who_like

def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.last_name = auth.info.last_name
      user.first_name = auth.info.first_name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end



def self.new_with_session(params, session)
  if session["devise.user_attributes"]
    new(session["devise.user_attributes"], without_protection: true) do |user|
      user.attributes = params
      user.valid?
    end
  else
    super
  end    
end



def password_required?
  super && provider.blank?
end



def update_with_password(params, *options)
  if encrypted_password.blank?
    update_attributes(params, *options)
  else
    super
  end
end

def facebook
  @facebook||=Koala::Facebook::API.new(oauth_token)
end

def get_friends
  self.facebook.fql_query("SELECT name, pic_square,uid FROM user WHERE uid in (SELECT uid2 FROM friend WHERE uid1=me())")
end

def get_friends_who_like(page)
  q = "SELECT id FROM object_url WHERE url ='"+page+"'"
  id = self.facebook.fql_query(q).first
  if id?
     q ="SELECT username, name, pic_square FROM user WHERE uid IN(SELECT uid FROM page_fan WHERE page_id='"+id["id"].to_s+"' AND uid IN (SELECT uid2 FROM friend WHERE uid1 = me()))"
     self.facebook.fql_query(q)
  else
     return []
  end 
end

def get_picture(options={})
  options[:type]||="square"
  self.facebook.get_picture('me', { :type => options[:type]})

end
def get_gender
  self.facebook.get_object('me')["gender"]
end

def self.share_blog_registration(user_id, blog_url)
  user = User.find(user_id)
  user.facebook.put_connections("me", "blogsdemae:register", blog: blog_url)
end
def self.share_blog_edition(user_id, blog_url)
  user = User.find(user_id)
  user.facebook.put_connections("me", "blogsdemae:edit", blog: blog_url)
end


end
