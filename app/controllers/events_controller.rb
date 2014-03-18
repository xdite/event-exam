class EventsController < ApplicationController

  layout "crm"
  before_action :login_required
  
  def new

    @event = Event.new

  end

  def index

    @events = Event.all

  end

  def show

  end



  def create

    @event = Event.new(event_params)
    @event.user_id = current_user.id

    @event.save

    flash[:warning] = "新增成功"

    redirect_to "/events/new"
  end

  def event_params
    params.require(:event).permit(:title, :content, :person_limit, :active_date, :location, :price)
  end

end
