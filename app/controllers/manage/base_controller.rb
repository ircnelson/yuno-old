class Manage::BaseController < ApplicationController

  before_filter :admin_required
  helper_method :admin?, :contributor?
    
  def admin?; (check_level == "admin") ? true : false; end
  def contributor?; (check_level == "contributor") ? true : false; end

  private
    def change_status(model, records, option)
    records.each do |a|
      if option.include?("Delete")
        model.find(a).destroy
      elsif option.include?("Change Status")
        r = model.find(a)
        case r.published
          when true
            r.unpublish
          when false
            r.publish
        end
      end
    end
  end
end