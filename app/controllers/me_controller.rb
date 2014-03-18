class MeController < ApplicationController
  layout "crm"
  before_action :login_required

  def events
  	@events = current_user.events

  end

  def join
	@events = current_user.participated_events


  	
  end
end
