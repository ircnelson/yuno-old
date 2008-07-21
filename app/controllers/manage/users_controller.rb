class Manage::UsersController < Manage::BaseController
  
  before_filter :find_user, :except => :index
  
  def index
    @users = User.find(:all, :order => "id desc")
  end
  
  def show
  end
  
  def update
    @user.update_attributes(params[:user])
    redirect_to manage_users_path
  end
  
  protected
    def find_user
      @user = User.find(params[:id])
    end
end