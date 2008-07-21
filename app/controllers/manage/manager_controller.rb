class Manage::ManagerController < Manage::BaseController
  def index
    @contents = Content.find(:all, :conditions => ["published = ?", false])
  end
end