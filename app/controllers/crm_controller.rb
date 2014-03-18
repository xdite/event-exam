class CrmController < ApplicationController
  layout "crm"
	before_filter :authenticate_user!
  def index
  end
end
