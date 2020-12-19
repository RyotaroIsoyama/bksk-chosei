class TimeSchedulesController < ApplicationController

  CREDENTIALS_URL = "https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=374716094513-hu2vo0hm9ennqc7rtjhejlg39upaso6s.apps.googleusercontent.com&redirect_uri=#{ENV["HOST"]}/oauth2callback&scope=https://www.googleapis.com/auth/calendar&access_type=offline&approval_prompt=force"

  def show
	@time_schedule = TimeSchedule.find(params[:id])
  end

  def new
	stdate_str = session[:current_event_params]["stdate(1i)"] + "-" + session[:current_event_params]["stdate(2i)"] + "-" + session[:current_event_params]["stdate(3i)"]
	stdate = stdate_str.to_date
	enddate = "#{session[:current_event_params]['enddate(1i)']}-#{session[:current_event_params]['enddate(2i)']}-#{session[:current_event_params]['enddate(3i)']}".to_date
	days = (enddate-stdate).to_i + 1

	@form = Form::TimeScheduleCollection.new({},days)
  end

  def create
	@form = Form::TimeScheduleCollection.new(time_schedule_params)
	if @form.save
		flash[:success] = "Create Success"
		redirect_to controller: 'events',action: 'new'
	else
		render 'new'
	end
  end

  def list
    session[:url] = CREDENTIALS_URL
    @event = Event.where(hashforurl: params[:h]).first
    days = (@event.enddate - @event.stdate).to_i + 1
    session[:startTime] = @event.stdate.strftime("%Y%m%d %H:%M:%S")
    session[:endTime] = (@event.enddate + 1).strftime("%Y%m%d %H:%M:%S")

    @form = Form::TimeScheduleCollection.new({},days)
  end

  private
    def time_schedule_params
      params.require(:form_time_schedule_collection).permit(time_schedules_attributes: [:username,:event_id,:eventday,:t0,:t1,:t2,:t3,:t4,:t5,:t6,:t7,:t8,:t9,:t10,:t11,:t12,:t13,:t14,:t15,:t16,:t17,:t18,:t19,:t20,:t21,:t22,:t23,:t24,:t25,:t26,:t27,:t28,:t29,:t30,:t31,:t32,:t33,:t34,:t35,:t36,:t37,:t38,:t39,:t40,:t41,:t42,:t43,:t44,:t45,:t46,:t47])
    end
end
