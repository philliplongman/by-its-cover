class ProfilesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @profile = Profile.new
  end

  def create
    @user = User.find(params[:user_id])
    @profile = Profile.create profile_params.merge(user: @user)
    respond_with @profile, location: -> { user_path(@user) }
  end

  def edit
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end

  def update
    @user = User.find(params[:user_id])
    @profile = @user.profile.update(profile_params)
    respond_with @profile, location: -> { user_path(@user) }
  end

  private

  def profile_params
    params.require(:profile).permit(
      :username, :picture, :gender, :birthday, :location
    )
  end

end
