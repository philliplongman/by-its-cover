class UsersController < ApplicationController
  access_resource :users

  def show
    user
  end

end
