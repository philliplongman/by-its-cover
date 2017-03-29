class ChangeProfilePictureToAvatar < ActiveRecord::Migration[5.0]
  def change
    rename_column :profiles, :picture, :avatar
  end
end
