class AddAuthorToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :author, :reference
  end
end
