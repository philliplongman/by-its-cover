class ProfilesController < ApplicationController

  def new
    @profile = Profile.new(user_id: params[:user_id])
  end

  def create
    @profile = Profile.create profile_params.merge(user_id: params[:user_id])
    respond_with @profile, location: -> { user_path(@profile.user) }
  end

  def edit
    @profile = Profile.find_by_user_id(params[:user_id])
  end

  def update
    @profile = Profile.find_by_user_id(params[:user_id])
    @profile.update(profile_params)
    respond_with @profile, location: -> { user_path(@profile.user) }
  end

  private

  def profile_params
    params.require(:profile).permit(
      :username, :picture, :gender, :birthday, :location
    )
  end

end
