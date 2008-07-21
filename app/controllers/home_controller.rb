class HomeController < ApplicationController

  before_filter :find_contents, :only => :index

  def index
    @categories = Category.find(:all)
    respond_to do |format|
      format.html
      format.atom
    end
  end
  
  protected
    def find_contents
      @paginate_contents = Content.find_with_paginate(:all, :page => params[:page])
      @contents = Content.find_published(:all, :limit => 5)
    end
end
