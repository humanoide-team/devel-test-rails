DataMapper.setup :default, "sqlite://#{Dir.pwd}/database.db"
class Post
  include DataMapper::Resource

  property :id,          Serial
  property :title,       String
  property :author,      String
  property :slug,        String
  property :description, String
  property :body,        String
  property :created_at,  DateTime
  property :updated_at,  DateTime

end
DataMapper.auto_upgrade!
