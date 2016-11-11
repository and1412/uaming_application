class Event < ApplicationRecord
	validates :event_date, :resource, :user, presence: true
end
