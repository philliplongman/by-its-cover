require "application_responder"

class ApplicationController < ActionController::Base
  extend Resourceable
  
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
    user.profile ? root_path : new_user_profile_path(user)
  end

  rescue_from ActionController::InvalidAuthenticityToken do |exception|
    sign_out current_user
  end
end
