class AddUserFcksetting < ActiveRecord::Migration
  def self.up
    add_column "users", "fcktoolbar", :string, :default => "Basic"
  end

  def self.down
    remove_column "users", "fcktoolbar"
  end
end
