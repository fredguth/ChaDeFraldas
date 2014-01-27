class Contribution < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_one :product
end
