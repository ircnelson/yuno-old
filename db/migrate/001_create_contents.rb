class CreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.string :title
      t.text :body
      t.boolean :published, :default => false
      t.datetime :published_at
      t.integer :user_id
      t.timestamps
    end
    Content.new do |a|
      a.title = "Bem-vindo ao Yuno.com.br"
      a.body = "<p>Oi. :-)</p>"
      a.published = true
      a.published_at = DateTime.now
      a.save
    end
  end

  def self.down
    drop_table :contents
  end
end