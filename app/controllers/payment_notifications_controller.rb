class PaymentNotificationsController < ApplicationController
  protect_from_forgery :except => [:create,:confirmation]

  def confirmation
    binding.pry
    if status =="Completed"
      @current_page="success"
      render :action  =>"contributions/success", :params =>{:contribution => contribution}
    else
      @current_page="failure"
      render :action =>"contributions/failure",
        :params =>{:contribution => contribution, :status=>status, :transaction_if=>transaction_id}  
      contribution.destroy
    end
  end


  def create
    binding.pry
    PaymentNotification.create!(:params => params, :contribution_id => params[:invoice], :status => params[:payment_status], :transaction_id => params[:txn_id])
  end

end
        
# if 
#@contribution.save
#         format.html {
#          @current_page="success"
#          render :action => "success",:params =>params[:contribution]
#         }
#         format.json { render action: 'show', status: :created, location: @contribution }
#       else
#         format.html {
#         @current_page="failure"
#         render action: 'failure',:params =>params[:contribution]
#         }
#         format.json { render json: @contribution.errors, status: :unprocessable_entity }
#       end




