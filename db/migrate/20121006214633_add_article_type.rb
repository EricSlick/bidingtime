class AddArticleType < ActiveRecord::Migration
  def change
    create_table :article_types do |t|
      t.string :name
      t.string :description
      t.boolean :published
      t.timestamps
    end
  end
end
