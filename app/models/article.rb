class Article < ActiveRecord::Base
  belongs_to :article_type
  attr_accessible :body, :image_url, :title, :author, :published, :published_at, :article_type_id
  opinio_subjectum

end
