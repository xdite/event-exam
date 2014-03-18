class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :events       
  #attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  has_many :event_users
  has_many :participated_events, :through => :event_users, :source => :event

  def join!(event)
    participated_events << event
  end

  def quit!(event)
	participated_events.delete(event)
  end

  def is_member_of?(event)
    participated_events.include?(event)
  end


end
