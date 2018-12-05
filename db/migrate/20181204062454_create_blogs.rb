class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.integer :user_id
      t.integer :blog_id
      t.datetime :datetime
      t.string :title
      t.text :text
      t.text :image
      t.timestamps
    end
  end
end
