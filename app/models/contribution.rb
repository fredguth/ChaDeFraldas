class Contribution < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  belongs_to :product
  attr_accessor :card_number, :holder, :expires_on, :cvc, :ip

  def purchase
  	order_id = self.id
   	@response = GATEWAY.purchase(price_in_cents, credit_card, :order_id =>self.id,:ip => ip)
   	self.purchased_at = Time.now if @response.success?
    @response.success?
   end

   def purchased?
   	 return purchased_at
   end
  def price_in_cents
    (product.value*100).round
  end
  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      :brand              => :visa,
      :number             => card_number,
      :verification_value => cvc,
      :month              => expires_on.month,
      :year               => expires_on.year,
      :name				  => holder
    )
    
   end


	def paypal_url(return_url, notify_url)
	  values = {
	    :business => 'seller_fredguth@fredguth.com',
	    :cmd => '_xclick',
	    :return_url =>return_url,
	    :invoice => self.id,
	    :notify_url => notify_url,
	    :item_name => event.name,
	    :amount => product.value,
	    :currency_code =>"BRL"
	    
	  }
	  
	  "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
	end



end
