class MeController < ApplicationController
  layout "crm"
  before_action :login_required

  def events
  	@events = current_user.events

  end
end
