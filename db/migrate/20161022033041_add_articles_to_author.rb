class AddArticlesToAuthor < ActiveRecord::Migration[5.0]
  def change
    add_column :authors, :articles, :reference
  end
end
