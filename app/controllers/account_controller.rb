# This controller handles the login/logout function of the site.  
class AccountController < ApplicationController

  before_filter :login_required, :only => [:index, :update]
  before_filter :already_logged, :only => [:login, :register]

  def index
    @user = current_user
  end

  def update
    user = User.find(current_user)
    flash[:notice] = (user.update_attributes(params[:user])) ? "Sua conta foi atualizada com sucesso." : "Falha ao atualizar."
    redirect_to "/account"
  end

  def register
    return unless request.post?
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.save
    if @user.errors.empty?
      self.current_user = @user
      flash[:notice] = "Obrigado por se registrar."
      redirect_back_or_default account_path
    else
      render :action => :register
    end
  end
  def login
    return unless request.post?
    self.current_user = User.authenticate(params[:login], params[:password])

    if logged_in?
      if params[:remember_me] == "1"
        self.current_user.remember_me
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      redirect_back_or_default("/account")
      flash[:notice] = "Conta acessada com sucesso."    
    else
      render :action => :login
    end
  end

  def activate
    unless user = User.find_by_activation_code(params[:activation_code])
      flash[:error] = 'Activation code not found.'
      redirect_to :controller => :account, :action => :activation
    end

    if user.pending?
      flash[:notice] = 'Sua conta já está ativada.'
      redirect_to "/account"
    end

    user.activate
    self.current_user = user
    flash[:notice] = "Sua conta foi ativada!" 
    redirect_back_or_default('/account')
  end

  def check_login
    parm = params[:user][:login]
    result = User.find_by_login(parm)
    if parm.size >= 3
      render :text => result.nil? ? "Pode ser usado." : "Não pode ser usado."
    else
      render :nothing => true
    end
  end

  def logout
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    #flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end
  
  protected
    def already_logged
      redirect_to "/account" if logged_in?
    end
end
