class Manage::PagesController < Manage::BaseController
  
  before_filter :find_page, :only => [:edit, :update, :destroy]
  before_filter :find_pages, :only => :index
  
  def index
  end
  
  def edit
  end
  
  def checkboxes
    if params[:check]
      change_status(Page, params[:check], params[:option])
    end
    redirect_to manage_pages_path
  end
  
  def new
    @page = Page.new(params[:page])
  end
  
  def create
    @page = Page.new(params[:page])
    if @page.save
      flash[:notice] = 'Página criada com sucesso.'
      redirect_to manage_pages_path
    else
      redirect_to new_manage_page_path
    end
  end
  
  def update
    if @page.update_attributes(params[:page])
      flash[:notice] = 'Página atualizada com sucesso.'
      redirect_to manage_pages_path
    else
      redirect_to edit_manage_pages_path(@page)
    end
  end
  
  def destroy
    @page.destroy
    redirect_to manage_pages_path
  end
   
  protected
    def find_page
      @page = Page.find(params[:id])
    end
    def find_pages
      @pages = Page.find(:all, :order => 'id desc')
    end
end
