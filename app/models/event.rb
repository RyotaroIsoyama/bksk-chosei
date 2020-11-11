class Event < ApplicationRecord
	has_many :time_schedules
	accepts_nested_attributes_for :time_schedules, allow_destroy: true
end
