class ProfilesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @profile = Profile.new
  end

  def create
    @user = User.find(params[:user_id])
    @profile = Profile.new(profile_params)

    @profile.user = @user

    if @profile.save
      redirect_to @user
    else
      flash.alert = "Unable to save profile. See errors below."
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end

  def update
    @user = User.find(params[:user_id])
    @profile = @user.profile

    if @profile.update(profile_params)
      redirect_to @user
    else
      flash.alert = "Unable to save profile. See errors below."
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(
      :username, :picture, :gender, :birthday, :location
    )
  end

end
