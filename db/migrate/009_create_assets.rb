class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.column :content_type, :string
      t.column :filename, :string    
      t.column :thumbnail, :string 
      t.column :size, :integer
      t.column :width, :integer
      t.column :height, :integer
      t.references :category, :polymorphic => true
      t.references :user, :polymorphic => true
      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
