class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @post.post_type = params[:post_type] if params[:post_type].present?
  end

  def create
    @post = Post.new(allow_params)
    if @post.save
      redirect_to posts_path, flash: { :'alert-success' => 'Your post was saved successfully.' }
    else
      flash.now[:'alert-danger'] = @post.errors.full_messages
      render :new
    end
  end


  def show
    @post = Post.find params[:id]
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    if @post.update(allow_params)
      redirect_to @post, flash: { :'alert-success' => 'Your post was updated successfully.' }
    else
      flash.now[:'alert-danger'] = @post.errors.full_messages
      render :edit
    end
  end


  private 
    def allow_params
      params.require(:post).permit(:title, :link, :body, :post_type)
    end
end
