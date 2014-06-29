class LansController < ApplicationController
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

  private
  	def lan_params
  		params.require(:lan).permit(:name, :max_players, :description, :start_date, :end_date)
  	end
end
