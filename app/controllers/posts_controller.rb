class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_post, only: [:show, :edit, :update]


  def index
    @posts = Post.page(params[:page])
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
  end

  def edit
  end

  def update
    if @post.update(allow_params)
      redirect_to @post, flash: { :'alert-success' => 'Your post was updated successfully.' }
    else
      flash.now[:'alert-danger'] = @post.errors.full_messages
      render :edit
    end
  end


  def destroy
    post = Post.find params[:id]
    if post.destroy
      redirect_to posts_path, flash: { :'alert-success'=> 'Your post has been removed.' }
    else
      redirect_to posts_path, flash: { :'alert-danger'=> 'We were unable to remove that post.' }
    end
  end



  private 
    def allow_params
      params.require(:post).permit(:category_id, :title, :link, :body, :post_type)
    end

    def find_post
      @post = Post.find params[:id]
    end

end
