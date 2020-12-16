class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  # Starting action in config/routes.rb
  def welcome

    # Redirect to Google Authorization Page
    redirect_to GoogleCalendar.new.auth_uri

  end

  def token
    # Get a auth_client object from Google API
    @google_api = GoogleCalendar.new

    @google_api.auth_client.code = params[:code] if params[:code]

    # Whichever Controller/Action needed to handle what comes next
    redirect_to 'http://time_schedules/list?'+session[:hashforurl] 
  end

end
