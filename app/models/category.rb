class Category < ActiveRecord::Base
  has_and_belongs_to_many :contents

  #avatar
  has_one :asset, :class_name => "Asset", :as => :category
end