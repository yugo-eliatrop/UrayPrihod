class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :check_rights, except: %i[index show]
  before_action :set_post, only: %i[show edit update destroy]

  def index
    per_page = 6
    @posts = Post.all.order('created_at DESC')
                 .paginate(page: paginate_page, per_page: per_page)
    @last = @posts.count / per_page + ((@posts.count % per_page).zero? ? 0 : 1)
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit; end

  def update
    pure_params = post_params
    if @post.update(pure_params)
      @post.remove_image! if pure_params[:remove_image]
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def paginate_page
    @page =
      if params[:page].nil?
        1
      else
        params_page = params[:page].to_i
        if params_page < 1
          1
        else
          params_page
        end
      end
  end

  def post_params
    params.require(:post).permit(:title, :description, :content,
                                 :image, :image_cache, :remove_image)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
