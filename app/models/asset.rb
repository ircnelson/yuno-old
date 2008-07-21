class Asset < ActiveRecord::Base
  belongs_to :category, :polymorphic => true
  belongs_to :user, :polymorphic => true

  has_attachment :content_type => :image, 
                 :storage => :file_system, 
                 :max_size => 1.megabyte,
                 :thumbnails => { :small => '48x48' },
                 :resize_to => '350x350>'

  validates_as_attachment
end
