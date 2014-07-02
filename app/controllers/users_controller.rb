class UsersController < ApplicationController
	before_filter :check_admin!
	before_action :authenticate_user!

	def index
		@users = User.paginate(:page => params[:page], :per_page => 20).order('created_at DESC')
	end
end
