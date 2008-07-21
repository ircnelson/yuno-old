class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :content_id
      t.string :body, :name, :uri, :email, :ip
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
