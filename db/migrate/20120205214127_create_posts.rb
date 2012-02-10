class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.text :message
      t.string :route
      t.timestamps
      t.references :user
    end
  end

  def self.down
    drop_table :posts
  end
end
