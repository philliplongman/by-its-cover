module Profileable
  extend ActiveSupport::Concern

  private

  def profiles
    @profiles ||= Profile.all
  end

  def profile
    @profile ||= load_profile
  end

  def load_profile
    record = Profile.find_or_initialize_by(user_id: params[:user_id])
    record.assign_attributes(profile_params) if params[:profile].present?
    record
  end

  def profile_params
    params.require(:profile).permit(
      :username, :picture, :gender, :birthday, :location
    )
  end

end
