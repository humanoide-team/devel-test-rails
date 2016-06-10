class PostsController < ApplicationController
  respond_to :html, :json
  before_action :find_post, :only=> [:edit, :update, :destroy, :show]

  def index
    @posts = Post.all
    respond_with(@posts)
  end

  def show
    respond_with(@post)
  end

  def edit
    respond_with(@post)
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def create
    @post = Post.new(param_post)
    flash[:notice] = t('general.sucesso_create') if @post.save
    respond_with(@post, :location => @post)
  end

  def update
    flash[:notice] = t('general.sucesso_update') if @post.update(param_post)
    respond_with(@post, :location => posts_path)
  end

  def destroy
    @post.destroy
    flash[:notice] = t('general.sucesso_delete')
    respond_with(@post, :location => posts_path)
  end

  private
    def find_post
      @post = Post.find(params[:id])
    end

    def param_post
      params.require(:post).permit(:title, :slug, :author, :description, :body)
    end
end
