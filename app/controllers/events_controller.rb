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
  		redirect_to 'http://localhost:3000/time_schedules/list?h=' + @event.hashforurl
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
