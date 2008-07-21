class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.string :login, :email, :remember_token
      t.string :crypted_password, :salt, :limit => 40
      t.datetime :remember_token_expires_at
      t.timestamps
      t.string :activation_code, :limit => 40
      t.datetime :activated_at
      #normal, contributor, admin
      t.string :level, :default => "normal"
    end
    User.new do |u|
      u.login = "admin"
      u.email = "admin@yuno.com.br"
      u.password = "rR1121"
      u.password_confirmation = "rR1121"
      u.level = "admin"
      u.save
    end
    u = User.find(1)
    u.activation_code = nil
    u.activate

    Content.find(:all).each do |a|
      a.user_id = User.find(1)
      a.save
    end
  end

  def self.down
    drop_table "users"
  end
end
