class DocumentsController < ApplicationController
  layout "crm"
  before_action :login_required
  before_action :require_is_admin
  
  def index

  	@documents = Document.all
  	@document = Document.new
  end

  def create
  	@document = Document.new(document_params)

  	@document.user_id = current_user.id

  	if @document.save
  		flash[:warning] = "文件已新增成功了"
  		redirect_to '/documents'
  	else
  		flash[:warning] = "啊~文件新增失敗了,請洽管理員"
  		redirect_to '/documents'
  	end
  end

  def destroy
  	@document = Document.find(params[:id])

  	if @document.destroy
  		flash[:warning] = "此文件已刪除了"
  		redirect_to '/documents'
  	else
  		flash[:warning] = "啊~文件刪除失敗了,請洽管理員"
  		redirect_to '/documents'
  	end
  end

  def document_params
  	params.require('document').permit(:file, :description)
  end
end
