require "google/apis/calendar_v3"
require "googleauth"
require "googleauth/stores/file_token_store"
require "date"
require "fileutils"

class EventsController < ApplicationController
  def show
  	@event = Event.find(params[:id])
  end

  def new
  	@event = Event.new	
	@user = current_user
	@my_events = Event.where(user_id: current_user.id)
  end

  def create
  	@event = Event.new(event_params)
	@event.hashforurl = Digest::SHA1.hexdigest(Time.now.to_s)
	session[:current_event_params]=event_params
	session[:hashforurl] = @event.hashforurl
	if @event.save
		session[:id]=@event.id
		redirect_url = ENV["HOST"] + "/time_schedules/list?h=" + @event.hashforurl
		redirect_to redirect_url
  	end
  end

  def update
    redirect_to action: :new
  end

  private

    def event_params
      params.require(:event).permit(:stdate, :enddate, :span,
                                   :owner, :user_id, :hashforurl)
    end
end
