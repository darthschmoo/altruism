class VolunteerProfilesController < ApplicationController
  before_filter :must_be_logged_in
  def index
    @volunteer_profiles = VolunteerProfile.all
  end

  def show
    @volunteer_profile = @user.volunteer_profile
  end

  def new
    @volunteer_profile = VolunteerProfile.new
    @skills = Skill.all
  end

  def create
    @volunteer_profile = VolunteerProfile.new(params[:volunteer_profile])
    @volunteer_profile.user = @user
    if @volunteer_profile.save
      flash[:notice] = "Successfully created volunteer profile."
      redirect_to @volunteer_profile
    else
      render :action => 'new'
    end
  end

  def edit
    @volunteer_profile = @user.volunteer_profile
    @skills = Skill.all
  end

  def update
    @volunteer_profile = @user.volunteer_profile
    if @volunteer_profile.update_attributes(params[:volunteer_profile])
      flash[:notice] = "Successfully updated volunteer profile."
      redirect_to @volunteer_profile
    else
      render :action => 'edit'
    end
  end

  def destroy
    @volunteer_profile = VolunteerProfile.find(params[:id])
    @volunteer_profile.destroy
    flash[:notice] = "Successfully destroyed volunteer profile."
    redirect_to volunteer_profiles_url
  end
end
