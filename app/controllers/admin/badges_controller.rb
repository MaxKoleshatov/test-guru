class Admin::BadgesController < Admin::BaseController

  before_action :find_badge, only: %i[show edit destroy]

  def index
    @badges = Badge.all
  end
    
  def new
    @badge = Badge.new
  end

  def show; end

  def edit; end

  def update
    @badge = Badge.find(params[:id])
    
    if @badge.update(badge_params)
      redirect_to admin_badges_path(@badge)
    else
      render :edit
    end
  end
  
  def create
    @badge = Badge.new(badge_params)
      
    if @badge.save
      redirect_to admin_badges_path
    end
  end

  def destroy
    @badge.destroy
    
    redirect_to admin_badges_path
  end

    private

  def find_badge
    @badge = Badge.find(params[:id])
  end
  
  def badge_params
      params.require(:badge).permit(:title, :image, :rules, :options)
  end
end