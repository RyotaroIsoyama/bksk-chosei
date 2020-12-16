require "google/apis/calendar_v3"
require "googleauth"
require "googleauth/stores/file_token_store"
require "date"
require "fileutils"

class EventsController < ApplicationController
  def show
  	@event = Event.new
  end

  def new
  	@event = Event.new	
  end

  def create
  	@event = Event.new(event_params)
	@event.hashforurl = Digest::SHA1.hexdigest(Time.now.to_s)
	session[:current_event_params]=event_params
	session[:hashforurl] = @event.hashforurl
	if @event.save
		session[:id]=@event.id
		redirect_to action: :token
  	end
  end

  OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
  REDIRECT_URI = "http://lvh.me:3000/".freeze
  APPLICATION_NAME = "bksk-chosei".freeze
  CLIENT_SECRET_PATH = "client_secret.json".freeze
  # The file token.yaml stores the user's access and refresh tokens, and is
  # created automatically when the authorization flow completes for the first
  # time.
  TOKEN_PATH = "credentials.yaml".freeze
  SCOPE = Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY
  MY_CALENDAR_ID = 'primary'

  def authorize
    client_id = Google::Auth::ClientId.from_file CLIENT_SECRET_PATH
    logger.debug(client_id.id)
    token_store = Google::Auth::Stores::FileTokenStore.new file: TOKEN_PATH
    authorizer = Google::Auth::UserAuthorizer.new client_id, SCOPE, token_store
    user_id = "madao329@gmail.com"
    credentials = authorizer.get_credentials user_id
    if credentials.nil?
      code = session[:code]
      url = authorizer.get_authorization_url(base_url: REDIRECT_URI)
      logger.debug(url)
      credentials = authorizer.get_and_store_credentials_from_code(
        user_id: user_id, code: code, base_url: REDIRECT_URI
      )
    end
    return credentials
  end

  def initialize_test
    # カレンダー操作用のインスタンスを生成、@serviceとして投入
    @service = Google::Apis::CalendarV3::CalendarService.new
    # オプションとしてアプリケーションの名前を設定（ここではサービスアカウント名）
    @service.client_options.application_name = APPLICATION_NAME
    # 認証を行う
    @service.authorization = authorize
    # 利用するカレンダーのIDを設定する
    @calendar_id = MY_CALENDAR_ID
  end

  def callback
    session[:code] = params[:code]
    logger.debug(session[:code])
    calendar = Google::Apis::CalendarV3::CalendarService.new
    calendar.client_options.application_name = APPLICATION_NAME
    calendar.authorization = authorize
  end

  #レスポンスとして受け取るEventをコンソールに表示
  def puts_event(event)
    puts "Summary:  #{event.summary}"
    puts "Location: #{event.location}"
    puts "ID:       #{event.id}"
    puts "Start:    #{event.start.date_time}"
    puts "End:      #{event.end.date_time}"
  end

  #期間を指定してEventのリストを取得
  def read
    logger.debug(@calendar_id)
    # 2020年の1月から12月1日までの予定を取ってくる
    events = @service.list_events(@calendar_id,
                                  time_min: (Time.new(2020, 11, 1)).iso8601,
                                  time_max: (Time.new(2020, 12, 1)).iso8601,
                                 )
    events.items.each do |event|
      puts '-------------------------------'
      puts_event(event)
    end
  end

  def fetch_calendar_events
    # Initialize the API
    service = Google::Apis::CalendarV3::CalendarService.new
    service.client_options.application_name = APPLICATION_NAME
    service.authorization = authorize

    logger.debug("多分認証done")
    # Fetch the next 10 events for the user
    calendar_id = "primary"
    response = service.list_events(calendar_id,
                                   max_results:   10,
                                   single_events: true,
                                   order_by:      "startTime",
                                   time_min:      DateTime.now.rfc3339)
    puts "Upcoming events:"
    puts "No upcoming events found" if response.items.empty?
    response.items.each do |event|
      start = event.start.date || event.start.date_time
      puts "- #{event.summary} (#{start})"
    end
  end

  def token
    super
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
