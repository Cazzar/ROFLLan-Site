class LansController < ApplicationController
  #Make it so I do not need to use Lan.find(params[:id]) more than nessacary
  before_filter :get_lan, except: [:create, :new, :index]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]

  before_filter :check_admin!, except: [:index, :show]
  before_filter :verify_signed_up!, only: [:remove_signup, :remove_signup_complete]
  before_filter :verify_not_signed_up!, only: [:signup, :signup_complete]

  def new
  end

  def create
    @lan = Lan.new(lan_params)

    @lan.save
    redirect_to @lan
  end

  def show
    @signed_up = is_signed_up?
    @pagetitle = @lan.name
  end

  def edit
    @pagetitle = "Editing #{@lan.name}"
  end

  def index
    @pagetitle = "Event List"
    @lans = Lan.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
  end  

  def update
    if @lan.update(lan_params)
      redirect_to @lan
    else
      render 'edit'
    end
  end

  def signup
  end

  def signup_complete
    if (params[:signup][:confirm] == 0)
      @error = "You did not confirm"
      render "signup"
    end 

    @signup =  Signup.new

    @signup.user = current_user
    @signup.lan = @lan

    @signup.save

    redirect_to lan_signups_path(@lan.id)
  end

  def signups
    @signups = Signup.where(lan: @lan).paginate(:page => params[:page], :per_page => 100)
  end

  def remove_signup
  end

  def remove_signup_complete
    if (params[:signup][:confirm] == 0)
      @error = "You did not confirm"
      render "remove_signup"
    end 

    @current_signup.destroy
    redirect_to lan_signups_path(@lan.id)
  end

  private
  	def lan_params
  		params.require(:lan).permit(:name, :max_players, :description, :start_date, :end_date)
  	end

    def get_lan
      @lan = Lan.find(params[:id])
    end

    def is_signed_up?
      @current_signup = Signup.find_by(lan: @lan, user: @current_user)

      if (!@current_signup.nil?)
        return false
      end

      return true
    end

    def verify_signed_up! 
      if (is_signed_up?)
        redirect_to lan_signups_path(@lan.id)
      end
    end

    def verify_not_signed_up! 
      if (!is_signed_up?)
        redirect_to lan_signups_path(@lan.id)
      end
    end
end
