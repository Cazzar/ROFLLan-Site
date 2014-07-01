class LansController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]

  before_filter :check_admin!, except: [:index, :show]

  def new
  end

  def create
    @lan = Lan.new(lan_params)

    @lan.save
    redirect_to @lan
  end

  def show
    @lan = Lan.find(params[:id])

    @pagetitle = @lan.name
  end

  def edit
    @lan = Lan.find(params[:id])

    @pagetitle = "Editing #{@lan.name}"
  end

  def index
    @pagetitle = "Event List"
    @lans = Lan.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
  end  

  def update
    @lan = Lan.find(params[:id])

    if @lan.update(lan_params)
      redirect_to @lan
    else
      render 'edit'
    end
  end

  def signup
    @lan = Lan.find(params[:id])
  end

  def signup_complete
    @lan = Lan.find(params[:id])
    @signup =  Signup.new

    @signup.user = current_user
    @signup.lan = @lan
    
    @signup.save

    redirect_to lan_signups_path(@lan.id)
  end

  def signups
    @lan = Lan.find(params[:id])
    @signups = Signup.where(lan: @lan).paginate(:page => params[:page], :per_page => 100)
  end

  private
  	def lan_params
  		params.require(:lan).permit(:name, :max_players, :description, :start_date, :end_date)
  	end
end
