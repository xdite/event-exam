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
    @event = Event.find(params[:id])
    @users = @event.members
    @quit_users = @event.quit_members

  end

  def join
   @event = Event.find(params[:id])

   if !current_user.is_member_of?(@event)
    UserMailer.confirm(current_user.email, { :user_name => current_user.name, :event_title => @event.title}).deliver
     current_user.join!(@event)
   else     
     flash[:warning] = "You already joined this event."
  end
  
  redirect_to "/events/index"
 
 end

 def quit
   @event = Event.find(params[:id])

   if current_user.is_member_of?(@event)
     current_user.quit!(@event)
     @event.quit_member_from_event
   else
     flash[:warning] = "You are not member of this event."
   end

   redirect_to "/events/index"
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
