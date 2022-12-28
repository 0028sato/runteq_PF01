class PostsController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  
  def index
    @posts = Post.all.includes(:user).order(created_at: :desc)
    @tag_list = Tag.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    tag_list = params[:post][:name].split(',')
    if @post.save
      @post.save_tag(tag_list)
      redirect_to root_path, success: t('defaults.message.created', item: Post.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_created', item: Post.model_name.human)
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_tags = @post.tags
  end

  def likes
    @like_posts = current_user.like_posts.includes(:user).order(created_at: :desc)
  end

  def my_posts
    @my_posts = current_user.posts.includes(:user).order(created_at: :desc)
  end

  def search
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts.all
  end

  private

  def post_params
    params.require(:post).permit(:budget, :body, :post_image, :post_image_cache)
  end
end
