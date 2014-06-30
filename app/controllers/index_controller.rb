class IndexController < ApplicationController
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
  end

  def about
  end

  def contact
  end

  def sponsors
  end
end
