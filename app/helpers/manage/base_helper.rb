module Manage::BaseHelper
  
  def class_manager
    if controller.controller_name =~ /manager/
      if controller.action_name =~ /index/
        "active"
      end
    end
  end
  def class_contents
    if controller.controller_name  =~ /contents/
      if controller.action_name =~ /index|new/
        "active"
      end
    end
  end
  def class_pages
    if controller.controller_name  =~ /pages/
      if controller.action_name =~ /index|new|show/
        "active"
      end
    end
  end
  def class_categories
    if controller.controller_name  =~ /categories/
      if controller.action_name =~ /index|new|show/
        "active"
      end
    end
  end
  def class_users
    if controller.controller_name  =~ /users/
      if controller.action_name =~ /index|new|show/
        "active"
      end
    end
  end
  def class_schedules
    if controller.controller_name  =~ /schedules/
      if controller.action_name =~ /index|new/
        "active"
      end
    end
  end
  
  def img_status(status)
    image_tag("/images/icons/#{status}.png", :alt => status)
  end
  
  def toggle_btn(title, domid, html_options = {})
    link_to_function title, update_page { |page| page.visual_effect(:toggle_blind, domid, :duration => 0.4) }, html_options
  end
  
  def exist_category?(category)
    if @selected
      @selected.include?(category)
    else
      false
    end
  end

  def checkbox(category, selected = nil)
    attr = "categories[]"
    id = category.id
    name = category.name
    checked = "checked=\"checked\"" if selected.include?(category)
    "<input id=\"category_#{id}\" type=\"checkbox\" #{checked} name=\"#{attr}\" value=\"#{id}\" /><label for=\"category_#{id}\">#{name}</label>\n"
  end
  
  def user_status(user)
    user.level.to_s
  end
end
