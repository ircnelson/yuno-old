class CategoriesController < ApplicationController
 
  before_filter :find_category, :only => :show
  before_filter :find_categories, :only => [:index, :show]
  
  def index
  end

  def show
  end
  
  protected
    def find_category
      @category = Category.find(params[:id])
    end

    def find_categories
      @categories = Category.find(:all)
    end
end