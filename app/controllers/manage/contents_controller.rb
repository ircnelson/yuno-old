class Manage::ContentsController < Manage::BaseController
  
  before_filter :find_content, :only => [:show, :edit, :update, :destroy]
  before_filter :find_contents, :only => :index
  #skip_before_filter :admin_required, :only => [:index, :new, :create], :if => :contributor_required
  before_filter :contributor_required, :only => [:index, :new, :create]

  def index
  end

  def show
    redirect_to manage_contents_path
  end

  def new
    @content = Content.new
    @categories = Category.find(:all)
    @selected = []
  end

  def edit
    @categories = Category.find(:all)
    @selected = @content.categories
  end

  def checkboxes
    if request.post?
      if params[:check]
        change_status(Content, params[:check], params[:option])
      end
      redirect_to manage_contents_path
    end
  end

  def create
    @content = Content.new(params[:content])
    @content.user_id = current_user.id
    check_categories
    if @content.save
      flash[:notice] = 'Conteúdo criado com sucesso.'
      redirect_to manage_contents_path
    else
      render :action => "new"
    end
  end

  def update
    check_categories
    if @content.update_attributes(params[:content])
      flash[:notice] = 'Conteúdo atualizado com sucesso.'
      redirect_to manage_contents_path
    else
      render :action => "edit"
    end
  end

  def destroy
    @content.destroy
    redirect_to manage_contents_url
  end

  protected
    def find_content
      @content = Content.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to "/"
    end
    def find_contents
      if admin?
        @contents = Content.find(:all, :order => "id desc")
      elsif contributor?
        @contents = Content.find_user(current_user.id)
      end
    end
    
    def check_categories
      @content.category_ids = params[:content][:category_ids] ||= []
    end
end