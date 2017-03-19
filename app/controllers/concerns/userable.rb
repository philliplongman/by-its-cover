module Userable
  extend ActiveSupport::Concern
  extend Resourceable

  access_resources :user

  private

  def user_params
    params.require(:user).permit(:email)
  end

end
