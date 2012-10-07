class ArticleType < ActiveRecord::Base
  has_many :articles
  attr_accessible :name, :description, :published

end