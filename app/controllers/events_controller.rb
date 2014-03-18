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
    if is_full_member?(@event)  
      flash[:warning] = "此活動報名人數已滿"
    else
      if is_out_of_date?(@event)
        flash[:warning] = "已超過報名截止時間"
      else
        UserMailer.confirm(current_user.email, { :user_name => current_user.name, :event_title => @event.title}).deliver
        current_user.join!(@event)
      end
    end
  else     
     flash[:warning] = "你已經加入此活動"
  end
  
  redirect_to "/events/index"
 
 end

 def is_full_member?(event)
  return (event.members.count >= event.person_limit.to_i)
 end

 def is_out_of_date?(event)
  out_date = event.active_date.split('~')[1]
  return Date.parse(out_date) < Date.today
 end

 def quit
   @event = Event.find(params[:id])

   if current_user.is_member_of?(@event)
     current_user.quit!(@event)
     @event.quit_member_from_event
   else
     flash[:warning] = "你並不是此活動的會員"
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
