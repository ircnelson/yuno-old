class Manage::CategoriesController < Manage::BaseController

  before_filter :find_category, :only => [:show, :edit, :update, :destroy]

  def index
    @categories = Category.find(:all)
    @category = Category.new
  end

  def show
    @articles = @category.articles
  end

  def edit
  end

  def create
    @category = Category.new(params[:category])
    @category.asset = Asset.new(params[:asset])
    if @category.save
      flash[:notice] = 'Categoria criada com sucesso.'
      respond_to do |format|
        format.html { redirect_to manage_categories_path }
      end
    else
      respond_to do |format|
        format.html { redirect_to new_manage_category_path }
      end
    end
  end

  def update
    if @category.update_attributes(params[:category])
      flash[:notice] = 'Categoria atualizada com sucesso.'
    end
    redirect_to manage_categories_path
  end

  def destroy
    if params[:article_id]
      @article = Article.find(params[:article_id])
      @article.categories.delete(@category)
    else
      @category.destroy
    end
    respond_to do |format|
      format.html { redirect_to manage_categories_path }
      format.js { render :nothing => true }
    end
  end

  protected
    def find_category
      @category = Category.find(params[:id])
    end
    
    def set_display
      category = Category.find(params[:id])
      category.asset = Asset.new(params[:category])
      category.save!
    end
end
