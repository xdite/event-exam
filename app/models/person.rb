class Person < ActiveRecord::Base
	has_attached_file :avatar
	#belongs_to :person, :counter_cache => true
	belongs_to :user
end
