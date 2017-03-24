class ProfilesController < ApplicationController
  access_resource :profile, key: :user_id, columns: [
    :username, :picture, :gender, :birthday, :location
  ]

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
