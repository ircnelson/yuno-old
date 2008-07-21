class AddPagesPosition < ActiveRecord::Migration
  def self.up
    add_column "pages", "position", :integer
    add_column "pages", "location", :string, :default => "bottom"
  end

  def self.down
    remove_column "pages", "position"
    remove_column "pages", "location"
  end
end
