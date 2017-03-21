class AddUrlColumnToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :url, :string
    add_index :articles, :url, unique: true
  end
end
