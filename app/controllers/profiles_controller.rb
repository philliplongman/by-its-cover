class ProfilesController < ApplicationController
  include Profileable

  def new
    profile
  end

  def create
    profile.save
    respond_with profile, location: -> { user_path(profile.user) }
  end

  def edit
    profile
  end

  def update
    profile.save
    respond_with profile, location: -> { user_path(profile.user) }
  end

end
