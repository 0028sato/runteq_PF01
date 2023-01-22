class PostsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  before_action :find_post, only: [:edit, :update, :destroy]
  
  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page]).per(20)
    @tag_list = Tag.all
    @snow_board_list = SnowBoard.all
    @snow_binding_list = SnowBinding.all
    @snow_shoes_list = SnowShoe.all
  end

  def new
    @post = Post.new
    @post.snow_boards.build
    @post.snow_bindings.build
    @post.snow_shoes.build
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
    @snow_boards = @post.snow_boards
    @snow_bindings = @post.snow_bindings
    @snow_shoes = @post.snow_shoes
  end

  def edit
    @tag_list = @post.tags.pluck(:name).join(',')
    @snow_board_list = @post.snow_boards.pluck(:board_name, :board_information)
    @snow_binding_list = @post.snow_bindings.pluck(:binding_name, :binding_information)
    @snow_shoe_list = @post.snow_shoes.pluck(:shoe_name, :shoe_information)
  end

  def update
    @post = Post.find(params[:id])
    tag_list = params[:post][:name].split(',')
    if @post.update(post_params)
      @post.save_tag(tag_list)
      redirect_to @post, success: t('defaults.message.updated', item: Post.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: Post.model_name.human)
    end
  end

  def destroy
    @post.destroy!
    redirect_to posts_path, success: t('defaults.message.deleted', item: Post.model_name.human)
  end

  def likes
    @q = current_user.like_posts.ransack(params[:q])
    @like_posts = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page]).per(20)
  end

  def my_posts
    @q = current_user.posts.ransack(params[:q])
    @my_posts = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page]).per(20)
  end

  def search
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts.all
  end

  private

  def post_params
    params.require(:post).permit(:budget, :body, :post_image, :post_image_cache, 
      snow_boards_attributes: [:id, :board_name, :board_information],
      snow_bindings_attributes: [:id, :binding_name, :binding_information],
      snow_shoes_attributes: [:id, :shoe_name, :shoe_information])
  end

  def find_post
    @post = current_user.posts.find(params[:id])
  end
end
