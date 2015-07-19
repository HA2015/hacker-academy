class EventsController < ApplicationController

  # Before/after actions define prerequisites for certain controller actions
  # Format: prerequisite (see private functions below), actions
  before_action :admin_user,     only: [:new, :create, :edit, :update, :create, :destroy]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "Event Successfully Created!"
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def index
    @events = Event.order(:date)

    respond_to do |format|
        format.html
        format.json { render :json => @events }
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id]) 
  end

  def update
    @event = Event.find(params[:id])
    # If correctly updated, flash. Otherwise, re-render the edit page. 
    if @event.update_attributes(event_params)
      flash[:success] = "Event updated"
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "Event deleted"
    redirect_to action: 'index'
  end

   # Internal methods, not for handling browser interaction
  private

    # Return the params hash but only with the permitted attributes
    def event_params
      params.require(:event).permit(:name, :date, :start_time, :finish_time, :desc)
    end

    def admin_user
      redirect_to(root_url) unless (logged_in? && current_user.site_admin?)
    end

    # Could use refactoring to eliminate the check for admin
    #  This check is here so that the before_action for sponsor does not redirect 
    #  an admin 
    def sponsor
      redirect_to(root_url) unless (logged_in? && current_user.sponsor? || current_user.site_admin?)
    end

end
