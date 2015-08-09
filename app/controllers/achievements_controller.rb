class AchievementsController < ApplicationController

  # Before/after actions define prerequisites for certain controller actions
  # Format: prerequisite (see private functions below), actions
  before_action :admin_user,     only: [:new, :create, :edit, :update, :create, :destroy]

  def new
    @achievement = Achievement.new
  end

  def create
    @achievement = Achievement.new(achievement_params)
    if @achievement.save
      flash[:success] = "Achievement Successfully Created!"
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def index
    @achievements = Achievement.all
  end

  def show
    @achievement = Achievement.find(params[:id])
  end

  def edit
    @achievement = Achievement.find(params[:id]) 
  end

  def update
    @achievement = Achievement.find(params[:id])
    # If correctly updated, flash. Otherwise, re-render the edit page. 
    if @achievement.update_attributes(achievement_params)
      flash[:success] = "Achievement updated"
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def achieve
    @achievement = Achievement.find(params[:id]) 
    Achieved.create(user_id: current_user.id, achievement_id: @achievement.id)
    current_user.update_level
    flash[:success] = "Achievement acquired!"
    redirect_to action: 'index'
  end

  def surrender
    @achievement = Achievement.find(params[:id])
    Achieved.where('(user_id= ? AND achievement_id= ?)', current_user.id, @achievement.id).destroy_all
    current_user.update_level
    flash[:success] = "Achievement surrendered."
    redirect_to action: 'index'
  end

  def destroy
    @achievement = Achievement.find(params[:id])
    Achieved.where('(achievement_id= ?)', @achievement.id).destroy_all
    Achievement.find(params[:id]).destroy
    flash[:success] = "Achievement deleted"
    redirect_to action: 'index'
  end

   # Internal methods, not for handling browser interaction
  private

    # Return the params hash but only with the permitted attributes
    def achievement_params
      params.require(:achievement).permit(:name, :description, :value)
    end

    def admin_user
      redirect_to(root_url) unless (logged_in? && current_user.site_admin?)
    end

end
