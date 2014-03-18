class EventQuitUser < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
end
