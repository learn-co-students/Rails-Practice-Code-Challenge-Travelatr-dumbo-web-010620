class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    # @blogger = Post.blogger
    if @post.valid?
      redirect_to posts_path
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])

  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @blogger = @post.blogger
    @post.destroy
    redirect_to blogger_path(@blogger)
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
  end
end
