class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.references :blog, foreign_key: true
      t.text :text
      t.text :html
      t.text :markdown

      t.timestamps
    end
  end
end
