class Content < ActiveRecord::Base

  validates_presence_of :title
  
  with_options :order => 'created_at', :class_name => "Comment" do |content|
    content.has_many :comments, :dependent => :delete_all
  end
  has_and_belongs_to_many :categories
  has_one :user

  def self.per_page
    1
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

    def find_user(user)
      find(:all, :conditions => ["user_id = ?", user], :order => "id desc")
    end

    def find_all_in_month(year, month, page)
      page ||= 0
      with_scope(:find => { :conditions => ["published_at <= ? AND published_at BETWEEN ? AND ?", Time.now.utc, *Time.delta(year.to_i, month.to_i)] }) do
        paginate(:all, page)
      end
    end

    def find_published(*args)
      with_published do
        find(*args)
      end
    end

    def find_with_paginate(*args)
      with_published do
        paginate(*args)
      end
    end

    def with_published
      with_scope :find => { :conditions => [ 'published = ? AND published_at IS NOT NULL', true], :order => "id desc" } do 
        yield 
      end 
    end

    def method_missing(method, *args, &block)
      if method.to_s =~ /^find_(all_)?published_by/
        with_published do
          super(method.to_s.sub('published_', ''), *args, &block)
        end
      else
        super(method, *args, &block)
      end
    end
  end
end