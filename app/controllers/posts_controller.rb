class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]
  before_action :authenticate_user!, except: %i[index]
  before_action :owner_user?, only: %i[edit update destroy]

  def index
    @posts = Post.all.order('created_at DESC')
    @post = Post.new
  end

  def edit; end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      flash[:notice] = 'Post was successfully created.'
    else
      flash[:alert] = 'Post could not been created.'
    end

    redirect_to root_path
  end

  def update
    if @post.update(post_params)
      redirect_to root_path, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body)
  end

  def owner_user?
    return if current_user.id.equal?(@post.user.id)

    flash[:alert] = 'You do not have authorization to edit this post'
    redirect_to root_path
  end
end
