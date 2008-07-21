class ContentsController < ApplicationController
 
  before_filter :find_content, :only => :show
  before_filter :find_contents, :only => :index
  
  #rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  
  def index
    @categories = Category.find(:all)
    respond_to do |format|
      format.html
      format.atom
    end
  end

  def by_date
    month = params[:month] ||= Time.now.utc.month
    @contents = Content.find_all_in_month(params[:year], month, :page => params[:page])
  end

  def view_page
    if(@page = Page.find_by_name(params[:name].to_a.join('/')))
      @page_title = @page.title
    else
      #render_404
      redirect_to "/"
    end
  end

  def show
    if !@content
      redirect_to edit_manage_content_path(params[:id])
    else
      @comments = @content.comments
      @categories = @content.categories
    end
  end
  
  protected
    def find_content
      @content =
      if params[:id]
        Content.find_published_by_id(params[:id]) 
      #else
      #  Content.find_with_paginate(:first)
      end
    end

    def find_contents
      @contents = Content.find_published(:all)
    end
end