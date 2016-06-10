require 'sinatra'
require 'data_mapper'
require File.dirname(__FILE__) + '/models.rb'
require 'json'
require 'date'

before do
  content_type 'application/json'
end

set :bind, '0.0.0.0'

get '/' do
  content_type 'html'
  erb :index
end

get "/posts" do
    @posts = Post.all
    @posts.to_json
end

get "/posts/:id" do
    @post = Post.get(params[:id])
    @post.to_json
end

post "/posts/new" do
  @post = Post.new(post_param)
  @post.created_at = DateTime.now
  @post.updated_at = nil

  if @post.save
       {:post => @post, :status => "success"}.to_json
  else
       {:post => @post, :status => "failure"}.to_json
  end
end

put "/posts/:id" do
    @post = Post.get(params[:id])

    if @post.update(post_param)
        {:task => @post, :status => "success"}.to_json
    else
        {:task => @post, :status => "failure"}.to_json
    end
end

delete "/posts/:id" do
    @post = Post.get(params[:id])
    if @post.destroy
        {:post => @post, :status => "success"}.to_json
    else
        {:post => @post, :status => "failure"}.to_json
    end
end

private
  def post_param
    JSON.parse(request.body.read)
  end
