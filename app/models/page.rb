class Page < ActiveRecord::Base
  validates_presence_of :title, :name
  validates_uniqueness_of :name
  def to_f
    self.body
  end
  def publish
    self.published = true
    self.published_at = Time.now.utc
    save(false)
  end
  def unpublish
    self.published = false
    self.published_at = nil
    save(false)
  end
  
  class << self
    def published
      find(:all, :conditions => ["published = ?", true], :order => "position desc")
    end
  end
end