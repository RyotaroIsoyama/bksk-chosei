class EventsController < ApplicationController
  def show
  	@event = Event.find(params[:id])
  end

  def new
  	@event = Event.new	
  end

  def create
  	@event = Event.new(event_params)
	@event.hashforurl = Digest::SHA1.hexdigest(Time.now.to_s)
	session[:current_event_params]=event_params
	if @event.save
		session[:id]=@event.id
  		redirect_to controller: 'time_schedules',action: 'new'
  	end
  end

  def update
    redirect_to action: :new
  end

  private

    def event_params
      params.require(:event).permit(:stdate, :enddate, :span,
                                   :owner, :hashforurl)
    end
end
