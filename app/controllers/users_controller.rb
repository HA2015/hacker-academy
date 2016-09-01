# This controller manages the Users resource. It:
# - provides views with stuff from the User database (e.g. @user)
# - it manages page flow when required

class UsersController < ApplicationController

  # Before/after actions define prerequisites for certain controller actions
  # Format: prerequisite (see private functions below), actions
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:destroy]
 
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # If correctly saved, login. Otherwise, render the 'new' form again. 
    if @user.save
      @user.send_activation_email
      flash[:info] = "Check your email to activate your account!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def index
    # Order the users according to their level, putting users that are not activated at the bottom
    @activated_users = User.where(activated: true).order(level: :desc)
    @inactivated_users = User.where(activated: false).order(level: :desc)
    @users = @activated_users + @inactivated_users
    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv }
      format.xls # { send_data @users.to_csv(col_sep: "\t") }
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id]) 
  end

  def update
    @user = User.find(params[:id])
    # If correctly updated, flash. Otherwise, re-render the edit page. 
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end 

  def destroy
    @user = User.find(params[:id])
    Achieved.where('(user_id= ?)', @user.id).destroy_all
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  # Internal methods, not for handling browser interaction
  private

    # Return the params hash but only with the permitted attributes
    def user_params
      params.require(:user).permit(:name, :description, :email, :password,
                                   :password_confirmation, :discipline, :graduating)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.site_admin?
    end

end
