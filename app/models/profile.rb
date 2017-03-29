# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#  avatar     :string
#  gender     :string
#  birthday   :date
#  location   :string
#
# Indexes
#
#  index_profiles_on_user_id   (user_id)
#  index_profiles_on_username  (username) UNIQUE
#

class Profile < ApplicationRecord
  belongs_to :user

  GENDERS = [
    "Male", "Female", "Trans Male", "Trans Female", "Other/Non-Conforming"
  ].freeze

  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: false }
  validates :username, length: { maximum: 25 }
  validates :gender,   inclusion: { in: GENDERS, allow_blank: true }
  validates :birthday, timeliness: {
    between: [-> { Date.current - 130.years }, -> { Date.current }],
    type: :date, allow_blank: true
  }

  def age
    birthday ? calculate_age : nil
  end

  private

  def calculate_age
    Date.current.year - birthday.year + (past_birthday? ? 1 : 0)
  end

  def past_birthday?
    (birthday.month <= Date.current.month) && (birthday.day <= Date.current.day)
  end

end
