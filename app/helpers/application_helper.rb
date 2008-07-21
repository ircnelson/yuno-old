# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def mycss
<<-CSS
  <style>
  </style>
CSS
  end

  def link_to_page (url)
    display = url.split("/").last
    link_current display, "/page/#{url}"
  end
  
  def link_current(title, url, active = nil)
    if current_page?(url) || active
      lnk = link_to(title, url, { :class => "active"})
    else
      lnk = link_to(title, url)
    end
    lnk
  end

  def category_include?(category)
    if self.include?(category)
      true
    else
      false
    end
  end
  def cat(record)
    record.blank? ? "geral" : record.collect{|c| c.name}.join(", ")
  end
  
  #display_render /users/sidebar, :f => f, :btn_name => "s"
  def display_render(partial, locals = {})
    render :partial => partial, :locals => locals
  end
  
  def show_comments(record, &block)
    x = record.comments_filter
    if block_given?
      if record.comments.blank?
        concat("<p class=\"information\"><span>This content no have comment</span></p>", block.binding)
      else
        case x
          when 0, 1
            yield
          end
      end
    end
  end
  def enable_comments(record, &block)
    if block_given?
      if record.comments_filter == 0
        yield
      end
    else
      record.comments_filter == 0 ? true : false
    end
  end

  def format_datetime(datetime)
    return datetime if !datetime.respond_to?(:strftime)
    datetime = current_user.tz.utc_to_local(datetime) if current_user
    datetime.strftime("%m-%d-%Y %I:%M %p")
  end
  alias date_format format_datetime

  def display_tree_recursive(tree, parent_id)
    ret = "\n<ul>"
    tree.each do |node|
      if node.parent_id == parent_id
        ret += "\n\t<li>"
        ret += yield node
        ret += display_tree_recursive(tree, node.id) { |n| yield n }
        ret += "\t</li>\n"
      end
    end
    ret += "</ul>\n"
  end
  
  def getuser(a)
    u = User.find_by_id(a.user_id).login; u
  end
  
  def title(title)
    content_for(:title) { title }
  end
  
  def category_link(record)
    link_to_unless_current("#{record.name} <span>(#{record.contents.count})</span>", category_path(record))
  end

  def cat_avatar(record)
    if record
      c = record.categories.rand
      link_to(image_tag(c.public_filename, :alt => c.name), category_path(c)) if c
    end
  end
  
  def default_links(pos, tag = :li)
    pos = pos.to_s
    record = Page.published.group_by(&:location) if controller.controller_name !~ /manage/
    links = ""
    if record[pos]
      record[pos].each do |p|
        links << content_tag(tag, link_to_page(p.name))
        links << "\n"
      end
    end
    links
  end
  
  def _icon(file)
    image_tag('/images/icons/' + file + '.png', :class => "btn-icon")
  end
  #link_btn('submit|reset', 'name', 'icon') -> <button>
  #link_btn('http://url.com', 'name', 'icon') -> <a>

  def link_btn(value, name, icon, html_options = {})
    icon = _icon(icon)
    if value.downcase =~ /submit|reset/
      html_options.merge!(:type => value)
      btn = tag("button", html_options, true) + icon + name + "</button>"
    else
      btn = link_to(icon + name, value, html_options)
    end
    btn
  end
  
  def link_btn_edit(url)
    link_btn(url, '&nbsp;Edit', 'edit')
  end
  
  def link_btn_delete(url)
    link_btn(url, 'Delete', 'delete', :class => "negative", :method => "delete", :confirm => "Are you sure?")
  end
  def link_to_delete(url)
    link_to("Delete", url, { :method => "delete", :confirm => "Are you sure?" })
  end

  def avatar(avatar)
    "/images/avatars/#{avatar}-48x48.png"
  end

  def display_yuno_avatars
    a = ''
    %w(boy girl).each do |t|
      a << "<h3>#{t.capitalize}s</h3>"
      9.downto(1) do |n|
        avatar = "#{t}-#{n}"
        a << "<label for=\"#{avatar}\">" + image_tag(avatar("#{avatar}")) + "</label>\n"
        a << "<input type=\"radio\" id=\"#{avatar}\" name=\"user[avatar]\" value=\"#{avatar}\">\n"
      end
    end
    a
  end

end