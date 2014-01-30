class Invitation < ActiveRecord::Base
  belongs_to :user
  serialize :list, Hash


  

end
