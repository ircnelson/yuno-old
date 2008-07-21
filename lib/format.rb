#mephisto's code

module Format
  DOMAIN = /^([a-z0-9]([-a-z0-9]*[a-z0-9])?\.)+((a[cdefgilmnoqrstuwxz]|aero|arpa)|(b[abdefghijmnorstvwyz]|biz)|(c[acdfghiklmnorsuvxyz]|cat|com|coop)|d[ejkmoz]|(e[ceghrstu]|edu)|f[ijkmor]|(g[abdefghilmnpqrstuwy]|gov)|h[kmnrtu]|(i[delmnoqrst]|info|int)|(j[emop]|jobs)|k[eghimnprwyz]|l[abcikrstuvy]|(m[acdghklmnopqrstuvwxyz]|mil|mobi|museum)|(n[acefgilopruz]|name|net)|(om|org)|(p[aefghklmnrstwy]|pro)|qa|r[eouw]|s[abcdeghijklmnortvyz]|(t[cdfghjklmnoprtvwz]|travel)|u[agkmsyz]|v[aceginu]|w[fs]|y[etu]|z[amw])$/ unless const_defined?(:DOMAIN)
  STRING = /^[a-z0-9-]+$/
  EMAIL  = /(\A(\s*)\Z)|(\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z)/i
end

module ActiveSupport::CoreExtensions::Time::Conversions
  def to_ordinalized_s(format = :default)
    format = ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS[format] 
    return to_default_s if format.nil?
    strftime(format.gsub(/%d/, '_%d_')).gsub(/_(\d+)_/) { |s| s.to_i.ordinalize }
  end
end
class Time
  class << self
    # Used for getting multifield attributes like those generated by a 
    # select_datetime into a new Time object. For example if you have 
    # following <tt>params={:meetup=>{:"time(1i)=>..."}}</tt> just do 
    # following:
    #
    # <tt>Time.parse_from_attributes(params[:meetup], :time)</tt>
    def parse_from_attributes(attrs, field, method=:gm)
      attrs = attrs.keys.sort.grep(/^#{field.to_s}\(.+\)$/).map { |k| attrs[k] }
      attrs.any? ? Time.send(method, *attrs) : nil
    end
  end

  def to_delta(delta_type = :day)
    case delta_type
      when :year then self.class.delta(year)
      when :month then self.class.delta(year, month)
      else self.class.delta(year, month, day)
    end
  end
      
  def self.delta(year, month = nil, day = nil)
    from = Time.local(year, month || 1, day || 1)
    
    to = 
      if !day.blank?
        from.advance :days => 1
      elsif !month.blank?
        from.advance :months => 1
      else
        from.advance :years => 1
      end
    return [from.midnight, to.midnight-1]
  end
end