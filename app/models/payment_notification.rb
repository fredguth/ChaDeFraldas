class PaymentNotification < ActiveRecord::Base
	belongs_to :contribution
	selialize :params
	after_create :mark_as_purchased

	private
	def mark_as_purchased
		if status == "Completed"
		contribution.update_attribute(:purchased_at, Time.now)
	end
end
