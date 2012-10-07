class RenameBlogsToArticlesWithNewFields < ActiveRecord::Migration
  def up
    rename_table :blogs, :articles
    add_column :articles, :article_type_id, :integer
    add_column :articles, :author, :string
    add_column :articles, :published_at, :datetime
    add_column :articles, :published, :boolean

  end

  def down
    rename_table :articles, :blogs
    drop_column :articles, :article_type_id
    drop_column :articles, :author
    drop_column :articles, :published_at
    drop_column :articles, :published
  end
end
