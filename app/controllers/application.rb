class ApplicationController < ActionController::Base

  include AuthenticatedSystem
  helper :all # include all helpers, all the time
  protect_from_forgery # :secret => '98d982d219d9bf448436d895df15bce0'

  #before_filter :set_charset
  before_filter :login_from_cookie
  
  helper_method :admin?
    
  def admin?; (check_level == "admin") ? true : false; end
  def contributor?; (check_level == "contributor") ? true : false; end
  
  def set_charset
    headers["Content-Type"] = "text/html; charset=iso-8859-1"
  end
  
  protected

=begin
    def rescue_action_in_public(exception)
      case exception
        when ActionController::MissingTemplate, ActiveRecord::RecordNotFound, ActionController::RoutingError, ActionController::UnknownController, ActionController::UnknownAction
          render_404
        else          
          render_500
      end
    end
    def render_500
      respond_to do |type|
        type.html { render :file => "#{RAILS_ROOT}/public/500.html", :status => "500 Error" }
        type.all  { render :nothing => true, :status => "500 Error" }
      end
    end
    def render_404
      respond_to do |type|
        type.html { render :file => "#{RAILS_ROOT}/public/404.html", :status => "404 Error" }
        type.all  { render :nothing => true, :status => "404 Error" }
      end
    end
=end

end