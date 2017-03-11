class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :title, null: false
      t.string :url, null: false

      t.timestamps
    end
    
    add_index :blogs, :url, unique: true
  end
end
