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


  private 
    def allow_params
      params.require(:post).permit(:title, :link, :body, :post_type)
    end
end
