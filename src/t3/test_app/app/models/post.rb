class Post < ActiveRecord::Base
  validates :title, :slug, :description, :author, :body, :presence => true
end
