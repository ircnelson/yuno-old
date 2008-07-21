class Comment < ActiveRecord::Base
  belongs_to :article
  validates_presence_of :name, :body
  validates_length_of :body, :minimum => 4
  #validates_format_of :email, :with => /(\A(\s*)\Z)|(\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z)/i
end