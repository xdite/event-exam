class Document < ActiveRecord::Base
	has_attached_file :file, :default_url => "/files/:style/missing.doc"
	belongs_to :user
end
