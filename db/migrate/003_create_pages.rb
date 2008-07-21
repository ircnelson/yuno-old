class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title
      t.string :name
      t.text :body
      t.boolean :published, :default => false
      t.timestamps
    end
    Page.new do |p|
      p.title = "About's page"
      p.name = "about"
      p.body = "This is about's content body\nVery nice, ahn?! :-)"
      p.published = true
      p.save
    end
  end

  def self.down
    drop_table :pages
  end
end
