class CommentsController < ApplicationController

  before_filter :load_content

  def create
    @comment = @content.comments.build(params[:comment])
    @comment.ip = request.remote_ip
    if @comment.save
      flash[:notice] = 'Seu comentário foi enviado.'
    end
    redirect_to content_path(@content)
  end

  def load_content
    @content = Content.find(params[:content_id], :conditions => ["published = ?", true])
  end
end
