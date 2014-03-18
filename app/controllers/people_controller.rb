class PeopleController < ApplicationController
  layout "crm"
  before_action :login_required
  #before_action :require_is_admin
  
  def index

    @query_string = params[:q]

    if @query_string
      seach_person = Person.where(
        "name like '%#{params[:q]}%' or 
         mobeil like '%#{params[:q]}%' or 
         zip_code like '%#{params[:q]}%' or
         address like '%#{params[:q]}%' or
         telephone like '%#{params[:q]}%' or
         fax like '%#{params[:q]}%' or
         email like '%#{params[:q]}%' or
         company_name like '%#{params[:q]}%' or
         company_department like '%#{params[:q]}%' or
         company_title like '%#{params[:q]}%' or
         company_unified_numbering like '%#{params[:q]}%' or
         company_zip_code like '%#{params[:q]}%' or
         company_address like '%#{params[:q]}%' or
         company_telephone_1 like '%#{params[:q]}%' or
         company_telephone_2 like '%#{params[:q]}%' or
         company_fax like '%#{params[:q]}%' or
         company_email like '%#{params[:q]}%' or
         company_website like '%#{params[:q]}%' or
         ps like '%#{params[:q]}%'
        ")

      flash[:warning] = "總共找到#{seach_person.count}個客戶"
    else
      seach_person = Person.all
    end

    if params[:t]
      session[:t] = params[:t]
    end

    if session[:t] == "list"
      session[:list_page] = params[:page]
      @person = seach_person #.paginate(:page => params[:page], :per_page => 10)
      mask_infomation
      render "people/list"
    else
      @person = seach_person
      mask_infomation
      render "people/view"
    end   

  end

  def mask_infomation
    @level_text = ['尚未認識','一般客戶','重要客戶','VIP'] 
    @level_label = ['<span class=\'label label-default\'>尚未認識</span>','<span class=\'label label-primary\'>一般客戶</span>','<span class=\'label label-danger\'>重要客戶</span>','<span class=\'label label-warning\'>VIP</span>']
    @dafa_attitude_text = ['大法態度未明','對大法有好感','大法負面思想']  
    @dafa_attitude_label = ['<span class=\'label label-info\'>大法態度未明</span>','<span class=\'label label-warning\'>對大法有好感</span>','<span class=\'label label-danger\'>大法負面思想</span>'] 
    @sex_label = ['<img src=\'/assets/1389209753_girl.png\'>','<img src=\'/assets/1389209742_boy.png\'>']
  end

  def show
    @person = Person.find(params[:id])
  end

  def edit
    @person = Person.find(params[:id])

  end

  def new
    @person = Person.new

  end

  def destroy

    @person = Person.find(params[:id])
    @person.destroy

    redirect_to "/people"

  end

  def update
    @person = Person.find(params[:id])

    if @person.update_attributes(person_params)
      if session[:list_page]
        redirect_to "/people?page=" + session[:list_page]
      else
        redirect_to "/people"
      end
    else
      render :edit
    end
  end

  def create

    @person = Person.new(person_params)
    @person.user_id = current_user.id

    @person.save

    flash[:warning] = "新增成功"

    redirect_to "/people/new"
  end

  def person_params
    params.require(:person).permit(:name, :mobeil, :zip_code, :address, :telephone, :fax, :email, :company_name, :company_department, :company_title, :company_unified_numbering, :company_zip_code, :company_address, :company_telephone_1, :company_telephone_2, :company_fax, :company_email, :company_website, :ps, :avatar, :source, :level, :dafa_attitude, :honorific, :sex, :shenyun_watch, :interactive)
  end
end
