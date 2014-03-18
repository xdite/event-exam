class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :people   
  has_many :documents      
  #attr_accessible :email, :password, :password_confirmation, :remember_me, :name
end
