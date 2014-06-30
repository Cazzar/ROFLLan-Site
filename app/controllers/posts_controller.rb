class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]

  before_filter :check_admin!, except: [:index, :show]

  def index
    @pagetitle = "Posts"
    @posts = Post.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
  end

  def new
  end

  def create
    @post = current_user.posts.create(post_params)

    @post.save
    redirect_to @post
  end

  def edit
    @post = Post.find(params[:id])

    @pagetitle = "Editing #{@post.title}"
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def show
    @post = Post.find(params[:id])
    @pagetitle = @post.title
  end

  private
    def post_params
      params.require(:post).permit(:title, :data)
    end
end
