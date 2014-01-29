class EventStepsController < ApplicationController
include Wicked::Wizard
  steps :choose, :invite
  
  
  def show
    @event = current_event
    render_wizard
  end
  def update
	  @event = current_event
	  @event.update_attributes(params[:event])
    Product.all.each do |p|
      if params[p.id+"-item"] 
        @event.products << p
      end
    end
    @event.save
	  render_wizard @event
  end

  private

  def redirect_to_finish_wizard(options = nil)
    redirect_to @event, notice: "Que Legal! Você criou um Chá de Fraldas."
  end
 
end
