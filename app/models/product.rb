class Product < ActiveRecord::Base
	 has_many :selections
	 has_many :events, :through => :selections
end
