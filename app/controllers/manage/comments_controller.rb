class Manage::CommentsController < Manage::BaseController
  
  before_filter :find_content, :except => [ :reply ]
  
  def index
    #@comment = @content.comments.build
    @comments = @content.comments
  end
  
  def show
    @replythiscomment = @content.comments.find(params[:id])
    @comment = @content.comments.build
  end

  def new
    @comment = @content.comments.build
  end

  def reply
    comment = params[:comment]
    @content = Content.find(comment['content_id'])
    @comment = @content.comments.build(comment)
    @comment.save
    redirect_to content_path(@content)
  end

  def create
    @comment = @content.comment.build(params[:comment])

    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Comentário criado com sucesso.'
        format.html { redirect_to(:manage, @content) }
        format.xml  { render :xml => @content, :status => :created, :location => @content }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @content.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to manage_content_comments_path(@content)
  end
  
  protected
    def find_content
      @content = Content.find(params[:content_id])
    end
end