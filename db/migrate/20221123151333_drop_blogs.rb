class DropBlogs < ActiveRecord::Migration[7.0]
  def change
    drop_table :blogs 
  end
end
