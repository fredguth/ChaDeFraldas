class Contribution < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  belongs_to :product
  attr_accessor :card_number, :holder, :expires_month, :expires_year, :cvc

  def purchase
  	#[true, false].sample
  	return false
  end

end
