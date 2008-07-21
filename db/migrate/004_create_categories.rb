class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end
    create_table :categories_contents, :id => false do |t|
      t.integer :category_id, :content_id
    end
  end

  def self.down
    drop_table :categories_contents
    drop_table :categories
  end
end
