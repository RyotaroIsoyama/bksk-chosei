class Form::TimeScheduleCollection < Form::Base
  attr_accessor :time_schedules

  def initialize(attributes = {},days=1)
    super attributes
    self.time_schedules = days.times.map{TimeSchedule.new()} unless self.time_schedules.present?
  end

  def time_schedules_attributes=(attributes)
    self.time_schedules = attributes.map{|_,v| TimeSchedule.new(v)}
  end

  def save
    TimeSchedule.transaction do
      self.time_schedules.map(&:save!)
    end
      return true
    rescue => e
      return false
  end
end
