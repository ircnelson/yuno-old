class AddCommentsFilter < ActiveRecord::Migration
  def self.up
    #0:unlock, 1:lock, 2:hidden
    add_column "contents", "comments_filter", :integer, :default => 0
  end

  def self.down
    remove_column "contents", "comments_filter"
  end
end
