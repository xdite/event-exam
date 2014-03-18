class Event < ActiveRecord::Base
  belongs_to :user


  belongs_to :owner, :class_name => "User", :foreign_key => :user_id
  has_many :event_users
  has_many :event_quit_users
  has_many :members, :through => :event_users, :source => :user
  has_many :quit_members, :through => :event_quit_users, :source => :user
 
  validates :title, :presence => true

  after_create :join_owner_to_event

  def editable_by?(user)
    user && user == owner
  end

  def join_owner_to_event
    members << owner
  end

  def quit_member_from_event
    quit_members << owner
  end
end
